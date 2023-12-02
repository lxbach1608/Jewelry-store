document.addEventListener("DOMContentLoaded", function(e) {
    
    // Delete model
    const deleteModel = $("#product-delete-model");
    
    const cancelBtn = $(".cancel-btn");
    
    const deleteBtns = $(".delete-btn");
    
    cancelBtn.click((e) => {
        deleteModel.addClass("hidden");
    });

    deleteBtns.click((e) => {
        deleteModel.removeClass("hidden");
        productId = e.currentTarget.attributes["data-id"].value;
        
        $("input[name*='delete-form-productId']").val(productId);
    });
    
    
    // handle delete    
    let productId;
    
    const deleteForm = $("form[name*='delete-form']");
    
    $(".confirm-delete-btn").click((e) => {
        deleteForm.submit();
    });
    
    
    
    // handle update
    const editModel = $("#product-edit-model");
    

    const editBtns = $(".edit-btn");
    
    editBtns.click(function (e) {
        const parent = $(this).parent();

        id = $(parent[0]).children("input[name*='_productId']").val();
        name = $(parent[0]).children("input[name*='_name']").val();
        desc = $(parent[0]).children("input[name*='_desc']").val();
        size = $(parent[0]).children("input[name*='_size']").val();
        color = $(parent[0]).children("input[name*='_color']").val();
        imgUrl = $(parent[0]).children("input[name*='_imgUrl']").val();
        price = $(parent[0]).children("input[name*='_price']").val();
        slug = $(parent[0]).children("input[name*='_slug']").val();
        quantity = $(parent[0]).children("input[name*='_quantity']").val();
        
        $("input[name*='form-id']").val(id);
        $("input[name*='form-name']").val(name);
        $("textarea[name*='form-desc']").val(desc);
        $("input[name*='form-imgUrl']").val(imgUrl);
        $("input[name*='form-price']").val(price);
        $("input[name*='form-slug']").val(slug);
        $("input[name*='form-quantity']").val(quantity);
        
        $("._img-demo").attr("src", imgUrl);

        editModel.removeClass("hidden");
    });
    
    
    // Handle insert    
    const insertModel = $("#product-insert-model");

    const closeBtns = $(".close-btn");
    const addBtn = $(".add-btn");
    
    closeBtns.click(function (e) {
        editModel.addClass("hidden");
        insertModel.addClass("hidden");
    });
    
    addBtn.click(function (e) {
        insertModel.removeClass("hidden");
    });

//  Handle category
  const categoryIcons = {
    caretDown: `<svg
      class="parent-category w-5"
      xmlns="http://www.w3.org/2000/svg"
      height="1em"
      viewBox="0 0 320 512"
      fill= "#8b5cf6"
    >
      <path
        d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z"
      />
    </svg>`,
    caretRight: `<svg
        class="parent-category w-5"
        xmlns="http://www.w3.org/2000/svg"
        height="1em"
        viewBox="0 0 256 512"
        fill= "#8b5cf6"
      >
      <path
        d="M246.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-128-128c-9.2-9.2-22.9-11.9-34.9-6.9s-19.8 16.6-19.8 29.6l0 256c0 12.9 7.8 24.6 19.8 29.6s25.7 2.2 34.9-6.9l128-128z"
      />
    </svg>`
  };

  // root category display category-list
    const rootHandle = $(".root-category-handle");

    const parentHandles = $(".parent-category-handle");
    const childHandles = $(".child-category-handle");
    
    rootHandle.click(function (e) {
      $(".category-list").hasClass("hidden")
        ? $(".category-list").removeClass("hidden")
        : $(".category-list").addClass("hidden");
    });

  // parent display children
  $(".parent-category-handle").on("click", function (e) {
    var sibling = $(this).next(".child-category-handle");

    if (sibling.hasClass("hidden")) {
      sibling.removeClass("hidden");
    } else {
      sibling.addClass("hidden");
    }
  });

  // imageUrl input
    const imageUrlInput = $("input[name=imageUrl]");
    const imageUrlInputUpdate = $("input[name=form-imgUrl]");

    const imgDemo = $(".img-demo");
    const imgDemoUpdate = $("._img-demo");

    // insert
    imageUrlInput.on("change", function (e) {
        imgDemo.attr("src", e.target.value);

        imgDemo.on("error", function (e) {
            $(".close-img").addClass("hidden");
        });

        imgDemo.on("load", function (e) {
          $(".close-img").removeClass("hidden");
        });
    });
    
    // update
    imageUrlInputUpdate.on("change", function (e) {
        imgDemoUpdate.attr("src", e.target.value);

        imgDemoUpdate.on("error", function (e) {
            $(".close-img").addClass("hidden");
        });

        imgDemoUpdate.on("load", function (e) {
          $(".close-img").removeClass("hidden");
        });
    });

  $(".close-img").click(function (e) {
    imgDemo.attr("src", "");
    imageUrlInput.val("");

    if (imgDemo.attr("src") === "") {
      $(".close-img").addClass("hidden");
    }
  }); 

  // product input
    const nameInput = $("input[name=name]");
    const nameInputUpdate = $("input[name=form-name]");
    
    const slugInput = $("input[name=slug]");
    const slugInputUpdate = $("input[name=form-slug]");


  nameInput.on("change", function (e) {
    var str = e.target.value;
    slugInput.val(str.replaceAll(" ", "-"));
  });
  
  nameInputUpdate.on("change", function (e) {
    var strUpdate = e.target.value;
    slugInputUpdate.val(strUpdate.replaceAll(" ", "-"));
  });
  
  // handle checkbox categories
  $(".child-item").on("click", function (e) {
    let cbInput = $(this).children("input");

    console.log(cbInput.attr("checked"));
    if (cbInput.attr("checked") === "checked") {
      cbInput.attr("checked", false);
    } else {
      cbInput.attr("checked", true);
    }
  });
  

});