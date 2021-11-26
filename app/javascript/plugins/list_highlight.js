const listHighlight = () => {
  const map_markers = document.querySelectorAll('.mapboxgl-marker')

  map_markers.forEach(marker => {
    let jam = document.querySelector(`[data-id='${marker.dataset.id}']`)

    jam.addEventListener('mouseover', (event) => {
      marker.classList.add('matched-marker')
    });
    jam.addEventListener('mouseout', (event) => {
      marker.classList.remove('matched-marker')
    });

    marker.addEventListener('mouseover', (event) => {
      jam.classList.add('matched-jam')
      jam.scrollIntoView({ behavior: 'smooth', block: 'center' });;
    });
    marker.addEventListener('mouseout', (event) => {
      jam.classList.remove('matched-jam');
    });
  });
};

export { listHighlight }
