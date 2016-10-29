$(document).on('turbolinks:load',function(){
  $(".js-avatar-preview").on("change", function(){
    var file = this.files[0]
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.addEventListener("load", function(){
      $(".js-avatar-preview").parent().css('background-image', 'url(' + reader.result + ')');
    });
  });
});
