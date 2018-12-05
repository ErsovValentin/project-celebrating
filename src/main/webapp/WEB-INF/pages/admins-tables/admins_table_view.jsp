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
                            <c:when test="${admin.id == 0}">
                                <h2>Добавить админа</h2>
                            </c:when>
                            <c:otherwise>
                                <h2>Редактировать админа</h2>
                            </c:otherwise>
                        </c:choose>
                    </header>

                    <c:url var="addAction" value="/admin/admins/addAdmin"/>
                    <form:form action="${addAction}" modelAttribute="admin">
                        <c:if test="${!empty admin.name}">
                            <div class="row half">
                                <div class="12u">
                                    <form:input class="text"  path="id" readonly="true" disabled="true" placeholder="ID"/>
                                    <form:hidden path="id"/>
                                </div>
                            </div>
                        </c:if>

                        <div class="row half">
                            <div class="12u">
                                <form:input path="name" class="text" required="required" placeholder="Полное имя"/>
                            </div>
                        </div>

                        <div class="row half">
                            <div class="12u">
                                <form:input path="email" type="email" class="text" required="required" placeholder="Email"/>
                            </div>
                        </div>

                        <div class="row half">
                            <div class="12u">
                                <form:input path="login" class="text" required="required" placeholder="Логин"/>
                            </div>
                        </div>

                        <div class="row half">
                            <div class="12u">
                                <form:password path="password" class="text" required="required" placeholder="Пароль"/>
                            </div>
                        </div>

                        <div class="row half">
                            <div class="12u">
                                <ul class="actions">
                                    <li>
                                        <c:choose>
                                            <c:when test="${admin.id == 0}">
                                                <input type="submit" class="button alt" value="<spring:message text="Добавить админа"/> "/>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="submit" class="button alt" value="<spring:message text="Редактировать админа"/> "/>
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
            <h2>Список администраторов</h2>
        </header>
        <div class="tbl-header">
            <table cellpadding="0" cellspacing="0" border="0">
                <thead>
                <tr>
                    <td>ID</td>
                    <td>Полное имя</td>
                    <td>Email</td>
                    <td>Логин</td>
                    <td>Пароль</td>
                    <td>Редактировать</td>
                    <td>Удалить</td>
                </tr>
                </thead>
            </table>
        </div>
        <div class="tbl-content"  style="background-color: rgba(0, 0, 0, 0.3);">
            <table cellpadding="0" cellspacing="0" border="0" class="table table-hover">
                <tbody>
                <c:forEach items="${listOfAdmins}" var="admin">
                    <tr>
                        <td align="center">${admin.id}</td>
                        <td align="center">${admin.name}</td>
                        <td align="center">${admin.email}</td>
                        <td align="center">${admin.login}</td>
                        <td align="center">${admin.password}</td>
                        <td align="center"><a class="btn btn-success" href="<c:url value="/admin/admins/updateAdmin/${admin.id}"/>"><i class="fa fa-pencil"></i></a></td>
                        <td align="center"><a  class="btn btn-danger" href="<c:url value="/admin/admins/deleteAdmin/${admin.id}"/>"><i class="fa fa-remove"></i></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>

</div>

<jsp:include page="../templates/footer.jsp"/>

