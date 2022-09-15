<%--
  User: 
  Date: 2022-05-01
  Time: 오후 12:15
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/shop/basic_header.jsp"%>
<%@ include file="/WEB-INF/include/shop/basic_sidebar.jsp"%>

<main id="main" class="main">
  <%@ include file="/WEB-INF/include/shop/basic_pagetitle.jsp"%>

<%--  <h1><sec:authentication property="principal.member.mno"/></h1>--%>

  <section class="section dashboard">
    <div class="row">

      <!-- Left side columns -->
      <div class="col-lg-8">
        <div class="row">

          <!-- Sales Card -->
          <div class="col-xxl-4 col-md-6">
            <div class="card info-card sales-card">

              <div class="filter">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                  <li class="dropdown-header text-start"><h6>Filter</h6></li>
                  <li><a class="dropdown-item" href="#">오늘</a></li>
                  <li><a class="dropdown-item" href="#">1주</a></li>
                  <li><a class="dropdown-item" href="#">1달</a></li>
                </ul>
              </div>

              <div class="card-body">
                <h5 class="card-title">예약건수 <span>| 누적</span></h5>

                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-cart"></i>
                  </div>
                  <div class="ps-3">
                    <h6><span class="sumRsv">-</span>건</h6>
                    <span class="text-success small pt-1 fw-bold plusRsv">-</span>
                    <span class="text-success small pt-1 fw-bold">건</span>
                    <span class="text-muted small pt-2 ps-1">증가</span>
                  </div>
                </div>
              </div>

            </div>
          </div><!-- End Sales Card -->

          <!-- Revenue Card -->
          <div class="col-xxl-4 col-md-6">
            <div class="card info-card revenue-card">

              <div class="filter">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                  <li class="dropdown-header text-start">
                    <h6>Filter</h6>
                  </li>

                  <li><a class="dropdown-item" href="#">오늘</a></li>
                  <li><a class="dropdown-item" href="#">1주</a></li>
                  <li><a class="dropdown-item" href="#">1달</a></li>
                </ul>
              </div>

              <div class="card-body">
                <h5 class="card-title">매출액 <span>| 누적</span></h5>

                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-currency-exchange"></i>
                  </div>
                  <div class="ps-3">
                    <h6><span class="sumPrice">-</span>만원</h6>
                    <span class="text-success small pt-1 fw-bold plusPrice">-</span>
                    <span class="text-success small pt-1 fw-bold">만원</span>
                    <span class="text-muted small pt-2 ps-1">증가</span>

                  </div>
                </div>
              </div>

            </div>
          </div><!-- End Revenue Card -->

          <!-- Customers Card -->
          <div class="col-xxl-4 col-xl-12">

            <div class="card info-card customers-card">

              <div class="filter">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                  <li class="dropdown-header text-start">
                    <h6>Filter</h6>
                  </li>

                  <li><a class="dropdown-item" href="#">Today</a></li>
                  <li><a class="dropdown-item" href="#">This Month</a></li>
                  <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
              </div>

              <div class="card-body">
                <h5 class="card-title">예약자수 <span>| 누적</span></h5>

                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-people"></i>
                  </div>
                  <div class="ps-3">
                    <h6><span class="sumPeople">-</span>명</h6>
                    <span class="text-danger small pt-1 fw-bold plusPeople">-</span>
                    <span class="text-danger small pt-1 fw-bold">명</span>
                    <span class="text-muted small pt-2 ps-1">증가</span>

                  </div>
                </div>

              </div>
            </div>

          </div><!-- End Customers Card -->

          <!-- Reports -->
          <div class="col-12">
            <div class="card">

              <div class="filter">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                  <li class="dropdown-header text-start">
                    <h6>Filter</h6>
                  </li>

                  <li><a class="dropdown-item" href="#">Today</a></li>
                  <li><a class="dropdown-item" href="#">This Month</a></li>
                  <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
              </div>

              <div class="card-body">
                <h5 class="card-title">예약건수 <span>| 일별</span></h5>
                <!-- Line Chart -->
                <div id="reportsChart"></div>

                <!-- End Line Chart -->

              </div>

            </div>
          </div><!-- End Reports -->

          <!-- Recent Sales -->
          <div class="col-12">
            <div class="card recent-sales overflow-auto">

              <div class="filter">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                  <li class="dropdown-header text-start">
                    <h6>Filter</h6>
                  </li>

                  <li><a class="dropdown-item" href="#">Today</a></li>
                  <li><a class="dropdown-item" href="#">This Month</a></li>
                  <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
              </div>

              <div class="card-body">
                <h5 class="card-title">최근 예약</h5>

                <table class="table table-borderless">
                  <thead>
                  <tr class="text-center">
                    <th scope="col">예약번호</th>
                    <th scope="col">체험명</th>
                    <th scope="col">기간</th>
                    <th scope="col">인원수(현재/최대)</th>
                  </tr>
                  </thead>
                  <tbody class="recentRsv"></tbody>
                </table>

              </div>

            </div>
          </div><!-- End Recent Sales -->

          <!-- Top Selling -->
          <div class="col-12">
            <div class="card top-selling overflow-auto">

              <div class="filter">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                  <li class="dropdown-header text-start">
                    <h6>Filter</h6>
                  </li>

                  <li><a class="dropdown-item" href="#">Today</a></li>
                  <li><a class="dropdown-item" href="#">This Month</a></li>
                  <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
              </div>

            </div>
          </div><!-- End Top Selling -->

        </div>
      </div><!-- End Left side columns -->

      <!-- Right side columns -->
      <div class="col-lg-4">

        <!-- News & Updates Traffic -->
        <div class="card">
          <div class="filter">
            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
              <li class="dropdown-header text-start">
                <h6>Filter</h6>
              </li>

              <li><a class="dropdown-item" href="#">Today</a></li>
              <li><a class="dropdown-item" href="#">This Month</a></li>
              <li><a class="dropdown-item" href="#">This Year</a></li>
            </ul>
          </div>

          <div class="card-body pb-0">
            <h5 class="card-title">해양 소식 <span>| 오늘</span></h5>

            <div class="news">
              <div class="post-item clearfix">
                <img src="https://img0.yna.co.kr/photo/yna/YH/2019/10/15/PYH2019101523150005700_P4.jpg" alt="">
                <h4><a href="#">울산 태화강서 용선·카누·카약 수상 스포츠 체험한다</a></h4>
                <p>(울산=연합뉴스) 김용태 기자 = 울산시는 태화강에서 '2022년 수상 스포츠 체험교실'을 상·하반기로 구분해</p>
              </div>

              <div class="post-item clearfix">
                <img src="http://owus.duckdns.org:38080/niceadmin/img/news-2.jpg" alt="">
                <h4><a href="#">해양레저 붐..전남 마리나 각광</a></h4>
                <p>▶ 인터뷰 : 임진출 / 전남도 해양레저팀장 - "부산, 제주 등에 비해 후발 주자이나 해수부 2차 마리나 항만</p>
              </div>

              <div class="post-item clearfix">
                <img src="http://owus.duckdns.org:38080/niceadmin/img/news-3.jpg" alt="">
                <h4><a href="#">‘해양레포츠 무료체험’ 포항시민 인산인해</a></h4>
                <p>“시민들의 많은 참여로 행사가 성황리에 종료되었다.”며 “아이들의 행복한 모습</p>
              </div>

              <div class="post-item clearfix">
                <img src="http://owus.duckdns.org:38080/niceadmin/img/news-4.jpg" alt="">
                <h4><a href="#">유정복, ‘해양 관광·레저의 으뜸, 인천!’ 비전</a></h4>
                <p>자전거길과 낚시?레저활동 공간 조성, 옹진에 해양박물관과 섬마을 힐링 캠프 건립 등을 추진한다</p>
              </div>

              <div class="post-item clearfix">
                <img src="http://owus.duckdns.org:38080/niceadmin/img/news-5.jpg" alt="">
                <h4><a href="#">스릴 좋지만… 수상레포츠 ‘사고 주의보’</a></h4>
                <p>경북도내 수상레저 안전사고 매년 수십건 발생
                  대부분 이용객·레저기구 운항자 부주의로 생겨</p>
              </div>

            </div><!-- End sidebar recent posts-->

          </div>
        </div><!-- End News & Updates -->
      </div><!-- End Right side columns -->

    </div>
  </section>

</main><!-- End #main -->


<script src="/resources/js/owus.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>
    const weatherState = {
        "date": new Date(),
        "geoID": 1
    }

  const chartRender = (series, category) => {

      new ApexCharts(document.querySelector("#reportsChart"), {
          series: [{
              name: '예약건수',
              data: series,
          }],
          chart: {
              height: 300,
              type: 'area',
              toolbar: {
                  show: false
              },
          },
          markers: {
              size: 4
          },
          colors: ['#4154f1', '#2eca6a', '#ff771d'],
          fill: {
              type: "gradient",
              gradient: {
                  shadeIntensity: 1,
                  opacityFrom: 0.3,
                  opacityTo: 0.4,
                  stops: [0, 90, 100]
              }
          },
          dataLabels: {
              enabled: false
          },
          stroke: {
              curve: 'smooth',
              width: 2
          },
          xaxis: {
              type: 'datetime',
              labels: {
                  format: 'M월 d일'
              },
              categories: category
          },
          yaxis: {
              min: Math.min(...series) < 0 ? 0 : Math.min(...series) - 1,
              max: Math.max(...series) + 1,

              labels: {
                  formatter: (v) => {return parseInt(v)}
              }
          },
          tooltip: {
              x: {
                  format: 'yy.MM.dd'
              },
          }
      }).render();
  }

  const summaryRender = ({rsv, price, people, lastDTO}) => {
      qs(".sumRsv").innerHTML = rsv
      qs(".sumPrice").innerHTML = parseInt(price/10000).toLocaleString()
      qs(".sumPeople").innerHTML = people

      qs(".plusRsv").innerHTML = lastDTO.totalRsv
      qs(".plusPrice").innerHTML = parseInt(lastDTO.totalPrice/10000).toLocaleString()
      qs(".plusPeople").innerHTML = lastDTO.totalPeople
  }

  document.addEventListener("DOMContentLoaded", () => {
      axios.get(`/shop/dash/summary`).then(rst => {
          const dtoList = rst.data

          const seriesData = []
          const categoryData = []

          let sumRsv = 0 , sumPrice = 0, sumPeople = 0
          let lastDTO = dtoList[dtoList.length - 1]

          for (const dto of dtoList) {
              seriesData.push(dto.totalRsv)
              categoryData.push(dto.dt)

              sumRsv += dto.totalRsv;
              sumPrice += dto.totalPrice;
              sumPeople += dto.totalPeople
          }

          console.info(seriesData)
          console.info(categoryData)
          console.info(sumRsv, sumPrice, sumPeople)

          summaryRender({rsv: sumRsv, price: sumPrice, people: sumPeople, lastDTO})
          chartRender(seriesData, categoryData)
      })

      axios.get(`/shop/dash/recentRsv`).then(rst => {
          let str =""
          for(const d of rst.data) {
              str += `<tr class="text-center">
                        <th scope="row"><a href="/shop/mypage/reservation/read/\${d.rsvno}">\${d.rsvno}</a></th>
                        <td>\${d.pdName}</td>
                        <td>\${d.startDate} ~ \${d.endDate}</td>
                        <td><span class="badge \${d.tutorCnt+d.normalCnt == d.pdLimit ? 'bg-danger' : 'bg-success'}">\${d.tutorCnt+d.normalCnt}/\${d.pdLimit}</span></td>
                      </tr>`
          }
          qs(".recentRsv").innerHTML = str
      })
  });
</script>

<%@include file="/WEB-INF/include/shop/basic_footer.jsp"%>
