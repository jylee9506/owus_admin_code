<%--
  User: 
  Date: 2022-05-01
  Time: 오후 12:38
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<aside id="sidebar" class="sidebar">

  <ul class="sidebar-nav" id="sidebar-nav">

    <li class="nav-item">
      <a class="nav-link collapsed" href="/admin">
        <i class="bi bi-grid"></i>
        <span>메인</span>
      </a>
    </li><!-- End Dashboard Nav -->

    <li class="nav-item">
      <a class="nav-link collapsed" data-bs-target="#shop-nav" data-bs-toggle="collapse" href="#">
        <i class="bi bi-menu-button-wide"></i><span>업체 관리</span><i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="shop-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <li>
          <a href="/admin/shop/member">
            <i class="bi bi-circle"></i><span>업체 회원 관리</span>
          </a>
        </li>
        <li>
          <a href="/admin/shop/notice">
            <i class="bi bi-circle"></i><span>공지 관리</span>
          </a>
        </li>
        <li>
          <a href="/admin/shop/ask">
            <i class="bi bi-circle"></i><span>문의 관리</span>
          </a>
        </li>

      </ul>
    </li><!-- End Components Nav -->

    <li class="nav-item">
      <a class="nav-link collapsed" data-bs-target="#diver-nav" data-bs-toggle="collapse" href="#">
        <i class="bi bi-journal-text"></i><span>다이버 관리</span><i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="diver-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <li>
          <a href="/admin/diver/member">
            <i class="bi bi-circle"></i><span>회원 관리</span>
          </a>
        </li>
        <li>
          <a href="/admin/diver/ask">
            <i class="bi bi-circle"></i><span>문의 관리</span>
          </a>
        </li>
      </ul>
    </li><!-- End Forms Nav -->

    <li class="nav-heading">Pages</li>

<%--    <li class="nav-item">--%>
<%--      <a class="nav-link collapsed" href="/admin/message">--%>
<%--        <i class="bi bi-envelope"></i>--%>
<%--        <span>쪽지함</span>--%>
<%--      </a>--%>
<%--    </li><!-- End Profile Page Nav -->--%>

    <li class="nav-item">
      <a class="nav-link collapsed" href="/admin/job">
        <i class="ri-walk-line"></i>
        <span>구인구직</span>
      </a>
    </li><!-- End F.A.Q Page Nav -->

    <li class="nav-item">
      <a class="nav-link collapsed" href="/admin/general">
        <i class="bx bxs-calculator"></i>
        <span>통계</span>
      </a>
    </li><!-- End Contact Page Nav -->

<%--    <li class="nav-item">--%>
<%--      <a class="nav-link collapsed" href="/admin/weather">--%>
<%--        <i class="ri-sun-line"></i>--%>
<%--        <span>날씨</span>--%>
<%--      </a>--%>
<%--    </li><!-- End Contact Page Nav -->--%>
  </ul>
</aside><!-- End Sidebar-->
