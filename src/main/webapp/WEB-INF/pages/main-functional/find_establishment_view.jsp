<%--
  Created by IntelliJ IDEA.
  User: Валик
  Date: 10.11.2018
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<jsp:include page="../templates/header.jsp"/>

<jsp:include page="../templates/menu.jsp"/>
<br/>
<br/>

<h1>Выберите заведение :</h1>
<c:url var="addAction" value="/find-establishments/founded"/>

<form action="${addAction}"method="GET">
    <table>
        <tr>
            <td>
                <label>
                    <spring:message text="Выберите торжество"/>
                </label>
            </td>
            <td>
                <select name="celebrationId">
                    <c:forEach var="celebration" items="${celebrations}">
                        <option value="${celebration.id}">${celebration.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>

        <tr>
            <td>
                <label>
                    <spring:message text="Количество мест"/>
                </label>
            </td>
            <td>
                <input name="numberOfSeats"/>
            </td>
        </tr>

        <tr>
            <td>
                <input type="submit" value="<spring:message text="Найти заведение"/> "/>
            </td>
        </tr>
    </table>
</form>


<button><a href="<c:url value="/find-establishments/getRandomEstablishments"/>">Куда пойти ?</a></button>
<button><a href="<c:url value="/find-establishments/celebrateNewYear"/>">Где отпраздновать Новый Год ?</a></button>
<button><a href="<c:url value="/find-establishments/celebrateParty"/>">Потусить</a></button>
<button><a href="<c:url value="/find-establishments/celebrateRomantic"/>">Романтика</a></button>

    <h1>Список заведений</h1>
    <table id="table_id" class="table table-striped table-bordered" >
        <thead>
        <td>ID</td>
        <td>Название заведения</td>
        <td>Количетво мест</td>
        <td>Тип</td>
        <td>Ценовая категория</td>
        <td>Описание</td>
        <td>Адрес</td>
        <td>Контактная информация</td>
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
            </tr>
        </c:forEach>
        </tbody>
    </table>



<jsp:include page="../templates/footer.jsp"/>


