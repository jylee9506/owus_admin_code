<%--
  User: 
  Date: 2022-05-01
  Time: 오후 7:21
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/shop/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/shop/basic_sidebar.jsp" %>


<main id="main" class="main">
    <%@ include file="/WEB-INF/include/shop/basic_pagetitle.jsp" %>

    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row mb-2 mt-2">
                                <div class="col">

                                </div>
                            </div>
                            <div class="row align-items-end">
                                <div class="col">
                                    <a class="nav-link nav-profile d-flex align-items-center pe-0"
                                       href="#" data-bs-toggle="dropdown">
                                        <%--                    <img src="http://owus.duckdns.org:38080/niceadmin/img/profile-img.jpg"--%>
                                        <%--                         alt="Profile"--%>
                                        <%--                         class="rounded-circle" style="height: 60px">--%>
                                        <%--                    <span class="d-none d-md-block dropdown-toggle ps-2">${tutorDTO.name}</span>--%>
                                    </a>
                                    <!-- End Profile Iamge Icon -->
                                    <span class="bs-gray"></span>
                                </div>
                                <div class="col col-auto">
                                    <div class="text-end mb-2">
                                        <%--                    <button type="button" class="btn btn-warning">처리완료</button>--%>
                                    </div>
                                    <%--                  <div class="text-end approveDIV">--%>
                                    <%--                    <input type="${tutorDTO.state == '3' ? "hidden":"button"}"--%>
                                    <%--                           value="승인"--%>
                                    <%--                           class="btn btn-outline-primary approveBtn">--%>
                                    <%--                    </input>--%>
                                    <%--                    <input type="${tutorDTO.state == '1' ? "hidden":"button"}"--%>
                                    <%--                           value="대기" class="btn btn-outline-primary waitBtn">--%>
                                    <%--                    </input>--%>
                                    <%--                    <button type="button"--%>
                                    <%--                            class="btn btn-outline-danger rejectBtn">반려--%>
                                    <%--                    </button>--%>

                                    <%--                  </div>--%>
                                </div>
                            </div>
                        </div>
                        <%--            <hr/>--%>
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
                                        <th scope="row">아이디</th>
                                        <td>${dto.id}</td>
                                        <th scope="row">상태</th>
                                        <td>대기</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">업체명</th>
                                        <td>${dto.name}</td>
                                        <th scope="row">전화번호</th>
                                        <td>${dto.phone}</td>
                                    <tr>
                                        <th scope="row">주소</th>
                                        <td>${dto.address}</td>
                                        <th scope="row">사업자 번호</th>
                                        <td>
                                            <input class="bzNumInput" value="${dto.bzNum == null ? '' : dto.bzNum}">
                                        </td>
                                    <tr>
                                        <th scope="row">이메일</th>
                                        <td>${dto.email}</td>
                                        <th scope="row"></th>
                                        <td></td>
                                    </tr>
                                    <%--                      <c:choose>--%>
                                    <%--                        <c:when test="${tutorDTO.state==1}">승인대기</c:when>--%>
                                    <%--                        <c:when test="${tutorDTO.state==2}">반려</c:when>--%>
                                    <%--                        <c:when test="${tutorDTO.state==3}">승인</c:when>--%>
                                    <%--                      </c:choose>--%>



                                    </tbody>
                                </table>

                                    <table class="table text-center shopAttach">
                                    <thead>
                                    <tr>
                                        <th scope="col">사업자 등록증</th>
                                        <th scope="col">협회 인증서</th>
                                        <th scope="col">해양수산부 인증서</th>
                                        <th scope="col">안전교육 인증서</th>
                                        <th scope="col">충전소 인증</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>

                                        <th class="attachTD">${dto.cfBz == null ? "" : "<img class=\"img-fluid\" src=\"/attach/view?fileName=".concat(dto.cfBz).concat("\">")}</th>
                                        <th class="attachTD">${dto.cfAssoc == null ? "" : "<img class=\"img-fluid\" src=\"/attach/view?fileName=".concat(dto.cfAssoc).concat("\">")}</th>
                                        <th class="attachTD">${dto.cfMof == null ? "" : "<img class=\"img-fluid\" src=\"/attach/view?fileName=" .concat(dto.cfMof) .concat("\">")}</th>
                                        <th class="attachTD">${dto.cfSafety == null ? "" : "<img class=\"img-fluid\" src=\"/attach/view?fileName=".concat(dto.cfSafety).concat("\">")}</th>
                                        <th class="attachTD">${dto.cfCharging == null ? "" : "<img class=\"img-fluid\" src=\"/attach/view?fileName=".concat(dto.cfCharging).concat("\">")}</th>
                                    <tr>
                                    </tbody>
                                </table>


                                <form class="actionForm" method="post">
                                    <input type="hidden" name="mno" >
                                    <input type="hidden" name="bzNum">
                                    <input type="hidden" name="attach">
                                    <div class="uploadResultDIV"></div>
                                </form>

                                <%--                  <h1>파일 업로드 테스트</h1>--%>
                                <%--                  <form action="/attach/upload" method="post" enctype="multipart/form-data">--%>
                                <%--                    <input type="file" name="files" multiple>--%>
                                <%--                    <button class="uploadBtn">Upload</button>--%>
                                <%--                  </form>--%>

                                <div>
                                    <div class="uploadInputDiv">
                                        <input type="file" name="upload" multiple class="uploadFile">
                                    </div>
                                    <button class="uploadBtn">upload</button>
                                </div>

                                <style>
                                    .uploadResult {
                                        display: flex;


                                    }

                                    .uploadResult > div {
                                        margin: 3em;
                                        border: 1px solid red;
                                    }
                                </style>

                                <div class="uploadResult">
                                </div>


                                <div class="row align-items-center justify-content-end">
                                    <div class="col-auto btnGroup">
                                        <input type="${dto.state =='5' ? "button" : "hidden" }"
                                          value="등록" class="btn btn-outline-primary registerBtn">
                                        </input>
                                         <input type="${dto.state == '5'? "hidden" : "button"}"
                                                value="수정" class="btn btn-outline-primary modifyBtn">
                                        </input>
                                    </div>
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

<%--<form class="actionForm" action="/admin/diver/member/read/approve" method="post">--%>
<%--    <input type="hidden" name="mno" value="${tutorDTO.mno}">--%>
<%--    <input type="hidden" name="state" value="${tutorDTO.state}">--%>
<%--    <input type="hidden" name="page" value="${listDTO.page}">--%>
<%--    <input type="hidden" name="size" value="${listDTO.size}">--%>
<%--    <input type="hidden" name="type" value="${listDTO.type}">--%>
<%--    <input type="hidden" name="keyword" value="${listDTO.keyword}">--%>
<%--    <input type="hidden" name="tutorflag" value="${tutorDTO.tutorflag}">--%>
<%--</form>--%>

<%@include file="/WEB-INF/include/shop/basic_footer.jsp" %>

<script src="/resources/js/owus.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>
    const mno = ${user.mno}
    const popupImgModal = bootstrap.Modal.getOrCreateInstance(qs("#popupImgModal"))
    //업로드 , 삭제 start --------------------------
    const uploadResult = document.querySelector(".uploadResult")
    const cloneInput = document.querySelector(".uploadFile").cloneNode()
    const actionForm =document.querySelector(".actionForm")

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


    document.querySelector(".btnGroup").addEventListener("click", (e) => {

        console.log("등록")
        e.preventDefault()
        e.stopPropagation()

        const target = e.target

        if(target.classList.contains("registerBtn")){
            actionForm.setAttribute("action", "/shop/support/request/register")
        }else if(target.classList.contains("modifyBtn") ) {
            actionForm.setAttribute("action","/shop/support/request/modify" )
        }else {
            return;
        }



        const bzNum = document.querySelector(".bzNumInput").value

        actionForm.querySelector("input[name='mno']").value = mno
        actionForm.querySelector("input[name='bzNum']").value = bzNum


        const divArr = document.querySelectorAll(".uploadResult > div")

        console.log(divArr.length);

        const names = ["cfBz","cfAssoc","cfMof","cfSafety","cfCharging"]

        let str = "";
        for(let i=0; i <divArr.length ; i++){
            console.log("배열 확인" + i);
            const  fileObj = divArr[i]

            const uuid = fileObj.getAttribute("data-uuid")
            const img = fileObj.getAttribute("data-img")
            const filename =fileObj.getAttribute("data-filename")
            const filepath =fileObj.getAttribute("data-filepath")
            const link = fileObj.getAttribute("data-link")

            str += `<input type = 'hidden' name='uploads[\${i}].uuid' value='\${uuid}'>`
            str += `<input type = 'hidden' name='uploads[\${i}].img' value='\${img}'>`
            str += `<input type = 'hidden' name='uploads[\${i}].filename' value='\${filename}'>`
            str += `<input type = 'hidden' name='uploads[\${i}].filepath' value='\${filepath}'>`

            str += `<input type = 'hidden' name='\${names[i]}' value='\${link}'>`
        }



        document.querySelector(".uploadResultDIV").innerHTML += str
        actionForm.setAttribute("method", "post")


        actionForm.submit();



    }, false)


    uploadResult.addEventListener("click", (e) => {
        if (e.target.getAttribute("class").indexOf("delBtn") < 0) {
            return

        }
        const btn = e.target;
        const link = btn.getAttribute("data-link")

        deleteToServer(link).then(result => {
            btn.closest("div").remove()
        })
    }, false)

    document.querySelector(".uploadBtn").addEventListener("click", (e) => {

        const formObj = new FormData();

        const fileInput = document.querySelector(".uploadFile")


        console.log(fileInput.files)

        const files = fileInput.files

        for (let i = 0; i < files.length; i++) {
            console.log(files[i])
            formObj.append("files", files[i]);


        }
           //resultArr == uploadResultDto (첨부파일)
            uploadToServer(formObj).then(resultArr => {

            uploadResult.innerHTML += resultArr.map( ({uuid,thumbnail,link,filename,filepath,img}) => `
            <div data-link='\${link}' data-uuid='\${uuid}' data-img='\${img}' data-filename='\${filename}' data-filepath='\${filepath}'>
                        <img src='/attach/view?fileName=\${thumbnail}'>
                        <button data-link='\${link}' class="delBtn">x</button>
                        \${filename}</div>`).join("")

            fileInput.remove()

            document.querySelector(".uploadInputDiv").appendChild(cloneInput)


        })

    }, false)

    async function deleteToServer(fileName) {

        const options = {headers: {"Content-Type": "application/x-www-form-urlencoded"}}


        const res = await axios.post("/attach/delete", "fileName=" + fileName, options)

        console.log(res.data)

        return res.data


    }


    <%--form태그 대신 비동기--%>

    async function uploadToServer(formObj) {

        console.log("upload to server...")
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

    // 업로드 , 삭제 end ------------------------------------------------------

</script>

