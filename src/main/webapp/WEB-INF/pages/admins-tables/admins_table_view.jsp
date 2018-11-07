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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admins</title>
</head>
<body>

<a href="<c:url value="/"/> ">Back to main menu</a>
<br/>
<br/>

<h1>Admin list</h1>
<c:if test="${!empty listOfAdmins}">
    <table border="2">
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Email</td>
            <td>Login</td>
            <td>Password</td>
            <td>Update</td>
            <td>Delete</td>
        </tr>
        <c:forEach items="${listOfAdmins}" var="admin">
            <tr>
                <td>${admin.id}</td>
                <td>${admin.name}</td>
                <td>${admin.email}</td>
                <td>${admin.login}</td>
                <td>${admin.password}</td>
                <td><a href="<c:url value="/updateAdmin/${admin.id}"/>">Update</a></td>
                <td><a href="<c:url value="/deleteAdmin/${admin.id}"/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<h1>Add Admin</h1>
<c:url var="addAction" value="/admins/addAdmin"/>

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
                    <spring:message text="Name"/>
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
                    <spring:message text="Login"/>
                </form:label>
            </td>
            <td>
                <form:input path="login"/>
            </td>
        </tr>

        <tr>
            <td>
                <form:label path="password">
                    <spring:message text="Password"/>
                </form:label>
            </td>
            <td>
                <form:input path="password"/>
            </td>
        </tr>

        <tr>
            <td>
                <c:choose>
                    <c:when test="${admin.id == 0}">
                        <input type="submit" value="<spring:message text="Add admin"/> "/>
                    </c:when>
                    <c:otherwise>
                        <input type="submit" value="<spring:message text="Update admin"/> "/>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>

    </table>
</form:form>

</body>
</html>
