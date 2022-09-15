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
  <%@ include file="/WEB-INF/include/shop/basic_pagetitle.jsp"%>

  <section class="section">
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-body">
            <div class="container-fluid mt-3 p-0">
              <div class="row align-items-center">
                <div class="col col-sm-8">
                  <div class='calendar'>
                    <div class="calendar-header row align-items-center">
                      <div class="col-sm-auto year-month"></div>
                      <div class="col-sm-auto">
                        <select class="areaSelect">
                          <option value="1" selected>동해 중부</option>
                          <option value="2">동해 남부</option>
                          <option value="3">남해 동부</option>
                          <option value="4">제주도</option>
                          <option value="5">울릉도</option>
                        </select>
                      </div>
                      <div class="calendar-nav col-auto">
                        <ul class="pagination m-0">
                          <li class="page-item"><a class="page-link go-prev" href="#">&laquo;</a></li>
                          <li class="page-item"><a class="page-link go-today" href="#">TODAY</a></li>
                          <li class="page-item"><a class="page-link go-next" href="#">&raquo;</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="calendar-body container-fluid">
                      <div class="row days text-center mb-3">
                        <div class="col sunday">일</div>
                        <div class="col">월</div>
                        <div class="col">화</div>
                        <div class="col">수</div>
                        <div class="col">목</div>
                        <div class="col">금</div>
                        <div class="col saturday">토</div>
                      </div>
                      <div class="renderTarget"></div>
                    </div>
                  </div>
                </div>
                <div class="col col-sm-4 weekArea"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

</main>
<!-- End #main -->

<%@include file="/WEB-INF/include/shop/basic_footer.jsp" %>

<link href="/resources/css/calendar.css" rel="stylesheet"/>
<link href="/resources/css/weather_svg.css" rel="stylesheet"/>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/owus.js"></script>
<%--<script src="/resources/js/calendar.js"></script>--%>
<script src="/resources/js/weather/service.js"></script>
<script src="/resources/js/weather/render.js"></script>

<script>
    let initstate = {
        "date": new Date(),
        "geoID": 1
    }

    let currentDate = new Date()

    const weather = weatherService(weatherRender)
    weather.setState(initstate)

    qsClickEvent(".go-prev", (e) => {
        e.preventDefault()
        e.stopPropagation()

        currentDate.setMonth(currentDate.getMonth()-1)

        weather.setState({"date": currentDate})

    })

    qsClickEvent(".go-today", (e) => {
        e.preventDefault()
        e.stopPropagation()

        currentDate = new Date()

        weather.setState({"date": currentDate})
    })

    qsClickEvent(".go-next", (e) => {
        e.preventDefault()
        e.stopPropagation()

        currentDate.setMonth(currentDate.getMonth()+1)

        weather.setState({"date": currentDate})

    })

    qsAddEvent(".areaSelect", "change", (e) => {
        const target = e.target;

        weather.setState({"geoID": target.value})
    })

</script>

