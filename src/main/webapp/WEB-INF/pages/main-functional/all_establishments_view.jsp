<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<jsp:include page="../templates/header.jsp"/>

<!-- Wrapper -->
<div class="wrapper style1">

    <jsp:include page="../templates/menu.jsp"/>

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

