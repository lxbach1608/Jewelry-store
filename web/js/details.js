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

var selectedVariations = 0;

if (sizeInput.val() !== "" || sizeInput.val() !== "") {
    selectedVariations = 1;
}

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
  
  selectedVariations++;
  
  submitQuantityVariations(selectedVariations);
});

// quantity handle
    const increaseBtn = $(".increase-btn");
    const decreaseBtn = $(".decrease-btn");
    const updateBtn = $(".update-cart-btn");

    if(updateBtn.hasClass("btn--disabled")) {
     
    } else {
        
    }


    increaseBtn.on("click", function (e) {
        updateBtn.removeClass("btn--disabled");

        currentQuantityInput = $(this).parent().children(".quantity-input");
        let currentValue = currentQuantityInput.val();

        currentValue = parseInt(currentQuantityInput.val());

        currentValue += 1;

        currentValue = currentValue < 1 ? 1 : currentValue;

        currentQuantityInput.val(currentValue);
    });

decreaseBtn.on("click", function (e) {
    updateBtn.removeClass("btn--disabled");

    
    currentQuantityInput = $(this).next(".quantity-input");
    let currentValue = currentQuantityInput.val();
    
    currentValue = parseInt(currentQuantityInput.val());

    currentValue -= 1;
    
    currentValue = currentValue < 1 ? 1 : currentValue;

    currentQuantityInput.val(currentValue);
});
    

// Handle quantity

var variationForm = $('.variation-form');
var selectedTexts = $('.selection-wrapper').children("span");

var sizes = {
    '1': "16.0",
    '2': "16.5",
    '3': "17.0",
    '4': "17.5"
};

var colors = {
    '1': "Gold",
    '2': "Silver",
    '3': "Bronze"
};

selectedTexts.each(function(index) {
    
    let sizeId = sizeInput.val();
    let colorId = colorInput.val();
    
    variationParent = $(this).parents("[class*='variation-wrapper']");
    
    console.log(variationParent);
    
    if(variationParent.hasClass("color-wrapper")) {
        console.log("in");
        $(this).text(colors[colorId]);
    } else {
        $(this).text(sizes[sizeId]);
    }
});



function submitQuantityVariations(selectedVariations) {
    if(selectedVariations >= 2) {
        selectedVariations = 2;
        variationForm.attr("action", '/JewelryStore/products/quantity');
    
        variationForm.submit();
    }
}