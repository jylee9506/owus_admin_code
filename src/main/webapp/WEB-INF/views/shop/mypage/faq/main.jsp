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

<main id="main" class="main">
  <%@ include file="/WEB-INF/include/shop/basic_pagetitle.jsp"%>

  <section class="section">
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-body">
            <button type="button" class="btn btn-primary mt-3 writeBtn">추가</button>
            <hr/>
            <div class="accordion accordion-flush" id="faq-group-1">
              <c:forEach items="${dtoList}" var="dto">
                <div class="accordion-item" data-bno="${dto.bno}">
                  <h2 class="accordion-header">
                    <button class="accordion-button ${(showBno != null &&dto.bno == showBno)?"":"collapsed"}" data-bs-target="#faqsOne-${dto.bno}" type="button" data-bs-toggle="collapse">
                      ${dto.title}
                    </button>
                  </h2>
                  <div id="faqsOne-${dto.bno}" class="accordion-collapse collapse ${(showBno != null &&dto.bno == showBno)?"show":""}" data-bs-parent="#faq-group-1">
                    <div class="row row-cols-2">
                      <div class="accordion-body ps-3 col-10">
                          ${dto.content}
                      </div>
                      <div class="col-2 p-2 text-end">
                        <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                          <button type="button" class="btn btn-warning updateBtn">수정</button>
                          <button type="button" class="btn btn-danger deleteBtn">삭제</button>
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>
<!-- End #main -->

<div class="modal fade" id="contentModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <input class="form-control modalTitle" id="floatingInput1" placeholder="예) 위치가 어떻게 되나요?">
      </div>
      <div class="modal-body">
        <div class="form-floating">
          <textarea class="form-control modalContent" placeholder="예) 양양해수욕장 입구 편의점 앞입니다" id="floatingTextarea2"
                    style="height: 150px"></textarea>
          <label for="floatingTextarea2">예) 양양해수욕장 입구 편의점 앞입니다</label>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary modalCancelBtn">취소</button>
        <button type="button" class="btn btn-primary modalWriteBtn">확인</button>
      </div>
    </div>
  </div>
</div><!-- End Basic Modal-->

<form class="actionForm" action="" method="post">
  <input type="hidden" name="bno" value="">
  <input type="hidden" name="title" value="">
  <input type="hidden" name="content" value="">
  <input type="hidden" name="mno" value="${user.mno}">

<%--  <input type="hidden" name="keyword" value="${listDTO.keyword}">--%>
<%--  <input type="hidden" name="category" value="${listDTO.category}">--%>
<%--  <input type="hidden" name="state" value="${listDTO.state}">--%>
</form>


<%@include file="/WEB-INF/include/shop/basic_footer.jsp"%>

<script src="/resources/js/owus.js"></script>

<script>
    const actionForm = qs(".actionForm")
    const modalElement = qs("#contentModal")
    const modal = bootstrap.Modal.getOrCreateInstance(modalElement)

    qsClickEvent(".writeBtn", (e) => {
        modalClear()
        modalElement.setAttribute("data-bno", "0")
        modal.show()
    })

    qsClickEvent(".accordion", (e) => {
        const target = e.target;

        if(target.classList.contains("updateBtn")) {
            const item = target.closest(".accordion-item")
            qs(".modalTitle").value = qs(".accordion-button", item).innerText
            qs(".modalContent").value = qs(".accordion-body", item).innerText

            modalElement.setAttribute("data-bno", item.getAttribute("data-bno"))
            modal.show()

        } else if(target.classList.contains("deleteBtn")) {
            const item = target.closest(".accordion-item")

            qs("input[name='bno']", actionForm).value = item.getAttribute("data-bno")
            actionForm.setAttribute("action", `\${path}/delete`)
            actionForm.submit()

        }
    })

    qsClickEvent(".modalWriteBtn", (e) => {
        const bno = modalElement.getAttribute("data-bno")

        if(parseInt(bno) > 0) {
            actionForm.setAttribute("action", `\${path}/update`)
            qs("input[name='bno']", actionForm).value = bno
        } else {
            actionForm.setAttribute("action", `\${path}/write`)
        }

        qs("input[name='title']", actionForm).value = qs(".modalTitle", modalElement).value
        qs("input[name='content']", actionForm).value = qs(".modalContent", modalElement).value

        actionForm.submit()
    })

    qsClickEvent(".modalCancelBtn", (e) => {
        modalClear()
        modal.hide()
    })

    const modalClear = () => {
        qs(".modalTitle", modalElement).value = ""
        qs(".modalContent", modalElement).value = ""
    }


</script>


