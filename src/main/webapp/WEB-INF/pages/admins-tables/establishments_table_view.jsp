<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<jsp:include page="../templates/header.jsp"/>
<!-- Wrapper -->
<div class="wrapper style1" height="100%">

    <jsp:include page="../templates/menu.jsp"/>

        <div id="footer" class="wrapper style2" >
            <div class="container">
                <section>
                    <header class="major">
                        <c:choose>
                            <c:when test="${establishment.id == 0}">
                                <h2>Добавить заведение</h2>
                            </c:when>
                            <c:otherwise>
                                <h2>Редактировать заведение</h2>
                            </c:otherwise>
                        </c:choose>
                    </header>

                    <c:url var="addAction" value="/admin/establishments/addEstablishment"/>
                    <form:form action="${addAction}" modelAttribute="establishment"  enctype="multipart/form-data">

                        <div class="row half">
                            <div class="12u">
                                <form:input type="file" name="image" id="profile-img"  path="image"/>
                            </div>
                        </div>

                        <c:if test="${!empty establishment.name}">
                            <div class="row half">
                                <div class="12u">
                                    <form:input class="text"  path="id" readonly="true" disabled="true" placeholder="ID"/>
                                    <form:hidden path="id"/>
                                </div>
                            </div>
                        </c:if>

                        <div class="row half">
                            <div class="12u">
                                <form:input path="name" class="text" required="required" placeholder="Название заведения"/>
                            </div>
                        </div>

                        <div class="row half">
                            <div class="12u">
                                <form:input path="numberOfSeats" class="text" required="required" placeholder="Количетво мест"/>
                            </div>
                        </div>

                        <div class="row half">
                            <div class="12u">
                                <form:select path="type" name="type" cssStyle="width: 100%;height: 55px;border-radius: 6px;" >
                                    <form:options items="${type}" itemLabel="name"/>
                                </form:select>
                            </div>
                        </div>

                        <div class="row half">
                            <div class="12u">
                                <form:select path="priceCategory" cssStyle="width: 100%;height: 55px;border-radius: 6px;" name="priceCategory" >
                                    <form:options items="${priceCategory}" itemLabel="name"/>
                                </form:select>
                            </div>
                        </div>

                        <div class="row half">
                            <div class="12u">
                                <form:textarea name="description" path="description" id="message" placeholder="Описание"></form:textarea>
                            </div>
                        </div>

                        <div class="row half">
                            <div class="12u">
                                <form:input path="address" class="text" required="required" placeholder="Адрес"/>
                            </div>
                        </div>

                        <div class="row half">
                            <div class="12u">
                                <form:input path="contactInformation" class="text" required="required" placeholder="Контактная информация"/>
                            </div>
                        </div>

                        <div class="row half">
                            <div class="12u">
                                <form:select name="celebrationsId" path="celebrationsId" cssStyle="width: 100%;height: 55px;border-radius: 6px;" cssClass="js-example-basic-multiple" id="selectCelebrations" multiple="true">
                                    <form:options items="${listOfCelebrations}" itemValue="id" itemLabel="name"/>
                                </form:select>
                            </div>
                        </div>

                        <div class="row half">
                            <div class="12u">
                                <ul class="actions">
                                    <li>
                                        <c:choose>
                                            <c:when test="${establishment.id == 0}">
                                                <input type="submit" class="button alt" value="<spring:message text="Добавить заведение"/> "/>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="submit" class="button alt" value="<spring:message text="Редактировать заведение"/> "/>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </form:form>
                </section>
            </div>
        </div>

    <section style="padding-top: 20px;">
        <!--for demo wrap-->
        <header class="major" style="text-align: center;color: #FFF;">
            <h2>Список заведений</h2>
        </header>
        <div class="tbl-header">
            <table cellpadding="0" cellspacing="0" border="0">
                <thead>
                <tr>
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
                </tr>
                </thead>
            </table>
        </div>
        <div class="tbl-content"  style="background-color: rgba(0, 0, 0, 0.3);">
            <table cellpadding="0" cellspacing="0" border="0" class="table table-hover">
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
                        <td><a class="btn btn-success" href="<c:url value="/admin/establishments/updateEstablishment/${establishment.id}"/>"><i class="fa fa-pencil"></i></a></td>
                        <td><a class="btn btn-danger" href="<c:url value="/admin/establishments/deleteEstablishment/${establishment.id}"/>"><i class="fa fa-remove"></i></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>

</div>
<script>
    $(document).ready(function() {
        $('.js-example-basic-multiple').select2();
    });
</script>
<jsp:include page="../templates/footer.jsp"/>




