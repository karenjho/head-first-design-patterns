require_relative 'fly_behaviour'
require_relative 'quack_behaviour'

class Duck

  attr_accessor :fly_behaviour, :quack_behaviour

  def initialize; end

  def fly
    fly_behaviour.fly
  end

  def quack
    quack_behaviour.quack
  end

  def swim
    puts "All ducks float, even decoys!"
  end
end

class MallardDuck < Duck

  def initialize
    self.fly_behaviour = FlyWithWings.new
    self.quack_behaviour = Quack.new
  end
end

