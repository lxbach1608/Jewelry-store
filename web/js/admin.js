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
        let categories;

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
        
        categories = $(parent[0]).children("input[name*='_categories']:checkbox:checked").map(function() {
            return this.value;
        });
        
        categories = categories.get(); // return array
        
        $("input[name*='form-id']").val(id);
        $("input[name*='form-name']").val(name);
        $("textarea[name*='form-desc']").val(desc);
        $("input[name*='form-imgUrl']").val(imgUrl);
        $("input[name*='form-price']").val(price);
        $("input[name*='form-slug']").val(slug);
        $("input[name*='form-quantity']").val(quantity);
        $("._img-demo").attr("src", imgUrl);
        
        // handle categories
        $("input[name*='form-categories']").each(function() {
            value = $(this).val();
            if(categories.find((element) => element === value)) {
                $(this).attr("checked", true);
            }
        });
        
        $("input[name='form-categories']:checkbox").each(function() {
        let parent = $(this).parent();
        let icon = parent.children(".folder-icon");
            
        if($(this).is(":checked")) {
            console.log($(this));
            icon.replaceWith(folderIcons['closeFolder']);
        }
        else {
            icon.replaceWith(folderIcons['openFolder']);
        }
        });
        

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
      class="arrow-icon w-5"
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
        class="arrow-icon w-5"
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
  
  const folderIcons = {
      openFolder: `<svg class="folder-icon w-8" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512" fill="#8b5cf6">
                    <path d="M384 480h48c11.4 0 21.9-6 27.6-15.9l112-192c5.8-9.9 5.8-22.1 .1-32.1S555.5 224 544 224H144c-11.4 0-21.9 6-27.6 15.9L48 357.1V96c0-8.8 7.2-16 16-16H181.5c4.2 0 8.3 1.7 11.3 4.7l26.5 26.5c21 21 49.5 32.8 79.2 32.8H416c8.8 0 16 7.2 16 16v32h48V160c0-35.3-28.7-64-64-64H298.5c-17 0-33.3-6.7-45.3-18.7L226.7 50.7c-12-12-28.3-18.7-45.3-18.7H64C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H87.7 384z"></path>
                    </svg>`,
      closeFolder: `<svg class="folder-icon w-8" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512" fill="#8b5cf6">
                    <path d="M64 480H448c35.3 0 64-28.7 64-64V160c0-35.3-28.7-64-64-64H288c-10.1 0-19.6-4.7-25.6-12.8L243.2 57.6C231.1 41.5 212.1 32 192 32H64C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64z"></path>
                    </svg>`
  };
  
  // root category display category-list
    const rootHandle = $(".root-category-handle");

    const parentHandles = $(".parent-category-handle");
    
    const childHandles = $(".child-category-handle");
    
    const childItems = $(".child-item");
    
    rootHandle.click(function (e) {
      $(".category-list").hasClass("hidden")
        ? $(".category-list").removeClass("hidden")
        : $(".category-list").addClass("hidden");
    });

    // parent display children
  $(".parent-category-handle").on("click", function (e) {    
    let sibling = $(this).next(".child-category-handle");
    
    let arrowIcon = $(this).children(".arrow-icon");
    
    if (sibling.hasClass("hidden")) {
      sibling.removeClass("hidden");
      arrowIcon.replaceWith(categoryIcons['caretDown']);
    } else {
      sibling.addClass("hidden");
      arrowIcon.replaceWith(categoryIcons['caretRight']);
    }
  });
  
    // handle checkout icon
    childItems.on("click", function(e) {
        let cb = $(this).children("input:checkbox");
        
        let fodlerIcon = $(this).children(".folder-icon");
        
        if(cb.is(":checked")) {
            fodlerIcon.replaceWith(folderIcons['openFolder']);
        } else {
            fodlerIcon.replaceWith(folderIcons['closeFolder']);
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

    if (cbInput.attr("checked") === "checked") {
      cbInput.attr("checked", false);
    } else {
      cbInput.attr("checked", true);
    }
  });
  
  
    // admin product UI category click
  $(".parent-category-text").on("click", function (e) {
      let sibling = $(this).next(".children-block");
      
      if (sibling.hasClass("hidden")) {
        sibling.removeClass(("hidden"));
        
        $(this).addClass("font-semibold");
      } else {
        sibling.addClass(("hidden"));
        
        $(this).removeClass("font-semibold");
      }
    });
});