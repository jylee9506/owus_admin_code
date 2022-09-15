<%--
  User: 
  Date: 2022-05-01
  Time: 오후 9:27
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
          <div class="card-body">
            <div class="row pt-3">
              <div class="col-12 text-end">
                <button class="btn btn-primary listBtn">목록</button>
                <button class="btn btn-primary modifyBtn">수정</button>
                <button class="btn btn-danger deleteBtn">삭제</button>
              </div>
            </div>
            <hr/>
            <div class="row g-3">
              <div class="col-md-7 pt-3 m-0">
                <div class="mainImgArea">
                  <div class="writeItemImg mainImg" style="background-image: url(/attach/view?fileName=${dto.uploads.size() > 0 ? dto.uploads.get(0).link : 'empty.png'})"></div>
                </div>
              </div>
              <div class="col-md-5 pt-3 m-0">
                <div class="row row-cols-1">
                  <div class="col h2">${dto.pdName}</div>
                  <div class="col pb-5">${dto.content}</div>
                </div>
                <div class="row row-cols-2 gy-2 h4 text-end">
                  <div class="col-8">일반 가격</div>
                  <div class="col-4"><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.price}"/>원</div>

                  <div class="col-8">강사 가격</div>
                  <div class="col-4"><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.dprice}"/>원</div>

                  <div class="col-8">인원 제한</div>
                  <div class="col-4"><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.pdLimit}"/>명</div>
                </div>
              </div>
              <hr/>
            </div>
            <div class="row g-3">
              <div class="col-md-7 contentImgArea">
                <img src="/attach/view?fileName=${dto.uploads.size() > 1 ? dto.uploads.get(1).link : 'empty.png'}" style="width: 100%">
              </div>
              <div class="col-md-5">
                <div class="row row-cols-2 align-items-center gy-2">
                  <div class="rounded-3" id="map" style="width:100%; height:50vh;"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>

<div class="modal fade warningModal" id="verticalycentered" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">작성 살패</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close"></button>
      </div>
      <div class="modal-body">
        비어있는 칸 또는 첨부 이미지를 확인하세요
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
          Close
        </button>
      </div>
    </div>
  </div>
</div>
<!-- End Vertically centered Modal-->
<%--<sec:authentication property="principal.mno" var="mno"/>--%>

<form class="actionForm" method="post" action="">
  <input type="hidden" name="mno" value="${user.mno}">
  <input type="hidden" name="pdno" value="${dto.pdno}">
</form>

<%@include file="/WEB-INF/include/shop/basic_footer.jsp" %>

<script src="/resources/js/owus.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/upload.js"></script>

<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=baaf4ef8ebcbc926523f97284e38200e"></script>

<link href="/resources/css/kakaomap.css" rel="stylesheet"/>
<script type="text/javascript" src="/resources/js/kakaomap.js"></script>

<script>
    const actionForm = qs(".actionForm")
    const dpno = '${dto.dpno}'

    qsClickEvent(".listBtn", (e) => {
        location.href = `\${path}`
    })

    qsClickEvent(".deleteBtn", (e) => {
        actionForm.setAttribute("action", `\${path}/delete`)
        actionForm.submit()
    })

    qsClickEvent(".modifyBtn", (e) => {
        actionForm.setAttribute("action", `\${path}/update`)
        actionForm.setAttribute("method", "GET")
        actionForm.submit()
    })

    getPointByDpno(dpno)
</script>