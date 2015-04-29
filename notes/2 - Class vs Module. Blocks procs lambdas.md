# Agenda

## Class vs Module

```
class C
end

module M
end
```

#### Instantiation
* Class can be instantiated
* Module can *not* be instantiated

```
C.new
M.new # error
```

#### Usage
* Class is used for object creation
* Moudle is used for mixin facility or to provide a namespace.

#### OOP
* Encapsulation
* Inheritance
* Polymorphism

#### Superclass (Class < Module < Object)
*  Class superclass is a Module
*  Module superclass is an Object

```
C.superclass  #=> Module
M.superclass  #=> Object
```

#### Inheritance
* Class inherits behavior and can be base for inheritance
* Ruby has single inheritance mechanism
* Module has no inheritance

```
class ChildOfC < C
end

module ChildOfM < M  #=> Error
end
```

#### Inclusion
* Class cannot be included
* Module can be included in classes and modules by using the include command (includes all instance methods as instance methods in class/module)

```
module Foo
  def foo
    puts 'foo'
  end
end

class IHaveFoo
  include Foo
end

IHaveFoo.new.foo  # Success! Instance method
IHaveFoo.foo      # Error! Class method
```

#### Extension
* Class can not extend with extend command (only with inheritance)
* Module can extend instance by using extend command (extends given instance with singleton methods from module)

```
module Foo
  def foo
    puts 'foo'
  end
end

class IAlsoHaveFoo
  extend Foo
end

IAlsoHaveFoo.new.foo # Error! Instance method
IAlsoHaveFoo.foo     # Success! Class method
```

#### Module might be nested in 2 ways:

1. BAD

```
module Cartoon
  NAME = 'aladdin'
end

module Cartoon::Poster
  def poster
    p "#{NAME} is the best OMFG#(*YY cartoon"
  end
end
```

2. GOOD

```
module Cartoon
  NAME = 'Винни Пух'
end

module Cartoon
  module Poster
    def poster
      p "#{NAME} is the best OMFG#(*YY cartoon"
    end
  end
end
```

#### Classes might be updated at any time
```
class Draft
  def self.foo
    p 'foo'
  end
end

Draft.foo  #=> 'foo'

class Draft
  def self.bar
    p 'bar'
  end
end

Draft.foo  #=> 'foo'
Draft.bar  #=> 'bar'
```

#### Eigenclass

```
snoopy = Dog.new
def snoopy.alter_ego
  "Red Baron"
end

snoopy.alter_ego
  # => "Red Baron"

fido.alter_ego
  # => NoMethodError: undefined method `alter_ego' for #<Dog:0x0000000190cee0>
```

```
class Object 
  def eigenclass 
    class << self
      self
    end 
  end 
end
```

```
class Dog
end

snoopy = Dog.new
=> #<Dog:0x00000001c4a170>

snoopy.eigenclass
=> #<Class:#<Dog:0x00000001c4a170>>

snoopy.eigenclass.superclass
=> Dog
```

#### Conclusion
Modules and classes have different aims! Different aims create different approaches and implementations. Classes are intended to create instances and to interpret them as real object models. Modules are intended to share functionallity between classes and other modules.




## Blocks procs and lambdas

#### Block
```
a = [1,2,3]
b = a.map { |digit| digit ** 3 }  #=> [1, 8, 27]
```

#### Lambda
```
lambda = lambda { |digit| digit ** 4 }
lambda = -> { |digit| digit ** 3 }
lambda.call 2  #=> 8
lambda[2]      #=> 8
```

#### Proc
```
proc = Proc.new { |digit| digit ** 3 }
proc.call 2  #=> 8
proc[2]      #=> 8
```

#### But they all are procs!

```
def simple_log(&block)
  p block.class
end

simple_log { 1 + 2 }  #=> <Proc…>
p lambda.class        #=> <Proc…(lambda)>
p proc.class          #=> <Proc…>
```

#### WTF? What is the difference?

1. Lambda throws an error if count of arguments (arity) does not match. Proc will silently work.

```
def args(code)
  code.call 1, 2
end

myproc = Proc.new{|a, b, c| puts "Give me a #{a} and a #{b} and a #{c.class}"}
mylambda = lambda{|a, b, c| puts "Give me a #{a} and a #{b} and a #{c.class}"}

args myproc    #=> "Give me a 1 and a 2 and a nil"
args mylambda  #=> Error! You should pass 3 arguments instead of 2
```

2. Lambda created additional scope like a function. Proc does not. As a result *return* keyword works differently inside proc and lambda.

```
def proc_return
  # return will jump out of the function and further execution.
  # The return value of the function will be "Proc.new"

  Proc.new { return "Proc.new"}.call
  return "proc_return method finished"
end

def lambda_return
  # return will jump out of the lambda and continue the function execution.
  # The return value of the function will be "lambda_return method finished"

  lambda { return "lambda" }.call
  return "lambda_return method finished"
end

puts proc_return    #=> Proc.new
puts lambda_return  #=> lambda_return method finished
```

---


<<<<<<< HEAD
* Какая разница между Symbol и String?
* Для чего используется yield?
* Для чего используется super?
* Для чего используются методы с "!" и "?" на конце?
* Что такое модуль и для чего он используется?
* Какой модификатор доступа по умолчанию (public/protected/private) применяется к методу?
* Что такое Range?* 
* Как можно в руби эмулировать перегрузку методов?


### Test

```
 1  class Taco < MexicanFood
 2    includes Menu
 3  
 4  attr_accessor :consumers
 5  
 6  def self.is_taco?
 7    true
 8  end
 9  
10  def initialize
11    add_to_menu(self)
12  end
13  
14  def is_really_a_taco?
15    self.class == Taco
16  end
17  
18  def add_developers_to_taco
19    devs = ['Bryan', 'Johnny', 'RJ', 'Arthur']
20    devs.each { |x| @consumers[x] = true }
21  end
22  
23  def add_non_devs_to_taco
24    non_devs = ['Rick', 'Jason', 'Alex']
25    non_devs.map { |x| @consumers[x] = true }
26  end
27  
28  def is_on_menu?
29    menu_items.include?(self)
30  end
31  
32  def condiments
33    self.condiments.collect { |x| x.name }
34  end
35  
36  def is_a_person_eating?(name=nil)
37    @consumers.keys.include?(name) if name
38  end  
40  
41  protected
42  
43  def is_really_good?
44    true # of course, tacos are always good
45  end
46  
47 end
```

Вопросы:

1) Что выражается на #1?
2) Что выражается на #2?
3) Что выражается на #6?
4) На #11, откуда взялся add_to_menu?
5) Что делает метод на #18 и что он вернет?
6) Что делает метод на #23 и что он вернет?
7) На #29, чем явлется self?
8) На #33, что происходит и какие могут возникнуть проблемы?
9) На #37, откуда берется переменна @consumers?
10) На #47 как можно вызвать этот метод из вне?


### Test

Напишите программу, которая выводит таблицу умножения на экран. Для тех кто забыл:

   1   2   3   4   5   6   7   8   9  10  11  12
   2   4   6   8  10  12  14  16  18  20  22  24
   3   6   9  12  15  18  21  24  27  30  33  36
   4   8  12  16  20  24  28  32  36  40  44  48
   5  10  15  20  25  30  35  40  45  50  55  60
   6  12  18  24  30  36  42  48  54  60  66  72
   7  14  21  28  35  42  49  56  63  70  77  84
   8  16  24  32  40  48  56  64  72  80  88  96
   9  18  27  36  45  54  63  72  81  90  99 108
  10  20  30  40  50  60  70  80  90 100 110 120
  11  22  33  44  55  66  77  88  99 110 121 132
  12  24  36  48  60  72  84  96 108 120 132 144


### Test

Написать программу, которая бы модифицировала оператор + таким образом, чтобы он каждый раз возвращал на 1 больше.


### Test

Напишите программу, которая выводит n-ое число Фибонначи на экран. Напомним что числа Фиббоначи считаются как сумма предыдущих двух чисел, где первые два элемента это 0 и 1.


## Test

Напишите класс, которым бы можно было описать магистра Йоду. Если это покажется вам слишком легким, добавьте пару его учеников ( Квай-Гон Джинн и Люк Скайуокер). Если и это вас не затруднит, то добавьте Ситхов.
