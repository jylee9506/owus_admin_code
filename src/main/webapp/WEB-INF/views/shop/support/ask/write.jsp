<%--
  User: 
  Date: 2022-05-01
  Time: 오후 9:27
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/shop/basic_header.jsp"%>
<%@ include file="/WEB-INF/include/shop/basic_sidebar.jsp"%>

<main id="main" class="main">
  <%@ include file="/WEB-INF/include/shop/basic_pagetitle.jsp"%>

  <section class="section">
    <div class="row">
      <div class="col-lg-12">

        <div class="card">
          <div class="card-body">
            <div class="row g-3">
              <div class="col-md-12 pt-3">
                <input name="inputTitle" type="text" class="form-control" value="${dto.title}">
                <select class="selectCategory">
                  <option value="0">카테고리 선택</option>
                  <c:forEach var="entry" items="${category}" varStatus="status">
                    <option value="${entry.key}" ${modify && entry.key == dto.category ? "selected" : ""}>${entry.value}</option>
                  </c:forEach>
                </select>
              </div>

              <div class="col-md-12 border-5">
                <div class="text-editor" style="height: 450px"></div> <!-- End Quill Editor Full -->
              </div>

              <div class="col-12 text-end">
                <button class="btn btn-primary ${modify ? 'modifyBtn' : 'writeBtn'}">${modify ? '수정' : '작성'}</button>
                <button class="btn btn-primary cancelBtn">취소</button>
              </div>
            </div>
          </div>
          <!-- End Page Title -->
        </div>
      </div>
    </div>
  </section>
</main>

<div class="modal fade warningModal" id="verticalycentered" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">주의</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        제목, 카테고리, 내용을 확인하세요
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div><!-- End Vertically centered Modal-->

<form class="actionForm" action="" method="get">
  <input type="hidden" name="page" value="${listDTO.page}">
  <input type="hidden" name="size" value="${listDTO.size}">
  <input type="hidden" name="type" value="${listDTO.type}">
  <input type="hidden" name="keyword" value="${listDTO.keyword}">
  <input type="hidden" name="category" value="${listDTO.category}">

  <input type="hidden" name="title">
  <input type="hidden" name="content">
  <input type="hidden" name="writeCategory">
  <input type="hidden" name="mno" value="${user.mno}">

  <div class="additionalInput"></div>
</form>

<%@include file="/WEB-INF/include/shop/basic_footer.jsp"%>

<script src="/resources/js/owus.js"></script>
<script src="/resources/js/quill/image-resize.min.js"></script>
<script src="/resources/js/quill/quill_editor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>
    const quill = qEdit.write('${dto.content}')
    const actionForm = qs(".actionForm")
    const warningModal = bootstrap.Modal.getOrCreateInstance(qs(".warningModal"))

    const bno = '${dto.bno}'

    qsClickEvent(".cancelBtn", (e) => {
        history.go(-1)
    })

    qsClickEvent(".modifyBtn", (e) => {
        e.stopPropagation()
        e.preventDefault()

        if(!contentToForm()) return

        imgToForm()
        qs(".additionalInput").innerHTML += `<input type="hidden" name="bno" value="\${bno}">`

        actionForm.setAttribute("action", `\${path}/modify/\${bno}`)
        actionForm.setAttribute("method", "post")
        actionForm.submit()
    })

    qsClickEvent(".writeBtn", (e) => {
        e.stopPropagation()
        e.preventDefault()

        if(!contentToForm()) return

        imgToForm()

        actionForm.setAttribute("action", `\${path}/write`)
        actionForm.setAttribute("method", "post")
        actionForm.submit()
    })

    const contentToForm = () => {
        const editor = qs(".text-editor")

        const category = qs(".selectCategory").value === "" ? 0 : parseInt(qs(".selectCategory").value)
        const title = qs("input[name='inputTitle']").value
        const content = JSON.stringify(quill.getContents())

        if(title === "" || category === 0) {
            warningModal.show()
            return false
        }

        qs("input[name='title']").value = title
        qs("input[name='writeCategory']").value = category
        qs("input[name='content']").value = content

        return true
    }

    const imgToForm = () => {
        let str = ""

        const imgs = qsAll(".uploadImg", qs(".ql-editor"))
        for (let i = 0; i < imgs.length; i++) {
            const {uuid, filename, img, filepath, link} = imgs[i].dataset
            if(i === 0) str += `<input type="hidden" name="mainImg" value="\${link}">`
            str += `<input type="hidden" name="uploads[\${i}].uuid" value="\${uuid}">`
            str += `<input type="hidden" name="uploads[\${i}].filename" value="\${filename}">`
            str += `<input type="hidden" name="uploads[\${i}].img" value="\${img}">`
            str += `<input type="hidden" name="uploads[\${i}].filepath" value="\${filepath}">`
        }

        qs(".additionalInput").innerHTML += str
    }

    const attachService = (function (){
        async function uploadToServer(formObj, callback) {
            console.log("----- upload", formObj)
            // const res = await axios.post("/upload", formObj)
            const resp = await axios({
                method: 'post',
                url: '/attach/upload',
                data: formObj,
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
            })

            callback(resp.data)
        }

        return {uploadToServer}

    })()



</script>
