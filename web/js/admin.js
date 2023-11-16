document.addEventListener("DOMContentLoaded", function(e) {
    const insertModel = $("#product-insert-model");
  const editModel = $("#product-edit-model");

  const closeBtns = $(".close-btn");

  const editBtns = $(".edit-btn");
  const addBtn = $(".add-btn");

  const rootHandle = $(".root-category-handle");

  const parentHandles = $(".parent-category-handle");
  const childHandles = $(".child-category-handle");

  const imageUrlInput = $("input[name=imageUrl]");

  // model open/close
  closeBtns.click(function (e) {
    editModel.addClass("hidden");
    insertModel.addClass("hidden");
  });

  editBtns.click(function (e) {
    editModel.removeClass("hidden");
  });

  addBtn.click(function (e) {
    insertModel.removeClass("hidden");
  });

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
    </svg>`,
  };

  // root category display category-list
  rootHandle.click(function (e) {
    $(".category-list").hasClass("hidden")
      ? $(".category-list").removeClass("hidden")
      : $(".category-list").addClass("hidden");
  });

  // parent display children
  $(".parent-category-handle").on("click", function (e) {
    // console.log($(this));

    var sibling = $(this).next(".child-category-handle");

    if (sibling.hasClass("hidden")) {
      sibling.removeClass("hidden");
    } else {
      sibling.addClass("hidden");
    }
  });

  // imageUrl input
  const imgDemo = $(".img-demo");

  imageUrlInput.on("change", function (e) {
    imgDemo.attr("src", e.target.value);

    imgDemo.on("error", function (e) {
      $(".close-img").addClass("hidden");
    });

    imgDemo.on("load", function (e) {
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
  const slugInput = $("input[name=slug]");

  nameInput.on("change", function (e) {
    var str = e.target.value;
    slugInput.val(str.replaceAll(" ", "-"));
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