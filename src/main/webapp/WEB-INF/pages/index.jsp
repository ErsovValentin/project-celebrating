<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Валик
  Date: 06.10.2018
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
</head>
<body>
<h1>Home Page</h1>
<ul>
    <li><a href="<c:url value="/establishments"/>">Establishments</a></li>
    <li><a href="<c:url value="/celebrations"/>">Celebrations</a></li>
</ul>

</body>
</html>
