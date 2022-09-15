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
                            <div id="collapseOne" class="accordion-collapse collapse show"
                                 aria-labelledby="headingOne"
                                 data-bs-parent="#accordionExample">
                                <div class="accordion-body container-fluid itemsBody">
                                    <table class="table text-center shopInfo">
                                        <tbody>
                                        <tr>
                                            <th class="col-3">번호</th>
                                            <th class="col-3">부대시설먕</th>
                                            <th class="col-3">선택</th>
                                        </tr>
                                        <c:forEach items="${dto}" var="d">
                                        <tr>
                                            <td>${d.fno}</td>
                                            <td>${d.name}</td>
                                            <td><input type="checkbox" value="${d.fno}" class="facility-checkbox"></td>
                                        </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
<%--                                    샘플 시설--%>
                                </div>
                            </div>
                            <div class="row align-items-center justify-content-end">
                                <div class="col-auto">
                                    <button type="button" class="btn btn-primary facilitySelectBtn"> 선택 완료
                                    </button>
                                    <button type="button" class="btn btn-primary cancelBtn">취소
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

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

<form class="actionForm" action="/shop/mypage/info/tutorAdd" method="get">
    <input type="hidden" name="mno" value="${facilityDTO.mno}">
    <input type="hidden" name="fnoList">
</form>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/owus.js"></script>

<script>
    const actionForm = document.querySelector(".actionForm");
    const shopInfo = document.querySelector(".shopInfo");

    qsAddEvent(".facilitySelectBtn", "click", (e) => {
        const facilityCheckBoxes = shopInfo.querySelectorAll(".facility-checkbox");
        const facilities = [];
        for (let i = 0; i < facilityCheckBoxes.length; i++) {

            if (facilityCheckBoxes[i].checked == true) {
                facilities[i] = facilityCheckBoxes[i].getAttribute("value");
            }
        }

        facilities.forEach(facility => {
            console.log(facility)
        })

        actionForm.querySelector("input[name='fnoList']").value = facilities;
        actionForm.setAttribute("action", "/shop/mypage/info/facilityRemove/remove")
        actionForm.setAttribute("method", "post");
        actionForm.submit();

    }, false)

    qsAddEvent(".cancelBtn", "click", (e) => {
        console.log("취소")
        self.location = "/shop/mypage/info";
    }, false)

</script>

