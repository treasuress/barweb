<!-- Inicialização do Maps -->
var map;
var geocoder;

function initialize() {
    var latlng = new google.maps.LatLng(-18.9113046, -48.26219249999997);

    var options = {
        zoom: 13,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById("map_canvas"), options);
}

<!-- mostra ponto no mapa -->
function MostraPonto(lat, long)
{
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(lat, long),
        map: map
    });
}

<!-- Transforma endereço em latitude e latitude -->
function carregarNoMapa(endereco) {
    geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'address': endereco + ', Brasil', 'region': 'BR' }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if (results[0]) {
                var latitude = results[0].geometry.location.lat();
                var longitude = results[0].geometry.location.lng();

                MostraPonto(latitude, longitude);
            }
        }
    });
}