function showForm() {
  const btn_add = document.querySelector('.attend');
  if(!btn_add){
    return
  }
  btn_add.addEventListener('click', () => {
    document.getElementById('new-booking').style.display = "block";
  })
}

function closeForm() {
  const btn_cancel = document.querySelector('.cancel');
  if(!btn_cancel){
    return
  }
  btn_cancel.addEventListener('click', () => {
    document.getElementById('new-booking').style.display = "none";
  })
}

// function closeForm() {
//   document.getElementById('new-bookmark').style.display = "none";
// }

export { showForm, closeForm };
