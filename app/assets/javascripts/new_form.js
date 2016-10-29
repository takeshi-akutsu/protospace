$(document).on('turbolinks:load',function(){
  var num = 0;
  $("#add_new_form").on("click", function(){
    console.log("hello");
    $(this).data("click", ++num);
    var click = $(this).data("click");
    $(".js-show-sub-" + click + "-image-form").removeClass("hide-form")
    $(".js-show-sub-" + click + "-image-form").addClass("appear-form")

    if (click == 3 ) {
      $("#add_new_form").addClass("hide");
    }
  });
});
