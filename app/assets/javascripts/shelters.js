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


  // // ADD USERS TO SHELTER STAFFS(/shelter/:id)
  var search_input = false;
  var usersListAll;

  // GET USERS LIST
  $('#addStaff').on( "click", function() {
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
              $('#addStaff').after('<input type="text" id="search-user-input" />');
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
        $('div#staff').append(`
          <div>
            <button class="btn btn-success m-1 addUser" data-user="${ui.item.value}" data-role="volunteer">
              +
            </button>
            ${ui.item.label}
          </div>`);
        return false;
      }
    });
  });

  $('#staffs').on('click', '.addUser', function(){
    var user    = $(this).data("user"),
        role    = $(this).data("role"),
        url     = window.location.href;
    $.ajax({
      type: 'POST',
      url: `${url}/addStaff/${user}`,
      dataType: 'json',
      data:{
        role: role
      },
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      success: function(data) {
        $("button[data-user='" + user + "']").replaceWith(`
          <button class="btn btn-danger m-1 deleteStaff" data-user="${user}">
            x
          </button>
        `);

      },
      error: function(data){
        console.log(data);
      }
    })
  });

    $('#staffs').on('click', '.deleteStaff', function(){
    var user    = $(this).data("user"),
        url     = window.location.href,
        el      = $(this);
    $.ajax({
      type: 'DELETE',
      url: `${url}/deleteStaff/${user}`,
      dataType: 'json',
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      success: function(data) {
        el.parent().remove();
      },
      error: function(data){
        console.log(data);
      }
    })
  });

  $(".shelter_cover input").change((e)=>{
    $(".shelter_cover label").text(e.target.files[0].name);
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

jQuery(function() {
  return $('#shelter_photo_shelter_photo').fileupload({
    dataType: "script",
    add: function(e, data) {
      var file, types;
      types = /(\.|\/)(gif|jpe?g|png)$/i;
      file = data.files[0];
      if (types.test(file.type) || types.test(file.name)) {
        return data.submit();
      } else {
        return alert(file.name + " is not a gif, jpeg, or png image file");
      }
    }
  });
});