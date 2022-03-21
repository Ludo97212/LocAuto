function autocomplete() {
  document.addEventListener("DOMContentLoaded", function () {
    var carAddress = document.getElementById('car_address');

    if (carAddress) {
      var autocomplete = new google.maps.places.Autocomplete(carAddress, { types: ['geocode'] });
      google.maps.event.addDomListener(carAddress, 'keydown', function (e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
