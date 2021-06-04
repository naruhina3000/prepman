import swal from "sweetalert";

const initShareSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) {
    // protect other pages
    swalButton.addEventListener("click", () => {
      swal(options);
    });
  }
};

function initShareFunction() {
  const copy = () => {
    /* Get the text field */
    var copyText = document.getElementById("shareInput");

    /* Select the text field */
    copyText.select();
    copyText.setSelectionRange(0, 99999); /* For mobile devices */
    /* Copy the text inside the text field */
    document.execCommand("copy");

    /* Alert the copied text */
    // alert("Link copied");
    initShareSweetalert(".copybtn", {
      title: "Copied link",
      text: "Now you can chare it with the world",
      icon: "success",
    });
  };

  document.querySelector(".copybtn").addEventListener("click", copy);
}

export { initShareFunction };
