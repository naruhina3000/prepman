
import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  let swalButton;
  if (typeof selector == 'string'){
    swalButton = document.querySelector(selector);
  } else {
    swalButton = selector
  }
  console.log(123, swalButton)
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback); // <-- add the `.then(callback)`
    });
  }
};

export { initSweetalert };
