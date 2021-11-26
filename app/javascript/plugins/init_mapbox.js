import mapboxgl from 'mapbox-gl';
import { listHighlight } from './list_highlight';

const buildMap = (mapElement, center) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/gmrcp/ckwevtlgv0lci14phqvv7l2q2',
    center: center,
    zoom: 12
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const element = document.createElement('a');

    element.dataset.id = marker.id;
    element.href = `/jams/${marker.id}`;
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.filter = 'invert(49%) sepia(95%) saturate(1276%) hue-rotate(173deg) brightness(98%) contrast(91%)';
    element.style.width = '40px';
    element.style.height = '40px';

    new mapboxgl.Marker({
      element: element
    }).setLngLat([marker.lng, marker.lat])
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.querySelector('#map');
  if (mapElement) {
    const center = JSON.parse(mapElement.dataset.center);
    const map = buildMap(mapElement, center);
    const markers = JSON.parse(mapElement.dataset.markers);
    if (markers.length > 0) {
      addMarkersToMap(map, markers);
      fitMapToMarkers(map, markers);
      listHighlight();
    }
  }
};

export { initMapbox };
