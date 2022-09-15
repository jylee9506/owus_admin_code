<%--
  User: 
  Date: 2022-05-01
  Time: 오후 12:15
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/admin/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/admin/basic_sidebar.jsp" %>

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
                      <div class="pe-2">
                        <select class="selectState pe-md-5 form-select-sm">
                          <c:forEach var="entry" items="${state}"
                                     varStatus="status">
                            <c:if test="${entry.key != 0}">
                              <option value="${entry.key}" ${entry.key == dto.state ? "selected":""}>${entry.value}</option>
                            </c:if>
                          </c:forEach>

                        </select>
                      </div>
                      <div>
                        <button type="button"
                                class="btn btn-primary btn-sm shopUpdateState">
                          변경
                        </button>
                      </div>
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
                      <input class="inputText form-control" type="text" name="bzNum" value="${dto.bzNum}"></td>
                  </tr>
                  <tr>
                    <th scope="row">이메일</th>
                    <td class="text-start"><span>${dto.email}</span></td>
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

              <div class="row">
                <table class="table text-center shopAttach">
                  <thead>
                  <tr>
                    <th scope="col">사업자 등록증</th>
                    <th scope="col">협회 인증</th>
                    <th scope="col">해양수산부 인증</th>
                    <th scope="col">안전교육 인증</th>
                    <th scope="col">충전소 인증</th>
                  </tr>
                  <thead>
                  <tbody>
                  <tr>
                    <td class="attachTD"><img class="img-fluid"
                                              src='/attach/view?fileName=${dto.cfBz}'/>
                    </td>
                    <td class="attachTD"><img class="img-fluid"
                                              src='/attach/view?fileName=${dto.cfAssoc}'/>
                    </td>
                    <td class="attachTD"><img class="img-fluid"
                                              src='/attach/view?fileName=${dto.cfMof}'/>
                    </td>
                    <td class="attachTD"><img class="img-fluid"
                                              src='/attach/view?fileName=${dto.cfSafety}'/>
                    </td>
                    <td class="attachTD"><img class="img-fluid"
                                              src='/attach/view?fileName=${dto.cfCharging}'/>
                    </td>
                  </tr>
                  <tbody>

                </table>

              </div>

              <div class="row align-items-center justify-content-end">
                <div class="col-auto shopUpdateDiv">
                  <button type="button" class="btn btn-primary shopListBtn">목록
                  </button>
                  <button type="button" class="btn btn-primary shopUpdateBtn">수정
                  </button>
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
                      업체 상품 보기
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
  <input type="hidden" name="page" value="${listDTO.page}">
  <input type="hidden" name="size" value="${listDTO.size}">
  <input type="hidden" name="type" value="${listDTO.type}">
  <input type="hidden" name="keyword" value="${listDTO.keyword}">
  <input type="hidden" name="state" value="${listDTO.state}">

  <input type=hidden name="mno" value="${dto.mno}">
  <div class="additionalInput"></div>

</form>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/owus.js"></script>

<script>
    const actionForm = document.querySelector(".actionForm");
    const mno = '${dto.mno}'

    const popupImgModal = bootstrap.Modal.getOrCreateInstance(qs("#popupImgModal"))

    qsClickEvent(".shopAttach", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const target = e.target

        if (target.tagName !== "IMG") {
            return
        }

        qs(".imgInModal", qs("#popupImgModal")).setAttribute("src", target.getAttribute("src"))
        popupImgModal.show()

    })

    qsClickEvent(".popupImgModalOut", (e) => {
        qs(".imgInModal", qs("#popupImgModal")).setAttribute("src", "")
        popupImgModal.hide()
    })

    // 업체관리 목록
    qsAddEvent(".shopListBtn", "click", (e) => {
        e.stopPropagation();
        e.preventDefault();

        location = `/admin/shop/member${listDTO.link}`
    });

    qsClickEvent(".shopUpdateState", (e) => {
        const selectState = qs(".selectState").value

        qs(".additionalInput").innerHTML += `<input type=hidden name="newState" value="\${selectState}">`

        actionForm.setAttribute("action", "/admin/shop/member/update/state");
        actionForm.setAttribute("method", "post");
        actionForm.submit();
    })

    qsAddEvent(".shopUpdateDiv", "click", (e) => {
        e.stopPropagation();
        e.preventDefault();

        // 수정
        if (e.target.getAttribute("class").indexOf("shopUpdateBtn") >= 0) {
            qsAll(".inputText").forEach(ipt => {
                const name = ipt.getAttribute("name")
                const val = ipt.value
                qs(".additionalInput").innerHTML += `<input type=hidden name="\${name}" value="\${val}">`
            })

            actionForm.setAttribute("action", "/admin/shop/member/update/info");
            actionForm.setAttribute("method", "post");
            actionForm.submit();
        }
    })

    axios.get(`/details/items/\${mno}`).then(rst => {
        const f = new Intl.NumberFormat('ko-KR')

        const itemsBody = qs(".itemsBody")
        let str = ""

        rst.data.forEach(d => {
            str += `
            <div class="row row-cols-3 shopItem">
              <div class="col col-2 justify-content-center">
                <div><img class="img-fluid rounded-3 itemImg" src="/attach/view?fileName=\${d.mainImg}"/></div>
              </div>
              <div class="col col-7">
                <div class="row row-cols-1">
                  <div class="col itemTitle p-0 pb-2">\${d.pdName}</div>
                  <div class="col itemContent">\${d.content}</div>
                </div>
              </div>
              <div class="col col-3">
                <table class="table table-hover table-sm m-0">
                  <tbody>
                    <tr>
                      <td>상품번호</td>
                      <td class="itemNum">\${d.pdno}</td>
                    </tr>
                    <tr>
                      <td>등록일</td>
                      <td class="itemRegDate">\${d.regDate}</td>
                    </tr>
                    <tr>
                      <td>인원제한</td>
                      <td class="itemLimit">\${d.pdLimit}</td>
                    </tr>
                    <tr>
                      <td>다이버 가격</td>
                      <td class="itemPriceD">\${f.format(d.price)}원</td>
                    </tr>
                    <tr>
                      <td>강사 가격</td>
                      <td class="itemPriceT">\${f.format(d.dprice)}원</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <hr/>
            `
        })
        itemsBody.innerHTML = str
    })

</script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=baaf4ef8ebcbc926523f97284e38200e"></script>

<link href="/resources/css/kakaomap.css" rel="stylesheet"/>
<script type="text/javascript" src="/resources/js/kakaomap.js"></script>
<script>
    getPointByMno(mno)
</script>