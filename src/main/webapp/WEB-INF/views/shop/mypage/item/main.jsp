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

<link href="/resources/css/shop.css" rel="stylesheet"/>

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
                  <button type="button" class="btn btn-primary writeBtn">상품등록</button>
                </div>
              </div>
            </div>
            <hr/>
<%--            <div class="container-fluid itemsBody">--%>
            <ul class="list-group list-group-flush itemsBody">
              <c:forEach items="${dtoList}" var="dto">
                <li class="list-group-item" data-pdno="${dto.pdno}">
                <div class="row row-cols-3 shopItem">
                  <div class="col col-2 justify-content-center">
                    <div><img class="img-fluid rounded-3 itemImg" src="/attach/view?fileName=${dto.mainImg}"/></div>
                  </div>
                  <div class="col col-7">
                    <div class="row row-cols-1">
                      <div class="col itemTitle p-0 pb-2">${dto.pdName}</div>
                      <div class="col itemContent">${dto.content}</div>
                    </div>
                  </div>
                  <div class="col col-3">
                    <table class="table table-hover table-sm m-0">
                      <tbody>
                      <tr>
                        <td>상품번호</td>
                        <td class="itemNum">${dto.pdno}</td>
                      </tr>
                      <tr>
                        <td>등록일</td>
                        <td class="itemRegDate">
                          <fmt:parseDate value="${dto.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                          <fmt:formatDate pattern="yy-MM-dd HH:mm" value="${ parsedDateTime }" />
                        </td>
                      </tr>
                      <tr>
                        <td>인원제한</td>
                        <td class="itemLimit">${dto.pdLimit}</td>
                      </tr>
                      <tr>
                        <td>다이버 가격</td>
                        <td class="itemPriceD"><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.price}"/>원</td>
                      </tr>
                      <tr>
                        <td>강사 가격</td>
                        <td class="itemPriceT"><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.dprice}"/>원</td>
                      </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                </li>
              </c:forEach>
<%--            </div>--%>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>
<!-- End #main -->

<form class="actionForm" action="" method="get">
<%--  <input type="hidden" name="page" value="${listDTO.page}">--%>
<%--  <input type="hidden" name="size" value="${listDTO.size}">--%>
<%--  <input type="hidden" name="type" value="${listDTO.type}">--%>
<%--  <input type="hidden" name="keyword" value="${listDTO.keyword}">--%>
<%--  <input type="hidden" name="category" value="${listDTO.category}">--%>
<%--  <input type="hidden" name="state" value="${listDTO.state}">--%>
</form>

<%@include file="/WEB-INF/include/shop/basic_footer.jsp"%>

<script src="/resources/js/owus.js"></script>

<script>
    const actionForm = qs(".actionForm")

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

    qsClickEvent(".itemsBody", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const target = e.target.closest("li");

        const pdno = target.getAttribute("data-pdno")

        console.log(pdno)

        actionForm.setAttribute("action", `\${path}/read/\${pdno}`)
        actionForm.submit()
    })

</script>


