class FlyBehaviour

  def initialize; end
  def fly; end

end

class FlyWithWings < FlyBehaviour

  def fly
    puts "I'm flying!"
  end
end

class FlyNoWay < FlyBehaviour

  def fly
    puts "I can't fly."
  end
end

class FlyRocketPowered < FlyBehaviour
  
  def fly
    puts "I'm flying with a rocket!"
  end
end
