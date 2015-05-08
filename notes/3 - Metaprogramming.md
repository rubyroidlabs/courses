# Metaprogramming

## Monkey patching
* On matrix multiplection example

```
class Fixnum
  alias_method :plus, :+

  def self.adds
    @adds ||= 0
  end

  def self.adds=(arg)
    @adds = arg
  end

  define_method(:+) do |arg|
    self.class.adds = self.class.adds.send(:plus, 1)
    self.send(:plus,arg)
  end

end

## How ruby works?
```
ruby -e 'five = 1+4; puts five' --dump parsetree
ruby -e 'five = 1+4; puts five' --dump parsetree_with_comment
ruby -e 'five = 1+4; puts five' --dump insns
ruby -e 'five = 1+4; puts five' --dump yydebug
```
## Understanding self variable

The keyword self in Ruby gives you access to the current object – the object that is receiving the current message. To explain: a method call in Ruby is actually the sending of a message to a receiver. When you write obj.meth, you're sending the meth message to the object obj. obj will respond to meth if there is a method body defined for it. And inside that method body, self refers to obj. When I started with Ruby, I learned this pretty quickly, but it wasn't totally apparent when you might actually need to use self. I will outline the two most common use cases I've found for it.


## Ruby have ghosts
* http://madebydna.com/all/code/2011/06/24/eigenclasses-demystified.html

```
Dog = Class.new

class Dog
    # some doggie behavior here
end

Dog.class
=> Class

dog = Dog.new

def dog.wark
 puts 'Wark'
end

snoopy = Dog.new

dog.wark
snoopy.wark

```


## Send method

```
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
  	puts "#{name} is brushing teeth!"
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
sleep 0.3

dima.say_hello_to_mom
sleep 0.3


dima.brush_teeth
sleep 0.3

dima.take_coffee
sleep 0.3


dima.go_out
sleep 0.3

```

```
%i(wake_up say_hello_to_mom brush_teeth take_coffee go_out).each do |action|
 dima.send(action)
 sleep 0.3
end
```

## Define methods
	* def
	* define_method

```
class Laptop
  ROW = 30

  def initialize(name, cpu, hdd, price)
    @name, @cpu, @hdd, @price = name, cpu, hdd, price
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def cpu
    @cpu
  end

  def cpu=(val)
    @cpu = val
  end

  def hdd
    @hdd
  end

  def hdd=(val)
    @hdd = val
  end

  def price
    @price
  end

  def price=(val)
    @price= val
  end

  def to_s
    "#{@name.center(ROW)} | #{@cpu.center(ROW)} | #{@hdd.center(ROW)} | #{@price.center(ROW) }"
  end

end

laptops = []

laptops << Laptop.new('MacBook', '2.7 Intel I3879', '128 SSD', '1200$')
laptops << Laptop.new('Vintage', 'x8086', '8MB HDD 1200 rpm', '1100$')

puts laptops

```


## attr_whatever

```


```

## Method_missing

```
class Object
  def not
    Not.new(self)
  end

  class Not
    def initialize(original)
      @original = original
    end

    def method_missing(sym, *args, &blk)
      @original.send(sym, *args, &blk)
    end
  end
end

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def smith?
    @name == "Smith"
  end
end

guys = []
guys << Person.new("Smith")
guys << Person.new("New")
guys << Person.new("Trinity")
guys << Person.new("Morphius")

guys.each do |guy|
  if guy.smith?
  	puts "Kick #{guy.name} ass!"
  else
  	puts "Give #{guy.name} a candy!"
  end
end


```

## Evals


=======
