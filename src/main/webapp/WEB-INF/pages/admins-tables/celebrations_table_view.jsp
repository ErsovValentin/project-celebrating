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
<jsp:include page="../templates/header.jsp"/>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<body>

<jsp:include page="../templates/menu.jsp"/>
<br/>
<br/>

<div class="card">
<c:if test="${!empty listOfCelebrations}">
    <h1>Список торжеств</h1>
    <table border="2" id="table_id" class="table table-striped table-bordered">
        <thead>
            <td>ID</td>
            <td>Название торжества</td>
            <td>Редактировать</td>
            <td>Удалить</td>
        </thead>
        <tbody>
        <c:forEach items="${listOfCelebrations}" var="celebration">
            <tr>
                <td>${celebration.id}</td>
                <td>${celebration.name}</td>
                <td><a href="<c:url value="/admin/celebrations/updateCelebration/${celebration.id}"/>"><i class="fa fa-pencil"></i></a></td>
                <td><a href="<c:url value="/admin/celebrations/deleteCelebration/${celebration.id}"/>"><i class="fa fa-remove"></i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</div>


<c:url var="addAction" value="/admin/celebrations/addCelebration"/>


<c:choose>
    <c:when test="${celebration.id == 0}">
        <h5>Добавить Торждество</h5>
    </c:when>
<c:otherwise>
    <h5>Редактировать Торждество</h5>
</c:otherwise>
</c:choose>


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
                <spring:message text="Название торжества"/>
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
                    <input type="submit" class="btn btn-primary" value="<spring:message text="Добавить Торждество"/> "/>
                </c:when>
                <c:otherwise>
                    <input type="submit" class="btn btn-primary" value="<spring:message text="Редактировать Торждество"/> "/>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
</table>
</form:form>

<jsp:include page="../templates/footer.jsp"/>

