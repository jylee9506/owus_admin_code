<%--
  User: 
  Date: 2022-05-01
  Time: 오후 7:21
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/admin/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/admin/basic_sidebar.jsp" %>

<main id="main" class="main">
  <%@ include file="/WEB-INF/include/admin/basic_pagetitle.jsp"%>
  <section class="section">
    <div class="row">
      <div class="col-lg-12">

        <div class="card">
          <div class="card-body">
            <div class="container-fluid">
              <div class="row mb-2 mt-2">
                <div class="col">
                  <h2>${dto.title}</h2>
                </div>
              </div>
              <div class="row align-items-end">
                <div class="col">
                  <a class="nav-link nav-profile d-flex align-items-center pe-0"
                     href="#" data-bs-toggle="dropdown">
                    <img src="http://owus.duckdns.org:38080/niceadmin/img/profile-img.jpg" alt="Profile"
                         class="rounded-circle" style="height: 60px">
                    <span class="d-none d-md-block dropdown-toggle ps-2">${dto.nickname}</span>
                  </a>
                  <!-- End Profile Iamge Icon -->
                  <span class="bs-gray">${dto.regDate}</span>
                </div>
                <div class="col col-auto">
                  <div class="text-end mb-2">
                    <c:if test="${dto.answerDate == null}">
                    <button type="button" class="btn btn-warning answerBtn">처리완료</button>
                    </c:if>
                    <c:if test="${dto.answerDate != null}">
                      ${dto.answerDate}
                    </c:if>
                  </div>
                  <div class="text-end">
                    <button type="button" class="btn btn-outline-primary listBtn">목록
                    </button>
                    <button type="button" class="btn btn-outline-primary modifyBtn">수정
                    </button>
                    <button type="button" class="btn btn-outline-danger removeBtn">삭제
                    </button>
                  </div>
                </div>
              </div>
            </div>
            <hr/>
            <div class="text-editor"></div>

            <hr/>
            <div class="replyArea container-fluid">
              <div class="row">
                <div class="col">
                  <ul class="list-group list-group-flush replyUL"></ul>
                </div>
              </div>

              <div class="row">
                <div class="col">
                  <div class="form-floating mb-3">
                    <textarea class="form-control newReplyText  "
                              placeholder="Leave a comment here"
                              id="floatingTextarea"
                              style="height: 100px;"></textarea>
                    <label for="floatingTextarea">댓글</label>
                  </div>
                </div>
              </div>
                <div class="row">
                  <div class="col">
                    <nav aria-label="Page navigation example">
                      <ul class="pagination"></ul>
                    </nav>
                  </div>
                  <div class="col col-auto">
                    <button type="button" class="btn btn-primary replyBtn">댓글등록</button>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

</main>

<div class="modal fade" id="updateReplyModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">댓글수정</h5>
      </div>
      <div class="modal-body">
        <div class="form-floating">

          <textarea class="form-control replyUpdateText" placeholder="Leave a comment here" id="floatingTextarea1" style="height: 150px"></textarea>
          <label for="floatingTextarea1">Comments</label>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary replyUpdateCancelBtn">취소</button>
        <button type="button" class="btn btn-primary replyUpdateBtn">수정</button>
      </div>
    </div>
  </div>
</div><!-- End Basic Modal-->

<div class="modal fade" id="subReplyModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">댓글입력</h5>
      </div>
      <div class="modal-body">
        <div class="form-floating">

          <textarea class="form-control replyNewText" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 150px"></textarea>
          <label for="floatingTextarea2">Comments</label>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary replyNewCancelBtn">취소</button>
        <button type="button" class="btn btn-primary replyNewBtn">확인</button>
      </div>
    </div>
  </div>
</div><!-- End Basic Modal-->

<ul class="subReplis hidden"></ul>

<form class="actionForm" action="" method="get">
  <input type="hidden" name="page" value="${listDTO.page}">
  <input type="hidden" name="size" value="${listDTO.size}">
  <input type="hidden" name="type" value="${listDTO.type}">
  <input type="hidden" name="keyword" value="${listDTO.keyword}">
  <input type="hidden" name="category" value="${listDTO.category}">
  <div class="additionalInput"></div>
</form>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp" %>

<script src="/resources/js/owus.js"></script>
<script src="/resources/js/quill/quill_editor.js"></script>
<script src="/resources/js/replyService.js"></script>

<script>
    const actionForm = qs(".actionForm")
    const additionalInput = qs(".additionalInput")

    const mno = ${user.mno}
    const bno = '${dto.bno}';

    qsClickEvent(".listBtn", (e) => {
        actionForm.setAttribute("action", path)
        actionForm.submit()
    })

    qsClickEvent(".modifyBtn", (e) => {
        actionForm.setAttribute("action", `\${path}/modify/\${bno}`)
        actionForm.submit()
    })

    qsClickEvent(".removeBtn", (e) => {
        actionForm.setAttribute("action", `\${path}/remove/\${bno}`)
        actionForm.setAttribute("method", "post")

        // additionalInput.innerHTML += inputTag("bno", bno)

        actionForm.submit()
    })

    qsClickEvent(".answerBtn", (e) => {
        actionForm.setAttribute("action", `\${path}/answer`)
        actionForm.setAttribute("method", "post")
        additionalInput.innerHTML += inputTag("bno", bno)

        actionForm.submit()

    })

    // =================================== 댓글처리
    const replyURL = "/ask/reply"
    const initState = {
        bno,
        mno,
        replyCount: 0,
        replyArr: [],
        pageNum: 1,
        parent: 0,
        size: 10
    }
    const rs = replyService(replyURL, initState, render)

    rs.setState({replyCount: ${dto.replyCount}})

    // =================================== 댓글 이벤트

    qsClickEvent(".pagination", (e) => {
        const target = e.target
        if(target.getAttribute("class") !== "page-link") {
            return
        }

        const rpage = parseInt(target.getAttribute("data-rpage"))

        rs.setState({pageNum: rpage})
    })

    qsClickEvent(".replyBtn", (e) => {
        const content = qs(".newReplyText").value
        const obj = {
            bno,
            mno,
            content,
            parent: 0,
        }
        rs.addServerReply(obj)

        qs(".newReplyText").value = ""
    })

    const updateReplyModal = bootstrap.Modal.getOrCreateInstance(qs("#updateReplyModal"))
    const subReplyModal = bootstrap.Modal.getOrCreateInstance(qs("#subReplyModal"))

    qsClickEvent(".replyUL", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const target = e.target

        if(target.tagName === "BUTTON") {
            const li = target.closest("li")
            const rno = li.getAttribute("data-rno")

            if(target.classList.contains("replyDelBtn")) { // 댓글 삭제
                rs.delServerReply(rno, (rst) => {
                    console.log("--------- del rst", rst)
                    li.innerHTML = rst
                })
            } else if(target.classList.contains("replyModalBtn")) { // 댓글 수정 모달
                const upd = qs("#updateReplyModal")
                qs(".replyUpdateText", upd).value = qs(".replyText", li).innerHTML
                qs(".replyUpdateBtn", upd).setAttribute("data-rno", rno)
                qs(".replyText", li).classList.add("updatingReply")

                updateReplyModal.show()
            } else if(target.classList.contains("replyToBtn")) { // 대댓글
                const sub = qs("#subReplyModal")
                qs(".replyNewBtn", sub).setAttribute("data-parent", rno)
                subReplyModal.show()
            }
        } else if(target.tagName === "DIV") {
            const li = target.closest("li")
            const rno = li.getAttribute("data-rno")

            if(target.classList.contains("subReplyShow")) {
                rs.getServerSubList({bno, mno, parent:rno})
                const cnt = target.getAttribute("data-cnt")
                target.outerHTML = closeToggleSubReply(cnt)

            } else if(target.classList.contains("subReplyClose")) {
                qs(".subReplis", li).remove()
                const cnt = target.getAttribute("data-cnt")
                target.outerHTML = showToggleSubReply(cnt)
            }
        }
    })

    //////////////////// MODAL
    qsClickEvent(".replyUpdateBtn", (e) => { // 댓글 수정
        const rno = parseInt(e.target.getAttribute("data-rno"))
        const content = qs(".replyUpdateText").value

        rs.updateServerReply({rno, content}, (rst) => {
            console.log(rst)

            qs(".updatingReply").innerHTML = content
            qs(".updatingReply").classList.remove("updatingReply")
            updateReplyModal.hide()
        })
    })

    qsClickEvent(".replyUpdateCancelBtn", (e) => {
        qs(".updatingReply").classList.remove("updatingReply")
        updateReplyModal.hide()
    })

    qsClickEvent(".replyNewBtn", (e) => { // 대댓글 추가
        const parent = parseInt(e.target.getAttribute("data-parent"))
        const content = qs(".replyNewText").value

        rs.addServerSubReply({bno, mno, parent, content}, (rst) => {
            console.log("---- add sup reply", rst)
            const parentElem = qs(`li[data-rno='\${parent}']`)

            try {
                qs(".subReply", parentElem).outerHTML = closeToggleSubReply(rst.result)
            } catch (e) {
                qs(".replyMore", parentElem).innerHTML += closeToggleSubReply(rst.result)
            }

            qs(".replyNewText").value = ""
            subReplyModal.hide()
        })
    })

    qsClickEvent(".replyNewCancelBtn", (e) => {
        qs(".replyNewText").value = ""
        subReplyModal.hide()
    })

    qEdit.read('${dto.content}')

</script>
