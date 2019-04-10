require_relative 'weapon_behaviour'

class Character

  attr_accessor :weapon

  def initialize; end

  def fight
    weapon.use
  end
end

class Queen < Character

  def initialize
    self.weapon = BowAndArrowBehaviour.new
  end
end

class King < Character

  def initialize
    self.weapon = KnifeBehaviour.new
  end
end

class Knight < Character

  def initialize
    self.weapon = SwordBehaviour.new
  end
end

class Troll < Character

  def initialize
    self.weapon = AxeBehaviour.new
  end
end
