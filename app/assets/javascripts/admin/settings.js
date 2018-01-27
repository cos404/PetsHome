var regionToggle = false;
var cityToggle = false;


$(function(){
  function runEffect() {
    var selectedEffect = "blind";
    $("#country-new-form").toggle( selectedEffect, {}, 500);
  };
  $("#country-toggle").on("click", function(){
    runEffect();
  });


  function runEffectRegion() {
    var selectedEffect = "blind";
    $("#region-new-form").toggle( selectedEffect, {}, 500);
    regionToggle = !regionToggle;
  };
  $("#region-toggle").on("click", function(){
    if(!$("#region-toggle").hasClass('disabled')) runEffectRegion();
  });


  function runEffectCity() {
    var selectedEffect = "blind";
    $("#city-new-form").toggle( selectedEffect, {}, 500);
    cityToggle = !cityToggle;
  };
  $("#city-toggle").on("click", function(){
    if(!$("#city-toggle").hasClass('disabled')) runEffectCity();
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

    // GET REGION LIST
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


  // BUTTON "REMOVE REGION"
    $("#regions").change(()=>{
      var region_id = $("#regions").find(":selected").val();
      $("#region-remove").remove();
      if(region_id){
        $("#region-control").append(
          `<button class="btn btn-danger" id="region-remove" data-region="${region_id}">-</button>`
        );
      }
    });

    $("#region-control").click('#region-remove', ()=>{
      var region_id = $('#region-remove').data("region");
      $.ajax({
        type: 'DELETE',
        url: `/admin/region/${region_id}`,
        dataType: 'json',
        headers: {
          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success: function(data) {
          $(`#regions option[value=${region_id}]`).remove();
        },
        error: function(data){
          console.log(data);
        }
      })
    });

  // BLOCK "CITY"
    // GET CITY LIST
    $("#regions").change(()=>{
      var region_id = $("#regions").find(":selected").val();

      if(!region_id){
        $('#cities').attr('disabled', true).find('option').remove();
        $('#city-toggle').addClass('disabled');
        if(cityToggle) runEffectRegion();
        return;
      }
      $('#city-toggle').removeClass('disabled');
      $('#cities').html('<option>Loading...</option>');
      $('#cities').attr('disabled', true);
      $('#city_region_id').val(`${region_id}`);
      if(region_id){
        $.ajax({
          type: 'POST',
          url: `/admin/get_cities`,
          dataType: 'json',
          data: {
            region_id: region_id
          },
          headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          },
          success: function(data) {
            $('#cities').find('option').remove();
            $('#cities').append('<option value="" label=" "></option>');
            $.each(data, function(i) {
              $('#cities').append($('<option>').text(data[i]['title']).attr('value', data[i]['id']));
            });
            $('#cities').attr('disabled', false);
          }
        });
      }
    });


});