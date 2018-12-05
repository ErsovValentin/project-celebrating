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
                            <c:when test="${celebration.id == 0}">
                                <h2>Добавить Торждество</h2>
                            </c:when>
                            <c:otherwise>
                                <h2>Редактировать Торждество</h2>
                            </c:otherwise>
                        </c:choose>
                    </header>

                    <c:url var="addAction" value="/admin/celebrations/addCelebration"/>
                    <form:form action="${addAction}" modelAttribute="celebration">
                        <c:if test="${!empty celebration.name}">
                            <div class="row half">
                                <div class="12u">
                                    <form:input class="text"  path="id" readonly="true" disabled="true" placeholder="ID"/>
                                    <form:hidden path="id"/>
                                </div>
                            </div>
                        </c:if>

                        <div class="row half">
                            <div class="12u">
                                <form:input path="name" class="text" required="required" placeholder="Название торжества"/>
                            </div>
                        </div>

                        <div class="row half">
                            <div class="12u">
                                <ul class="actions">
                                    <li>
                                        <c:choose>
                                            <c:when test="${celebration.id == 0}">
                                                <input type="submit"  class="button alt" value="<spring:message text="Добавить Торждество"/> "/>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="submit"  class="button alt" value="<spring:message text="Редактировать Торждество"/> "/>
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
                <h2>Список торжеств</h2>
            </header>
            <div class="tbl-header">
                <table cellpadding="0" cellspacing="0" border="0">
                    <thead>
                        <td>ID</td>
                        <td>Название торжества</td>
                        <td>Редактировать</td>
                        <td>Удалить</td>
                    </thead>
                </table>
            </div>
            <div class="tbl-content"  style="background-color: rgba(0, 0, 0, 0.3);">
                <table cellpadding="0" cellspacing="0" border="0" class="table table-hover">
                    <tbody>
                    <c:forEach items="${listOfCelebrations}" var="celebration">
                        <tr>
                            <td>${celebration.id}</td>
                            <td>${celebration.name}</td>
                            <td><a class="btn btn-success" href="<c:url value="/admin/celebrations/updateCelebration/${celebration.id}"/>"><i class="fa fa-pencil"></i></a></td>
                            <td><a class="btn btn-danger" href="<c:url value="/admin/celebrations/deleteCelebration/${celebration.id}"/>"><i class="fa fa-remove"></i></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>


<%--<div class="card">--%>
<%--<c:if test="${!empty listOfCelebrations}">--%>
    <%--<h1>Список торжеств</h1>--%>
    <%--<table border="2" id="table_id" class="table table-striped table-bordered">--%>
        <%--<thead>--%>
            <%--<td>ID</td>--%>
            <%--<td>Название торжества</td>--%>
            <%--<td>Редактировать</td>--%>
            <%--<td>Удалить</td>--%>
        <%--</thead>--%>
        <%--<tbody>--%>
        <%--<c:forEach items="${listOfCelebrations}" var="celebration">--%>
            <%--<tr>--%>
                <%--<td>${celebration.id}</td>--%>
                <%--<td>${celebration.name}</td>--%>
                <%--<td><a href="<c:url value="/admin/celebrations/updateCelebration/${celebration.id}"/>"><i class="fa fa-pencil"></i></a></td>--%>
                <%--<td><a href="<c:url value="/admin/celebrations/deleteCelebration/${celebration.id}"/>"><i class="fa fa-remove"></i></a></td>--%>
            <%--</tr>--%>
        <%--</c:forEach>--%>
        <%--</tbody>--%>
    <%--</table>--%>
<%--</c:if>--%>
<%--</div>--%>




</div>
<jsp:include page="../templates/footer.jsp"/>


