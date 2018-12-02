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
<jsp:include page="../templates/header.jsp"/>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<jsp:include page="../templates/menu.jsp"/>
<br/>
<br/>


<div class="card">
<c:if test="${!empty listOfEstablishments}">
    <h1>Список заведений</h1>
    <table border="2" id="table_id" class="table table-striped table-bordered" >
        <thead>
            <td>ID</td>
            <td>Название заведения</td>
            <td>Количетво мест</td>
            <td>Тип</td>
            <td>Ценовая категория</td>
            <td>Описание</td>
            <td>Адрес</td>
            <td>Контактная информация</td>
            <td>Торждества</td>
            <td>Редактировать</td>
            <td>Удалить</td>
        </thead>
        <tbody>
        <c:forEach items="${listOfEstablishments}" var="establishment">
            <tr>
                <td>${establishment.id}</td>
                <td>${establishment.name}</td>
                <td>${establishment.numberOfSeats}</td>
                <td>${establishment.type.name}</td>
                <td>${establishment.priceCategory.name}</td>
                <td>${establishment.description}</td>
                <td>${establishment.address}</td>
                <td>${establishment.contactInformation}</td>
                <td>
                    <ul>
                        <c:forEach items="${establishment.celebrations}" var="celebration">
                        <li>${celebration.name}</li>
                        </c:forEach>
                    </ul>
                </td>
                <td><a href="<c:url value="/admin/establishments/updateEstablishment/${establishment.id}"/>"><i class="fa fa-pencil"></i></a></td>
                <td><a href="<c:url value="/admin/establishments/deleteEstablishment/${establishment.id}"/>"><i class="fa fa-remove"></i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</div>


<c:choose>
    <c:when test="${establishment.id == 0}">
        <h5>Добавить заведение</h5>
    </c:when>
    <c:otherwise>
        <h5>Редактировать заведение</h5>
    </c:otherwise>
</c:choose>

<c:url var="addAction" value="/admin/establishments/addEstablishment"/>

<form:form action="${addAction}" modelAttribute="establishment"  enctype="multipart/form-data">
<table>
    <tr>

        <td>
            <form:label path="id">
                <spring:message text="Выберите изображение"/>
            </form:label>
        </td>
        <td>
            <img src="" id="profile-img-tag" width="300px" />
            <form:input type="file" name="image" id="profile-img"  path="image"/>
        </td>

    </tr>

    <c:if test="${!empty establishment.name}">
        <tr>
            <td>
                <form:label path="id">
                    <spring:message text="ID"/>
                </form:label>
            </td>
            <td>
                <form:input name="id" path="id" readonly="true" disabled="true"/>
                <form:hidden name="id" path="id"/>
            </td>
        </tr>
    </c:if>

    <tr>
        <td>
            <form:label path="name">
                <spring:message text="Название заведения"/>
            </form:label>
        </td>
        <td>
            <form:input name="name" path="name"/>
        </td>
    </tr>

    <tr>
        <td>
            <form:label path="numberOfSeats">
                <spring:message text="Количетво мест"/>
            </form:label>
        </td>
        <td>
            <form:input name="numberOfSeats" path="numberOfSeats"/>
        </td>
    </tr>

    <tr>
        <td>
            <form:label path="type">
                <spring:message text="Тип"/>
            </form:label>
        </td>
        <td>
            <form:select path="type" name="type">
                <form:options items="${type}" itemLabel="name"/>
            </form:select>
        </td>
    </tr>

    <tr>
        <td>
            <form:label path="priceCategory">
                <spring:message text="Ценовая категория"/>
            </form:label>
        </td>
        <td>
            <form:select path="priceCategory" name="priceCategory">
                <form:options items="${priceCategory}" itemLabel="name"/>
            </form:select>
        </td>
    </tr>

    <tr>
        <td>
            <form:label path="description">
                <spring:message text="Описание"/>
            </form:label>
        </td>
        <td>
            <form:textarea name="description" path="description"/>
        </td>
    </tr>

    <tr>
        <td>
            <form:label path="address">
                <spring:message text="Адрес"/>
            </form:label>
        </td>
        <td>
            <form:input name="address" path="address"/>
        </td>
    </tr>

    <tr>
        <td>
            <form:label path="contactInformation">
                <spring:message text="Контактная информация"/>
            </form:label>
        </td>
        <td>
            <form:input name="contactInformation" path="contactInformation"/>
        </td>
    </tr>

    <tr>
        <td>
            <form:label path="celebrationsId">
                <spring:message text="Торждество"/>
            </form:label>
        </td>
        <td>
            <form:select name="celebrationsId" path="celebrationsId" cssClass="js-example-basic-multiple" id="selectCelebrations" multiple="true">
                <form:options items="${listOfCelebrations}" itemValue="id" itemLabel="name"/>
            </form:select>
        </td>
    </tr>
    <tr>
        <td>
            <c:choose>
                <c:when test="${establishment.id == 0}">
                    <input type="submit" value="<spring:message text="Добавить заведение"/> "/>
                </c:when>
                <c:otherwise>
                    <input type="submit" value="<spring:message text="Редактировать заведение"/> "/>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>

</table>
</form:form>

<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#profile-img-tag').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#profile-img").change(function(){
        readURL(this);
    });
</script>
<jsp:include page="../templates/footer.jsp"/>

