class Display
  attr_accessor :weather_data

  def initialize(weather_data)
    @weather_data = weather_data
    weather_data.register_observer(self)
  end

  def update(temperature, humidity, pressure)
    raise "Must be implemented by subclass"
  end

  def display
    raise "Must be implemented by subclass"
  end
end

class CurrentConditionsDisplay < Display

  attr_accessor :temperature, :humidity, :pressure

  def display
    puts "Current conditions: #{temperature}C degrees and #{humidity}% humidity"
  end

  def update(temperature, humidity, pressure)
    self.temperature = temperature
    self.humidity = humidity
    self.pressure = pressure
    display
  end
end


class StatisticsDisplay < Display

  attr_accessor :temperatures

  def initialize(weather_data)
    @temperatures = []
    super
  end


  def display
    puts "Avg/Max/Min temperate = #{average}/#{maximum}/#{minimum}"
  end

  def update(temperature, _humidity, _pressure)
    self.temperatures << temperature.to_f
    display
  end

  def average
    temperatures.sum / temperatures.length
  end

  def maximum
    temperatures.max
  end

  def minimum
    temperatures.min
  end
end

class ForecastDisplay < Display

  attr_accessor :old_pressure, :new_pressure

  def display
    puts forecast
  end

  def update(_temperature, _humidity, pressure)
    self.old_pressure = self.new_pressure.to_f
    self.new_pressure = pressure.to_f
    display
  end

  def forecast
    if new_pressure > old_pressure
      "Improving weather on the way!"
    elsif new_pressure < old_pressure
      "Watch out for cooler, rainy weather"
    else
      "More of the same"
    end
  end
end
