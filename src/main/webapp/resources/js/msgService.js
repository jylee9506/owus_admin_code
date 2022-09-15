
const pageUL = document.querySelector(".pagination")
const tabID = [".recvTable", ".sendTable"]
const render = (state) => {

    const msgRender = () => {
        let str = ""
        for(const dto of state.dtoList) {
            str += `
                <tr class="text-center">
                  <th scope="row" class="col-2">${dto.bno}</th>
                  <td class="col-4 text-truncate content">
                    <div class="clickable" data-mno="${state.tabType == 0 ? dto.fmno : dto.tmno}">${dto.content}</div>
                  </td>
                  <td class="col-2 nickname">${state.tabType == 0 ? dto.fnickname : dto.tnickname}</td>
                  <td class="col-2 sendDate">${dto.sendDate}</td>
                  <td class="col-2 readDate">${dto.readDate == null ? "-" : dto.readDate}</td>
                </tr>
            `
        }
        qs(tabID[state.tabType]).innerHTML = str
    }

    const pageRender = () => {
        const currentPage = state.page
        const lastPage = Math.ceil(state.total / state.size)
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

    msgRender()
    pageRender()

}

const msgService = (callback) => {
    let state = {}
    const render = callback

    const setState = (newState) => {
        state = {...state, ...newState}
        console.log(state, newState)

        if(newState.page || newState.tabType >= 0) {
            getServerList()
            return
        }
        render(state)
    }

    const getServerList = async () => {
        const {mno, tabType, page, size} = state
        const res = await axios.get(`/shop/mypage/message/list`, {params: {mno, tabType, page, size}})
        setState(res.data)
    }

    const postServer = async (obj, callback) => {
        const res = await axios.post(`/shop/mypage/message/post`, obj)
        callback(res.data)
    }

    const findUserServer = async (keyword, callback) => {
        const res = await axios.post(`/shop/mypage/message/find`, {keyword})
        callback(res.data)
    }

    const getMessage = async (bno, callback) => {
        const res = await axios.get(`/shop/mypage/message/get`, {params: {bno}})
        callback(res.data)
    }

    return {setState, postServer, findUserServer, getMessage}
}