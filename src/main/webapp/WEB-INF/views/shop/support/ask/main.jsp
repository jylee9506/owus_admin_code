<%--
  User: 
  Date: 2022-05-01
  Time: 오후 12:15
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/include/shop/basic_header.jsp"%>
<%@ include file="/WEB-INF/include/shop/basic_sidebar.jsp"%>

<main id="main" class="main">
  <%@ include file="/WEB-INF/include/shop/basic_pagetitle.jsp"%>

<%--  <h1><sec:authentication property="principal.mno"/></h1>--%>

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
                  <select class="selectCategory pe-md-5">
                    <option value="0">카테고리 전체</option>
                    <c:forEach var="entry" items="${category}" varStatus="status">
                      <option value="${entry.key}" ${entry.key == listDTO.category ? "selected":""}>${entry.value}</option>
                    </c:forEach>
                  </select>
                </div>

                <div class="col-auto">
                  <select class="selectState pe-md-5">
                    <option value="0">처리결과</option>
                    <option value="1" ${listDTO.state == 1 ? "selected": ""}>처리 중</option>
                    <option value="2" ${listDTO.state == 2 ? "selected": ""}>처리완료</option>
                  </select>
                </div>

                <div class="col-auto">
                  <button type="button" class="btn btn-primary writeBtn">글쓰기</button>
                </div>
              </div>
            </div>
            <hr/>

            <!-- Default Table -->
            <table class="table text-center table-hover">
              <thead>
              <tr>
                <th scope="col" class="col-1">번호</th>
                <th scope="col" class="col-2">카테고리</th>
                <th scope="col" class="col-4">제목</th>
                <th scope="col" class="col-1">작성자</th>
                <th scope="col" class="col-2">작성일</th>
                <th scope="col" class="col-2">처리결과</th>
              </tr>
              </thead>
              <tbody>
<%-- 게시글              =======================================================================--%>
              <c:forEach items="${dtoList}" var="dto">
                <tr class="align-middle">
                  <th scope="row">${dto.bno}</th>
                  <td>${category[dto.category]}</td>
                  <td class="text-start text-truncate d-flex align-items-center">
                    <div style="width: 50px; height: 50px;" class="me-1">
                      <c:if test="${dto.mainImg != null}">
                        <img src="/attach/view?fileName=${dto.mainImg}" style="width: 100%; height: 100%;">
                      </c:if>
                    </div>
                    <div><a href="ask/read/${dto.bno}" class="titleInList">${dto.title}</a> (${dto.replyCount})</div>
                  </td>
                  <td class="text-truncate">${dto.nickname}</td>
                  <td>
                    <fmt:parseDate value="${dto.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                    <fmt:formatDate pattern="yy-MM-dd HH:mm" value="${ parsedDateTime }" />
                  </td>
                  <td>${dto.answerDate == null ? "처리중" : "처리완료"}</td>
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
                        <a class="page-link" data-page="${pgMaker.start-1}" href="?page=${pgMaker.start-1}" ${pgMaker.prev ? '' : 'tabindex="-1" aria-disabled="true"'}>«</a>
                      </li>

                      <c:forEach begin="${pgMaker.start}" end="${pgMaker.end}" var="page">
                        <li class="page-item ${pgMaker.page == page ? 'active' : ''}">
                          <a class="page-link" data-page="${page}" href="?page=${page}">${page}</a>
                        </li>
                      </c:forEach>

                      <li class="page-item ${pgMaker.next ? '' : 'disabled'} ">
                        <a class="page-link" data-page="${pgMaker.end+1}" href="?page=${pgMaker.end+1}" ${pgMaker.next ? '' : 'tabindex="-1" aria-disabled="true"'}>»</a>
                      </li>
                    </ul>
                  </nav>
                </div>
              </div>

              <div class="row justify-content-md-center align-items-center">
                <div class="col col-auto">
                  <select class="selectType" aria-label="select search type">
                    <option value="t" ${(listDTO.type == null || listDTO.type == "t") ? 'selected' : ''}>제목</option>
                    <option value="c" ${listDTO.type == "c" ? 'selected' : ''}>내용</option>
                    <option value="tc" ${listDTO.type == "tc" ? 'selected' : ''}>제목+내용</option>
                  </select>
                </div>

                <div class="col col-auto">
                  <div class="search-bar">
                    <div class="search-form d-flex align-items-center">
                      <input type="text" name="query" placeholder="Search" title="Enter search keyword" value="${listDTO.keyword}">
                      <button type="submit" title="Search" class="searchBtn"><i class="bi bi-search"></i></button>
                    </div>
                  </div><!-- End Search Bar -->
                </div>

                <c:if test="${listDTO.keyword != null}">
                  <div class="col-auto">
                    <button type="button" class="btn btn-dark clearBtn">초기화</button>
                  </div>
                </c:if>

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

<form class="actionForm" action="ask" method="get">
  <input type="hidden" name="page" value="${listDTO.page}">
  <input type="hidden" name="size" value="${listDTO.size}">
  <input type="hidden" name="type" value="${listDTO.type}">
  <input type="hidden" name="keyword" value="${listDTO.keyword}">
  <input type="hidden" name="category" value="${listDTO.category}">
  <input type="hidden" name="state" value="${listDTO.state}">
</form>

<%@include file="/WEB-INF/include/shop/basic_footer.jsp"%>

<script src="/resources/js/owus.js"></script>

<script>
    const actionForm = qs(".actionForm")

    qsAddEvent(".selectSize", "change", (e)=>{
        const target = e.target

        actionForm.setAttribute("action", path)
        qs("input[name='size']").value = target.value

        actionForm.submit()
    })

    qsAddEvent(".selectCategory", "change", (e)=> {
        const target = e.target

        actionForm.setAttribute("action", path)
        qs("input[name='category']").value = target.value
        qs("input[name='page']").value = 1

        actionForm.submit()
    })

    qsAddEvent(".selectState", "change", (e)=>{
        const target = e.target

        actionForm.setAttribute("action", path)
        qs("input[name='state']").value = target.value
        qs("input[name='page']").value = 1

        actionForm.submit()
    })

    qsClickEvent(".writeBtn", (e) => {
        actionForm.setAttribute("action", `\${path}/write`)
        actionForm.submit()
    })

    qsClickEvent(".pagination", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const target = e.target;

        if(target.getAttribute("class") !== "page-link") {
            return
        }

        qs("input[name='page']").value = target.getAttribute("data-page")

        actionForm.setAttribute("action", path)
        actionForm.submit()

    })

    qsClickEvent(".table", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const target = e.target;

        if(target.getAttribute("class").indexOf("titleInList") < 0) {
            return
        }

        actionForm.setAttribute("action", target.getAttribute("href"))
        actionForm.submit()
    })

    qsAddEvent("input[name='query']", "keyup", (e) => {
        if(e.keyCode === 13) {
            qs(".searchBtn").click()
        }
    })

    qsClickEvent(".searchBtn", (e) => {
        const keyword = qs("input[name='query']").value

        if(keyword === null || keyword === "") {
            return
        }

        qs("input[name='keyword']").value = qs("input[name='query']").value
        qs("input[name='type']").value = qs(".selectType").value
        qs("input[name='page']").value = 1

        actionForm.setAttribute("action", path)
        actionForm.submit()
    })

    qsClickEvent(".clearBtn", (e) => {
        qs("input[name='keyword']").value = ""
        qs("input[name='type']").value = "t"

        actionForm.setAttribute("action", path)
        actionForm.submit()
    })
</script>


