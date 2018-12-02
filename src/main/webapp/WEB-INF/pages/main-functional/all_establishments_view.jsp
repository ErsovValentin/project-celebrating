<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<jsp:include page="../templates/header.jsp"/>
<jsp:include page="../templates/menu.jsp"/>
<br/>
<br/>

<div class="row" style="padding-right: 1rem; padding-left: 1rem;">
    <c:forEach items="${listOfEstablishments}" var="establishment">
        <div class="col-sm-3" style="margin-top: 1em;">
            <div class="card">
                <img src="data:image/png;base64,${establishment.base64}" height="200px" />
                <img src="<c:url value="/imageController/${establishment.id}"/>" height="200px" />
                <div class="card-body">
                    <h5 class="card-title">
                        <a href="#" class="btn btn-primary">${establishment.name}</a>
                    </h5>
                    <h8 class="card-subtitle mb-2 text-muted">Ценовая категория :${establishment.priceCategory.name}</h8>
                    <br>
                    <p class="card-text">${establishment.address}</p>
                    <p class="card-text">${establishment.contactInformation}</p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<jsp:include page="../templates/footer.jsp"/>

