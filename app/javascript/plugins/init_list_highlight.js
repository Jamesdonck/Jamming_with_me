const initListHighlight = () => {
  const markers = document.querySelectorAll('mapboxgl-marker')

  markers.array.forEach(marker => {
    marker.addEventListener('hover', (event) => {
      console.log(event)
    })
  });
}

export { initListHighlight }
