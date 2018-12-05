<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<nav class="navbar navbar-expand-lg navbar-dark bg-dark">--%>
    <%--<a class="navbar-brand" href="<c:url value="/"/>">ToMecтo</a>--%>
    <%--<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">--%>
        <%--<span class="navbar-toggler-icon"></span>--%>
    <%--</button>--%>
    <%--<div class="collapse navbar-collapse" id="navbarNavDropdown">--%>
        <%--<ul class="navbar-nav">--%>
            <%--<li class="nav-item ">--%>
                <%--<a class="nav-link" href="<c:url value="/"/>">Главная<span class="sr-only"></span></a>--%>
            <%--</li>--%>
            <%--<li class="nav-item">--%>
                <%--<a class="nav-link" href="<c:url value="/all-establishmnets"/>">Все заведения</a>--%>
            <%--</li>--%>
            <%--<li class="nav-item">--%>
                <%--<a class="nav-link" href="<c:url value="/all-establishmnets"/>">О нас</a>--%>
            <%--</li>--%>
            <%--<sec:authorize url="/admin/">--%>
                <%--<li class="nav-item dropdown">--%>
                    <%--<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                        <%--Администраторские опции--%>
                    <%--</a>--%>
                    <%--<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">--%>
                        <%--<a class="dropdown-item" href="<c:url value="/admin/establishments"/>">Заведения</a>--%>
                        <%--<a class="dropdown-item" href="<c:url value="/admin/celebrations"/>">Торжества </a>--%>
                        <%--<a class="dropdown-item" href="<c:url value="/admin/admins"/>">Админы</a>--%>
                        <%--<a class="dropdown-item" href="<c:url value="/logout"/>">Выйти</a>--%>
                    <%--</div>--%>
                <%--</li>--%>
            <%--</sec:authorize>--%>
        <%--</ul>--%>
    <%--</div>--%>
<%--</nav>--%>

<div id="header" class="skel-panels-fixed">
    <div id="logo">
        <h1><a href="<c:url value="/"/>">То Место</a></h1>
    </div>
    <nav id="nav">
        <ul style="font-size: 1.4rem;">
            <li class="active"><a href="<c:url value="/"/>">Главная</a></li>
            <li> <a href="<c:url value="/all-establishmnets"/>">Все заведения</a></li>
            <sec:authorize url="/admin/">
                <li> <a href="<c:url value="/admin/establishments"/>">Заведения</a></li>
                <li> <a href="<c:url value="/admin/celebrations"/>">Торжества </a></li>
                <li> <a href="<c:url value="/admin/admins"/>">Админы</a></li>
                <li> <a href="<c:url value="/logout"/>">Выйти</a></li>
            </sec:authorize>
        </ul>
    </nav>
</div>