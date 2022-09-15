<%--
  User: 
  Date: 2022-05-01
  Time: 오후 12:15
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/shop/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/shop/basic_sidebar.jsp" %>

<link href="/resources/css/shop.css" rel="stylesheet"/>

<main id="main" class="main">
    <%@ include file="/WEB-INF/include/admin/basic_pagetitle.jsp" %>

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body pt-3">
                        <div class="container-fluid">
                            <div class="row">
                                <table class="table text-center shopInfo">
                                    <tbody>
                                    <%-- 게시글              =======================================================================--%>
                                    <tr>
                                        <th scope="row">아이디</th>
                                        <td class="text-start">
                                            <span>${dto.id}</span>
                                        </td>
                                        <th scope="row">상태</th>
                                        <td class="text-start align-center d-flex">
                                            <c:choose>
                                                <c:when test="${dto.state == 1}">대기</c:when>
                                                <c:when test="${dto.state == 2}">반려</c:when>
                                                <c:when test="${dto.state == 3}">승인</c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr class="align-middle">
                                        <th scope="row">업체명</th>
                                        <td class="text-start">
                                            <input class="inputText form-control" type="text"
                                                   name="name" value="${dto.name}">
                                        </td>
                                        <th scope="row">전화번호</th>
                                        <td class="text-start">
                                            <input class="inputText form-control" type="text"
                                                   name="phone" value="${dto.phone}">
                                        </td>
                                    </tr>
                                    <tr class="align-middle">
                                        <th scope="row">주소</th>
                                        <td class="text-start">
                                            <input class="inputText form-control" type="text"
                                                   name="address" value="${dto.address}">
                                        </td>
                                        <th scope="row">사업자 번호</th>
                                        <td class="text-start">
                                            <input class="inputText form-control" type="text" name="bzNum"
                                                   value="${dto.bzNum}"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">이메일</th>
                                        <td class="text-start">
                                            <input class="inputText form-control" type="text" name="email"
                                                   value="${dto.email}">
                                        </td>
                                        <th scope="row">정보수정일</th>
                                        <td class="text-start">
                                            <span>${dto.updateDate}</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">신청일자</th>
                                        <td class="text-start"><span>${dto.requestDate}</span></td>
                                        <th scope="row">처리일자</th>
                                        <td class="text-start"><span>${dto.approveDate}</span></td>
                                    </tr>
                                    <%-- 게시글 끝              =======================================================================--%>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row align-items-center justify-content-end mb-3">
                                <div class="col-auto shopUpdateDiv">
                                    <button type="button" class="btn btn-success shopUpdateBtn">수정 완료
                                    </button>
                                    <button type="button" class="btn btn-secondary cancelBtn">취소
                                    </button>
                                </div>
                            </div>
                            <div class="accordion mb-2" >
                                <div class="accordion-item">
                                    <h2 class="accordion-header" >
                                        <div class="accordion-button" >
                                            <b>부대 시설</b>
                                        </div>
                                    </h2>
                                    <div class="accordion-collapse">
                                        <div class="accordion-body container-fluid facilityItem">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="accordion" id="accordionExample">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne">
                                        <button class="accordion-button" type="button"
                                                data-bs-toggle="collapse"
                                                data-bs-target="#collapseOne" aria-expanded="false"
                                                aria-controls="collapseOne">
                                            소속 강사
                                        </button>
                                    </h2>
                                    <div id="collapseOne" class="accordion-collapse collapse show"
                                         aria-labelledby="headingOne"
                                         data-bs-parent="#accordionExample">
                                        <div class="accordion-body container-fluid itemsBody">
                                            <%-- 상품 1개 영역--%>
                                            <%-- 상품 1개 영역 end--%>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="row row-cols-1 pt-4">
                                <div class="col"><h3>다이빙 포인트</h3></div>
                                <div class="col">
                                    <div class="rounded-3" id="map"
                                         style="width:100%;height:50vh;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</main>
<!-- Button trigger modal -->

<div class="modal fade" id="popupImgModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <div class="form-floating">
                    <img style="width: 100%" class="imgInModal"/>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary popupImgModalOut">확인
                </button>
            </div>
        </div>
    </div>
</div>
<!-- End Basic Modal-->

<%--<!-- End #main -->--%>
<form class="actionForm" action="" method="get">
    <input type="hidden" name="mno" value="${dto.mno}">
    <input type=hidden name="name" value="${dto.name}">
    <input type="hidden" name="phone" value="${dto.phone}">
    <input type="hidden" name="address" value="${dto.address}">
    <input type="hidden" name="email" value="${dto.email}">
</form>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/owus.js"></script>

<script>
    const actionForm = document.querySelector(".actionForm");
    const mno = '${dto.mno}'
    const shopInfoTable = document.querySelector(".shopInfo");

    //update ---
    qsAddEvent(".shopUpdateBtn", "click", (e) => {
        e.stopPropagation();
        e.preventDefault();
        console.log("수정 버튼");
        const name = shopInfoTable.querySelector("input[name='name']").value;
        const phone = shopInfoTable.querySelector("input[name='phone']").value;
        const address = shopInfoTable.querySelector("input[name='address']").value;
        const email = shopInfoTable.querySelector("input[name='email']").value;

        actionForm.querySelector("input[name ='mno']").value = mno;
        actionForm.querySelector("input[name='name']").value = name;
        actionForm.querySelector("input[name = 'phone']").value = phone;
        actionForm.querySelector("input[name = 'address']").value = address;
        actionForm.querySelector("input[name ='email']").value = email;

        actionForm.setAttribute("action", "/shop/mypage/info/modify/shopinfo");
        actionForm.setAttribute("method", "post");
        actionForm.submit();
    })
    // update end----

    document.querySelector(".cancelBtn").addEventListener("click",(e)=>{
        e.stopPropagation();
        e.preventDefault();

        self.location ="/shop/mypage/info";
    },false)

    const state = ${dto.state};
    if(state ==3 ){
        axios.get(`/details/tutor/\${mno}`).then(rst => {
            const f = new Intl.NumberFormat('ko-KR')
            const itemsBody = qs(".itemsBody")
            let str = ""

            str += `<table class="table text-center">
            <tbody>
            <tr>
                <th class = "col-1" >이름</th>
                <th class="col-1">성별</th>
                <th class="col-1">나이</th>
            </tr>
        `
            rst.data.forEach(d => {
                str += `
            <tr >
                <td>\${d.nickname} </td>
                <td>\${d.gender == 0 ? '남자' : '여자'}</td>
                <td>\${d.birthdate}</td>
            </tr>
             `
            })
            str += `  </tbody>
                </table>`
            itemsBody.innerHTML = str;
        })
    }

</script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=baaf4ef8ebcbc926523f97284e38200e"></script>

<link href="/resources/css/kakaomap.css" rel="stylesheet"/>
<script type="text/javascript" src="/resources/js/kakaomap.js"></script>
