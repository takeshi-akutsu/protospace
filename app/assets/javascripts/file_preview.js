$(document).on('turbolinks:load',function(){
  $(".js-preview").on("change", function(){
    var id = $(this).closest("div").find("img").attr("id")
    var file = this.files[0]
    var reader = new FileReader();
    reader.readAsDataURL(file);
    console.log(id);

    reader.addEventListener("load", function(){
      console.log(reader.result);
      $("#" + id).attr("src", reader.result);
      $("#" + id).removeClass("hide");
    });
  });
});
