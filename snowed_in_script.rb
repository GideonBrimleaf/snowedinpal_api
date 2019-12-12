require 'active_support/inflector'
require 'httparty'

def get_forecast 
  HTTParty.get('https://peaceful-scrubland-76997.herokuapp.com/forecasts/three_day').parsed_response
end


def am_i_response(weather_summary, weather_type)
  weather_duration = weather_type == 'heavy_snow' ? weather_summary['heavy_snow_days'] : weather_summary['high_wind_nights']
  weather_summary[weather_type] == true ? "aye pal - fae the next #{weather_duration[0]} #{'day'.pluralize(weather_duration[0])}" : "naw mate, yer alright"
end


puts "Am I snowed in pal? #{am_i_response(get_forecast()['summary'], 'heavy_snow')}"
puts "Is it blowin' a gale pal? #{am_i_response(get_forecast()['summary'], 'high_wind_night')}"