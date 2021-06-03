import {initSweetalert} from '../components/init_sweetalert.js'



const attachAlert = (elements) => {
  elements.forEach((button)=>{
      initSweetalert(button, {
        title: "Are you sure?",
        text: button.dataset.label,
        icon: "warning"
        }, (value) => {
        if (value) {
          button.nextElementSibling.click();
        }
    });

  })
}


const initMultipleSweetAlert = () => {
  const buttonsArray = [
    document.querySelectorAll('.delete-planner'),
    document.querySelectorAll('.delete-shoppinglist'),
    document.querySelectorAll('.delete-cookbook'),
    document.querySelectorAll('.delete-cookbook-user-show'),
    document.querySelectorAll('.delete-recipe'),
  ]
  buttonsArray.forEach((array)=> {
    attachAlert(array)
  })
}


export {initMultipleSweetAlert}
