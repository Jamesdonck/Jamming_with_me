import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkerToMap = (map, marker) => {
  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url('${marker.image_url}')`;
  element.style.backgroundSize = 'contain';
  element.style.width = '25px';
  element.style.height = '25px';

  new mapboxgl.Marker(element)
    .setLngLat([marker.lng, marker.lat])
    .addTo(map);
};

const fitMapToMarker = (map, marker) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([marker.lng, marker.lat]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapboxShow = () => {
  const mapElement = document.querySelector('.jam--container>div#map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const marker = JSON.parse(mapElement.dataset.marker);
    addMarkerToMap(map, marker);
    fitMapToMarker(map, marker);
  }
};

export { initMapboxShow };
