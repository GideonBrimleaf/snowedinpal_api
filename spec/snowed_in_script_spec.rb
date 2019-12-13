# frozen_string_literal: true

require_relative '../snowed_in_script.rb'

describe 'am_i_response' do
  it 'says naw when there is nae snow' do
    weather = {"heavy_snow"=>false, "high_wind_night"=>true, "cold_night"=>true, "heavy_snow_days"=>[], "high_wind_nights"=>[1], "cold_nights"=>[nil, "2019-12-14", "2019-12-15"]}
    expect(am_i_response(weather, "heavy_snow")).to eql("Naw mate, yer alright")
  end
  
  it 'says aye when there is snow' do
    weather = {"heavy_snow"=>true, "high_wind_night"=>false, "cold_night"=>true, "heavy_snow_days"=>[2], "high_wind_nights"=>[], "cold_nights"=>[nil, "2019-12-14", "2019-12-15"]}
    expect(am_i_response(weather, "heavy_snow")).to eql("Aye pal - fae the next 2 days")
  end
  
  it 'says naw when there is nae wind' do
    weather = {"heavy_snow"=>true, "high_wind_night"=>false, "cold_night"=>true, "heavy_snow_days"=>[2], "high_wind_nights"=>[], "cold_nights"=>[nil, "2019-12-14", "2019-12-15"]}
    expect(am_i_response(weather, "high_wind_night")).to eql("Naw mate, yer alright")
  end
  
  it 'says aye when there is wind' do
    weather = {"heavy_snow"=>false, "high_wind_night"=>true, "cold_night"=>true, "heavy_snow_days"=>[], "high_wind_nights"=>[1], "cold_nights"=>[nil, "2019-12-14", "2019-12-15"]}
    expect(am_i_response(weather, "high_wind_night")).to eql("Aye pal - fae the next 1 day")
  end
  
end