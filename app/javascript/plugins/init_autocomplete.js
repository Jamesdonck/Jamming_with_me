import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('jam_location');
  const cityInput = document.getElementById('search_city');

  if (addressInput) {
    const jamLat = document.getElementById('jam_latitude');
    const jamLng = document.getElementById('jam_longitude');

    places({ container: addressInput })
      .on('change', (event) => {
        addressInput.textContent = event.suggestion.value;
        jamLat.value = event.suggestion.latlng.lat || '';
        jamLng.value = event.suggestion.latlng.lng || '';
      });
  };

  if (cityInput) {
    const cityLat = document.getElementById('search_lat');
    const cityLng = document.getElementById('search_lng');

    const form = document.querySelector('.simple_form, .search')
    places({
      container: cityInput,
      templates: { value: suggestion => suggestion.city }
    }).configure({
      type: 'city',
      aroundLatLngViaIP: false,
    })
    .on('change', (event) => {
        cityInput.textContent = event.suggestion.value;
        cityLat.value = event.suggestion.latlng.lat || '';
        cityLng.value = event.suggestion.latlng.lng || '';
        form.submit();
      });
  };
};

export { initAutocomplete };
