import $ from 'jquery'

const initErrorModal = () => {
  const errorModal = document.querySelector("#errorModal")
  if (errorModal){
    $('#stepModal').modal('show')
  }
}


export { initErrorModal }
