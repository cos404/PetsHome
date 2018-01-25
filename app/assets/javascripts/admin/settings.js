var regionToggle = false;

$(function(){
  function runEffect() {
    var selectedEffect = "blind";
    $("#country-new-form").toggle( selectedEffect, {}, 500);
  };

  function runEffectRegion() {
    var selectedEffect = "blind";
    $("#region-new-form").toggle( selectedEffect, {}, 500);
    regionToggle = !regionToggle;
  };
  $("#country-toggle").on("click", function(){
    runEffect();
  });

  $("#region-toggle").on("click", function(){
    if(!$("#region-toggle").hasClass('disabled')) runEffectRegion();
  });


  // BUTTON "REMOVE COUNTRY"
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

  // BLOCK "ADD REGION"

  $("#countries").change(()=>{
    var country_id = $(this).find(":selected").val();

    if(!country_id){
      $('#regions').attr('disabled', true).find('option').remove();
      $('#region-toggle').addClass('disabled');
      if(regionToggle) runEffectRegion();
      return;
    }
    $('#region-toggle').removeClass('disabled');
    $('#regions').html('<option>Loading...</option>');
    $('#regions').attr('disabled', true);
    $('#region_country_id').val(`${country_id}`);
    if(country_id){
      $.ajax({
        type: 'POST',
        url: `/admin/get_regions`,
        dataType: 'json',
        data: {
          country_id: country_id
        },
        headers: {
          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success: function(data) {
          $('#regions').find('option').remove();
          $('#regions').append('<option value="" label=" "></option>');
          $.each(data, function(i) {
            $('#regions').append($('<option>').text(data[i]['title']).attr('value', data[i]['id']));
          });
          $('#regions').attr('disabled', false);
        }
      });
    }
  });


});