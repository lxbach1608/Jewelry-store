document.addEventListener("DOMContentLoaded", function(e) {
    const parent = $(".parent");

    parent.on("click", function (e) {
      let childBlock = $(this).children(".child-list");

      childBlock.on("click", function (e) {
        e.stopPropagation();
      });

      if (childBlock.hasClass("hidden")) {
        childBlock.removeClass("hidden");
      } else {
        childBlock.addClass("hidden");
      }
    });

});
