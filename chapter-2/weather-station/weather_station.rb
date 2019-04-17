require_relative "weather_data"
require_relative "display"

weather_data = WeatherData.new
current_conditions_display = CurrentConditionsDisplay.new(weather_data)
statistics_display = StatisticsDisplay.new(weather_data)
forecast_display = ForecastDisplay.new(weather_data)

weather_data.set_measurements(80, 65, 30.4)
weather_data.set_measurements(82, 70, 29.2)
weather_data.set_measurements(78, 90, 29.2)
