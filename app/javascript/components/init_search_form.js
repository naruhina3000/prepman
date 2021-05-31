const initSearchForm = () => {
  const modal = document.querySelector("#searchModal")
  if (searchModal){
    const labels = document.querySelectorAll("#searchModal label")
    labels.forEach((label)=>{
      label.addEventListener('click', () => {
        label.classList.toggle('active')
      })
    })
  }
}


export { initSearchForm }
