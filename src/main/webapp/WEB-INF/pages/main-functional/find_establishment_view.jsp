<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<jsp:include page="../templates/header.jsp"/>

<!-- Wrapper -->
<div class="wrapper style1">

    <jsp:include page="../templates/menu.jsp"/>

    <!-- Find -->
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
                        <input class="text" required type="text" name="numberOfSeats" placeholder="Количество мест" />
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

    <%--Filter--%>
    <div class="taxonomy-wall">
        <div class="taxonomy-wall-item" style="opacity: 0.6">
            <a class="show" data-remote="true" href="/find-establishments/getRandomEstablishments"><div class="bg" style="background-image: url('<c:url value="/resources/images/pic01.jpg"/>');"></div>
                <div class="title">
                    <span class="my-span">Куда пойти?</span>
                </div>
                <div class="dash"></div>
                <div class="subtitle"></div>
            </a></div>
        <div class="taxonomy-wall-item" style="opacity: 0.6">
            <a class="show" data-remote="true" href="/find-establishments/celebrateNewYear"><div class="bg" style="background-image: url('<c:url value="/resources/images/pic04.jpg"/>');"></div>
                <div class="title">
                    <span class="my-span">Где отметить Новый Год ?</span>
                </div>
                <div class="dash"></div>
                <div class="count">

                </div>
            </a></div>
        <div class="taxonomy-wall-item" style="opacity: 0.6">
            <a class="show" data-remote="true" href="<c:url value="/find-establishments/celebrateRomantic"/>"><div class="bg" style="background-image: url('<c:url value="/resources/images/pic03.jpg"/>');"></div>
                <div class="title">
                    <span class="my-span">Романтика</span>
                </div>
                <div class="dash"></div>
                <div class="count">

                </div>
            </a></div>
        <div class="taxonomy-wall-item" style="opacity: 0.6">
            <a class="show" data-remote="true" href="<c:url value="/find-establishments/celebrateParty"/> "><div class="bg" style="background-image: url('<c:url value="/resources/images/pic02.jpg"/>');"></div>
                <div class="title">
                    <span class="my-span">Потусить</span>
                </div>
                <div class="dash"></div>
                <div class="count">
                </div>
            </a></div>
    </div>

    <!-- Body -->
    <div id="extra">
        <div class="container">
            <div class="row no-collapse-1">
                <c:forEach items="${listOfEstablishments}" var="establishment">
                    <section class="4u" style="margin-top: 2rem !important;"> <a href="#" class="image featured"><img height="250px" src="data:image/png;base64,${establishment.base64}"/></a>
                        <div class="box">
                            <p>Ценовая категория: ${establishment.priceCategory.name}<br/>
                                    ${establishment.type.name}<br/>
                                    ${establishment.contactInformation}</p>
                            <a onclick="showEstablishmentModal(${establishment.id})" class="button">${establishment.name}</a>
                        </div>
                    </section>
                </c:forEach>
            </div>
        </div>
    </div>


</div>


<jsp:include page="../templates/modal.jsp"/>

<jsp:include page="../templates/footer.jsp"/>

