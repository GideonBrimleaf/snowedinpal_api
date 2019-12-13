# frozen_string_literal: true

require_relative '../snowed_in_script.rb'

describe 'am_i_response' do
   it 'days naw when there is no snow' do
     weather = {"summary"=>{"heavy_snow"=>false,"high_wind_night"=>false,"cold_night"=>true,"heavy_snow_days"=>[],"high_wind_nights"=>[],"cold_nights"=>[null,"2019-12-14","2019-12-15"]}}
  end
end