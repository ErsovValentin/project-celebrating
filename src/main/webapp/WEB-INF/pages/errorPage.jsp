<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Валик
  Date: 10.12.2018
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="margin: 0px; background: #0e0e0e;">
<h1 align="center" style="color: #FFFFFF !important;"><a href="<c:url value="/"/>">Вернуться на главную</a></h1>
<img style="cursor: zoom-in;
    display: block;
    margin-left: auto;
    margin-right: auto;" src="<c:url value="/resources/images/${errorCode}.jpg"/>" width="737" height="590">
</body>
</html>
