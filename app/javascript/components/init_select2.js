import $ from "jquery";
import "select2";

const initSelect2 = () => {
  let options = {};
  if (document.querySelector("#utensilModal")) {
    options = { dropdownParent: $("#utensilModal") };
  }
  $(".select2").select2(options);
};

export { initSelect2 };
