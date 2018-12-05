<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%--<jsp:include page="../templates/header.jsp"/>--%>
<%--<jsp:include page="../templates/menu.jsp"/>--%>
<%--<br/>--%>
<%--<br/>--%>

<%--<div class="row" style="padding-right: 1rem; padding-left: 1rem;">--%>
    <%--<c:forEach items="${listOfEstablishments}" var="establishment">--%>
        <%--<div class="col-sm-3" style="margin-top: 1em;">--%>
            <%--<div class="card">--%>
                <%--<img src="data:image/png;base64,${establishment.base64}" height="200px" />--%>
                <%--<div class="card-body">--%>
                    <%--<h5 class="card-title">--%>
                        <%--<a data-toggle="modal" onclick="showEstablishmentModal(${establishment.id})"class="btn btn-primary">${establishment.name}</a>--%>
                    <%--</h5>--%>
                    <%--<h8 class="card-subtitle mb-2 text-muted">Ценовая категория :${establishment.priceCategory.name}</h8>--%>
                    <%--<br>--%>
                    <%--<p class="card-text">${establishment.address}</p>--%>
                    <%--<p class="card-text">${establishment.contactInformation}</p>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</c:forEach>--%>
<%--</div>--%>


<%--<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">--%>
    <%--<div class="modal-dialog modal-dialog-centered" role="document">--%>
        <%--<div class="modal-content">--%>
            <%--<div class="modal-header">--%>
                <%--<h5 class="modal-title" id="name"></h5>--%>
                <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
                    <%--<span aria-hidden="true">&times;</span>--%>
                <%--</button>--%>
            <%--</div>--%>
            <%--<div class="modal-body">--%>
                <%--<p><img id="image" src="" height="200px" /></p>--%>
                <%--<p>Адрес: <span id="address"></span></p>--%>
                <%--<p>Контактная информация: <span id="contactInformation"></span></p>--%>
                <%--<p>Описание: <span id="description"></span></p>--%>
                <%--<p>Количество мест: <span id="numberOfSeats"></span></p>--%>
                <%--<p>Ценовая категория: <span id="priceCategory"></span></p>--%>
                <%--<p>Тип заведения: <span id="type"></span></p>--%>
            <%--</div>--%>
            <%--<div class="modal-footer">--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<%--<script>--%>
    <%--function showEstablishmentModal(id)--%>
    <%--{--%>
        <%--var baseUrl = window.location.origin;--%>
        <%--$.ajax({--%>
            <%--url: baseUrl+"/establishment/"+id,--%>
            <%--type: 'GET',--%>
        <%--}).done(function(result){--%>
            <%--document.getElementById("name").innerText = result.name;--%>
            <%--document.getElementById("address").innerText = result.address;--%>
            <%--document.getElementById("contactInformation").innerText = result.contactInformation;--%>
            <%--document.getElementById("description").innerText = result.description;--%>
            <%--document.getElementById("numberOfSeats").innerText = result.numberOfSeats;--%>
            <%--document.getElementById("priceCategory").innerText = result.priceCategory;--%>
            <%--document.getElementById("type").innerText = result.type;--%>
            <%--$("#image").attr("src",baseUrl+"/imageController/"+result.id);--%>
            <%--// $("#name").val(result.name);--%>
            <%--// $("#address").val(result.address);--%>
            <%--// $("#contactInformation").val(result.contactInformation);--%>
            <%--// $("#description").val(result.description);--%>
            <%--// $("#image").attr("src",baseUrl+"/imageController/"+result.id);--%>
            <%--// $("#numberOfSeats").val(result.numberOfSeats);--%>
            <%--// $("#priceCategory").val(result.priceCategory);--%>
            <%--// $("#type").val(result.type);--%>
            <%--$('#exampleModalCenter').modal('toggle');--%>
        <%--});--%>
    <%--}--%>
<%--</script>--%>
<%--<jsp:include page="../templates/footer.jsp"/>--%>


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

