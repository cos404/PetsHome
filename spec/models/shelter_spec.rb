require 'rails_helper'

RSpec.describe Shelter, type: :model do

  it "get shelter address" do
    user    = create(:user)
    country = create(:country)
    region  = create(:region, country: country)
    city    = create(:city, region: region)
    shelter = create(:shelter, user: user, country: country, region: region, city: city)

    expect(shelter.address).to eq  "#{shelter.country.title_en}, #{shelter.region.title_en}, #{shelter.city.title_en}, #{shelter.street} #{shelter.house_number}"
  end

end