# Agenda
* Ruby + -
* Ruby history
* Ruby basics
* Git basics
* Homework

## Ruby basics

### Ruby advantages and disadvantages

#### "+" :
* Awesome ( show method_missing feature )
* You can do about everything you want
* Metaprogramming
* Gems
* Testing tools
* Fast changes

#### "-" :
* Fast changes
* Interpreter
* GC 
  * RUBY_GC_MALLOC_LIMIT for 2.0 - GC every 8Mb (picked many ears ago)
  * 2.1 - Koichi changed GC to malloc memory by factor
* What else?

### How to run ruby commands

* write simple "puts 'Hello world here and run it in 2 ways'"

```
puts "Chunky bacon!"
```


### How ruby works ( historical )
* 1.8
  * Maintained until June 2013
* 1.9 + 2.0
  * Performance

* Show my own little translator parser

```
ruby -e 'puts {is_this_a_block}' --dump parsetree
ruby -e 'puts {is_this_a_block}' --dump parsetree_with_comment
ruby -e 'five = 1+4; puts five' --dump insns
ruby -e 'five = 1+4; puts five' --dump yydebug
```


### Variables


* $ -	A global variable	$global_variable
* @ -	An instance variable	@instance_variable
* [a-z] or _ - A local variable	 local_variable
* [A-Z] - 	A constant	CONSTANT_VARIABLE
* @@ - A class variable	@@class_variable





### Mathematical Operators

```
#!/usr/bin/ruby
a = 0
# ++ and -- are not allowed in Ruby, but += and -= are.
a += 1
# Ruby won't automatically make a number into a String.
# You must do it manually by calling the "to_s" built in function
puts "a now = " + a => Exception
a_value = a_value + a_value # Что это?
puts "a_value now = " + a_value.to_s
# % + - * /  and so on but here is the best way:
puts "a_value now = #{ a_value }"
```

### Strings and comments

* One-line, multiline strings, comments

### Control Structures, Logical Operators and Loops

```
a = -1
if a == 0
  puts "a is 0"
elsif a_ == 1
  puts "a is 1"
else
  puts "a is something else"
end
/# Other Logical Operators ==, >, <, >=, <=, ||, && 

a == 1 ? 'da' : 'no' 

10.times { |num| puts "number = " + num.to_s }
1.upto(3) { |i| puts i }
3.downto(1) { |i| puts i }


enemies = rand(1..2000)
p enemies

case enemies
when 1..4     then puts "Немного"
when 5..9     then puts "Мало"
when 10..19   then puts "Группа"
when 20..49   then puts "Толпа"
when 50..99   then puts "Орда"
when 100..249 then puts "Сотня"
when 250..499 then puts "Туча"
when 500..999 then puts "Тьма"
when 1000..Float::INFINITY then puts "Легион"
end

```

// We can use thieves as an example :)

### Arrays and Loops


```
 family = ["mother", "father"] # %w{mother father}
 # add more to array
 family << 'son'
 family << 'daughter'
 family.each do |member|
   puts "Family includes #{member}"
 end

 # Key Value Map
 pairs = {"pasha" => "masha", "sasha" => "dasha", 'vova' => 'grisha'}
 pairs["vova"] = "julia"

pairs.each do|key,value|
   puts "The #{key} and the #{value}"
end
```

### Functions

```
 def method(somearg)
   return "You passed in "+ somearg
 end

 passing_in = "Hello World"
 return_value = myFunction(passing_in);
 puts return_value
```

* return vs no return
* default arguments
* key arguments


### Classes and Objects

```
$my_global_var = nil

class Example
 @@my_class_var = 'cv'
 
 def set_global_var(new_var)
   $my_global_var = new_var
 end
 
 def set_class_var(new_var)
   @@my_class_var = new_var
 end 
 
 def set_instance_var(new_var)
   @my_instance_var = new_var
 end
 
 def get_global_var()
   $my_global_var
 end
 
 def get_class_var()
   @@my_class_var
 end
 
 def get_instance_var()
   @my_instance_var
 end
end

 a_class = MyClass.new
 a_class.set_var("something")
 puts "Var: " + a_class.get_var
```

* = and ! methods
* deriving


### Ruby nil object

```
 var = nil
 if var.nil?
   puts "var is nil"
 else
    puts "var is not nil"
 end
```

### Command line arguments

```
$* is the number of arguments passed into the script.
ARGV is an array of those arguments.
ARGV[0] would be the first argument.
__FILE__
DATA
```


### Smallest programm

```
DATA.rewind
puts DATA.read
__END__
```

### File reading
```
file_data = File.read(local_filename.txt)
puts file_data
```

### File writing

```
 # 'w' = write
file = File.open(local_filename.txt, 'w')
file.puts("I'm writing something")
file.puts("Now I'm writing something else")
file << "This is the last thing I'll write"
file.close

string = "I'm writing something"
string << "This is the last thing I'll write"

File.open(local_filename.txt, 'w') { |file| file << string }
```

### Require
```
 require './file'
 
```

### Factorial

```
RubyVM::InstructionSequence.compile_option = { tailcall_optimization: true, trace_instruction: false}

eval <<CODE
  def factorial(n, result=1)
    if n == 1
      result
    else
      factorial(n-1, n*result)
    end
  end
CODE

p factorial(30_000)
exit

```


## Git and SVN
* git init
* git add
* git commit
* git branch
* git checkout
* git stash
* git merge
* git rebase
* git cherry-pick

## What is Gem and how to use it?

* install and use https://github.com/defunkt/colored + explain what is inside



## Hometask

* Write your own `sl` programm

