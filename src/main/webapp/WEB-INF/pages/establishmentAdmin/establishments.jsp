<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Валик
  Date: 06.10.2018
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Establishments</title>
</head>
<body>
<a href="<c:url value="/"/> ">Back to main menu</a>
<br/>
<br/>

<h1>Establishment list</h1>

<c:if test="${!empty listOfEstablishments}">
    <table border="2">
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Number of seats</td>
            <td>Type</td>
            <td>Price category</td>
            <td>Description</td>
            <td>Address</td>
            <td>Contact information</td>
            <td>Update</td>
            <td>Delete</td>
        </tr>
        <c:forEach items="${listOfEstablishments}" var="establishment">
            <tr>
                <td>${establishment.id}</td>
                <td>${establishment.name}</td>
                <td>${establishment.numberOfSeats}</td>
                <td>${establishment.type}</td>
                <td>${establishment.priceCategory}</td>
                <td>${establishment.description}</td>
                <td>${establishment.address}</td>
                <td>${establishment.contactInformation}</td>
                <td><a href="<c:url value="/updateEstablishment/${establishment.id}"/>">Update</a></td>
                <td><a href="<c:url value="/deleteEstablishment/${establishment.id}"/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<h1>Add Establishment</h1>
<c:url var="addAction" value="/establishment/addEstablishment"/>

<form:form action="${addAction}" modelAttribute="establishment">
<table>
    <c:if test="${!empty establishment.name}">
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
            <form:label path="numberOfSeats">
                <spring:message text="Number of seats"/>
            </form:label>
        </td>
        <td>
            <form:input path="numberOfSeats"/>
        </td>
    </tr>

    <tr>
        <td>
            <form:label path="type">
                <spring:message text="Type"/>
            </form:label>
        </td>
        <td>
            <form:select path="type">
                <form:options items="${type}" itemLabel="name"/>
            </form:select>
        </td>
    </tr>

    <tr>
        <td>
            <form:label path="priceCategory">
                <spring:message text="Price Category"/>
            </form:label>
        </td>
        <td>
            <form:select path="priceCategory">
                <form:options items="${priceCategory}" itemLabel="name"/>
            </form:select>
        </td>
    </tr>

    <tr>
        <td>
            <form:label path="description">
                <spring:message text="Description"/>
            </form:label>
        </td>
        <td>
            <form:textarea path="description"/>
        </td>
    </tr>

    <tr>
        <td>
            <form:label path="address">
                <spring:message text="Address"/>
            </form:label>
        </td>
        <td>
            <form:input path="address"/>
        </td>
    </tr>

    <tr>
        <td>
            <form:label path="contactInformation">
                <spring:message text="Contact information"/>
            </form:label>
        </td>
        <td>
            <form:input path="contactInformation"/>
        </td>
    </tr>

    <tr>
        <td>
            <c:choose>
                <c:when test="${establishment.id == 0}">
                    <input type="submit" value="<spring:message text="Add establishment"/> "/>
                </c:when>
                <c:otherwise>
                    <input type="submit" value="<spring:message text="Update establishment"/> "/>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>

</table>
</form:form>

</body>
</html>
