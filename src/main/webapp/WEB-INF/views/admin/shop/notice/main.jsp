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
                        <div class="container-fluid p-0 pt-3">
                            <div class="row align-items-center">
                                <div class="col">
                                    <div class="explainBoard"><strong></strong></div>
                                </div>
                                <div class="col-auto">
                                    <c:set var="sizeKey">10,15,30,50</c:set>
                                    <select class="selectSize pe-md-5">
                                        <c:forEach var="sz" items="${sizeKey}">
                                            <option value="${sz}" ${listDTO.size == sz ? "selected":""}>${sz}개씩</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="col-auto">
                                    <button type="button" class="btn btn-primary writeBtn">글쓰기</button>
                                </div>
                            </div>

                            <!-- Default Table -->
                            <table class="table text-center table-hover">
                                <thead>
                                <tr>
                                    <th scope="col" class="col-1">번호</th>
                                    <th scope="col" class="col-6">제목</th>
                                    <th scope="col" class="col-1">작성자</th>
                                    <th scope="col" class="col-2">등록일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%-- 게시글              =======================================================================--%>
                                <c:forEach items="${dtoList}" var="notice">
                                    <tr>
                                        <th scope="row">${notice.bno}</th>
                                        <td class="text-start">
                                            <div class="container-fluid p-0">
                                                <div class="row">
                                                    <div class="text-center">
                                                        <a href="/admin/shop/notice/read/${notice.bno}${listDTO.link}"
                                                           class="titleInList">${notice.title}</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center">${notice.name}</td>
                                        <td>${notice.regDate}</td>
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

                                            <ul class="pagination justify-content-center">
                                                <li class="page-item ${pgMaker.prev ? '' : 'disabled'} ">
                                                    <a class="page-link" data-page="${pgMaker.start-1}"
                                                       href="?page=${pgMaker.start-1}&size=${listDTO.size}" ${pgMaker.prev ? '' : 'tabindex="-1" aria-disabled="true"'}>«</a>
                                                </li>

                                                <c:forEach begin="${pgMaker.start}" end="${pgMaker.end}" var="page">
                                                    <li class="page-item ${pgMaker.page == page ? 'active' : ''}">
                                                        <a class="page-link" data-page="${page}"
                                                           href="?page=${page}&size=${listDTO.size}">${page}</a>
                                                    </li>
                                                </c:forEach>

                                                <li class="page-item ${pgMaker.next ? '' : 'disabled'} ">
                                                    <a class="page-link" data-page="${pgMaker.end+1}"
                                                       href="?page=${pgMaker.end+1}&size=${listDTO.size}" ${pgMaker.next ? '' : 'tabindex="-1" aria-disabled="true"'}>»</a>
                                                </li>
                                            </ul>

                                        </nav>
                                    </div>
                                </div>

                                <div class="row justify-content-md-center align-items-center">
                                    <div class="col col-auto">
                                        <select class="selectType" aria-label="select search type">
                                            <option value="t" ${(listDTO.type == null || listDTO.type == "t") ? 'selected' : ''}>
                                                제목
                                            </option>
                                            <option value="c" ${listDTO.type == "c" ? 'selected' : ''}>내용</option>
                                            <option value="tc" ${listDTO.type == "tc" ? 'selected' : ''}>제목+내용</option>
                                            <option value="w" ${listDTO.type == "w" ? 'selected' : ''}>작성자</option>
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
        </div>
    </section>
</main>
<!-- End #main -->

<form class="actionForm" action="/admin/shop/notice/" method="get">
    <input type="hidden" name="page" value="${listDTO.page}">
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword}">
</form>

<script src="/resources/js/owus.js"></script>


<script>

    const table = document.querySelector(".table");
    const actionForm = document.querySelector(".actionForm");

    //글 선택시
    // table.addEventListener("click",(e)=>{
    //   e.preventDefault();
    //   e.stopPropagation();
    //
    //   if(e.target.getAttribute("class") != "titleInList")
    //       return;
    //
    //   const readNum =  e.target.getAttribute("href")
    //   actionForm.setAttribute("action","/admin/shop/notice/read/"+readNum);
    //   actionForm.submit();
    //
    // },false)

    // 동적 검색
    document.querySelector(".searchBtn").addEventListener("click", (e) => {
        e.stopPropagation();
        e.preventDefault();
        const typeSelect = document.querySelector(".selectType").value;
        const keywordInput = document.querySelector("input[name='query']").value;

        actionForm.querySelector("input[name='keyword']").value = keywordInput;
        actionForm.querySelector("input[name='type']").value = typeSelect;
        actionForm.querySelector("input[name='page']").value = 1;
        actionForm.submit();
    })

    //쓰기 버튼
    document.querySelector(".writeBtn").addEventListener("click", (e) => {
        self.location = "/admin/shop/notice/write${listDTO.link}";
    }, false)

    //selectSize
    const selectSize = document.querySelector(".selectSize");
    selectSize.addEventListener("change", (e) => {
        const size = selectSize.value;
        document.querySelector("input[name = 'size']").value = size;
        actionForm.submit();

    }, false)

    document.querySelector(".pagination").addEventListener("click", (e) => {
        e.stopPropagation();
        e.preventDefault();

        if (e.target.getAttribute("class") != "page-link") {
            return;
        }

        const page = e.target.getAttribute("data-page")
        actionForm.querySelector("input[name='page']").value = page;
        actionForm.submit();

    }, false)
</script>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp" %>
