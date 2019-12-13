require 'sinatra'
require 'active_support/inflector'
require 'httparty'

def get_forecast 
  HTTParty.get('https://peaceful-scrubland-76997.herokuapp.com/forecasts/three_day').parsed_response
end


def am_i_response(weather_summary, weather_type)
  weather_duration = weather_type == 'heavy_snow' ? weather_summary['heavy_snow_days'] : weather_summary['high_wind_nights']
  weather_summary[weather_type] == true ? "aye pal - fae the next #{weather_duration[0]} #{'day'.pluralize(weather_duration[0])}" : "naw mate, yer alright"
end

get '/' do
  erb :index
end

get '/snowed_in' do
  erb :snow
end

get '/heavy_wind' do
  erb :wind
end