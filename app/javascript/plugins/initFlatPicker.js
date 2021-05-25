import flatpickr from "flatpickr";

const initFlatPickr = () => {
  const input = document.querySelector("#planner_date");

  if (input){
    console.log(input)
    flatpickr(input, {
      minDate: "today",
      dateFormat: "Y-m-d",
      disableMobile: "true"
    });

  }
};

export { initFlatPickr };
