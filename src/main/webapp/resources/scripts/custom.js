function showEstablishmentModal(id) {
    var baseUrl = window.location.origin;
    $.ajax({
        url: baseUrl+"/establishment/"+id,
        type: 'GET',
    }).done(function(result){
        document.getElementById("name").innerText = result.name;
        document.getElementById("address").innerText = result.address;
        document.getElementById("contactInformation").innerText = result.contactInformation;
        document.getElementById("description").innerText = result.description;
        document.getElementById("numberOfSeats").innerText = result.numberOfSeats;
        document.getElementById("priceCategory").innerText = result.priceCategory;
        document.getElementById("type").innerText = result.type;
        $("#image").attr("src",baseUrl+"/imageController/"+result.id);
        // var image = baseUrl+"/imageController/"+result.id;
        // $('#modalContent').css('background-image', 'url('+image+')');
        $('#exampleModalCenter').modal('toggle');
    });
}

$(document).ready(function() {

    $(".taxonomy-wall-item").mouseover(function () {
        $(this).fadeTo("fast",1,function(){});
    });

    $(".taxonomy-wall-item").mouseleave(function () {
        $(this).fadeTo("fast",0.6,function(){});
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#profile-img-tag').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#profile-img").change(function(){
    readURL(this);
});