<%--
  User: 
  Date: 2022-05-01
  Time: 오후 9:27
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <title>게시판 제목</title>
</head>

<%@ include file="/WEB-INF/include/admin/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/admin/basic_sidebar.jsp" %>

<main id="main" class="main">
    <%@ include file="/WEB-INF/include/admin/basic_pagetitle.jsp" %>

    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <form class="row g-3 actionForm" action="/admin/shop/notice/write/register" method="post"
                              autocomplete="off">

                            <div class="col-md-12">
                                <label for="validationDefault01" class="form-label ">제목</label>
                                <input name="title" type="text" class="form-control" id="validationDefault01" value="" required>
                            </div>

                            <div class="col-md-12">
                                <label for="validationDefault03" class="form-label">내용</label>
                                <div class="form-floating mb-3">
                                    <textarea name="content" id="validationDefault03" class="form-control pt-2"
                                              placeholder="Leave a text here" style="height: 200px;"
                                              required></textarea>
                                </div>
                            </div>
                            <input type="hidden" name="mno" value="1">
                            <input type="hidden" name="page" value="${listDTO.page}">
                            <input type="hidden" name="size" value="${listDTO.size}">
                            <input type="hidden" name="type" value="${listDTO.type}">
                            <input type="hidden" name="keyword" value="${listDTO.keyword}">
                            <div class="uploadResultDIV"></div>
                        </form>
                        <div class="col-sm-12 mb-3 uploadInputDiv">
                            <input class="form-control uploadFile" type="file" name="files" id="formFile"  multiple>
                        </div>

                        <div class="uploadResult" >
                        </div>
                        <div class="col-12 text-end">
                            <button class="btn btn-primary uploadBtn">Upload</button>
                            <button class="btn btn-primary writeBtn">작성</button>
                            <button class="btn btn-primary cancelBtn">취소</button>
                        </div>
                    </div>
                    <!-- End Page Title -->
                </div>
            </div>
        </div>
    </section>

</main>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/owus.js"></script>

<script>

    const uploadResult = document.querySelector(".uploadResult")
    const cloneInput = document.querySelector(".uploadFile").cloneNode()
    const actionForm = document.querySelector(".actionForm");

    document.querySelector(".writeBtn").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();
        const title = document.querySelector("input[name='title']").value;
        const content = document.querySelector("textarea[name='content']").value;
        const imgs = uploadResult.querySelectorAll("img");
        const uploadResultDIV = document.querySelector(".uploadResultDIV");
        console.log(imgs);


        let str = "";
        for(let i =0; i<imgs.length; i++){
            const fileObj = imgs[i];

            const uuid = fileObj.getAttribute("data-uuid");
            const img = fileObj.getAttribute("data-img");
            const filepath = fileObj.getAttribute("data-filepath");
            const filename = fileObj.getAttribute("data-filename");
            const imgSrc = fileObj.getAttribute("src");

            str += `<input type='hidden' name='uploads[\${i}].uuid' value='\${uuid}'>`;
            str += `<input type='hidden' name = 'uploads[\${i}].img' value = '\${img}'>`;
            str += `<input type='hidden' name = 'uploads[\${i}].filename' value = '\${filename}'>`;
            str += `<input type='hidden' name = 'uploads[\${i}].filepath' value = '\${filepath}'>`;
            str += `<input type='hidden' name = 'mainImages[\${i}]' value = '\${imgSrc}'>`;
        }
        uploadResultDIV.innerHTML += str;

        actionForm.querySelector("input[name ='title']").value = title;
        actionForm.querySelector("textarea[name ='content']").value = content;
        actionForm.submit();

    }, false)


    document.querySelector(".cancelBtn").addEventListener("click", (e) => {
        const linkes = uploadResult.querySelectorAll("button")

        for(link of linkes  ){
            let linkData =  link.getAttribute("data-link");
            deleteToServer(linkData);
        }
        self.location = "/admin/shop/notice${listDTO.link}";

    }, false)


    uploadResult.addEventListener("click", (e) => {

        if(e.target.getAttribute("class").indexOf("delBtn") < 0){
            return
        }
        const btn = e.target
        const link = btn.getAttribute("data-link")
        console.log(link);
        deleteToServer(link).then(result => {
            btn.closest("div").remove()
        })

    }, false)


    document.querySelector(".uploadBtn").addEventListener("click",(e)=> {

        const formObj = new FormData();

        const fileInput = document.querySelector(".uploadFile")

        // console.log(fileInput.files)

        const files = fileInput.files

        for (let i = 0; i < files.length; i++) {
            formObj.append("files", files[i])
        }

        uploadToServer(formObj).then(resultArr => {

            uploadResult.innerHTML += resultArr.map(result =>
                `<div>
                    <img data-uuid ='\${result.uuid}' data-filename='\${result.filename}' data-filepath ='\${result.filepath}' data-img='\${result.img}'
                    src='/attach/view?fileName=\${result.thumbnail}'>
                    <button data-link='\${result.link}' class="delBtn">x</button>
                    \${result.filename}
                </div>`).join(" ")

            fileInput.remove()
            document.querySelector(".uploadInputDiv").appendChild(cloneInput);

        })

    }, false)


    async function deleteToServer(fileName){
        const options = {headers: { "Content-Type": "application/x-www-form-urlencoded"}}

        const res = await axios.post("/attach/delete", "fileName="+fileName, options )

        console.log(res.data)

        return res.data
    }

    async function uploadToServer (formObj) {

        console.log("upload to server......")
        console.log(formObj)

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

</script>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp" %>