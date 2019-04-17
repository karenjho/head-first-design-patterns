class WeatherData

  attr_accessor :observers, :temperature, :humidity, :pressure

  def initialize
    @observers = []
  end

  def register_observer(observer)
    observers << observer
  end

  def remove_observer(observer)
    observers.delete(observer)
  end

  def notify_observers
    observers.each do |observer|
      observer.update(temperature, humidity, pressure)
    end
  end

  def measurements_changed!
    notify_observers
  end

  def set_measurements(temperature, humidity, pressure)
    self.temperature = temperature
    self.humidity = humidity
    self.pressure = pressure
    measurements_changed!
  end
end
