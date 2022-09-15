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
                    <h2 class="m-3">Image Upload </h2>
                    <div class="card-body pt-3">
                        <div class="container-fluid">
                            <div id="collapseOne" class="accordion-collapse collapse show"
                                 aria-labelledby="headingOne"
                                 data-bs-parent="#accordionExample">
                                <div class="accordion-body container-fluid itemsBody">
                                    <div class="row justify-content-md-end ">
                                        <div class="col col-auto ">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="uploadResult">
                            </div>
                            <form class="actionForm" action="/shop/mypage/info/imageAdd/upload" method="post">
                                <input type="hidden" name="mno" >
                                <div class="uploadResultDIV"></div>
                            </form>
                            <div class="col-sm-12 mb-3 uploadInputDiv">
                                <input class="form-control uploadFile" type="file" name="files" id="formFile" multiple>
                            </div>
                            <div class="row align-items-center justify-content-end">
                                <div class="col-auto">
                                    <button type="button" class="btn btn-primary imageUploadBtn"> upload
                                    </button>
                                    <button type="button" class="btn btn-primary registerBtn"> 등록
                                    </button>
                                    <button type="button" class="btn btn-primary cancelBtn"> 취소
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


<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/owus.js"></script>

<script>

    const uploadResult = document.querySelector(".uploadResult")
    const cloneInput = document.querySelector(".uploadFile").cloneNode()
    const actionForm = document.querySelector(".actionForm");

    //작성 이벤트
    document.querySelector(".registerBtn").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();
        console.log("등록");


        const imgs = uploadResult.querySelectorAll("img");
        const uploadResultDIV = document.querySelector(".uploadResultDIV");
        const mno =${facilityDTO.mno}
        console.log(imgs);
        console.log(uploadResultDIV);


        let str = "";
        for(let i =0; i<imgs.length; i++){
            const fileObj = imgs[i];

            const uuid = fileObj.getAttribute("data-uuid");
            const img = fileObj.getAttribute("data-img");
            const filepath = fileObj.getAttribute("data-filepath");
            const filename = fileObj.getAttribute("data-filename");
            // const imgSrc = fileObj.getAttribute("src");

            str += `<input type='hidden' name='uploads[\${i}].uuid' value='\${uuid}'>`;
            str += `<input type='hidden' name = 'uploads[\${i}].img' value = '\${img}'>`;
            str += `<input type='hidden' name = 'uploads[\${i}].filename' value = '\${filename}'>`;
            str += `<input type='hidden' name = 'uploads[\${i}].filepath' value = '\${filepath}'>`;
            // str += `<input type='hidden' name = 'mainImages[\${i}]' value = '\${imgSrc}'>`;
        }

        uploadResultDIV.innerHTML += str;
        actionForm.querySelector("input[name='mno']").value = mno;
        actionForm.submit();

    }, false)

    // delbtn 클릭 이벤트
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

    //upladBtn 클릭 이벤트
    qsAddEvent(".imageUploadBtn", "click", (e) => {

        const formObj = new FormData();
        const fileInput = document.querySelector(".uploadFile")
        const files = fileInput.files

        for (let i = 0; i < files.length; i++) {
            formObj.append("files", files[i])
        }

        uploadToServer(formObj).then(resultArr => {

            uploadResult.innerHTML += resultArr.map(result => `<div>
                <img data-uuid ='\${result.uuid}'
                    data-filename='\${result.filename}'
                    data-filepath ='\${result.filepath}'
                    data-img='\${result.img}'
                    src='/attach/view?fileName=\${result.thumbnail}'>
                <button data-link='\${result.link}' class="delBtn">x</button>
                \${result.filename}</div>`).join(" ")

            fileInput.remove()
            document.querySelector(".uploadInputDiv").appendChild(cloneInput);
        })

    }, false)

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

    async function deleteToServer(fileName){
        const options = {headers: { "Content-Type": "application/x-www-form-urlencoded"}}

        const res = await axios.post("/attach/delete", "fileName="+fileName, options )

        console.log(res.data)

        return res.data
    }


    qsAddEvent(".cancelBtn", "click", (e) => {
        console.log("취소")
        self.location = "/shop/mypage/info";
    }, false)

</script>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp" %>