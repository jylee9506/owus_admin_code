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
<<<<<<< HEAD
    <sec:authentication property="principal.mno" var="mno"/>
=======
>>>>>>> ced54b516e74c4d77f591ba5a21c2a2f045c50d3
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-body">
            <form class="row g-3 writeForm" action="/shop/job/write" method="post" autocomplete="off">
              <div class="addInput"></div>

                <div class="col-md-12">
                  <label for="validationDefault01" class="form-label">제목</label>
                  <input name="title" type="text" class="form-control titleInput" id="validationDefault01" placeholder="제목을 작성하시오" required>
                </div>

                <div class="input-group mb-3">
                  <span class="input-group-text">Images</span>
                  <div class="float-end uploadHidden">
                    <button type="button" class="uploadFileBtn btn btn-primary ">ADD Files</button>
                  </div>
                </div>

                <div class="col-md-12">
                  <label for="validationDefault03" class="form-label">내용</label>
                  <div class="form-floating mb-3">
                    <textarea style="height: 200px;" name="content" id="validationDefault03" class="form-control pt-2 contentText" placeholder="내용을 작성하시오" required></textarea>
                  </div>
                </div>

                <div class="col-12 text-end">
                  <button class="btn btn-primary writeBtn">작성</button>
                  <button class="btn btn-primary cancelBtn">취소</button>
                </div>

              <input type="hidden" name="mno" value="${mno}">
              <input type="hidden" name="page" value="${listDTO.page}">
              <input type="hidden" name="size" value="${listDTO.size}">
              <input type="hidden" name="type" value="${listDTO.type}">
              <input type="hidden" name="keyword" value="${listDTO.keyword}">
              <input type="hidden" name="category" value="${listDTO.category}">
<%--              <div class="uploadInputDiv2"></div>--%>

              <!-- 첨부 파일 섬네일을 보여줄 부분 -->
              <div class="row mt-3 uploadInputDiv">
                <div class="col ">
                  <div class="container-fluid d-flex uploadResult" style="flex-wrap: wrap;">

                  </div>
                </div>
              </div>

            </form>
          </div>
          <!-- 첨부파일 추가를 위한 모달창 -->
          <div class="uploadModal modal" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Upload File</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <div class="input-group mb-3">
                    <input type="file" name="files" class="form-control" multiple >
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary uploadBtn">Upload</button>
                  <button type="button" class="btn btn-outline-dark closeUploadBtn" >Close</button>
                </div>
              </div>
            </div>
          </div><!-- register modal -->
          <!-- End Page Title -->
        </div>
      </div>
    </div>
  </section>

</main>

<%@include file="/WEB-INF/include/shop/basic_footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/owus.js"></script>

<script>

  const writeForm = document.querySelector(".writeForm")
  const writeBtn = document.querySelector(".writeBtn")
  const uploadModal = new bootstrap.Modal(".uploadModal")

  qsAddEvent(".writeBtn", "click", (e) =>{

    e.preventDefault()
    e.stopPropagation()


    const divArr = qsAll(".divFileInfo")

    console.log("---------", divArr)

    // if (e.target.getAttribute("class").indexOf("divArr") > 0) {


      let str = "";
      for (let i = 0; i < divArr.length; i++) {


        const fileObj = divArr[i]

        const uuid = fileObj.getAttribute("data-uuid")
        const img = fileObj.getAttribute("data-img")
        const filepath = fileObj.getAttribute("data-filepath")
        const filename = fileObj.getAttribute("data-filename")
        // const bno = fileObj.getAttribute("data-bno")
        // const imgSrc = fileObj.getAttribute("src")


        str += `<input type="hidden" name="uploads[\${i}].uuid" value="\${uuid}">`
        str += `<input type="hidden" name="uploads[\${i}].filename" value="\${filename}">`
        str += `<input type="hidden" name="uploads[\${i}].img" value="\${img}">`
        str += `<input type="hidden" name="uploads[\${i}].filepath" value="\${filepath}">`
        // str += `<input type="hidden" name="'uploads[\${i}].bno" value="\${bno}">`
        // str += `<input type="hidden" name="mainImages[\${i}]" value = "\${imgSrc}">`

      }
      const uploadInputDiv = qs(".uploadInputDiv")

      uploadInputDiv.innerHTML += str

    // }


  writeForm.setAttribute("action", "/shop/job/write")
  writeForm.setAttribute("method", "post")
  writeForm.submit();

  })

  // 파일 업로드 모달창 구현
  qsAddEvent(".uploadFileBtn", "click", (e) => {
    e.stopPropagation()
    e.preventDefault()

    uploadModal.show()

  })
  qsAddEvent(".closeUploadBtn", "click", (e) =>{

    uploadModal.hide()

  })

  const uploadResult = qs(".uploadResult");

  uploadResult.addEventListener("click", (e) => {

    if (e.target.getAttribute("class").indexOf("delBtn") < 0) {
      return
    }

    const btn = e.target;
    const link = btn.getAttribute("data-link")
    const findCard = btn.closest(".card")

    console.log(findCard)


    deleteToServer(link).then(result => {

      findCard.closest("div").remove()
    })

  }, false)



  qsAddEvent(".uploadBtn", "click", (e) =>{

    const formObj = new FormData();

    const fileInput = document.querySelector("input[name='files']")

    console.log(fileInput.files)

    const files = fileInput.files

    for (let i = 0; i < files.length; i++) {
      formObj.append("files", files[i]);
    }

    uploadToServer(formObj).then(resultArr => {
      console.log(resultArr);

          uploadResult.innerHTML += resultArr.map(({uuid, thumbnail, link, filename, filepath, img, bno}) => `

                  <div class="card col-4">
                    <div data-filename='\${filename}' class="card-header justify-content-center">

                      <div class="divFileInfo" data-bno='\${bno}' data-uuid='\${uuid}' data-img='\${img}'  data-filename='\${filename}'  data-filepath='\${filepath}'>

                        <button data-link='\${link}' class="delBtn btn-sm btn-danger" >x</button>

                      </div>

                      <div class="card-body">

                        <img src='/attach/view?fileName=\${thumbnail}'>

                      </div>
                         \${filename}
                    </div>

                  </div>`).join(" ")


          uploadModal.hide()
        })
  })

  async function uploadToServer(formObj) {

    console.log("upload to server......");
    console.log(formObj);

    const response = await axios({
      method: 'post',
      url: '/attach/upload',
      data: formObj,
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    });

    return response.data
  }

  async function deleteToServer(fileName) {

    const options = {headers: {"Content-Type": "application/x-www-form-urlencoded"}}
    const res = await axios.post("/attach/delete", "fileName="+fileName, options)

    return res.data;

  }
</script>