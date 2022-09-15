<%--
  User: 
  Date: 2022-05-01
  Time: 오후 7:21
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/admin/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/admin/basic_sidebar.jsp" %>

<main id="main" class="main">
  <%@ include file="/WEB-INF/include/admin/basic_pagetitle.jsp" %>

  <section class="section">
    <div class="row">
      <div class="col-lg-12">

        <div class="card">
          <div class="card-body">
            <div class="container-fluid">
              <div class="row mb-2 mt-2">
                <div class="col">
                  <h2>강사 등록 신청서</h2>
                </div>
              </div>
              <div class="row align-items-end">
                <div class="col">
                  <a class="nav-link nav-profile d-flex align-items-center pe-0"
                     href="#" data-bs-toggle="dropdown">
                    <img src="http://owus.duckdns.org:38080/niceadmin/img/profile-img.jpg"
                         alt="Profile"
                         class="rounded-circle" style="height: 60px">
                    <span class="d-none d-md-block dropdown-toggle ps-2">${tutorDTO.name}</span>
                  </a>
                  <!-- End Profile Iamge Icon -->
                  <span class="bs-gray">${tutorDTO.requestdate}</span>
                </div>
                <div class="col col-auto">
                  <div class="text-end mb-2">
                    <%--                    <button type="button" class="btn btn-warning">처리완료</button>--%>
                  </div>
                  <div class="text-end approveDIV">
                    <input type="${tutorDTO.state == '3' ? "hidden":"button"}"
                           value="승인"
                           class="btn btn-outline-primary approveBtn">
                    </input>
                    <input type="${tutorDTO.state == '1' ? "hidden":"button"}"
                           value="대기" class="btn btn-outline-primary waitBtn">
                    </input>
                    <button type="button"
                            class="btn btn-outline-danger rejectBtn">반려
                    </button>

                  </div>
                </div>
              </div>
            </div>
            <hr/>
            <div class="container-fluid contentArea">
              <div class="row">
                <%--                               <div class="col">내용 내용 내용 내용 내용 내용</div>&ndash;%&gt;--%>

                <table class="table">
                  <thead>
                  <tr>
                    <th scope="col"></th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <th scope="row">회원번호</th>
                    <td>${tutorDTO.mno}</td>
                    <th scope="row">닉네임</th>
                    <td>${tutorDTO.nickname}</td>
                  </tr>
                  <tr>
                    <th scope="row">핸드폰번호</th>
                    <td>${tutorDTO.phone}</td>
                    <th scope="row">강사신청상태</th>
                    <td>
                      <c:choose>
                        <c:when test="${tutorDTO.state==1}">승인대기</c:when>
                        <c:when test="${tutorDTO.state==2}">반려</c:when>
                        <c:when test="${tutorDTO.state==3}">승인</c:when>
                      </c:choose>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">성별</th>
                    <td colspan="1">${tutorDTO.gender=='0'?"남성":"여성"}</td>
                    <th scope="row">생년월일</th>
                    <td colspan="1">${tutorDTO.birthdate}</td>
                  </tr>
                  <th scope="row">소속</th>
                  <td colspan="1">${tutorDTO.certassoc}</td>
                  <th scope="row">자격증 번호</th>
                  <td colspan="1">${tutorDTO.certnum}</td>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>


<form class="actionForm" action="/admin/diver/member/read/approve" method="post">
  <input type="hidden" name="mno" value="${tutorDTO.mno}">
  <input type="hidden" name="state" value="${tutorDTO.state}">
  <input type="hidden" name="page" value="${listDTO.page}">
  <input type="hidden" name="size" value="${listDTO.size}">
  <input type="hidden" name="type" value="${listDTO.type}">
  <input type="hidden" name="keyword" value="${listDTO.keyword}">
  <input type="hidden" name="tutorflag" value="${tutorDTO.tutorflag}">
</form>

<script src="/resources/js/owus.js"></script>

<script>
    const form = document.querySelector(".actionForm")

    //승인버튼
    document.querySelector(".approveDIV").addEventListener("click", (e) => {
        console.log("승인버튼")
        e.preventDefault()
        e.stopPropagation()

        const target = e.target

        if (target.getAttribute("class").indexOf("approveBtn") < 0)
            return;

        const id = ${tutorDTO.mno}
        form.querySelector("input[name='mno']").value = id
        form.querySelector("input[name='tutorflag']").value = 1;
        form.querySelector("input[name='state']").value = 3
        form.submit()


    }, false)

    //반려버튼
    document.querySelector(".approveDIV").addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const target = e.target

        if (target.getAttribute("class").indexOf("rejectBtn") < 0)
            return;

        const id = ${tutorDTO.mno}
            form.querySelector("input[name='mno']").value = id
        form.querySelector("input[name='tutorflag']").value = 0;
        form.querySelector("input[name='state']").value = 2
        form.submit()
    }, false)

    //승인대기버튼
    document.querySelector(".approveDIV").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        const target = e.target

        if (target.getAttribute("class").indexOf("waitBtn") < 0)
            return;


        const id = ${tutorDTO.mno}
            form.querySelector("input[name='mno']").value = id
        form.querySelector("input[name='state']").value = 1
        form.submit()
    }, false)

</script>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp" %>