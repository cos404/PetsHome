$(function(){
  // Generate Shelters JSON
  $("#SheltersJSON").click(()=>{
    $.ajax({
      type: 'POST',
      url: '/admin/generateSheltersJSON',
      dataType: 'json',
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      success: (data) =>{
        console.log(data);
      },
      error: (data) =>{
        console.log(data);
      }
    });
  })
});