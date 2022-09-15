<%--
  User: 
  Date: 2022-05-01
  Time: 오후 12:38
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<aside id="sidebar" class="sidebar">

  <ul class="sidebar-nav" id="sidebar-nav">

    <li class="nav-item">
      <a class="nav-link collapsed" href="/shop">
        <i class="bi bi-grid"></i>
        <span>메인</span>
      </a>
    </li><!-- End Dashboard Nav -->

    <li class="nav-item">
      <a class="nav-link collapsed" data-bs-target="#mypage-nav" data-bs-toggle="collapse" href="#">
        <i class="bi bi-file-person"></i><span>마이 페이지</span><i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="mypage-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <li>
          <a href="/shop/mypage/info">
            <i class="bi bi-circle"></i><span>내 정보</span>
          </a>
        </li>
        <li>
          <a href="/shop/mypage/item">
            <i class="bi bi-circle"></i><span>상품관리</span>
          </a>
        </li>
        <li>
          <a href="/shop/mypage/reservation">
            <i class="bi bi-circle"></i><span>예약관리</span>
          </a>
        </li>

        <li>
          <a href="/shop/mypage/review">
            <i class="bi bi-circle"></i><span>리뷰관리</span>
          </a>
        </li>
        <li>
          <a href="/shop/mypage/faq">
            <i class="bi bi-circle"></i><span>FAQ</span>
          </a>
        </li>

        <li>
          <a href="/shop/mypage/message">
            <i class="bi bi-circle"></i><span>쪽지함</span>
          </a>
        </li>

        <li>
          <a href="/shop/mypage/stats">
            <i class="bi bi-circle"></i><span>통계</span>
          </a>
        </li>
      </ul>
      <a class="nav-link collapsed" data-bs-target="#support-nav" data-bs-toggle="collapse" href="#">
        <i class="bi bi-chat-square-dots"></i><span>고객센터</span><i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="support-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <li>
          <a href="/shop/support/request">
            <i class="bi bi-circle"></i><span>업체 등록/해지 신청</span>
          </a>
        </li>
        <li>
          <a href="/shop/support/ask">
            <i class="bi bi-circle"></i><span>1:1문의</span>
          </a>
        </li>

      </ul>

    </li><!-- End Components Nav -->

    <li class="nav-heading">Pages</li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="/shop/weather">
        <i class="ri-sun-line"></i>
        <span>해상날씨</span>
      </a>
    </li><!-- End Contact Page Nav -->

    <li class="nav-item">

      <a class="nav-link collapsed" href="/shop/job">
        <i class="bi bi-person-square"></i>
        <span>구인구직</span>
      </a>
    </li><!-- End Contact Page Nav -->

    <li class="nav-item">
      <a class="nav-link collapsed" href="/shop/notice">
        <i class="bi bi-exclamation-octagon-fill"></i>
        <span>공지사항</span>
      </a>
    </li><!-- End Contact Page Nav -->

  </ul>
</aside><!-- End Sidebar-->
