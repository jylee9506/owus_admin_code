<%--
  User: 
  Date: 2022-05-01
  Time: 오후 12:15
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/shop/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/shop/basic_sidebar.jsp" %>

<main id="main" class="main">
    <%@ include file="/WEB-INF/include/shop/basic_pagetitle.jsp" %>

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
                                    <select class="selectState" aria-label="select search type">
                                        <option value="2" ${listDTO.state == "3" ? 'selected' : ''}>전체보기</option>
                                        <option value="0" ${listDTO.state == "0" ? 'selected' : ''}>미답변</option>
                                        <option value="1" ${listDTO.state == "1" ? 'selected' : ''}>답변완료</option>
                                    </select>
                                </div>
                            </div>

                        <!-- Default Table -->
                        <table class="table text-center table-hover">
                            <thead>
                            <tr>
                                <th scope="col" class="col-1">번호</th>
                                <th scope="col" class="col-1">예약번호</th>
                                <th scope="col" class="col-2">상품명</th>
                                <th scope="col" class="col-1">평점</th>
                                <th scope="col" class="col-2">등록일</th>
                                <th scope="col" class="col-1">상태</th>
                            </tr>
                            </thead>
                            <tbody class="content-table">
<%--                             게시글              =======================================================================--%>
                            <c:forEach items="${dtoList}" var="reply">
                                <tr>
                                    <th scope="row">${reply.rno}</th>
                                    <td class="text-center"> ${reply.rsvno}</td>
                                    <td class="text-center"><a class="content-link" href="${reply.rno}">${reply.pdname}</a> </td>
                                    <td class="text-center">${reply.score}</td>
                                    <td>${reply.regdate}</td>
                                    <td>${reply.state == 0 ? "미답변" : "답변완료"}</td>
                                </tr>
                            </c:forEach>
<%--                             게시글 끝              =======================================================================--%>
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
                                        <option value="p" ${(listDTO.type == null || listDTO.type == "p") ? 'selected' : ''}>
                                            제목
                                        </option>
                                        <option value="c" ${listDTO.type == "c" ? 'selected' : ''}>내용</option>
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

<form class="actionForm" action="/shop/mypage/review/" method="get">
    <input type="hidden" name="page" value="${listDTO.page}">
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword}">
    <input type="hidden" name="state" value="${listDTO.state}">
</form>

<script src="/resources/js/owus.js"></script>


<script>

    const table = document.querySelector(".table");
    const actionForm = document.querySelector(".actionForm");

    document.querySelector(".selectState").addEventListener("change",(e) =>{

        const state = document.querySelector(".selectState").value;
        // console.log(state);
        actionForm.querySelector("input[name='state']").value = state;
        actionForm.submit();
    },false)

   document.querySelector(".content-table").addEventListener("click",(e)=>{
        e.preventDefault();
        e.stopPropagation();

       if(e.target.getAttribute("class") != "content-link"){
           return;
       }

        const rno = e.target.getAttribute("href");
        actionForm.setAttribute("action","/shop/mypage/review/read/"+rno)

        actionForm.submit();

   },false)

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

<%@include file="/WEB-INF/include/shop/basic_footer.jsp" %>
