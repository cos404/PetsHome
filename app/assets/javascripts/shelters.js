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


  // // ADD USERS TO SHELTER PERSONAL(/shelter/:id)
  var search_input = false;
  var usersListAll;

  // GET USERS LIST
  $('#addPersonal').on( "click", function() {
    if(!search_input){
      $.ajax({
        type: 'POST',
        url: '/getUsers',
        dataType: 'json',
        headers: {
          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success: function(data) {
            search_input = true;
            if(data.length != 0){
              usersListAll = data;
              $('#addPersonal').after('<input type="text" id="search-user-input" />');
            }
          }
      })
    }
    else {
      $('#search-user-input').remove();
      search_input = false;
    }
  });

  // USERS SEARCH AND AUTOCOMPLETE
  var usersList
  const createPartOfArray = (usersList, partOfWord) => {
    var regex = new RegExp(`\\b${partOfWord}.*`,'i');
    return usersList.filter(v => {
      if (regex.test(v.username)) return v
    })
  }

  $('#staffs').on('input', '#search-user-input',function(e) {
    word = $('#search-user-input').val();
    $('#user-list').children().remove();
    usersList = createPartOfArray(usersListAll, word);

    $( "#search-user-input" ).autocomplete({
      source: function (request, response) {
        response($.map(usersList, function (value, key) {
          return {
            label: value.username,
            value: value.id
          }
        }));
      },
      select: function (e, ui) {
        $('div#personal').append(`<div class="addedUser"><button class="btn btn-success m-1" value="${ui.item.value}">+</button>${ui.item.label}</div>`);
        return false;
      }
    });
  });

});


// ADD SHELTER BALLONS TO MAPS
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

// JQUERY IMAGE UPLOADING
$(function() {
  $('#shelter_photo_shelter_photo').fileupload();
  return {
    dataType: "script"
  };
});