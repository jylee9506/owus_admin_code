<%--
  User: 
  Date: 2022-05-01
  Time: 오후 7:21
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
  <title>상세페이지</title>
</head>

<%@ include file="/WEB-INF/include/shop/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/shop/basic_sidebar.jsp" %>

<main id="main" class="main">
  <%@ include file="/WEB-INF/include/shop/basic_pagetitle.jsp"%>

  <section class="section">
    <div class="row">
      <div class="col-lg-12">

        <div class="card">
          <div class="card-body">
            <div class="container-fluid">
              <div class="row mb-2 mt-2">
                <div class="col">

                  <h2>
                    ${jobBoardDTO.title}
                  </h2>
                </div>
              </div>
              <div class="row align-items-end">
                <div class="col">
                  <img src="/resources/img/member.png" alt="MemberImage"
                         class="rounded-circle" style="height: 60px">

                  <span class="bs-gray">${jobBoardDTO.nickname} <br> ${jobBoardDTO.regDate}</span>
                  <!-- End Profile Iamge Icon -->
                </div>
                  <div class="col col-auto">
                    <div class="text-end">
                      <button type="button" class="btn btn-outline-primary listBtn">목록
                      </button>
                      <button type="button" class="btn btn-outline-primary modifyBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">수정시작
                      </button>
                      <form class="jobBoardListRemoveForm" action="/shop/job/remove/${jobBoardDTO.bno}" method="post">
                        <button type="button" class="btn btn-outline-danger removeBtn" data-bs-toggle="modal" data-bs-target="#exampleModal1">삭제
                        </button>
                      </form>
                    </div>
                  </div>
              </div>
            </div>
            <hr/>
            <div class="container-fluid contentArea">
              <div class="row">
                <div class="col">${jobBoardDTO.content}</div>
              </div>
            </div>
            <hr/>
            <div class="replyArea container-fluid">
              <div class="row">
                <div class="col">
                  <ul class="list-group list-group-flush replyUL">

                    <li class="list-group-item">
                      <div class="d-flex justify-content-between align-items-center">
                        <div class="replyContent">
                          <div class="replyer">댓글 작성자</div>
                          <div class="replyText">댓글 댓글 댓글</div>
                          <div class="replyDate">2022-05-01</div>
                        </div>
                        <div class="btn-group" role="group" aria-label="댓글 버튼">
                          <button type="button" class="btn btn-sm btn-outline-primary replyToReplyBtn">답댓글</button>
                          <button type="button" class="btn btn-sm btn-outline-primary replyModalBtn">수정</button>
                          <button type="button" class="btn btn-sm btn-outline-primary replyDelBtn">삭제</button>
                        </div>
                      </div>
                    </li>

                    <li class="list-group-item">
                      <div class="d-flex justify-content-between align-items-center">
                        <div class="replyContent">
                          <div class="replyer">댓글 작성자</div>
                          <div class="replyText">댓글 댓글 댓글</div>
                          <div class="replyDate">2022-05-01</div>
                        </div>
                        <div class="btn-group" role="group" aria-label="댓글 버튼">
                          <button type="button" class="btn btn-sm btn-outline-primary replyToReplyBtn">답댓글</button>
                          <button type="button" class="btn btn-sm btn-outline-primary replyModalBtn">수정</button>
                          <button type="button" class="btn btn-sm btn-outline-primary replyDelBtn">삭제</button>
                        </div>
                      </div>
                    </li>

                  </ul>
                </div>
              </div>

              <div class="row">
                <div class="col">
                  <div class="form-floating mb-3">
                    <textarea class="form-control newReplyText"
                              placeholder="Leave a comment here"
                              id="floatingTextarea"
                              style="height: 100px;"></textarea>
                    <label for="floatingTextarea">Comments</label>
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

      <!-- Remove Modal -->
      <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel1">Check Remove</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              정말 숨김처리 하기겠습니까
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary checkRemoveBtn">remove</button>
            </div>
          </div>
        </div>
      </div>


      <!-- Modify Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Modify Page</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
              <form class="jobBoardListModForm" action="/shop/job/modify/${jobBoardDTO.bno}" method="post">
                <input type="hidden" name="page" value="${listDTO.page}">
                <input type="hidden" name="size" value="${listDTO.size}">
                <input type="hidden" name="type" value="${listDTO.type == null ? '' : listDTO.type}">
                <input type="hidden" name="keyword" value="${listDTO.keyword == null ? '' : listDTO.keyword}">
                <input type="hidden" name="category" value="${listDTO.category == null ? '' : listDTO.category}">
                <div class="col-md-12 mb-lg-5">
                  <label for="formGroupExampleInput"  class="form-label ">번호</label>
                  <input id="formGroupExampleInput" class="form-control" type="text" name="bno" value="<c:out value="${jobBoardDTO.bno}"/>" readonly>
                </div>

                <div class="col-md-12 mb-lg-5">
                  <label for="formGroupExampleInput1" class="form-label ">제목</label>
                  <input id="formGroupExampleInput1" class="form-control" type="text" name="title" value="<c:out value="${jobBoardDTO.title}"/>">
                </div>

                <div class="form-floating col-md-12 mb-3">
                  <textarea style="height: 300px;" id="floatingTextarea2"  class="form-control" name="content"> <c:out value="${jobBoardDTO.content}"/> </textarea>
                  <label for="floatingTextarea2">내용</label>
                </div>

              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary cancelBtn" data-bs-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary writeBtn">수정 완료</button>
            </div>
          </div>
        </div>
      </div>

    </div>
  </section>
</main>


<%--<form class="jobBoardListForm" action="" method="get">--%>
<%--  <input type="hidden" name="page" value="${jobBoardListDTO.page}">--%>
<%--  <input type="hidden" name="size" value="${jobBoardListDTO.size}">--%>
<%--  <input type="hidden" name="type" value="${jobBoardListDTO.type == null ? '' : jobBoardListDTO.type}">--%>
<%--  <input type="hidden" name="keyword" value="${jobBoardListDTO.keyword == null ? '' : jobBoardListDTO.keyword}">--%>
<%--  <input type="hidden" name="category" value="${jobBoardListDTO.category == null ? '' : jobBoardListDTO.category}">--%>
<%--</form>--%>
<script src="/resources/js/owus.js"></script>

<script>

  const jobBoardListForm = qs(".jobBoardListForm")
  const jobBoardListModForm = qs(".jobBoardListModForm")
  const jobBoardListRemoveForm = qs(".jobBoardListRemoveForm")

  qsAddEvent(".listBtn", "click", (e) => {

    self.location = `/shop/job/main/${listDTO.link}`

  },false)

  qsAddEvent(".checkRemoveBtn", "click", (e) => {



    jobBoardListRemoveForm.submit()


  })

  qsAddEvent(".writeBtn", "click", (e)=>{

    jobBoardListModForm.submit()
  })



</script>

<%@include file="/WEB-INF/include/shop/basic_footer.jsp" %>