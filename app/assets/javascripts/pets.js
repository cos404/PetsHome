$(function() {
  return $('#pet_photo_pet_photo').fileupload({
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