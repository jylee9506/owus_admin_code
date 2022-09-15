<%--
  User: 
  Date: 2022-05-14
  Time: 오후 10:33
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>Title</title>
</head>
<body>

<style>
    .icon {
        width: 100px;
        height: 100px;
        background-position: center;
        background-repeat: no-repeat;
        background-size: contain;
        display: inline-block;
    }
</style>


  <c:forEach begin="1" end="41" var="i">

    <i class="icon" style="background: url(/resources/svg/weather/icon_flat_wt${i}.svg)">${i}</i>

  </c:forEach>

</body>
</html>
