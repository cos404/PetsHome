$(document).ready(function() {
  $('#shelter_country_id').change(function() {
    var country_id = $(this).val();
    if(!country_id){
      $('#shelter_region_id').attr('disabled', true).find('option').remove();
      $('#shelter_city_id').attr('disabled', true).find('option').remove();
      return;
    }
    $('#shelter_region_id').html('<option>Loading...</option>');
    $('#shelter_region_id').attr('disabled', true);

    $.ajax({
      type: 'POST',
      url: '/getRegions',
      data: {
        country_id: country_id
      },
      dataType: 'json',
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      success: function(data) {
        $('#shelter_region_id').find('option').remove();
        $.each(data, function(i) {
          $('#shelter_region_id').append($('<option>').text(data[i]['title']).attr('value', data[i]['id']));
        });
        $('#shelter_region_id').attr('disabled', false);

        $('#shelter_city_id').html('<option>Loading...</option>');
        $('#shelter_city_id').attr('disabled', true);

        $.ajax({
          type: 'POST',
          url: '/getCities',
          data: {
            region_id: $('#shelter_region_id').find(":selected").val()
          },
          dataType: 'json',
          headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          },
          success: function(data) {
            $('#shelter_city_id').find('option').remove();
            $.each(data, function(i) {
              $('#shelter_city_id').append($('<option>').text(data[i]['title']).attr('value', data[i]['id']));
            });
            $('#shelter_city_id').attr('disabled', false);
          }
        })
      }
    });
  });


  $('#shelter_region_id').change(function() {
    var region_id = $(this).val();
    $('#shelter_city_id').html('<option>Loading...</option>');
    $('#shelter_city_id').attr('disabled', true);

    $.ajax({
      type: 'POST',
      url: '/getCities',
      data: {
        region_id: region_id
      },
      dataType: 'json',
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      success: function(data) {
        $('#shelter_city_id').find('option').remove();
        $.each(data, function(i) {
          $('#shelter_city_id').append($('<option>').text(data[i]['title']).attr('value', data[i]['id']));
        });
        $('#shelter_city_id').attr('disabled', false);
      }
    });
  });
});


ymaps.ready(init);
function init() {
  var myMap = new ymaps.Map("map", {
        center: [latitude, longitude],
        zoom: 16,
        controls: ['zoomControl', 'typeSelector',  'fullscreenControl']
      });

  myMap.geoObjects
    .add(new ymaps.Placemark([latitude, longitude], {
        balloonContent: `<b>${title}</b><p>${address}</p>`
    }, {
        preset: 'islands#icon',
        iconColor: '#0095b6'
    }));
}

$(function() {
  $('#shelter_photo_shelter_photo').fileupload();
  return {
    dataType: "script"
  };
});