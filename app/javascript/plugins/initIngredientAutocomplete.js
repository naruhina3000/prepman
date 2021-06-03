import $ from "jquery";

const initIngredientAutocomplete = () => {
  $(".ingredients-autocomplete").select2({
    dropdownParent: $("#ingredientModal"),
    ajax: {
      url: "/ingredients",
      data: function (params) {
        var query = {
          search: params.term,
          type: "public",
        };
        return query;
      },
      processResults: function (data) {
        // Transforms the top-level key of the response object from 'items' to 'results'
        return {
          results: data,
          pagination: {
            more: false,
          },
        };
      },
    },
  });
};
export { initIngredientAutocomplete };

