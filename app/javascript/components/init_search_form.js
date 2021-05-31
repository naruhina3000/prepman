const initSearchForm = () => {
  const modal = document.querySelector("#searchModal")
  const stars = document.querySelectorAll("#searchModal .starRating")
  const cleanStars = () => stars.forEach((s)=> s.classList.remove('active'))
  if (searchModal){
    const labels = document.querySelectorAll("#searchModal label:not(.starRating)")
    labels.forEach((label)=>{
      label.addEventListener('click', () => {
        label.classList.toggle('active')
      })
    })
    stars.forEach((star, index)=>{
      star.addEventListener('click', () => {
        cleanStars()
        Array.from(stars).slice(0, index + 1).forEach((s)=> s.classList.add('active'))
      })
    })
  }
}


export { initSearchForm }
