<%--
  User: 
  Date: 2022-05-01
  Time: 오후 12:15
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/include/admin/basic_header.jsp"%>
<%@ include file="/WEB-INF/include/admin/basic_sidebar.jsp"%>

<main id="main" class="main">
  <%@ include file="/WEB-INF/include/admin/basic_pagetitle.jsp"%>

  <section class="section">
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-body">
            </div>
            <div class="container-fluid p-0">
              <div class="row align-items-end">
                <div class="col mb-3">

                </div>
                <div class="col-auto">
                  <select class="selectSize pe-md-5">
                    <option value="10" ${listDTO.size == "10" ? "selected" : ""}>
                      10개씩
                    </option>
                    <option value="15" ${listDTO.size == "15" ? "selected" : ""}>
                      15개씩
                    </option>
                    <option value="30" ${listDTO.size == "30" ? "selected" : ""}>
                      30개씩
                    </option>
                    <option value="50" ${listDTO.size == "50" ? "selected" : ""}>
                      50개씩
                    </option>
                  </select>
                </div>
                <div class="col-auto">
                  <select class="pe-md-5 selectCategory">
                    <option value="0" ${listDTO.category == 0 ? 'selected': ""} >
                      모두보기
                    </option>
                    <option value="1" ${listDTO.category == 1 ? 'selected': ""}>
                      구직
                    </option>
                    <option value="2" ${listDTO.category == 2 ? 'selected': ""}>
                      구인
                    </option>
                  </select>
                </div>

                <div class="col-auto">
                  <button type="button" class="btn btn-primary noticeBtn">공지사항 글쓰기</button>
                </div>
              </div>
            </div>

            <!-- Default Table -->
            <table class="table text-center table-hover">
              <thead>
              <tr>
                <th scope="col" class="col-1">번호</th>
                <th scope="col" class="col-2">구인/구직</th>
                <th scope="col" class="col-6">제목</th>
                <th scope="col" class="col-1">작성자</th>
                <th scope="col" class="col-2">작성일</th>

              </tr>
              </thead>

              <%--  공지사항              =======================================================================--%>
              <tbody class="noticeBoardTable">
              <c:forEach items="${notList}" var="noticeColumn">
                <tr>
                  <th scope="row">${noticeColumn.bno}</th>
                  <td></td>
                  <td>
                    <a data-notbno="${noticeColumn.bno}" class="noticeTitle">${noticeColumn.title}</a>
                  </td>
                  <td class="text-start text-truncate">${noticeColumn.nickname}</td>
                  <td>${noticeColumn.regDate}</td>

                </tr>
              </c:forEach>
              <%-- 공지사항             =======================================================================--%>
              </tbody>
              <tbody class="jobBoardTable">
<%-- 게시글              =======================================================================--%>

              <c:forEach items="${dtoList}" var="jobColumn">
                <tr>
                  <th scope="row">${jobColumn.bno}</th>
                  <td>${jobColumn.category == 1 ? "구직" : "구인"}</td>
                  <td class="text-start">
                    <a data-bno="${jobColumn.bno}" class="titleInList">${jobColumn.title}</a>
                  </td>
                  <td class="text-start text-truncate">${jobColumn.nickname}</td>
                  <td>
                    <fmt:parseDate value="${jobColumn.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                    <fmt:formatDate pattern="yy-MM-dd HH:mm" value="${ parsedDateTime }" />
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
                      <li class="page-item ${pageMaker.prev ? '' : 'disabled'} ">
                        <a class="page-link" data-page="${pageMaker.start-1}" href="?page=${pageMaker.start-1}" ${pageMaker.prev ? '' : 'tabindex="-1" aria-disabled="true"'}>«</a>
                      </li>

                      <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="page">
                        <li class="page-item ${pageMaker.page == page ? 'active' : ''}">
                          <a class="page-link" data-page="${page}" href="?page=${page}">${page}</a>
                        </li>
                      </c:forEach>

                      <li class="page-item ${pageMaker.next ? '' : 'disabled'} ">
                        <a class="page-link" data-page="${pageMaker.end+1}" href="?page=${pageMaker.end+1}" ${pageMaker.next ? '' : 'tabindex="-1" aria-disabled="true"'}>»</a>
                      </li>
                    </ul>
                  </nav>
                </div>
              </div>

              <div class="row justify-content-md-center align-items-center">
                <div class="col col-auto">
                  <select class="selectType" aria-label="select search type">
                    <option value="t" ${(listDTO.type == null || listDTO.type == "t") ? 'selected' : ''}>제목</option>
                    <option value="c" ${listDTO.type == "c" ? 'selected' : ''}>내용</option>
                    <option value="tc" ${listDTO.type == "tc" ? 'selected' : ''}>제목+내용</option>
                    <option value="w" ${listDTO.type == "w" ? 'selected' : ''}>작성자</option>
                  </select>
                </div>

                <div class="col col-auto">
                  <div class="search-bar">
                    <div class="search-form d-flex align-items-center">
                      <input type="text" name="query" placeholder="Search" class="selectKeyword" title="Enter search keyword" value="${listDTO.keyword}">
                      <button type="submit" title="Search" class="jobBoardSearchBtn"><i class="bi bi-search"></i></button>
                    </div>
                  </div><!-- End Search Bar -->
                </div>

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

<form class="jobBoardListForm" action="" method="get">
  <input type="hidden" name="page" value="${listDTO.page}">
  <input type="hidden" name="size" value="${listDTO.size}">
  <input type="hidden" name="type" value="${listDTO.type == null ? '' : listDTO.type}">
  <input type="hidden" name="keyword" value="${listDTO.keyword == null ? '' : listDTO.keyword}">
  <input type="hidden" name="category" value="${listDTO.category == null ? '' : listDTO.keyword}">
</form>

<script src="/resources/js/owus.js"></script>

<script>
  const jobBoardListForm = qs(".jobBoardListForm");
  const jobBoardSearchBtn = qs(".jobBoardSearchBtn");
  const pagination = qs(".pagination");
  const jobBoardTable = qs(".jobBoardTable");

  // pagination 구현
  qsAddEvent(".pagination", "click", (e)=>{
    e.preventDefault()
    e.stopPropagation()

    const target = e.target;

    if(target.getAttribute("class").indexOf("page-link") < 0){
      return
    }
    const page = target.getAttribute("data-page")


    jobBoardListForm.querySelector("input[name = 'page']").value = page
    jobBoardListForm.setAttribute("action", "/admin/job")
    jobBoardListForm.submit()

  })

  // 검색 버튼 구현
  qsAddEvent(".jobBoardSearchBtn", "click", (e)=>{
    e.stopPropagation();
    e.preventDefault();

    const category = qs(".selectCategory").value
    const keyword = qs(".selectKeyword").value
    const type = qs(".selectType").value
    const size = qs(".selectSize").value


    jobBoardListForm.querySelector("input[name = 'page']").value = 1;
    jobBoardListForm.querySelector("input[name ='keyword']").value = keyword;
    jobBoardListForm.querySelector("input[name ='type']").value = type;
    jobBoardListForm.querySelector("input[name ='size']").value = size;
    jobBoardListForm.querySelector("input[name ='category']").value = category;

    jobBoardListForm.setAttribute("action", "/admin/job")
    jobBoardListForm.submit();

  })

  // 구인, 구직 Select 구현
  qsAddEvent(".selectCategory", "change", (e) => {
    e.preventDefault();
    e.stopPropagation();

    const category = qs(".selectCategory").value


    jobBoardListForm.querySelector("input[name ='category']").value = category;
    console.log(category)

    jobBoardListForm.submit()
  })

  // 리스트 Size 구현
  qsAddEvent(".selectSize", "change", (e) => {
    e.preventDefault();
    e.stopPropagation();

    const size = qs(".selectSize").value

    jobBoardListForm.querySelector("input[name ='size']").value = size;

    jobBoardListForm.submit()
  })

  // 게시글 상세보기 구현
  qsAddEvent(".jobBoardTable", "click", (e)=>{
    e.stopPropagation()
    e.preventDefault()

    const target = e.target;

    if(target.getAttribute("class").indexOf("titleInList") < 0){
      return
    }

    const url = target.getAttribute("data-bno")

    jobBoardListForm.setAttribute("action", "/admin/job/read/" + url)
    jobBoardListForm.submit()
  })

  qsAddEvent(".noticeBoardTable", "click", (e)=>{
    e.stopPropagation()
    e.preventDefault()

    const target = e.target;

    if(target.getAttribute("class").indexOf("noticeTitle") < 0){
      return
    }

    const url = target.getAttribute("data-notbno")

    jobBoardListForm.setAttribute("action", "/admin/job/noticeModify/" + url)
    jobBoardListForm.submit()
  })



  qsAddEvent(".noticeBtn", "click", (e) =>{
    self.location = `/admin/job/write`
  })

</script>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp"%>
