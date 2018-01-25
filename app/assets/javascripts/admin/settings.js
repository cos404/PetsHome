$(function(){
  function runEffect() {
    var selectedEffect = "blind";
    $( "#country-new-form" ).toggle( selectedEffect, {}, 500);
  };

  $("#country-toggle").on("click", function(){
    runEffect();
  });

  $("#countries").change(()=>{
    var country_id = $(this).find(":selected").val();
    $("#country-remove").remove();
    if(country_id){
      $("#country-control").append(
        `<button class="btn btn-danger" id="country-remove" data-country="${country_id}">-</button>`
      );
    }
  });

  $("#country-control").click('#country-remove', ()=>{
    var country_id = $('#country-remove').data("country");
    $.ajax({
      type: 'DELETE',
      url: `/admin/country/${country_id}`,
      dataType: 'json',
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      success: function(data) {
        $(`#countries option[value=${country_id}]`).remove();
      },
      error: function(data){
        console.log(data);
      }
    })
  });


});