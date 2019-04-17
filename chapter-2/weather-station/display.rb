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

class HeatIndexDisplay < Display

  attr_accessor :heat_index

  def update(temperature, humidity, _pressure)
    self.heat_index = calculate_heat_index(temperature.to_f, humidity.to_f)
    display
  end

  def display
    puts "Heat index is #{heat_index.round(5)}"
  end

  def calculate_heat_index(t, rh)
    (
      16.923 + (0.185212 * t) + (5.37941 * rh) - (0.100254 * t * rh) +
      (0.00941695 * (t * t)) + (0.00728898 * (rh * rh)) +
      (0.000345372 * (t * t * rh)) - (0.000814971 * (t * rh * rh)) +
      (0.0000102102 * (t * t * rh * rh)) - (0.000038646 * (t * t * t)) +
      (0.0000291583 * (rh * rh * rh)) + (0.00000142721 * (t * t * t * rh)) +
      (0.000000197483 * (t * rh * rh * rh)) -
      (0.0000000218429 * (t * t * t * rh * rh)) +
      0.000000000843296 * (t * t * rh * rh * rh)
    ) - (0.0000000000481975 * (t * t * t * rh * rh * rh))
  end
end
