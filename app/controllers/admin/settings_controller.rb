class Admin::SettingsController < Admin::ApplicationController

  ## SHELTER MAP JSON GENERATE
  def generateSheltersJSON
    shelters = {
      "type":"FeatureCollection",
    }

    shelters_list = Shelter.all.select(:id, :title, :street, :house_number, :latitude, :longitude, :about)
    shelters[:features] = shelters_list.map do |shelter|
      {
        type: "Feature",
        id: shelter.id,
        geometry: {
          type: "Point",
          coordinates: [shelter.latitude, shelter.longitude]
        },
        properties: {
          balloonContentHeader: shelter.title,
          balloonContentBody: 
          " <br>
            <p>#{shelter.about.truncate(210, separator: /\s/)}...<a href='#{shelter_url(shelter)}'>&gt;&gt;</a></p>
            <p>Адрес: #{shelter.street} #{shelter.house_number}</p>
          ",
          clusterCaption: shelter.title,
          hintContent: shelter.title
        }
      }
    end

    File.open("public/shelters.json","w") do |f|
      f.write(shelters.to_json)
    end

    render json: {message: "Shelters list generated!"}, status: 200
  end

end