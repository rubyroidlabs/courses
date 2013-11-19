class People

  def initialize(name)
    @name = name
  end

  def wake_up
    puts "#{@name} is waking up!"
  end

  def say_hello_to_mom
    puts "#{@name} is saying hello to mom!"
  end

  def brush_teeth
    puts "#{@name} is brushing teeth!"
  end

  def take_coffee
    puts "#{@name} is taking coffee!"
  end

  def go_out
    puts "#{@name} is going out!"
  end

end

dima = People.new("Dima")

dima.wake_up
sleep 0.15

dima.say_hello_to_mom
sleep 0.15


dima.brush_teeth
sleep 0.15

dima.take_coffee
sleep 0.15

dima.go_out
sleep 0.15
