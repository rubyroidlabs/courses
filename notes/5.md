# Утилиты
* Base64
* Benchmark
* CMath
* CSV
* Date
* Time
* FileUtils
* File
* Matrix
* Vector
* Net::HTTP
* ObjectSpace
* OpenStruct
* PP
* Tempfile
* Time
* URI
* YAML

# Ruby features

## Hash
```
h = {a: 1, b: 2}
h.keys
h.values
h.each_pair
```

## Array

```
arr = [1,2,3,4,5,6]
```
===
```
arr.first #=> 1
arr.take(3) #=> [1, 2, 3]

arr.last  #=> 6
arr.drop(3) #=> [4, 5, 6]
```
===
```
arr.size # => 4
arr.length # => 4
arr.count # => 4
```
===
```
arr.empty?
```
===
```
arr.push
arr.pop

arr.shift
arr.unshift
```
===
```
arr.compact
arr.uniq
arr.reverse
arr.rotate 3
arr.sample
arr.shuffle
arr.slice => [1..2]
arr.sort
arr.transpose [[1,2], [3,4], [5,6]]
```
===
```
arr.each
arr.reverse_each
```
===
```
arr.map

arr.select
arr.keep_if

arr.reject
arr.delete_if
```
===
```
* operation

arr * 4
arr * ' '
```
===
```
arr + [10]
arr - [1]
arr << 10
arr << [10]
arr == [1,2,3,4,5,6]
```
===
```
arr.bsearch { }
```
===
```
arr.combination(2)
arr.repeated_combintion(2)
arr.permutation(3)
arr.repeated_permutation(2)
arr.product [7,8], [9,10]

arr.cycle(?3)
```
===
```
arr.fetch(3) { |i| 10 }
arr.fill 10, 1..3
```
===
```
arr.flatten
```

## Enumerable
===
```
arr.all?
arr.any?
```
===
```
[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5].chunk { |n|
  n.even?
}.each { |even, ary|
  p [even, ary]
}
```
===
```
arr.each_slice(2) {}
arr.each_slice(2).to_a #enumerator to array
arr.each_with_index
```

## Range
```
range = 1..4
arr = (1..6).to_a
arr = (1...6).to_a
range.include? 3
```

## Complex
```
Complex(0.3)         #=> (0.3+0i)
Complex('0.3-0.5i')  #=> (0.3-0.5i)
Complex('2/3+3/4i')  #=> ((2/3)+(3/4)*i)
Complex('1@2')       #=> (-0.4161468365471424+0.9092974268256817i)

0.3.to_c             #=> (0.3+0i)
'0.3-0.5i'.to_c      #=> (0.3-0.5i)
'2/3+3/4i'.to_c      #=> ((2/3)+(3/4)*i)
'1@2'.to_c           #=> (-0.4161468365471424+0.9092974268256817i)
```

## Dir
```
Dir.chdir("/var/spool/mail")
puts Dir.pwd
Dir.chdir("/tmp") do
  puts Dir.pwd
  Dir.chdir("/usr") do
    puts Dir.pwd
  end
  puts Dir.pwd
end
puts Dir.pwd

Dir.foreach("testdir") {|x| puts "Got #{x}" }
```
===
```
Dir["config.?"]                     #=> ["config.h"]
Dir.glob("config.?")                #=> ["config.h"]
Dir.glob("*.[a-z][a-z]")            #=> ["main.rb"]
Dir.glob("*.[^r]*")                 #=> ["config.h"]
Dir.glob("*.{rb,h}")                #=> ["main.rb", "config.h"]
Dir.glob("*")                       #=> ["config.h", "main.rb"]
```
===
```
Dir.mkdir(File.join(Dir.home, ".foo"), 0700) #=> 0
```


## File
```
File.absolute_path("~oracle/bin")
File.atime("testfile")
File.basename("/home/gumby/work/ruby.rb")
File.ctime("testfile")
File.directory?(file_name)
File.file?(file_name)
File.exists?(file_name)
```


## Benchmark
```
require 'benchmark'
include Benchmark          # we need the CAPTION and FORMAT constants

n = 50000
Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
  tf = x.report("for:")   { for i in 1..n; a = "1"; end }
  tt = x.report("times:") { n.times do   ; a = "1"; end }
  tu = x.report("upto:")  { 1.upto(n) do ; a = "1"; end }
  [tf+tt+tu, (tf+tt+tu)/3]
end
```

```
require 'benchmark'

array = (1..1000000).map { rand }

Benchmark.bmbm do |x|
  x.report("sort!") { array.dup.sort! }
  x.report("sort")  { array.dup.sort  }
end
```

## Math and CMath
Provide functions for real and comples numbers respectively.

```
Math.cos 1
Math.sin 1
Math.log 100
Math::E
Math::PI
```

## CSV
```
require 'csv'

csv_string = CSV.generate do |csv|
  csv << [1,2,3]
  csv << ['he','she','OHO']
  csv << [:do, :not, :know]
end
File.open('test.txt', 'w') { |f| f << csv_string }
```
===
```
CSV.foreach("path/to/file.csv") do |row|
  p row
end
```
===
```
CSV.parse("Class,Module,Object") do |row|
  p row
end
```


## ENV
```
export MYVAR=123
irb
ENV['MYVAR']
```

# Conclusion
1. Change your mind! You should think about logic not about implementation.
2. Write with the help of the language not using the language!
3. Have fun!

## Mechanize
```
require 'rubygems'
require 'mechanize'

a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

a.get('http://google.com/') do |page|
  search_result = page.form_with(:name => 'gbqf') do |search|
    search.q = 'Hello world'
  end.submit

  search_result.links.each do |link|
    puts link.text
  end
end

```

```
require 'rubygems'
require 'mechanize'

a = Mechanize.new
a.get('http://rubyforge.org/') do |page|
  # Click the login link
  login_page = a.click(page.link_with(:text => /Log In/))

  # Submit the login form
  my_page = login_page.form_with(:action => '/account/login.php') do |f|
    f.form_loginname  = ARGV[0]
    f.form_pw         = ARGV[1]
  end.click_button

  my_page.links.each do |link|
    text = link.text.strip
    next unless text.length > 0
    puts text
  end
end

```

```
require 'rubygems'
require 'mechanize'

agent = Mechanize.new
agent.set_proxy 'localhost', 8000
page = agent.get(ARGV[0])
puts page.body

```

## Домашка

### простое
парсер баш орга
и складывать в xml

### сложное
http://yoombe.com/awards/brv?id=303189503
http://bit.ly/1wftYlD
кликать на сердечко
есть ограничение на количество кликов в день
нужны прокси




=======

 
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


### Test

Напишите класс, которым бы можно было описать магистра Йоду. Если это покажется вам слишком легким, добавьте пару его учеников ( Квай-Гон Джинн и Люк Скайуокер). Если и это вас не затруднит, то добавьте Ситхов.

