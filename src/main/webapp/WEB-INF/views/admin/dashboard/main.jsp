<%--
  User: 
  Date: 2022-05-01
  Time: 오후 12:15
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/include/admin/basic_header.jsp"%>
<%@ include file="/WEB-INF/include/admin/basic_sidebar.jsp"%>

<main id="main" class="main">
  <%@ include file="/WEB-INF/include/admin/basic_pagetitle.jsp"%>

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
                  <li class="dropdown-header text-start">
                    <h6>Filter</h6>
                  </li>

                  <li><a class="dropdown-item" href="#">오늘</a></li>
                  <li><a class="dropdown-item" href="#">1주</a></li>
                  <li><a class="dropdown-item" href="#">1달</a></li>
                </ul>
              </div>

              <div class="card-body">
                <h5 class="card-title">예약건수 <span>| 오늘</span></h5>

                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-cart"></i>
                  </div>
                  <div class="ps-3">
                    <h6>145</h6>
                    <span class="text-success small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">증가</span>

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
                <h5 class="card-title">매출액 <span>| 오늘</span></h5>

                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-currency-exchange"></i>
                  </div>
                  <div class="ps-3">
                    <h6>3,264만원</h6>
                    <span class="text-success small pt-1 fw-bold">8%</span> <span class="text-muted small pt-2 ps-1">증가</span>

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
                <h5 class="card-title">이용자수 <span>| 오늘</span></h5>

                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-people"></i>
                  </div>
                  <div class="ps-3">
                    <h6>1244</h6>
                    <span class="text-danger small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">감소</span>

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
                <h5 class="card-title">요약 <span>/오늘</span></h5>

                <!-- Line Chart -->
                <div id="reportsChart"></div>

                <script>
                    document.addEventListener("DOMContentLoaded", () => {
                        new ApexCharts(document.querySelector("#reportsChart"), {
                            series: [{
                                name: '예약건수',
                                data: [31, 40, 28, 51, 42, 82, 56],
                            }, {
                                name: '매출액',
                                data: [11, 32, 45, 32, 34, 52, 41]
                            }, {
                                name: '이용자수',
                                data: [15, 11, 32, 18, 9, 24, 11]
                            }],
                            chart: {
                                height: 350,
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
                                categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z"]
                            },
                            tooltip: {
                                x: {
                                    format: 'yy.MM.dd HH:mm'
                                },
                            }
                        }).render();
                    });
                </script>
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
                <h5 class="card-title">최근 예약 <span>| 오늘</span></h5>

                <table class="table table-borderless datatable">
                  <thead>
                  <tr>
                    <th scope="col">상품번호</th>
                    <th scope="col">가게이름</th>
                    <th scope="col">상품</th>
                    <th scope="col">가격</th>
                    <th scope="col">인원수(현재/최대)</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <th scope="row"><a href="#">#2457</a></th>
                    <td>양양다이브</td>
                    <td><a href="#" class="text-primary">체험 다이빙</a></td>
                    <td>150,000원</td>
                    <td><span class="badge bg-success">5/6</span></td>
                  </tr>
                  <tr>
                    <th scope="row"><a href="#">#2457</a></th>
                    <td>양양다이브</td>
                    <td><a href="#" class="text-primary">체험 다이빙</a></td>
                    <td>150,000원</td>
                    <td><span class="badge bg-danger">6/6</span></td>
                  </tr>
                  <tr>
                    <th scope="row"><a href="#">#2457</a></th>
                    <td>양양다이브</td>
                    <td><a href="#" class="text-primary">체험 다이빙</a></td>
                    <td>150,000원</td>
                    <td><span class="badge bg-success">5/6</span></td>
                  </tr>
                  <tr>
                    <th scope="row"><a href="#">#2457</a></th>
                    <td>양양다이브</td>
                    <td><a href="#" class="text-primary">체험 다이빙</a></td>
                    <td>150,000원</td>
                    <td><span class="badge bg-danger">6/6</span></td>
                  </tr>
                  <tr>
                    <th scope="row"><a href="#">#2457</a></th>
                    <td>양양다이브</td>
                    <td><a href="#" class="text-primary">체험 다이빙</a></td>
                    <td>150,000원</td>
                    <td><span class="badge bg-success">5/6</span></td>
                  </tr>
                  <tr>
                    <th scope="row"><a href="#">#2457</a></th>
                    <td>양양다이브</td>
                    <td><a href="#" class="text-primary">체험 다이빙</a></td>
                    <td>150,000원</td>
                    <td><span class="badge bg-danger">6/6</span></td>
                  </tr>
                  </tbody>
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

              <div class="card-body pb-0">
                <h5 class="card-title">인기가게<span>| 1주</span></h5>

                <table class="table table-borderless">
                  <thead>
                  <tr>
                    <th scope="col">대표이미지</th>
                    <th scope="col">가게이름</th>
                    <th scope="col">위치</th>
                    <th scope="col">누적 예약</th>
                    <th scope="col">누적 매출</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <th scope="row"><a href="#"><img src="http://owus.duckdns.org:38080/niceadmin/img/scuba.jpg" alt=""></a></th>
                    <td><a href="#" class="text-primary fw-bold">우성 다이브 리조트</a></td>
                    <td>제주</td>
                    <td class="fw-bold">124</td>
                    <td>5,828만원</td>
                  </tr>
                  <tr>
                    <th scope="row"><a href="#"><img src="http://owus.duckdns.org:38080/niceadmin/img/scuba.jpg" alt=""></a></th>
                    <td><a href="#" class="text-primary fw-bold">마코 다이브</a></td>
                    <td>제주</td>
                    <td class="fw-bold">98</td>
                    <td>4,508만원</td>
                  </tr>
                  <tr>
                    <th scope="row"><a href="#"><img src="http://owus.duckdns.org:38080/niceadmin/img/scuba.jpg" alt=""></a></th>
                    <td><a href="#" class="text-primary fw-bold">로맨틱 다이브 센터</a></td>
                    <td>고성</td>
                    <td class="fw-bold">74</td>
                    <td>4,366만원</td>
                  </tr>
                  <tr>
                    <th scope="row"><a href="#"><img src="http://owus.duckdns.org:38080/niceadmin/img/scuba.jpg" alt=""></a></th>
                    <td><a href="#" class="text-primary fw-bold">스쿠버해양캠프</a></td>
                    <td>양양</td>
                    <td class="fw-bold">63</td>
                    <td>2,016만원</td>
                  </tr>
                  <tr>
                    <th scope="row"><a href="#"><img src="http://owus.duckdns.org:38080/niceadmin/img/scuba.jpg" alt=""></a></th>
                    <td><a href="#" class="text-primary fw-bold">스쿠바캠프</a></td>
                    <td>통영</td>
                    <td class="fw-bold">41</td>
                    <td>3,239만원</td>
                  </tr>
                  </tbody>
                </table>

              </div>

            </div>
          </div><!-- End Top Selling -->

        </div>
      </div><!-- End Left side columns -->

      <!-- Right side columns -->
      <div class="col-lg-4">

        <!-- Recent Activity -->
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
            <h5 class="card-title">최근 활동 <span>| Today</span></h5>

            <div class="activity">

              <div class="activity-item d-flex">
                <div class="activite-label">32 min</div>
                <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
                <div class="activity-content">
                  [업체 등록] <b>지리산다이브</b>의 등록 요청
                </div>
              </div><!-- End activity item-->

              <div class="activity-item d-flex">
                <div class="activite-label">56 min</div>
                <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                <div class="activity-content">
                  [강사 등록] <b>이민경</b> 다이버 강사등록 요청
                </div>
              </div><!-- End activity item-->

              <div class="activity-item d-flex">
                <div class="activite-label">2 hrs</div>
                <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
                <div class="activity-content">
                  [업체 등록] <b>지리산다이브</b>의 등록 요청
                </div>
              </div><!-- End activity item-->

              <div class="activity-item d-flex">
                <div class="activite-label">1 day</div>
                <i class='bi bi-circle-fill activity-badge text-info align-self-start'></i>
                <div class="activity-content">
                  [강사 등록] <b>이민경</b> 다이버 강사등록 요청
                </div>
              </div><!-- End activity item-->

              <div class="activity-item d-flex">
                <div class="activite-label">2 days</div>
                <i class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
                <div class="activity-content">
                  [업체 등록] <b>지리산다이브</b>의 등록 요청
                </div>
              </div><!-- End activity item-->

              <div class="activity-item d-flex">
                <div class="activite-label">4 weeks</div>
                <i class='bi bi-circle-fill activity-badge text-muted align-self-start'></i>
                <div class="activity-content">
                  [강사 등록] <b>이민경</b> 다이버 강사등록 요청
                </div>
              </div><!-- End activity item-->

            </div>

          </div>
        </div><!-- End Recent Activity -->

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

        <!-- Budget Report -->
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
            <h5 class="card-title">Budget Report <span>| This Month</span></h5>

            <div id="budgetChart" style="min-height: 400px;" class="echart"></div>

            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                        legend: {
                            data: ['Allocated Budget', 'Actual Spending']
                        },
                        radar: {
                            // shape: 'circle',
                            indicator: [{
                                name: 'Sales',
                                max: 6500
                            },
                                {
                                    name: 'Administration',
                                    max: 16000
                                },
                                {
                                    name: 'Information Technology',
                                    max: 30000
                                },
                                {
                                    name: 'Customer Support',
                                    max: 38000
                                },
                                {
                                    name: 'Development',
                                    max: 52000
                                },
                                {
                                    name: 'Marketing',
                                    max: 25000
                                }
                            ]
                        },
                        series: [{
                            name: 'Budget vs spending',
                            type: 'radar',
                            data: [{
                                value: [4200, 3000, 20000, 35000, 50000, 18000],
                                name: 'Allocated Budget'
                            },
                                {
                                    value: [5000, 14000, 28000, 26000, 42000, 21000],
                                    name: 'Actual Spending'
                                }
                            ]
                        }]
                    });
                });
            </script>

          </div>
        </div><!-- End Budget Report -->

        <!-- Website Traffic -->
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
            <h5 class="card-title">Website Traffic <span>| Today</span></h5>

            <div id="trafficChart" style="min-height: 400px;" class="echart"></div>

            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    echarts.init(document.querySelector("#trafficChart")).setOption({
                        tooltip: {
                            trigger: 'item'
                        },
                        legend: {
                            top: '5%',
                            left: 'center'
                        },
                        series: [{
                            name: 'Access From',
                            type: 'pie',
                            radius: ['40%', '70%'],
                            avoidLabelOverlap: false,
                            label: {
                                show: false,
                                position: 'center'
                            },
                            emphasis: {
                                label: {
                                    show: true,
                                    fontSize: '18',
                                    fontWeight: 'bold'
                                }
                            },
                            labelLine: {
                                show: false
                            },
                            data: [{
                                value: 1048,
                                name: 'Search Engine'
                            },
                                {
                                    value: 735,
                                    name: 'Direct'
                                },
                                {
                                    value: 580,
                                    name: 'Email'
                                },
                                {
                                    value: 484,
                                    name: 'Union Ads'
                                },
                                {
                                    value: 300,
                                    name: 'Video Ads'
                                }
                            ]
                        }]
                    });
                });
            </script>

          </div>
        </div><!-- End Website Traffic -->

      </div><!-- End Right side columns -->

    </div>
  </section>

</main><!-- End #main -->


<script src="/resources/js/owus.js"></script>

<script>
// ################## 스크립트 작성 영역
console.log("HELLO")
</script>

<%@include file="/WEB-INF/include/admin/basic_footer.jsp"%>
