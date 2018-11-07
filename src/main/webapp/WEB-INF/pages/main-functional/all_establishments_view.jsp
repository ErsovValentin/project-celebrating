<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"/>

<div class="table-center">
    <table id="table_id" class="table table-striped table-bordered">
        <thead>
            <td>Name</td>
            <td>Number of seats</td>
            <td>Type</td>
            <td>Price category</td>
            <td>Description</td>
            <td>Address</td>
            <td>Contact information</td>
        </thead>
        <tbody>
            <c:forEach items="${listOfEstablishments}" var="establishment">
                <tr>
                    <td>${establishment.name}</td>
                    <td>${establishment.numberOfSeats}</td>
                    <td>${establishment.type}</td>
                    <td>${establishment.priceCategory}</td>
                    <td>${establishment.description}</td>
                    <td>${establishment.address}</td>
                    <td>${establishment.contactInformation}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
