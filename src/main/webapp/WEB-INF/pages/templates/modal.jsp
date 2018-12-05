<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--Modal--%>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" id="modalContent">
            <div class="modal-header">
                <h5 class="modal-title" id="name"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p><img id="image" src="" height="250px" width="100%"/></p>
                <p><u class="">Адрес: </u><span id="address"></span></p>
                <p><u>Контактная информация: </u><span id="contactInformation"></span></p>
                <p><u>Описание:</u> <span id="description"></span></p>
                <p><u>Количество мест: </u><span id="numberOfSeats"></span></p>
                <p><u>Ценовая категория: </u><span id="priceCategory"></span></p>
                <p><u>Тип заведения:</u> <span id="type"></span></p>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>