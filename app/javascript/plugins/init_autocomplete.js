import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('jam_location');
  const cityInput = document.getElementById('search_city')

  if (addressInput) {
    places({ container: addressInput })
  };
  if (cityInput) {
    places({
      container: cityInput,
      templates: { value: suggestion => suggestion.name }
    }).configure({
        type: 'city',
        aroundLatLngViaIP: false,
      });
  };
};

export { initAutocomplete };
