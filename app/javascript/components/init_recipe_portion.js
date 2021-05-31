
const updateIngredientsAmount = (portion) => {
  const amounts = document.querySelectorAll('.ingredient-amount')
  amounts.forEach((amount) => {
    amount.innerText = parseInt(amount.dataset.unit) * portion
  })
}

const initRecipePortion = () => {
  const amount = document.querySelector('#portion-amount')
  const less =  amount.previousElementSibling
  const more =  amount.nextElementSibling
  if (amount){
    less.addEventListener('click', ()=>{
      if (amount.innerText === '1') return
      const portion = parseInt(amount.innerText) - 1
      amount.innerText = portion
      updateIngredientsAmount(portion)
    })
    more.addEventListener('click', ()=>{
      const portion = parseInt(amount.innerText) + 1
      amount.innerText = portion
      updateIngredientsAmount(portion)

    })
  }
}


export { initRecipePortion }
