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
                                    <div class="row justify-content-md-end ">
                                        <div class="col col-auto ">
                                            <span>
                                                <select class="genderType" aria-label="select search type">
                                                    <option data-category="1"
                                                            value="" ${(listDTO.mtype == null) ? 'selected' : ''}>
                                                        ---
                                                    </option>
                                                       <option data-category="1"
                                                               value="0" ${(listDTO.mtype == "0") ? 'selected' : ''}>
                                                        남
                                                    </option>
                                                    </option>
                                                    <option data-category="1"
                                                            value="1" ${listDTO.mtype == "1" ? 'selected' : ''}>여
                                                    </option>
                                                </select>
                                            </span>
                                            <span>
                                                <select class="stateType" aria-label="select search type">
                                                    <option data-category="2"
                                                            value="" ${(listDTO.type == null) ? 'selected' : ''}>
                                                     ---
                                                    </option>
                                                       <option data-category="2"
                                                               value="s" ${( listDTO.type == "s") ? 'selected' : ''}>
                                                        승인
                                                    </option>
                                                    <option data-category="2"
                                                            value="w" ${listDTO.type == "w" ? 'selected' : ''}>대기
                                                    </option>
                                                    <option data-category="2"
                                                            value="r" ${listDTO.type == "r" ? 'selected' : ''}>반려
                                                    </option>
                                                </select>
                                            </span>
                                        </div>
                                    </div>
                                    <table class="table text-center shopInfo">
                                        <tbody>
                                        <tr>
                                            <th class="col-3">이름</th>
                                            <th class="col-3">성별</th>
                                            <th class="col-3">나이</th>
                                            <th class="col-2">상태</th>
                                            <th class="co1-2">선택</th>
                                        </tr>
                                        <c:forEach items="${dto}" var="d">
                                            <tr>
                                                <td>${d.nickname}</td>
                                                <td>${d.gender == 0 ? '남자' : '여자'}</td>
                                                <td>${d.birthdate}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${d.state == 1}">대기</c:when>
                                                        <c:when test="${d.state == 2}">반려</c:when>
                                                        <c:when test="${d.state == 3}">승인</c:when>
                                                    </c:choose>
                                                </td>
                                                <td><input type="<c:set var="mno" value="${mno}"/><c:choose><c:when test="${d.smno == mno}">hidden</c:when><c:when test="${d.smno != mno}">checkbox</c:when></c:choose>"
                                                        name="diver" class="diver-checkbox" value="${d.mno}" }></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <nav aria-label="...">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item ${pgMaker.prev ? '' : 'disabled'} ">
                                        <a class="page-link" data-page="${pgMaker.start-1}"
                                           href="?page=${pgMaker.start-1}&size=${listDTO.size}" ${pgMaker.prev ? '' : 'tabindex="-1" aria-disabled="true"'}>«</a>
                                    </li>

                                    <c:forEach begin="${pgMaker.start}" end="${pgMaker.end}" var="page">
                                        <li class="page-item ${pgMaker.page == page ? 'active' : ''}">
                                            <a class="page-link" data-page="${page}"
                                               href="?mno=${mno}&page=${page}&size=${listDTO.size}&type=${listDTO.type}&mtype=${listDTO.mtype}&keyword=${listDTO.keyword}">${page}</a>
                                        </li>
                                    </c:forEach>

                                    <li class="page-item ${pgMaker.next ? '' : 'disabled'} ">
                                        <a class="page-link" data-page="${pgMaker.end+1}"
                                           href="?page=${pgMaker.end+1}&size=${listDTO.size}" ${pgMaker.next ? '' : 'tabindex="-1" aria-disabled="true"'}>»</a>
                                    </li>
                                </ul>
                            </nav>
                            <div class="row justify-content-md-center align-items-center">
                                <div class="col col-auto">
                                    <select class="selectType" aria-label="select search type">
                                        <option value="n" ${(listDTO.type == null || listDTO.type == "n") ? 'selected' : ''}>
                                            이름
                                        </option>
                                        <option value="o" ${listDTO.type == "o" ? 'selected' : ''}>나이</option>
                                    </select>
                                </div>

                                <div class="col col-auto">
                                    <div class="search-bar">
                                        <div class="search-form d-flex align-items-center">
                                            <input type="text" name="query" placeholder="Search"
                                                   title="Enter search keyword" class="keyword"
                                                   value="${listDTO.keyword}">
                                            <button type="submit" title="Search" class="searchBtn"><i
                                                    class="bi bi-search"></i></button>
                                        </div>
                                    </div><!-- End Search Bar -->
                                </div>
                            </div>
                            <div class="row align-items-center justify-content-end">
                                <div class="col-auto">
                                    <button type="button" class="btn btn-primary diverSelectBtn"> 선택 완료
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

<form class="actionForm" action="/shop/mypage/info/diver" method="get">
    <input type="hidden" name="mno" value="${mno}">
    <input type="hidden" name="type" value="${listDTO.type}">
    <input type="hidden" name="mtype" value="${listDTO.mtype}">
    <input type="hidden" name="keyword" value="${listDTO.keyword}">
    <input type="hidden" name="divers" >
</form>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/owus.js"></script>

<script>
    const actionForm = document.querySelector(".actionForm");
    const shopInfo = document.querySelector(".shopInfo");

    qsAddEvent(".genderType", "change", (e) => {
        const mtype = qs(".genderType").value;
        actionForm.querySelector("input[name = 'mtype']").value = mtype;
        actionForm.submit();
    }, false)

    qsAddEvent(".searchBtn", "click", (e) => {
        const type = document.querySelector(".selectType").value
        const keyword = document.querySelector(".keyword").value

        actionForm.querySelector("input[name ='type']").value = type;
        actionForm.querySelector("input[name = 'keyword']").value = keyword;
        actionForm.submit();
    }, false)

    qsAddEvent(".diverSelectBtn", "click", (e) => {
        const diverCheckBoxes = shopInfo.querySelectorAll(".diver-checkbox");
        const divers = [];
        for (let i = 0; i < diverCheckBoxes.length; i++) {

            if (diverCheckBoxes[i].checked == true) {
                divers[i] = diverCheckBoxes[i].getAttribute("value");
            }
        }

        divers.forEach(diver =>{
            console.log(diver)})

        actionForm.querySelector("input[name='divers']").value = divers;
        actionForm.setAttribute("action", "/shop/mypage/info/diverRemove/remove")
        actionForm.setAttribute("method", "post");
        actionForm.submit();

    }, false)

    qsAddEvent(".cancelBtn","click",(e)=>{
        console.log("취소")
        self.location ="/shop/mypage/info";
    },false)
</script>

