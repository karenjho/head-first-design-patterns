require_relative 'observable'

class WeatherData

  include Observable

  attr_accessor :temperature, :humidity, :pressure

  def initialize
    @observers = []
  end

  def measurements_changed!
    self.changed = true
    notify_observers
  end

  def set_measurements(temperature, humidity, pressure)
    self.temperature = temperature
    self.humidity = humidity
    self.pressure = pressure
    measurements_changed!
  end
end
