<%--
  User: 
  Date: 2022-05-01
  Time: 오후 12:15
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/shop/basic_header.jsp" %>
<%@ include file="/WEB-INF/include/shop/basic_sidebar.jsp" %>

<main id="main" class="main">
  <%@ include file="/WEB-INF/include/shop/basic_pagetitle.jsp" %>

  <%--  <h1><sec:authentication property="principal.member.mno"/></h1>--%>

  <section class="section">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title"></h5>

        <!-- Default Tabs -->
        <ul class="nav nav-tabs d-flex" id="myTabjustified" role="tablist">
          <li class="nav-item flex-fill" role="presentation">
            <button class="nav-link w-100 active" id="recvMsg"
                    data-bs-toggle="tab" data-bs-target="#recvMsg-tab"
                    type="button" role="tab" aria-controls="recvMsg"
                    aria-selected="true">받은 쪽지
            </button>
          </li>
          <li class="nav-item flex-fill" role="presentation">
            <button class="nav-link w-100" id="sendMsg" data-bs-toggle="tab"
                    data-bs-target="#sendMsg-tab" type="button" role="tab"
                    aria-controls="sendMsg" aria-selected="false">보낸 쪽지
            </button>
          </li>
          <li class="nav-item flex-fill" role="presentation">
            <button class="nav-link w-100" id="writeMsg" data-bs-toggle="tab"
                    data-bs-target="#writeMsg-tab" type="button" role="tab"
                    aria-controls="writeMsg" aria-selected="false">쪽지 쓰기
            </button>
          </li>
        </ul>
        <div class="tab-content pt-2" id="myTabjustifiedContent">
          <div class="tab-pane fade show active" id="recvMsg-tab" role="tabpanel" aria-labelledby="recvMsg-tab">
            <table class="table" style="table-layout: fixed">
              <thead>
              <tr class="text-center">
                <th scope="col" class="col-2">쪽지번호</th>
                <th scope="col" class="col-4">내용</th>
                <th scope="col" class="col-2">보낸이</th>
                <th scope="col" class="col-2">받은시간</th>
                <th scope="col" class="col-2">읽은시간</th>
              </tr>
              </thead>
              <tbody class="recvTable">
              </tbody>
            </table>
          </div>
          <div class="tab-pane fade" id="sendMsg-tab" role="tabpanel" aria-labelledby="sendMsg-tab">
            <table class="table" style="table-layout: fixed">
              <thead>
              <tr class="text-center">
                <th scope="col" class="col-2">쪽지번호</th>
                <th scope="col" class="col-4">내용</th>
                <th scope="col" class="col-2">받는이</th>
                <th scope="col" class="col-2">보낸시간</th>
                <th scope="col" class="col-2">읽은시간</th>
              </tr>
              </thead>
              <tbody class="sendTable">
              </tbody>
            </table>
          </div>
          <div class="tab-pane fade" id="writeMsg-tab" role="tabpanel" aria-labelledby="writeMsg-tab">
            <div class="row row-cols-2">
              <div class="col">
                <div class="form-floating mb-3">
                  <input type="text" class="form-control toUserInput" id="floatingText" placeholder="아이디, 이름, 닉네임">
                  <label for="floatingText">아이디, 이름, 닉네임</label>
                </div>
              </div>
              <div class="col">
                <ul class="d-flex flex-wrap list-unstyled toUserList"></ul>
              </div>
            </div>
            <div class="form-floating mb-3">
              <textarea class="form-control content" placeholder="내용" id="floatingTextarea" style="height: 100px;"></textarea>
              <label for="floatingTextarea">내용</label>
            </div>
            <div class="form-floating mb-3">
              <button class="btn btn-primary sendBtn">보내기</button>
            </div>
          </div>
        </div><!-- End Default Tabs -->
        <hr/>
        <nav aria-label="Page navigation example">
          <ul class="pagination"></ul>
        </nav>
      </div>
    </div>
  </section>

</main>
<!-- End #main -->

<%@include file="/WEB-INF/include/shop/basic_footer.jsp" %>


<div class="modal fade" id="msgModal" tabindex="-1">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title nickname">변상민</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="text-end sendDate">2022-06-01</div>
        <div class="content">
          Non omnis incidunt qui sed occaecati magni asperiores est mollitia. Soluta at et reprehenderit. Placeat autem numquam et fuga numquam. Tempora in facere consequatur sit dolor ipsum. Consequatur nemo amet incidunt est facilis. Dolorem neque recusandae quo sit molestias sint dignissimos.
        </div>
      </div>
      <div class="modal-footer">
<%--        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>--%>
        <button type="button" class="btn btn-primary sendMsgBtn" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>


<link rel="stylesheet" href="/resources/css/message.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/owus.js"></script>
<script src="/resources/js/msgService.js"></script>

<script>
    const msgModal = bootstrap.Modal.getOrCreateInstance(qs("#msgModal"))

    const initState = {
        mno: ${user.mno},
        tabType: 0,
        page: 1,
        size: 10,
        total: 0,
        dtoList: []
    }

    const service = msgService(render)
    const {setState} = service

    setState(initState)

    qsClickEvent("#recvMsg", (e) => {
        const target = e.target
        setState({tabType: 0, page: 1})
    })

    qsClickEvent("#sendMsg", (e) => {
        const target = e.target
        setState({tabType: 1, page: 1})
    })

    qsClickEvent("#writeMsg", (e) => {
        pageUL.innerHTML = ""
    })

    qsClickEvent(".sendBtn", (e) => {
        const tmnoList = new Set()
        qsAll(".toUser").forEach(u => tmnoList.add(u.getAttribute("data-mno")))

        service.postServer({
            fmno: ${user.mno},
            tmnoList: Array.from(tmnoList),
            content: qs(".content").value
        }, (rst) => {
            console.log(rst)

            qs(".toUserList").innerHTML = ""
            qs(".content").value = ""
            qs("#sendMsg").click()
        })
    })

    qsClickEvent(".recvTable", (e) => {
        const target = e.target
        if(!target.classList.contains("clickable")) {
            return
        }

        const tr = target.closest("tr")

        qs(".nickname", qs("#msgModal")).innerHTML = qs(".nickname", tr).innerHTML
        qs(".sendDate", qs("#msgModal")).innerHTML = qs(".sendDate", tr).innerHTML
        qs(".content", qs("#msgModal")).innerHTML = qs(".content", tr).innerText
        qs(".sendMsgBtn", qs("#msgModal")).setAttribute("data-mno", target.getAttribute("data-mno"))
        msgModal.show()

    })

    qsClickEvent(".pagination", (e) => {
        const target = e.target
        if(target.getAttribute("class") !== "page-link") {
            return
        }

        const page = parseInt(target.getAttribute("data-rpage"))

        service.setState({page})
    })

    qsClickEvent(".toUserList", (e) => {
        const target = e.target

        if(!target.classList.contains("toUserDel")) {
            return
        }

        target.parentElement.remove()

    })

    const isAdded = (mno) => {
        const rst = Array.from(qsAll(".toUser")).filter(ele => parseInt(ele.getAttribute("data-mno")) === parseInt(mno))
        return rst.length > 0
    }

    $(function() {
        $('.toUserInput').autocomplete({ // autocomplete 구현 시작부
            source : (req, resp) => {
                service.findUserServer($('.toUserInput').val(), (rst) => {
                    resp(
                        $.map(rst, (item) => {
                            return {
                                ...item
                            }
                        })
                    )
                })
            }, //source 는 자동완성의 대상

            select : function(event, ui) { // item 선택 시 이벤트
                const {id, name, nickname, mno} = ui.item
                if(isAdded(mno)) return

                const li = `
                  <li class="toUser position-relative" data-mno="\${mno}">
                      <div>\${name}</div>
                      <div>\${id}</div>
                      <button class="btn btn-sm btn-danger position-absolute toUserDel">삭제</button>
                  </li>
                `
                $(".toUserList").append(li)

            },
            focus : function(event, ui) { // 포커스 시 이벤트
                return false;
            },
            close : function(event) { // 자동완성 창 닫아질 때의 이벤트
                console.log(event);
            },

            minLength : 2, // 최소 글자 수
            autoFocus : true, // true로 설정 시 메뉴가 표시 될 때, 첫 번째 항목에 자동으로 초점이 맞춰짐
            classes : { // 위젯 요소에 추가 할 클래스를 지정
                'ui-autocomplete' : 'highlight'
            },
            delay : 300, // 입력창에 글자가 써지고 나서 autocomplete 이벤트 발생될 떄 까지 지연 시간(ms)
            disable : false, // 해당 값 true 시, 자동완성 기능 꺼짐
            position : { my : 'right top', at : 'right bottom'} // 제안 메뉴의 위치를 식별


        }).autocomplete( "instance" )._renderItem = function( ul, item ) {
            return $( "<li>" )
                .append( "<div>" + item.name + "<br>" + item.id + " | " + item.nickname + "</div>" )
                .appendTo( ul );
        };
    });


</script>
