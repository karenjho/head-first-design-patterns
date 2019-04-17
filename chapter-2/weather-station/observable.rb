module Observable

  attr_accessor :observers, :changed

  def add_observer(observer)
    observers << observer
  end

  def delete_observer(observer)
    observers.delete(observer)
  end

  def notify_observers
    observers.each do |observer|
      observer.update(temperature, humidity, pressure)
    end
  end
end
