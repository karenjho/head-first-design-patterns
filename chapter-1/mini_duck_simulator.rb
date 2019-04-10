require_relative 'duck'

puts "Let's make a mallard duck"
mallard_duck = MallardDuck.new

puts "The mallard duck quacks"
mallard_duck.quack
puts "The mallard duck flies"
mallard_duck.fly
puts "The mallard duck swims"
mallard_duck.swim

puts "Let's make a model duck"
model_duck = ModelDuck.new

puts "The model duck quacks"
model_duck.quack
puts "The model duck flies"
model_duck.fly
puts "The model duck flies with rocket power"
model_duck.fly_behaviour = FlyRocketPowered.new
model_duck.fly
puts "The model duck swims"
model_duck.swim

