class WeatherReport

  def initialize(weather_type)
    @weather_type = weather_type
    @forecast = get_forecast
  end

  def am_i_response
    weather_summary = @forecast['summary']
    weather_duration = @weather_type == :heavy_snow ? weather_summary['heavy_snow_days'] : weather_summary['high_wind_nights']
    weather_duration > 0 ? "Aye pal - fae the next #{weather_duration} #{'day'.pluralize(weather_duration)}" : "Naw mate, yer alright"
  end

  def data
    [
      weather_report(@forecast)[0], 
      weather_report(@forecast)[1], 
      weather_report(@forecast)[2]
    ]
  end

  private

  def get_forecast
    url = 'https://peaceful-scrubland-76997.herokuapp.com/forecasts/three_day'
    HTTParty.get(url).parsed_response
  end
  
  def weather_report(forecast_range)
    forecast_range['breakdown'].map {|weather_item| weather_item.values}
  end

end