var map;
var storeLatLng;

function initMap() {
    document.getElementById("store_location_google_maps").style.display = "block";
    document.getElementById("static_map").style.display = "none";

    storeLatLng = { lat: 53.272792, lng: -2.812533 };

    map = new google.maps.Map(document.getElementById('store_location_google_maps'), {
        center: storeLatLng,
        zoom: 15
    });

    var marker = new google.maps.Marker({
        position: storeLatLng,
        map: map,
        title: 'eTVs'
    });
}