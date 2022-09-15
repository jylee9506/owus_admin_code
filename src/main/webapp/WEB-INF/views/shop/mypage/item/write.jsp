<%--
  User: 
  Date: 2022-05-01
  Time: 오후 9:27
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/shop/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/shop/basic_sidebar.jsp" %>

<link href="/resources/css/shop.css" rel="stylesheet"/>

<main id="main" class="main">
  <%@ include file="/WEB-INF/include/shop/basic_pagetitle.jsp" %>

  <section class="section">
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-body">
            <form class="actionForm" action="" method="get">
            <div class="row pt-3">
              <div class="col-12 text-end">
                <button class="btn btn-primary ${modify ? 'modifyBtn' : 'writeBtn'}">${modify ? '수정' : '작성'}</button>
                <button class="btn btn-primary cancelBtn">취소</button>
              </div>
            </div>
            <hr/>
              <div class="row g-3">
                <div class="col-md-7 pt-3">
                  <h2>대표 이미지</h2>
                  <div class="mainImgArea">
                    <c:choose>
                      <c:when test="${modify}">
                        <c:set var="up" value="${dto.uploads.get(0)}"/>
                        <div class="writeItemImg mainImg uploadImg"
                             data-uuid="${up.uuid}" data-filename="${up.filename}" data-link="${up.link}" data-filepath="${up.filepath}" data-img="${up.img}" data-ord="0"
                             style="background-image: url(/attach/view?fileName=${up.link})"></div>
                        <input type="hidden" name="mainImg" value="${up.link}">
                      </c:when>
                      <c:otherwise>
                        <div class="writeItemImg mainImg opacity-3" style="background-image: url(/resources/img/imgicon.png)"></div>
                      </c:otherwise>
                    </c:choose>

                  </div>
                  <input class="form-control mt-1" type="file" id="formFile"
                         accept="image/*" value="대표이미지">
                </div>
                <div class="col-md-5 pt-3">
                  <h2>체험 정보</h2>
                  <input name="pdName" type="text" class="form-control" value="${dto.pdName}" placeholder="예) [체험] 초급 다이빙">
                  <textarea name="content" class="form-control mt-3"
                            style="height: 485px"
                            placeholder="예) 한국 유일 산호초 군집 포인트...">${dto.content}</textarea>
                </div>
                <hr/>
              </div>
              <div class="row g-3">
                <div class="col-md-7">
                  <div class="pb-2">
                    <h2>체험 관련 이미지</h2>
                    <input class="form-control" type="file" id="formFile2" accept="image/*" value="상품 이미지">
                  </div>
                  <div class="contentImgArea">
                    <c:choose>
                      <c:when test="${modify}">
                        <c:set var="up" value="${dto.uploads.get(1)}"/>
                        <div class="uploadImg" data-uuid="${up.uuid}" data-filename="${up.filename}"
                             data-link="${up.link}" data-filepath="${up.filepath}" data-img="${up.img}" data-ord="1">
                          <img src="/attach/view?fileName=${up.link}" style="width: 100%">
                        </div>
                      </c:when>
                      <c:otherwise>
                        <div class="writeItemImg contentImg opacity-3" style="background-image: url(/resources/img/imgicon2.png)"></div>
                      </c:otherwise>
                    </c:choose>
                  </div>
                </div>
                <div class="col-md-5">
                  <h2>상세 내용</h2>

                  <div class="row row-cols-2 align-items-center gy-2 pb-5">
                    <div class="col-4">일반 가격</div>
                    <div class="col-8"><input name="price" type="number" class="form-control" placeholder="원" value="${dto.price}"></div>

                    <div class="col-4">강사 가격</div>
                    <div class="col-8"><input name="dprice" type="number" class="form-control" placeholder="원" value="${dto.dprice}"></div>

                    <div class="col-4">인원 제한</div>
                    <div class="col-8"><input name="pdLimit" type="number" class="form-control" placeholder="명" value="${modify ? dto.pdLimit : 0}"></div>
                  </div>

                  <h2>다이빙 포인트</h2>
                  <select class="form-select selectDpoint" name="dpno">
                    <c:forEach items="${dpointList}" var="dp">
                      <option ${dto.dpno == dp.dpno ? "selected" : ""} value="${dp.dpno}" data-lat="${dp.lat}" data-lng="${dp.lng}" data-mainImg="${dp.mainImg}" data-content="${dp.content}">${dp.title}</option>
                    </c:forEach>
                  </select>
                </div>
              </div>
              <input type="hidden" name="mno" value="<sec:authentication property="principal.mno"/>">
              <c:if test="${modify}">
                <input type="hidden" name="pdno" value="${dto.pdno}">
              </c:if>
              <div class="additionalInput"></div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>

<div class="modal fade warningModal" id="verticalycentered" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">작성 살패</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close"></button>
      </div>
      <div class="modal-body">
        비어있는 칸 또는 첨부 이미지를 확인하세요
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
          Close
        </button>
      </div>
    </div>
  </div>
</div>
<!-- End Vertically centered Modal-->


<%@include file="/WEB-INF/include/shop/basic_footer.jsp" %>

<script src="/resources/js/owus.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/upload.js"></script>

<script>
    const actionForm = qs(".actionForm")
    const warningModal = bootstrap.Modal.getOrCreateInstance(qs(".warningModal"))

    <%--const bno = '${dto.bno}'--%>

    qsClickEvent(".cancelBtn", (e) => {
        history.go(-1)
    })

    qsClickEvent(".modifyBtn", (e) => {
        e.stopPropagation()
        e.preventDefault()

        if (!contentToForm()) return

        actionForm.setAttribute("action", `\${path}/update`)
        actionForm.setAttribute("method", "post")
        actionForm.submit()
    })

    qsClickEvent(".writeBtn", (e) => {
        e.stopPropagation()
        e.preventDefault()

        if (!contentToForm()) return

        actionForm.setAttribute("action", `\${path}/write`)
        actionForm.setAttribute("method", "post")
        actionForm.submit()
    })

    const updateImg = (target, imgArea) => {
        const formObj = new FormData();
        const fileInput = target
        const file = fileInput.files[0]

        formObj.append("files", file);

        const uploaded = qs(".uploadImg", qs(imgArea))
        if(uploaded !== null) {
            attachService.deleteToServer(uploaded.getAttribute("data-link"), (data) => {
                console.log(data)
            })
        }
        return formObj
    }

    qsAddEvent("#formFile", "change", (e) => {
        const formObj = updateImg(e.target, ".mainImgArea")

        attachService.uploadToServer(formObj, (arr) => {
            console.log(arr[0])
            const {uuid, filename, filepath, img, link, thumbnail} = arr[0]

            qs(".mainImgArea").innerHTML = `
                <div class="writeItemImg mainImg uploadImg"
                    data-uuid="\${uuid}" data-filename="\${filename}" data-link="\${link}" data-filepath="\${filepath}" data-img="\${img}" data-ord="0"
                    style="background-image: url(/attach/view?fileName=\${link})"></div>
                <input type="hidden" name="mainImg" value="\${link}">
                `
        })
    })

    qsAddEvent("#formFile2", "change", (e) => {
        const formObj = updateImg(e.target, ".contentImgArea")

        attachService.uploadToServer(formObj, (arr) => {
            console.log(arr[0])
            const {uuid, filename, filepath, img, link, thumbnail} = arr[0]

            qs(".contentImgArea").innerHTML = `
                <div class="uploadImg" data-uuid="\${uuid}" data-filename="\${filename}"
                    data-link="\${link}" data-filepath="\${filepath}" data-img="\${img}" data-ord="1">
                    <img src="/attach/view?fileName=\${link}" style="width: 100%">
                </div>`
        })
    })

    const imgToForm = () => {
        let str = ""

        const imgs = qsAll(".uploadImg")
        for (let i = 0; i < imgs.length; i++) {
            const {uuid, filename, img, filepath, ord} = imgs[i].dataset
            str += `<input type="hidden" name="uploads[\${i}].uuid" value="\${uuid}">`
            str += `<input type="hidden" name="uploads[\${i}].filename" value="\${filename}">`
            str += `<input type="hidden" name="uploads[\${i}].img" value="\${img}">`
            str += `<input type="hidden" name="uploads[\${i}].filepath" value="\${filepath}">`
            str += `<input type="hidden" name="uploads[\${i}].ord" value="\${ord}">`
        }

        qs(".additionalInput").innerHTML += str

        return imgs.length
    }

    const contentToForm = () => {
        const pdName = qs("input[name='pdName']").value
        const content = qs("textarea[name='content']").value

        if(pdName === "" || content === "" || imgToForm() !== 2) {
            warningModal.show()
            return false
        }

        return true
    }

</script>
