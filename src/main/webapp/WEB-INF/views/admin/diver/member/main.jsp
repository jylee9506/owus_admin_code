<%--
  User: 
  Date: 2022-05-01
  Time: 오후 12:15
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/admin/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/admin/basic_sidebar.jsp" %>

<main id="main" class="main">
    <%@ include file="/WEB-INF/include/admin/basic_pagetitle.jsp" %>

    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <div class="container-fluid p-0">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h5 class="card-title">강사신청등록</h5>
                                </div>
                                <div class="col-auto">
                                    <select class="state">
                                        <option value="0" ${listDTO.state == 0 ? "selected":""}>
                                            전체보기
                                        </option>
                                        <option value="3" ${listDTO.state == 3 ? "selected":""}>
                                            승인
                                        </option>
                                        <option value="1" ${listDTO.state== 1 ? "selected":""}>
                                            승인대기
                                        </option>
                                        <option value="2" ${listDTO.state== 2 ? "selected":""}>
                                            반려
                                        </option>
                                    </select>
<%--                                    <button type="button" class="btn btn-primary writeBtn">등록하기</button>--%>
                                </div>
                            </div>
                        </div>

                        <!-- Default Table -->
                        <table class="table text-center table-hover">
                            <thead>
                            <tr>
                                <th scope="col" class="col-6">제목</th>
                                <th scope="col" class="col-1">닉네임</th>
                                <th scope="col" class="col-1">#</th>
                                <th scope="col" class="col-2">신청일자</th>
                                <th scope="col" class="col-2">상태</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%-- 게시글              =======================================================================--%>

                            <c:forEach items="${dtoList}" var="dto">
                                <tr>
                                    <td>
                                        <a class="titleInList tutorID" href="/admin/diver/member/read/${dto.mno}">강사등록 신청합니다.</a>
                                    </td>
                                    <td class="text-truncate">${dto.nickname}</td>
                                    <td>${dto.mno}</td>
                                    <td>${dto.requestdate}</td>

                                    <td><c:choose>
                                        <c:when test="${dto.state==1}">승인대기</c:when>
                                        <c:when test="${dto.state==2}">반려</c:when>
                                        <c:when test="${dto.state==3}">승인</c:when>
                                    </c:choose></td>
                                </tr>

                            </c:forEach>
                            <%-- 게시글 끝              =======================================================================--%>
                            </tbody>
                        </table>
                        <!-- End Default Table Example -->
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <nav aria-label="...">


                                        <%--페이징하기--%>
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item ${pgMaker.prev ? '' : 'disabled'} ">
                                                <a class="page-link" data-page="${pgMaker.start-1}"
                                                   href="?page=${pgMaker.start-1}" ${pgMaker.prev ? '' : 'tabindex="-1" aria-disabled="true"'}>«</a>
                                            </li>

                                            <c:forEach begin="${pgMaker.start}" end="${pgMaker.end}" var="page">
                                                <li class="page-item ${pgMaker.page == page ? 'active' : ''}">
                                                    <a class="page-link" data-page="${page}"
                                                       href="?page=${page}">${page}</a>
                                                </li>
                                            </c:forEach>

                                            <li class="page-item ${pgMaker.next ? '' : 'disabled'} ">
                                                <a class="page-link" data-page="${pgMaker.end+1}"
                                                   href="?page=${pgMaker.end+1}" ${pgMaker.next ? '' : 'tabindex="-1" aria-disabled="true"'}>»</a>
                                            </li>
                                        </ul>

                                    </nav>
                                </div>
                            </div>

                            <div class="row justify-content-md-center align-items-center">
                                <div class="col col-auto">
                                    <select class="selectType" aria-label="select search type">
                                        <option value="w" ${listDTO.type == "w" ? 'selected' : ''}>닉네임</option>
                                    </select>
                                </div>

                                <div class="col col-auto">
                                    <div class="search-bar">
                                        <div class="search-form d-flex align-items-center">
                                            <input type="text" name="query" placeholder="Search"
                                                   title="Enter search keyword" value="${listDTO.keyword}">
                                            <button type="submit" title="Search" class="searchBtn"><i
                                                    class="bi bi-search"></i></button>
                                        </div>
                                    </div><!-- End Search Bar -->
                                </div>

                            </div>
                        </div>
                        <!-- End Disabled and active states -->
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<!-- End #main -->

<form class="actionForm" action="/admin/diver/member/" method="get">
    <input type="hidden" name="page" value="${listDTO.page}">
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword}">
    <input type="hidden" name="state" value="${listDTO.state}">
</form>

<script src="/resources/js/owus.js"></script>

<script>


    const form = document.querySelector(".actionForm")


    document.querySelector(".state").addEventListener("change",(e)=>{
        e.stopPropagation()
        e.preventDefault()

        const target = e.target
        console.log(target.value)
        form.querySelector("input[name='state']").value=target.value
        form.setAttribute("action","/admin/diver/member")
        form.submit()

    },false)

    document.querySelector(".searchBtn").addEventListener("click",(e)=>{
        console.log("검색")
        e.stopPropagation()
        e.preventDefault()

        const target = e.target

        const keyword = document.querySelector(".search-bar input[name='query']").value

        form.setAttribute("action","/admin/diver/member/")
        form.querySelector("input[name='keyword']").value = keyword
        form.submit()


    },false)

    qsAddEvent("input[name='query']", "keyup", (e) => {
        if(e.keyCode === 13) {
            qs(".searchBtn").click()
        }
    })

</script>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp" %>
