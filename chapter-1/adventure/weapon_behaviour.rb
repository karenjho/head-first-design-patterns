class WeaponBehaviour

  def initialize; end
  def use; end
end

class KnifeBehaviour < WeaponBehaviour

  def use
    puts "Cut with a knife"
  end
end

class SwordBehaviour < WeaponBehaviour

  def use
    puts "Swing a sword"
  end
end

class AxeBehaviour < WeaponBehaviour

  def use
    puts "Chop with an axe"
  end
end

class BowAndArrowBehaviour < WeaponBehaviour

  def use
    puts "Shoot an arrow with a bow"
  end
end
