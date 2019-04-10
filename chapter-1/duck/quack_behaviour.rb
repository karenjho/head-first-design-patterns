class QuackBehaviour

  def initialize; end
  def quack; end

end

class Quack < QuackBehaviour

  def quack
    puts "Quack"
  end
end

class MuteQuack < QuackBehaviour

  def quack
    puts "<< silence >>"
  end
end

class Squeak < QuackBehaviour

  def quack
    puts "Squeak"
  end
end
