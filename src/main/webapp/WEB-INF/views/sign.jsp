<%--
  User: 
  Date: 2022-05-16
  Time: 오전 10:02
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>OWUS 관리자</title>

  <!-- Favicons -->
<%--  <link href="assets/img/favicon.png" rel="icon">--%>
<%--  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">--%>

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="http://owus.duckdns.org:38080/niceadmin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="http://owus.duckdns.org:38080/niceadmin/css/style.css" rel="stylesheet">

  <style>
      * {
          font-family: "Noto Sans KR", sans-serif;
      }
  </style>
</head>

<body>

<main>
  <div class="container">

    <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

            <div class="card mb-3">

              <div class="card-body">

                <div class="pt-4 pb-2">
                  <h5 class="card-title text-center pb-0 fs-4">관리자 로그인</h5>
                </div>

                <form class="row g-3 needs-validation" novalidate action="/login" method="post">

                  <div class="col-12">
                    <label for="yourUsername" class="form-label">아이디</label>
                    <div class="input-group has-validation">
                      <input type="text" name="username" class="form-control" id="yourUsername" required>
                      <div class="invalid-feedback">아이디를 입력하세요.</div>
                    </div>
                  </div>

                  <div class="col-12">
                    <label for="yourPassword" class="form-label">비밀번호</label>
                    <input type="password" name="password" class="form-control" id="yourPassword" required>
                    <div class="invalid-feedback">비밀번호를 입력하세요!</div>
                  </div>

                  <div class="col-12">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" name="remember-me" value="true" id="rememberMe">
                      <label class="form-check-label" for="rememberMe">자동 로그인</label>
                    </div>
                  </div>
                  <div class="col-12">
                    <button class="btn btn-primary w-100" type="submit">로그인</button>
                  </div>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>

    </section>

  </div>
</main><!-- End #main -->

<!-- Template Main JS File -->
<script src="http://owus.duckdns.org:38080/niceadmin/js/main.js"></script>

</body>

</html>