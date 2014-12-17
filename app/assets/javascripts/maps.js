<!-- Inicialização do Maps -->
var map;
var geocoder;

function initialize() {
    //todo seb now - mostrar todos os pontos do mapa
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
        map: map,

//      todo fim - criar icone para mapa
        icon: '/assets/icone4.png'
    });


    //mostra informações do estabelecimento
    var infowindow = new google.maps.InfoWindow(), marker;

    google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
//            todo now - colokr nome do bar, tel, endereço - ver nos fav (mapa)
            infowindow.setContent("Conteúdo do marcador.");
            infowindow.open(map, marker);
        }
    })(marker))
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