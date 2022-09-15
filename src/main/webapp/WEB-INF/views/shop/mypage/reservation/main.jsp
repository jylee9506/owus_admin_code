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

<link rel="stylesheet" href="/resources/css/kakaomap.css">

<main id="main" class="main">
  <%@ include file="/WEB-INF/include/shop/basic_pagetitle.jsp"%>

  <section class="section">
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-body">
            <div class="container-fluid p-0 pt-3">
              <div class="row align-items-center">
                <div class="col">
                  <div class="explainBoard"></div>
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
                  <select class="selectState pe-md-5">
                    <c:forEach var="entry" items="${state}" varStatus="status">
                      <option value="${entry.key}" ${entry.key == listDTO.state ? "selected":""}>${entry.value}</option>
                    </c:forEach>
                  </select>
                </div>
              </div>
            </div>
            <hr/>

            <!-- Default Table -->
            <table class="table text-center table-hover">
              <thead>
              <tr>
                <th scope="col" class="col-1">예약번호</th>
                <th scope="col" class="col-2">상품명</th>
                <th scope="col" class="col-1">예약자</th>
                <th scope="col" class="col-1">강사</th>
                <th scope="col" class="col-1">일반</th>
                <th scope="col" class="col-1">총가격</th>
                <th scope="col" class="col-1">예약날짜</th>
                <th scope="col" class="col-1">체험날짜</th>
                <th scope="col" class="col-1">종료날짜</th>
                <th scope="col" class="col-1">상태</th>
              </tr>
              </thead>
              <tbody>
<%-- 게시글              =======================================================================--%>
              <c:forEach items="${dtoList}" var="dto">
                <tr class="align-middle">
                  <th scope="row" class="text-truncate">${dto.rsvNo}</th>
                  <td class="text-start text-truncate">
                    <a href="/shop/mypage/reservation/read/${dto.rsvNo}" class="titleInList">${dto.pdName}</a>
                  </td>
                  <td>
                      ${dto.name}
                  </td>
                  <td>
                      ${dto.tutorCnt}
                  </td>
                  <td>
                      ${dto.normalCnt}
                  </td>
                  <td>
                      ${dto.price}
                  </td>
                  <td>
                    <fmt:parseDate value="${dto.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                    <fmt:formatDate pattern="yy-MM-dd HH:mm" value="${ parsedDateTime }" />
                  </td>
                  <td>
                    <fmt:parseDate value="${dto.startDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                    <fmt:formatDate pattern="yy-MM-dd" value="${ parsedDateTime }" />
                  </td>
                  <td>
                    <fmt:parseDate value="${dto.endDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                    <fmt:formatDate pattern="yy-MM-dd" value="${ parsedDateTime }" />
                  </td>
                  <td>
                      ${state[dto.state]}
                  </td>
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
                    <option value="w" ${(listDTO.type == null || listDTO.type == "w") ? 'selected' : ''}>예약자</option>
                    <option value="n" ${listDTO.type == "n" ? 'selected' : ''}>상품명</option>
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

<form class="actionForm" action="/shop/mypage/reservation" method="get">
  <input type="hidden" name="page" value="${listDTO.page}">
  <input type="hidden" name="size" value="${listDTO.size}">
  <input type="hidden" name="type" value="${listDTO.type}">
  <input type="hidden" name="keyword" value="${listDTO.keyword}">
  <input type="hidden" name="state" value="${listDTO.state}">
</form>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp"%>

<script src="/resources/js/owus.js"></script>

<script>
    const actionForm = qs(".actionForm")

    qsAddEvent(".selectSize", "change", (e)=>{
        const target = e.target

        qs("input[name='size']").value = target.value

        actionForm.submit()
    })

    qsAddEvent(".selectState", "change", (e)=>{
        const target = e.target

        qs("input[name='state']").value = target.value
        qs("input[name='page']").value = 1

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

        actionForm.setAttribute("action", "/shop/mypage/reservation")
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

        actionForm.submit()
    })

    qsClickEvent(".clearBtn", (e) => {
        qs("input[name='keyword']").value = ""
        qs("input[name='type']").value = "w"

        actionForm.submit()
    })
</script>


