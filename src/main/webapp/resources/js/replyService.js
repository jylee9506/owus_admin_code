const replyUL = qs(".replyUL")
const pageUL = qs(".pagination")

function showToggleSubReply(cnt) {
    return `<div class="subReply subReplyShow text-end" data-cnt="${cnt}">
                ${cnt}개 댓글 보기
             </div>`
}

function closeToggleSubReply(cnt) {
    return `<div class="subReply subReplyClose text-end" data-cnt="${cnt}">
                접기</div>`
}

function render(state) {
    console.log("---------render", state)
    const isSubReply = state.parent && state.parent > 0

    function replyRender() {
        const arr = state.replyArr;


        const str = arr.map(reply => {
            if (reply.delFlag) {
                return `<li class="list-group-item replyli" data-rno="${reply.rno}">${reply.content}</li>`
            }

            let btnHtml = ""
            let content = ""

            console.log("mmmmmmmmmm", state.mno, reply.mno)
            const isOwner = parseInt(state.mno) === parseInt(reply.mno)

            btnHtml = `
                <div class="btn-group" role="group" aria-label="댓글 버튼">
                    ${isSubReply ? "" : `<button type="button" class="btn btn-sm btn-outline-primary replyToBtn">답댓글</button>`}
                    ${isOwner ? `<button type="button" class="btn btn-sm btn-outline-primary replyModalBtn">수정</button>` : ""}
                    ${isOwner ? `<button type="button" class="btn btn-sm btn-outline-primary replyDelBtn">삭제</button>` : ""}
                </div>`

            content = `
                <div class="replyer">${reply.nickname}</div>
                <div class="replyText">${reply.content}</div>
                <div class="replyDate">${reply.regDate}</div>`

            let html = `
                <li class="list-group-item replyli" data-rno="${reply.rno}">
                  <div class="row">
                      <div class="col-12 d-flex justify-content-between align-items-center replyMain">
                          <div class="replyContent">${content}</div>
                          <div class="replyMore text-end">
                                ${btnHtml}
                                ${!isSubReply && reply.cnt > 0 ? showToggleSubReply(reply.cnt) : ""}
                           </div>
                      </div>
                  </div>
                </li>`

            return html

        }).join(" ")

        if (isSubReply) {
            const parent = state.parent
            const parentElem = qs(`li[data-rno='${parent}']`)
            const cloned = qs(".subReplis").cloneNode()

            try {
                qs(".subReplis", parentElem).remove()
            } catch (e) {
                console.log("first sub reply")
            }

            cloned.innerHTML = str
            cloned.classList.remove("hidden")

            parentElem.append(cloned)

        } else {
            replyUL.innerHTML = str
        }


    }

    function pageRender() {
        const currentPage = state.pageNum
        const lastPage = Math.ceil(state.replyCount / state.size)
        let endPage = Math.ceil(currentPage / 10) * 10
        const startPage = endPage - 9
        endPage = lastPage > endPage ? endPage : lastPage

        const prev = startPage !== 1
        const next = endPage !== lastPage

        console.log("---------page", {
            startPage,
            currentPage,
            endPage,
            lastPage,
            prev,
            next
        })

        let str = `<li class="page-item ${prev ? '' : 'disabled'}"><a class="page-link" href="#" data-rpage="${startPage - 1}" aria-label="Previous">Prev</a></li>`

        for (let i = startPage; i <= endPage; i++) {
            str += `<li class="page-item ${currentPage === i ? 'active' : ''}"><a class="page-link" href="#" data-rpage="${i}">${i}</a></li>`
        }

        str += `<li class="page-item ${next ? '' : 'disabled'}"><a class="page-link" href="#" data-rpage="${endPage + 1}" aria-label="Previous">Next</a></li>`

        pageUL.innerHTML = str

    }

    replyRender()
    if (!isSubReply) pageRender()
}

const replyService = (replyURL, initState, callback) => {
    const restURL = replyURL
    let state = initState

    const setState = (newState) => {
        // newState.pageNum = newState.pageNum < 1 ? 1 : newState.pageNum
        // newState.size = newState.size < 10 ? 10 : newState.size
        // 처리 필요

        console.log("----- setState", newState)

        state = {...state, ...newState}

        if (newState.replyCount || newState.pageNum) {
            getServerList(newState)
            return
        }
        callback(state)
    }

    const getServerSubList = async function (obj) {
        const res = await axios.get(`${restURL}/sublist/${obj.bno}/${obj.parent}`)
        callback({replyArr: res.data, ...obj})
    }

    const getServerList = async function (newState) {
        let pageNum
        if (newState.replyCount) {
            pageNum = Math.ceil(state.replyCount / state.size)
        } else {
            pageNum = state.pageNum
        }

        const params = {page: pageNum, size: state.size}
        const res = await axios.get(`${restURL}/list/${state.bno}`, {params})

        state.pageNum = pageNum
        setState({replyArr: res.data})
    }

    const addServerReply = async function (obj) {
        console.log("----- add reply", obj)
        const res = await axios.post(`${restURL}/`, obj)
        const rst = parseInt(res.data.result)

        setState({replyCount: rst})
    }

    const addServerSubReply = async function (obj, callback) {
        console.log("----- add sub reply", obj)
        const res = await axios.post(`${restURL}/`, obj)

        getServerSubList(obj)
        callback(res.data)
    }

    const delServerReply = async function (rno, callback) {
        console.log("----- del reply service", {rno})
        const res = await axios.delete(`${restURL}/${rno}`, {data: {rno}})
        const rst = res.data.result

        callback(rst)
    }

    const updateServerReply = async function (obj, callback) {
        console.log("---- update reply", obj)
        const res = await axios.patch(`${restURL}/${obj.rno}`, obj)
        const rst = res.data.result

        callback(rst)
    }

    return {
        getServerList, setState,
        addServerReply, delServerReply,
        updateServerReply, getServerSubList,
        addServerSubReply
    }
}