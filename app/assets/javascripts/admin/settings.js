$(function(){
  function runEffect() {
    var selectedEffect = "blind";
    $( "#country-new-form" ).toggle( selectedEffect, {}, 500);
  };
  $( "#country-toggle" ).on( "click", function() {
    runEffect();
  });
});