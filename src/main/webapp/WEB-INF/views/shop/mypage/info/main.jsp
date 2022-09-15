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
<link href="/resources/css/shop/mypage/info/info.css" rel="stylesheet"/>
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
                                                   name="name" value="${dto.name}" readonly>
                                        </td>
                                        <th scope="row">전화번호</th>
                                        <td class="text-start">
                                            <input class="inputText form-control" type="text"
                                                   name="phone" value="${dto.phone}" readonly>
                                        </td>
                                    </tr>
                                    <tr class="align-middle">
                                        <th scope="row">주소</th>
                                        <td class="text-start">
                                            <input class="inputText form-control" type="text"
                                                   name="address" value="${dto.address}" readonly>
                                        </td>
                                        <th scope="row">사업자 번호</th>
                                        <td class="text-start">
                                            <input class="inputText form-control" type="text" name="bzNum"
                                                   value="${dto.bzNum}" readonly></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">이메일</th>
                                        <td class="text-start">
                                            <input class="inputText form-control" type="text" name="email"
                                                   value="${dto.email}" readonly>
                                        </td>
                                        <th scope="row">정보수정일</th>
                                        <td class="text-start"><span>${dto.updateDate}</span></td>
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
                                    <button type="button" class="btn btn-primary shopUpdateBtn">Shop 수정
                                    </button>
                                </div>
                            </div>
                            <div class="accordion mb-2">
                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <div class="accordion-button">
                                            <b>부대 시설</b>
                                        </div>
                                    </h2>
                                    <div class="accordion-collapse">
                                        <div class="accordion-body container-fluid facilityItem">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row align-items-center justify-content-end mb-3">
                                <div class="col-auto shopUpdateDiv">
                                    <button type="button" class="btn btn-primary facilityAddBtn">facility 추가
                                    </button>
                                    <button type="button" class="btn btn-primary facilityRemoveBtn">facility 삭제
                                    </button>
                                </div>
                            </div>
                            <hr>
                            <div class="accordion mb-2" id="accordionExample">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne">
                                        <button class="accordion-button" type="button"
                                                data-bs-toggle="collapse"
                                                data-bs-target="#collapseOne" aria-expanded="false"
                                                aria-controls="collapseOne">
                                            <b>소속 강사</b>
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
                            <div class="row align-items-center justify-content-end">
                                <div class="col-auto">
<<<<<<< HEAD
                                    <button type="button" class="btn btn-primary diverAddBtn"> 강사 추가
                                    </button>
                                    <button type="button" class="btn btn-primary diverDelBtn"> 강사 삭제
=======
                                    <button type="button" class="btn btn-primary diverAddBtn">강사 추가
                                    </button>
                                    <button type="button" class="btn btn-primary diverDelBtn">강사 삭제
>>>>>>> ced54b516e74c4d77f591ba5a21c2a2f045c50d3
                                    </button>
                                </div>
                            </div>

                            <div class="row align-items-center justify-content-end mt-4">
                                <div class="col-auto">
<<<<<<< HEAD
                                    <button type="button" class="btn btn-primary diverAddBtn"> 이미지 추가
                                    </button>
                                    <button type="button" class="btn btn-primary diverDelBtn"> 이미지 삭제
=======
                                    <button type="button" class="btn btn-primary imageADD">갤러리 추가
>>>>>>> ced54b516e74c4d77f591ba5a21c2a2f045c50d3
                                    </button>
                                </div>
                            </div>

                            <%--이미지 쇼룸--%>
                            <div class="gallery-container">

                            </div>
                            <%--이미지 쇼룸 end--%>

                            <div>
                                <h3>다이빙 포인트</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</main>

<%--<!-- End #main -->--%>
<form class="actionForm" action="/shop/mypage/info/diverAdd" method="get">
    <input type=hidden name="mno" value="${dto.mno}">
    <input type="hidden" name="fnoList">
    <div class="additionalInput"></div>

</form>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/owus.js"></script>
<script src="/resources/js/shop/mypage/info.js"></script>
<script>

    const actionForm = document.querySelector(".actionForm");
    const mno = ${dto.mno};

    //이미지 업로드 버튼
    qsAddEvent(".imageADD","click",(e)=>{
        console.log("image add 버튼")

        actionForm.setAttribute("action", "/shop/mypage/info/imageAdd");
        actionForm.submit();
    },false)


    //강사 삭제 페이지 이동 버튼
    qsAddEvent(".diverDelBtn", "click", (e) => {
        e.stopPropagation();
        e.preventDefault();

        actionForm.setAttribute("action", "/shop/mypage/info/diverRemove")
        actionForm.submit();
    }, false)

    //강사 추가 페이지 이동 버튼
    qsAddEvent(".diverAddBtn", "click", (e) => {
        e.stopPropagation();
        e.preventDefault();

        actionForm.setAttribute("action", "/shop/mypage/info/tutorAdd")
        actionForm.submit();
    }, false)

    //shop 수정 페이지 이동 버튼
    qsAddEvent(".shopUpdateBtn", "click", (e) => {
        e.stopPropagation();
        e.preventDefault();

        self.location = `/shop/mypage/info/modify`;
    })

    // 부대시설 추가 페이지 이동
    qsAddEvent(".facilityAddBtn", "click", (e) => {
        e.stopPropagation();
        e.preventDefault();

        actionForm.setAttribute("action", "/shop/mypage/info/facilityAdd")
        actionForm.submit();
    }, false)

    // 부대시설 삭제 페이지 이동
    qsAddEvent(".facilityRemoveBtn", "click", (e) => {
        e.stopPropagation();
        e.preventDefault();

        actionForm.setAttribute("action", "/shop/mypage/info/facilityRemove")
        actionForm.submit();

    }, false)

    // 강사 목록 불러오기
    const state = '${dto.state}';
    if (state == 3) {
        // Tutor get
        axios.get(`/details/tutor/\${mno}`).then(rst => {
            const f = new Intl.NumberFormat('ko-KR');
            const itemsBody = qs(".itemsBody");
            let str = "";

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

        // 부대시설 get
        axios.get(`/details/facility/\${mno}`).then(facilityArr => {

            const facilityItem = qs(".facilityItem");
            let str = "";

            facilityArr.data.forEach(d => {
                str += `<div>\${d.fno} : \${d.name}</div>`
            })

            facilityItem.innerHTML = str;
        })
    }
    //image gallery get
    axios.get(`/details/gallery/\${mno}`).then(galleryArr => {
            let cnt =0;
            let fileName;
            console.log(galleryArr.data.length);
            const galleryContainer = qs(".gallery-container");
            let str = "";
            str += ` <div tabindex="0" class="info-gallery mb-1">
                                    <h3>Gallery</h3>
                                    <div class="img-list-box">
                                     <ul class="uploadResult">`
            galleryArr.data.forEach(d =>{
                str +=
                    `<li class=\${cnt==1 ? 'active' : ''}><img src='/attach/view?fileName=\${d.link}' alt=""></li>`

                if(cnt ==1){
                    fileName = `\${d.link}`;
                }
                cnt++;
            })
            str += `</ul>
                </div>
                <div class="show-room">
                    <li><img src="/attach/view?fileName=\${fileName}" alt=""></li>
                </div>
            </div>`
            galleryContainer.innerHTML = str;
    });


</script>

<%--<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=baaf4ef8ebcbc926523f97284e38200e"></script>--%>
<%--<link href="/resources/css/kakaomap.css" rel="stylesheet"/>--%>
<%--<script type="text/javascript" src="/resources/js/kakaomap.js"></script>--%>
