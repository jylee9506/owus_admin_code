<%--
  User: 
  Date: 2022-05-01
  Time: 오후 7:21
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
  <title>상세페이지</title>
</head>

<%@ include file="/WEB-INF/include/shop/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/shop/basic_sidebar.jsp" %>

<main id="main" class="main">
  <%@ include file="/WEB-INF/include/shop/basic_pagetitle.jsp"%>

  <section class="section">
    <sec:authentication property="principal.mno" var="mno"/>
    <div class="row">
      <div class="col-lg-12">

        <div class="card">
          <div class="card-body">
            <div class="container-fluid">
              <div class="row mb-2 mt-2">
                <div class="col">
                  <h2>${jobBoardDTO.title}</h2>
                </div>
              </div>
              <div class="row align-items-end">
                <div class="col">
                  <img src="/resources/img/member.png" alt="MemberImage"
                         class="rounded-circle" style="height: 60px">

                  <span class="bs-gray">${jobBoardDTO.nickname} <br>
                    <fmt:parseDate value="${jobBoardDTO.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                    <fmt:formatDate pattern="yy-MM-dd HH:mm" value="${ parsedDateTime }" />
                  </span>

                  <!-- End Profile Iamge Icon -->
                </div>
                  <div class="col col-auto">
                    <div class="text-end">
                      <button type="button" class="btn btn-outline-primary listBtn">목록
                      </button>
                      <c:if test="${jobBoardDTO.mno == mno}">
                        <button type="button" class="btn btn-outline-primary modifyBtn">수정 / 삭제
                        </button>
                      </c:if>
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
    </div>
  </section>

</main>

<div class="modal fade" id="updateReplyModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modify page</h5>
      </div>
      <div class="modal-body">
        <div class="form-floating">

          <textarea class="form-control replyUpdateText" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 150px"></textarea>
          <label for="floatingTextarea2">Comments</label>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary replyUpdateCancelBtn">취소</button>
        <button type="button" class="btn btn-primary replyUpdateBtn">수정</button>
      </div>
    </div>
  </div>

</div><!-- End Basic Modal-->

<form class="jobBoardListForm" action="" method="get">
  <input type="hidden" name="page" value="${listDTO.page}">
  <input type="hidden" name="size" value="${listDTO.size}">
  <input type="hidden" name="type" value="${listDTO.type == null ? '' : listDTO.type}">
  <input type="hidden" name="keyword" value="${listDTO.keyword == null ? '' : listDTO.keyword}">
  <input type="hidden" name="category" value="${listDTO.category == null ? '' : listDTO.category}">
</form>
<script src="/resources/js/owus.js"></script>

<script>

  const jobBoardListForm = qs(".jobBoardListForm")

  qsAddEvent(".listBtn", "click", (e) => {

    self.location = `/shop/job/main/${listDTO.link}`

  })

  qsAddEvent(".modifyBtn", "click", (e) => {

    self.location = `/shop/job/modify/${bno}${listDTO.link}`

  },false)




</script>

<%@include file="/WEB-INF/include/shop/basic_footer.jsp" %>