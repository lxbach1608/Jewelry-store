const selections = $(".selection-js");

const productIdInput = $("input[name*='form-add-to-cart-productId'");
const sizeInput = $("input[name*='form-add-to-cart-size'");
const colorInput = $("input[name*='form-add-to-cart-color'");

selections.on("click", function (e) {
  childrenSelection = $(this).children(".select-list-js");

  if (childrenSelection.hasClass("hidden")) {
    childrenSelection.removeClass("hidden");

    childrenSelection.on("mouseleave", function (e) {
      childrenSelection.addClass("hidden");
    });
  } else {
    childrenSelection.addClass("hidden");
  }
});

const selectList = $(".select-list-js");
const childSelectList = selectList.children("li");

childSelectList.on("click", function (e) {
  dataId = e.currentTarget.attributes["data-id"].value;

  if ($(this).parent().hasClass("size-js")) {
    sizeInput.val(dataId);
  } else {
    colorInput.val(dataId);
  }

  selectText = $(this)
    .parent()
    .parent()
    .children(".selection-wrapper")
    .children("span");

  selectText.text(e.currentTarget.innerText);
});

// quantity handle
const increaseBtn = $(".increase-btn");
const decreaseBtn = $(".decrease-btn");
const quantityInput = $(".quantity-input");

increaseBtn.on("click", function (e) {
  let current = parseInt(quantityInput.val());

  current += 1;

  quantityInput.val(current);
});

decreaseBtn.on("click", function (e) {
  let current = parseInt(quantityInput.val());

  current -= 1;

  quantityInput.val(current);
});
