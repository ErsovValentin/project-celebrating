<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>То Место</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />

    <link rel="stylesheet" href="<c:url value="/resources/styles/skel.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/styles/style.css" />"/>
    <link rel="stylesheet" href="<c:url value="/resources/styles/style-wide.css" />"/>

    <%--Bootstrap 4--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

    <%--JQuery--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <%--Bootstrap 4--%>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
            integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

    <%--Fonts Awesome--%>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" type="text/css" rel="stylesheet">

    <%--Select2--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

    <%--Scripts for DataTables--%>
    <script src="<c:url value="/resources/scripts/datatables.js"/>" type="application/javascript"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

    <%--Popper--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
            integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script

    <script src="<c:url value="/resources/scripts/select2.js"/>"></script>


</head>
<body>

<!-- Wrapper -->
<div class="wrapper style1">

    <jsp:include page="templates/menu.jsp"/>

    <!-- Banner -->
    <div id="banner" class="container">
        <section>
            <h1>Выберите заведение :</h1>
            <c:url var="addAction" value="/find-establishments/founded"/>
            <form action="${addAction}"method="GET">
                <div class="row half">
                    <div class="12u">
                        <select style="width: 100%;height: 55px;border-radius: 6px;" class="js-example-basic-multiple" name="celebrationId">
                            <c:forEach var="celebration" items="${celebrations}">
                                <option value="${celebration.id}">${celebration.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="row half">
                    <div class="12u">
                        <input class="text" type="text" name="numberOfSeats" placeholder="Количество мест" />
                    </div>
                </div>
                <div class="row half">
                    <div class="12u">
                        <ul class="actions">
                            <li>
                                <input type="submit" class="button alt" value="<spring:message text="Найти заведение"/> "/>

                            </li>
                        </ul>
                    </div>
                </div>
                </table>
            </form>
        </section>
    </div>

    <!-- Extra -->
    <div id="extra">
        <div class="container">
            <div class="row no-collapse-1">
                <c:forEach items="${listOfEstablishments}" var="establishment">
                <section class="4u" style="margin-top: 2rem !important;"> <a href="#" class="image featured"><img height="250px" src="data:image/png;base64,${establishment.base64}"/></a>
                    <div class="box">
                        <p>Ценовая категория: ${establishment.priceCategory}<br/>
                        ${establishment.type}<br/>
                        ${establishment.contactInformation}</p>
                        <a href="#" class="button">${establishment.name}</a>
                    </div>
                </section>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- Copyright -->
<div id="copyright" class="bg-dark">
    <div class="container">
        <div class="copyright">
            <p>Design: <a href="http://templated.co">Jeleapova</a>
            <ul class="icons">
                <li><a href="#" class="fa fa-facebook"><span>Facebook</span></a></li>
                <li><a href="#" class="fa fa-twitter"><span>Twitter</span></a></li>
                <li><a href="#" class="fa fa-google-plus"><span>Google+</span></a></li>
            </ul>
        </div>
    </div>
</div>

</body>
</html>

