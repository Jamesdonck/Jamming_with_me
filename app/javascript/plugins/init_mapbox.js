import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const city = document.getElementById('city-name').dataset

  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/gmrcp/ckwevtlgv0lci14phqvv7l2q2',
    //style: 'mapbox://styles/mapbox/streets-v10',
    center: [parseFloat(city.lng), parseFloat(city.lat)],
    zoom: 12
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window);

    // const element = document.createElement('div');
    // element.className = 'marker';
    // element.style.backgroundImage = `url('${marker.image_url}')`;
    // element.style.backgroundSize = 'contain';
    // element.style.width = '35px';
    // element.style.height = '35px';

    new mapboxgl.Marker({
      color: '#23a6f0'
    }).setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const listHighlight = () => {
  const map_markers = document.querySelectorAll('.mapboxgl-marker')
  map_markers.forEach(marker => {
    marker.addEventListener('mouseover', (event) => {
      console.log(event);
    });
  });
};

const initMapbox = () => {
  const mapElement = document.querySelector('#map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    listHighlight();
  }
};

export { initMapbox };
