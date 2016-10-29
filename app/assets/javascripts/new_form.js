$(document).on('turbolinks:load',function(){
  // プロトタイプ作成画面の方
  $("#add_new_form").on("click", function(){
    console.log("hoge");
    $("#js-show-form").removeClass("hide-form")
    $("#js-show-form").addClass("appear-form")
    $("#add_new_form").addClass("hide");
  });

  //プロトタイプ編集画面の方
  var num = 0;
  $("#add_new_forms").on("click", function(){
    console.log("hello");
    $(this).data("click", ++num);
    var click = $(this).data("click");
    $(".js-show-sub-" + click + "-image-form").removeClass("hide-form")
    $(".js-show-sub-" + click + "-image-form").addClass("appear-form")

    if (click == 3 ) {
      $("#add_new_forms").addClass("hide");
    }
  });
});
