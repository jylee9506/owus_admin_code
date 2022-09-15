<%--
  User: 
  Date: 2022-05-01
  Time: 오후 12:15
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/include/shop/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/shop/basic_sidebar.jsp" %>

<link rel="stylesheet" href="/resources/css/shop/mypage/review/review.css">
<main id="main" class="main">
    <%@ include file="/WEB-INF/include/shop/basic_pagetitle.jsp" %>

    <%--  <h1><sec:authentication property="principal.mno"/></h1>--%>
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="container-fluid p-0 pt-3">
                            <div class="row align-items-center">
                                <div class="col">
                                    <div class="explainBoard"><strong></strong></div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h1>${review.pdname}</h1>
                                    <div class="col-auto">
                                        <button type="button" class="btn btn-primary listBtn">목록</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr/>
                        <div class="container-fluid itemsBody">
                            <h3>상품정보</h3>
                            <table class="table table-striped-columns table-bordered text-center">
                                <thead>
                                </thead>
                                <tbody>
                                <tr>
                                    <th class="col-2">상품번호</th>
                                    <td class="col-2">${review.pdno}</td>
                                    <th class="col-2">가격</th>
                                    <td class="col-2">${review.price}</td>
                                </tr>
                                <tr>
                                    <th>예약번호</th>
                                    <td>${review.rsvno}</td>
                                    <th>할인가격</th>
                                    <td>${review.dprice}</td>
                                </tr>
                                <tr>
                                    <th>인원제한</th>
                                    <td>${review.pdlimit}</td>
                                    <th>수정날짜</th>
                                    <td>${review.updatedate}</td>
                                </tr>
                                </tbody>
                            </table>
                            <hr>
                            <h3>댓글</h3>
                            <div class="replyContainer">
                                <div class="replyBox">
                                    <div>${review.content}</div>
                                    <div>
                                        <span>${review.name}</span>
                                        <span>${review.regdate}</span>
                                    </div>

                                </div>
                                <div class="replyBox replyAnswer" style="display: ${review.state==0? 'none' : 'block'}">
                                    <div class="d-flex flex-row-reverse">
                                        <img class="delete-icon" src="/resources/img/close.png">
                                        <img class="modify-icon" src="/resources/img/edit.png" data-bs-toggle="modal"
                                             data-bs-target="#exampleModal">
                                    </div>
                                    <div>${reply.content}</div>
                                    <div>
                                        <span>${reply.name}</span>
                                        <span>${reply.regdate}</span>
                                    </div>
                                </div>
                            </div>
                            <!-- Button trigger modal -->
                            <div class="d-flex flex-row-reverse">
                                <input type="${review.state==0? 'button' : 'hidden'}" class="btn btn-primary " value="댓글등록" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</main>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">${review.state == 0 ? "댓글 작성" : "댓글 수정"}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            <textarea class="w-100 reply-answer" style="height: 150px">${reply.content}</textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary cancel" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary complete">완료</button>
            </div>
        </div>
    </div>
</div>
<!-- End #main -->

<form class="actionForm" action="/shop/mypage/review/answer" method="post">
      <input type="hidden" name="mno" value="${review.mno}">
      <input type="hidden" name="content">
      <input type="hidden" name="rno" value="${review.rno}">
      <input type="hidden" name="page" value="${listDTO.page}">
      <input type="hidden" name="size" value="${listDTO.size}">
      <input type="hidden" name="type" value="${listDTO.type}">
      <input type="hidden" name="keyword" value="${listDTO.keyword}">
    <input type="hidden" name="state" value="${listDTO.state}">
</form>

<%@include file="/WEB-INF/include/shop/basic_footer.jsp" %>

<script src="/resources/js/owus.js"></script>

<script>
    const actionForm = qs(".actionForm")

    qsClickEvent(".modify-icon",(e)=>{
        console.log("수정");
    },false)

    qsClickEvent(".listBtn", (e) => {
     actionForm.setAttribute("action","/shop/mypage/review");
     actionForm.setAttribute("method","get");
     actionForm.submit();
    })

    qsClickEvent(".complete",(e) =>{
        e.stopPropagation();
        e.preventDefault();

        const state = ${review.state};

        const content = qs(".reply-answer").value;
        const rno = ${review.rno};
        const mno = ${review.mno};

        actionForm.querySelector("input[name='content']").value =content;
        actionForm.querySelector("input[name ='mno']").value = mno;
        actionForm.querySelector("input[name='rno']").value = rno;


        if(state ==0){    //댓글 입력 post
            actionForm.submit();
        }else if(state ==1){      //댓글 수정 post
           actionForm.setAttribute("action","/shop/mypage/review/modify");
           actionForm.submit();
        }

    },false)

    qsClickEvent(".delete-icon",(e)=>{

        actionForm.setAttribute("action","/shop/mypage/review/delete");
        actionForm.submit();
    },false)

</script>


