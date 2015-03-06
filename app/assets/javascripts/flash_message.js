$(function() {
  $(".close").click(function(){
    $("#div_flash_container").hide();});
  setInterval(function(){
    $('#div_flash_container').slideUp();
  }, 5000);
});