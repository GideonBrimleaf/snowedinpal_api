require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/inflector'
require 'httparty'

require_relative 'weather_report'

get '/' do
  erb :index
end

get '/snowed_in' do
  @weather_report = WeatherReport.new(:heavy_snow)
  erb :snow
end

get '/heavy_wind' do
  @weather_report = WeatherReport.new(:high_wind_night)
  erb :wind
end