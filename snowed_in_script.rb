require 'sinatra'
require 'active_support/inflector'
require 'httparty'

def get_forecast 
  HTTParty.get('https://peaceful-scrubland-76997.herokuapp.com/forecasts/three_day').parsed_response
end


def am_i_response(weather_summary, weather_type)
  weather_duration = weather_type == 'heavy_snow' ? weather_summary['heavy_snow_days'] : weather_summary['high_wind_nights']
  weather_summary[weather_type] == true ? "Aye pal - fae the next #{weather_duration[0]} #{'day'.pluralize(weather_duration[0])}" : "Naw mate, yer alright"
end

def weather_report(forecast_range)
  forecast_range['breakdown'].map {|weather_item| weather_item.values}
end

get '/' do
  erb :index
end

get '/snowed_in' do
  @weather_report_day1 = weather_report(get_forecast)[0]
  @weather_report_day2 = weather_report(get_forecast)[1]
  @weather_report_day3 = weather_report(get_forecast)[2]
  erb :snow
end

get '/heavy_wind' do
  @weather_report_day1 = weather_report(get_forecast)[0]
  @weather_report_day2 = weather_report(get_forecast)[1]
  @weather_report_day3 = weather_report(get_forecast)[2]
  erb :wind
end