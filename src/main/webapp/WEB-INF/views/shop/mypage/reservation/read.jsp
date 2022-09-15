<%--
  User: 
  Date: 2022-05-01
  Time: 오후 12:15
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/include/shop/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/shop/basic_sidebar.jsp" %>

<link href="/resources/css/shop.css" rel="stylesheet"/>

<main id="main" class="main">
  <%@ include file="/WEB-INF/include/shop/basic_pagetitle.jsp" %>

  <section class="section">
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-body pt-3">
            <div class="container-fluid">
              <div class="row">
                <p class="pTag">예약 정보</p>
                <table class="table text-center shopInfo">
                  <tbody>
                  <tr>
                    <th scope="row">예약번호</th>
                    <td class="text-start">${dto.rsvNo}</td>
                    <th scope="row">상품명</th>
                    <td class="text-start align-center d-flex">${dto.pdName}</td>
                  </tr>
                  <tr class="align-middle">
                    <th scope="row">예약자</th>
                    <td class="text-start">${dto.rsvName}</td>
                    <th scope="row">인원</th>
                    <td class="text-start">
                      강사: ${dto.tutorCnt}, &nbsp; 일반: ${dto.normalCnt}
                    </td>
                  </tr>
                  <tr class="align-middle">
                    <th scope="row">총가격</th>
                    <td class="text-start">${dto.price}</td>
                    <th scope="row">예약날짜</th>
                    <td class="text-start">
                      <fmt:parseDate value="${dto.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                      <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ parsedDateTime }" />
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">기간</th>
                    <td class="text-start">
                      <fmt:parseDate value="${dto.startDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                      <fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />
                      ~
                      <fmt:parseDate value="${dto.endDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                      <fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />
                    </td>
                    <th scope="row">상태</th>
                    <td class="text-start">${state[dto.state]}</td>
                  </tr>
                  <tr>
                    <c:if test="${state[dto.state] == '반려'}">
                      <th scope="row">반려사유</th>
                      <td class="text-start" colspan="3">${dto.rejectCause}</td>
                    </c:if>
                  </tr>
                  </tbody>
                </table >
                <p class="pTag">인원 정보</p>
                  <c:forEach items="${dto.detailList}" var="list">
                    <p>
                    <c:if test="${list.tutorFlag == 0}">
                      <table class="table text-center shopInfo">
                      <tr>
                        <th scope="row">이름</th>
                        <td class="text-start">${list.name}</td>
                        <th scope="row">생년월일</th>
                        <td class="text-start">${list.birth}</td>
                      </tr>
                      <tr>
                        <th scope="row">성별</th>
                        <td class="text-start">${gender[list.gender]}</td>
                        <th scope="row">렌탈여부</th>
                        <td class="text-start">${list.rentalFlag == 0 ? 'X' : 'O'}</td>
                      </tr>
                      </table>
                    </c:if>
                      <c:if test="${list.tutorFlag == 1}">
                        <table class="table text-center shopInfo">
                        <tr>
                          <th scope="row">소속</th>
                          <td class="text-start">${list.certAssoc}</td>
                          <th scope="row">강사번호</th>
                          <td class="text-start">${list.certNum}</td>
                        </tr>
                        <tr>
                          <th scope="row">성별</th>
                          <td class="text-start">${gender[list.gender]}</td>
                          <th scope="row">렌탈여부</th>
                          <td class="text-start">${list.rentalFlag == 0 ? 'X' : 'O'}</td>
                        </tr>
                        </table>
                      </c:if>
                    <c:if test="${list.rentalFlag == 1}">
                      <table class="table text-center shopInfo">
                        <tr>
                          <th scope="row">발사이즈</th>
                          <td class="text-start">${list.footSize}</td>
                          <th scope="row">키</th>
                          <td class="text-start">${list.height}</td>
                          <th scope="row">몸무게</th>
                          <td class="text-start">${list.weight}</td>
                        </tr>
                      </table>
                    </c:if>
                    <br><br>
                    </p>

                  </c:forEach>
                  <%-- 게시글 끝              =======================================================================--%>
              </div>
              <hr>
              <div class="row align-items-center justify-content-end">
                <div class="col-auto shopUpdateDiv">
                  <button type="button" class="btn btn-primary shopListBtn">목록
                  </button>
                  <c:if test="${dto.state == 1 }">
                  <button type="button" class="btn btn-primary approveBtn">승인
                  </button>
                  <button type="button" class="btn btn-primary returnBtn">반려
                  </button>
                  </c:if>
                </div>
              </div>
              <div class="modal fade" id="updateReplyModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">반려</h5>
                    </div>
                    <div class="modal-body">
                      <div class="form-floating">

                        <textarea class="form-control rejectCause" placeholder="Leave a comment here" id="floatingTextarea1" style="height: 150px"></textarea>
                        <label for="floatingTextarea1"></label>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary cancelBtn">취소</button>
                      <button type="button" class="btn btn-primary realReturnBtn">반려</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Basic Modal-->
            </div>
          </div>
        </div>
      </div>
    </div>

  </section>
</main>

<%--<!-- End #main -->--%>
<form class="actionForm" action="" method="get">
  <input type="hidden" name="page" value="${listDTO.page}">
  <input type="hidden" name="size" value="${listDTO.size}">
  <input type="hidden" name="type" value="${listDTO.type}">
  <input type="hidden" name="keyword" value="${listDTO.keyword}">
  <input type="hidden" name="state" value="${listDTO.state}">


  <div class="additionalInput"></div>
</form>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/owus.js"></script>

<script>
  const form = document.querySelector(".actionForm");
  const additionalInput = document.querySelector('.additionalInput');
  const rsvNo = ${dto.rsvNo};
  const updateReplyModal = bootstrap.Modal.getOrCreateInstance(qs("#updateReplyModal"))

  qsAddEvent(".shopListBtn", "click", (e)=> {
    e.stopPropagation()
    e.preventDefault()

    form.setAttribute("action", "/shop/mypage/reservation");
    form.submit();
  });

  qsAddEvent(".approveBtn", "click", (e)=> {
    e.stopPropagation()
    e.preventDefault()

    form.setAttribute("action", "/shop/mypage/reservation/update");
    form.setAttribute("method", "POST");

    additionalInput.innerHTML += `<input type="hidden" name="rsvNo" value="\${rsvNo}">`
    document.querySelector("input[name='state']").value = 5;

    form.submit();
  })

  qsAddEvent(".returnBtn", "click", (e)=> {
    e.stopPropagation()
    e.preventDefault()

    updateReplyModal.show()
  })

  qsClickEvent(".realReturnBtn", (e) => {
    const content = qs(".rejectCause").value

    form.setAttribute("action", "/shop/mypage/reservation/update");
    form.setAttribute("method", "POST");

    additionalInput.innerHTML += `<input type="hidden" name="rsvNo" value="\${rsvNo}">`
    additionalInput.innerHTML += `<input type="hidden" name="rejectCause" value="\${content}">`
    document.querySelector("input[name='state']").value = 3;

    form.submit();

    updateReplyModal.hide();

  })

  qsClickEvent(".cancelBtn", (e) => {

    updateReplyModal.hide()
  })
</script>
