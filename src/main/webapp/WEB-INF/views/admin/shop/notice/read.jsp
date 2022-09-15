<%--
  User: 
  Date: 2022-05-01
  Time: 오후 7:21
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <title>글 제목</title>
</head>

<%@ include file="/WEB-INF/include/admin/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/admin/basic_sidebar.jsp" %>

<main id="main" class="main">
    <%@ include file="/WEB-INF/include/admin/basic_pagetitle.jsp" %>
    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row mb-2 mt-2">
                                <div class="col">
                                    <h2>${noticeDTO.title}</h2>
                                </div>
                            </div>
                            <div class="row align-items-end">
                                <div class="col">
                                    <a class="nav-link nav-profile d-flex align-items-center pe-0"
                                       href="#" data-bs-toggle="dropdown">
                                        <img src="http://owus.duckdns.org:38080/niceadmin/img/profile-img.jpg" alt="Profile"
                                             class="rounded-circle" style="height: 60px">
                                        <span class="d-none d-md-block ps-2">${noticeDTO.name}</span>
                                    </a>
                                    <!-- End Profile Iamge Icon -->
                                    <span class="bs-gray">
                    <fmt:parseDate value="${noticeDTO.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime"
                                   type="both"/>
                    <fmt:formatDate pattern="yy-MM-dd HH:mm" value="${ parsedDateTime }"/></span>
                                </div>
                                <div class="col col-auto">
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
                        <div class="container-fluid contentArea">
                            <div class="row">
                                <div class="col">${noticeDTO.content}</div>
                            </div>
                        </div>
                        <hr/>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="attachTitle">
                                    첨부파일
                                </div>
                                <div class="uploadResult">
                                    <c:forEach items="${uploads}" var="uploadImage">
                                        <div>
                                            <img src="/attach/view?fileName=${uploadImage.thumbnail}">${uploadImage.filename}
                                        </div>
                                    </c:forEach>
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

                    <textarea class="form-control replyUpdateText" placeholder="Leave a comment here"
                              id="floatingTextarea2" style="height: 150px"></textarea>
                    <label for="floatingTextarea2">Comments</label>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary replyUpdateCancelBtn">취소</button>
                <button type="button" class="btn btn-primary replyUpdateBtn">수정</button>
            </div>
        </div>
    </div>
</div>
<!-- End Basic Modal-->

<form class="actionForm" action="/admin/shop/notice/remove/${noticeDTO.bno}" method="post">
    <input type="hidden" name="page" value="${listDTO.page}">
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword}">
</form>

<script src="/resources/js/owus.js"></script>

<script>
    const actionForm = document.querySelector(".actionForm");

    //목록 btn
    document.querySelector(".listBtn").addEventListener("click", (e) => {
        self.location = "/admin/shop/notice${listDTO.link}";
    }, false)

    //수정
    document.querySelector(".modifyBtn").addEventListener("click", (e) => {
        e.stopPropagation();
        e.preventDefault();

        self.location = "/admin/shop/notice/modify/${noticeDTO.bno}${listDTO.link}";

    }, false)


    //삭제
    document.querySelector(".removeBtn").addEventListener("click", (e) => {
        console.log("삭제버튼")
        actionForm.submit();
    }, false)
</script>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp" %>