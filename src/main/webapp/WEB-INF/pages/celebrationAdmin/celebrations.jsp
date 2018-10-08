<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Валик
  Date: 06.10.2018
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Celebrations</title>
</head>
<body>
<a href="<c:url value="/"/> ">Back to main menu</a>
<br/>
<br/>

<h1>Celebration list</h1>

<c:if test="${!empty listOfCelebrations}">
    <table border="2">
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Update</td>
            <td>Delete</td>
        </tr>
        <c:forEach items="${listOfCelebrations}" var="celebration">
            <tr>
                <td>${celebration.id}</td>
                <td>${celebration.name}</td>
                <td><a href="<c:url value="/updateCelebration/${celebration.id}"/>">Update</a></td>
                <td><a href="<c:url value="/deleteCelebration/${celebration.id}"/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>


<h1>Add Client</h1>
<c:url var="addAction" value="/celebrations/addCelebration"/>

<form:form action="${addAction}" modelAttribute="celebration">
<table>
    <c:if test="${!empty celebration.name}">
        <tr>
            <td>
                <form:label path="id">
                    <spring:message text="ID"/>
                </form:label>
            </td>
            <td>
                <form:input path="id" readonly="true" disabled="true"/>
                <form:hidden path="id"/>
            </td>
        </tr>
    </c:if>

    <tr>
        <td>
            <form:label path="name">
                <spring:message text="Name"/>
            </form:label>
        </td>
        <td>
            <form:input path="name"/>
        </td>
    </tr>

    <tr>
        <td>
            <c:choose>
                <c:when test="${celebration.id == 0}">
                    <input type="submit" value="<spring:message text="Add celebration"/> "/>
                </c:when>
                <c:otherwise>
                    <input type="submit" value="<spring:message text="Update celebration"/> "/>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>

</table>
</form:form>

</body>
</html>
