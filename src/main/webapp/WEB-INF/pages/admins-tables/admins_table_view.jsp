<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Валик
  Date: 20.10.2018
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="../templates/header.jsp"/>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<jsp:include page="../templates/menu.jsp"/>
<br/>
<br/>

<div class="card">
<c:if test="${!empty listOfAdmins}">
    <h1>Список админов</h1>
    <table border="2" id="table_id" class="table table-striped table-bordered">
        <thead>
            <td>ID</td>
            <td>Полное имя</td>
            <td>Email</td>
            <td>Логин</td>
            <td>Пароль</td>
            <td>Редактировать</td>
            <td>Удалить</td>
        </thead>
        <tbody>
        <c:forEach items="${listOfAdmins}" var="admin">
            <tr>
                <td>${admin.id}</td>
                <td>${admin.name}</td>
                <td>${admin.email}</td>
                <td>${admin.login}</td>
                <td>${admin.password}</td>
                <td><a href="<c:url value="/admin/admins/updateAdmin/${admin.id}"/>"><i class="fa fa-pencil"></i></a></td>
                <td><a href="<c:url value="/admin/admins/deleteAdmin/${admin.id}"/>"><i class="fa fa-remove"></i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</div>

<c:choose>
    <c:when test="${admin.id == 0}">
        <h5>Добавить админа</h5>
    </c:when>
    <c:otherwise>
        <h5>Редактировать админа</h5>
    </c:otherwise>
</c:choose>

<c:url var="addAction" value="/admin/admins/addAdmin"/>

<form:form action="${addAction}" modelAttribute="admin">
    <table>
    <c:if test="${!empty admin.name}">
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
                    <spring:message text="Полное имя"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>

        <tr>
            <td>
                <form:label path="email">
                    <spring:message text="Email"/>
                </form:label>
            </td>
            <td>
                <form:input path="email"/>
            </td>
        </tr>

        <tr>
            <td>
                <form:label path="login">
                    <spring:message text="Логин"/>
                </form:label>
            </td>
            <td>
                <form:input path="login"/>
            </td>
        </tr>

        <tr>
            <td>
                <form:label path="password">
                    <spring:message text="Пароль"/>
                </form:label>
            </td>
            <td>
                <form:input type="password" path="password"/>
            </td>
        </tr>

        <tr>
            <td>
                <c:choose>
                    <c:when test="${admin.id == 0}">
                        <input type="submit" value="<spring:message text="Добавить админа"/> "/>
                    </c:when>
                    <c:otherwise>
                        <input type="submit" value="<spring:message text="Редактировать админа"/> "/>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>

    </table>
</form:form>

<jsp:include page="../templates/footer.jsp"/>

