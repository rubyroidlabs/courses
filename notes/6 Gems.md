#Gem
* Что такое гем?
* Зачем они нужны?
* Из чего состоит гем
* В чем плюс в отличие от C подобных языков?
* extconf
* Как установить гем?
* Куда он устанавливается?
* Как создать свой гем?
* Как дебажить гем?
* Как опубликовать гем?
* Какие могут возникнуть проблемы (версии и зависимости)?
* Как эти проблемы решаются?
* Gemfile & bundler

## Гем

Each gem has a name, version, and platform

## Составляющие

* Code (including tests and supporting utilities)
* Documentation
* gemspec

## Структура

```
% tree freewill
freewill/
├── bin/
│   └── freewill
├── lib/
│   └── freewill.rb
├── test/
│   └── test_freewill.rb
├── README
├── Rakefile
└── freewill.gemspec
```

## Gemspec

```
% cat freewill.gemspec
Gem::Specification.new do |s|
  s.name        = 'freewill'
  s.version     = '1.0.0'
  s.summary     = "Freewill!"
  s.description = "I will choose Freewill!"
  s.authors     = ["Nick Quaranto"]
  s.email       = 'nick@quaran.to'
  s.homepage    = 'http://example.com/freewill'
  s.files       = ["lib/freewill.rb", ...]
end
```

## Создание гема

1. Создать структуру `lib`
2. Добавить файл `my_gem.gemspec`
3. `gem build my_gem.gemspec`
4. `gem install ./my_gem.gem`
5. `gem push hola-0.0.0.gem`

## Именование

* fancy_require => require 'fancy_require'	
* net-http-persistent => require 'net/http/persistent'	
* net-http-digest_auth => require 'net/http/digest_auth'
* Don’t use UPPERCASE letters

## Gemfile & bundler

```
source 'https://rubygems.org'

ruby '2.1.4'

gem 'rails', '~> 4.0.10rc2'

gem 'angular-rails-templates', github: 'Saicheg/angular-rails-templates'

group :development, :qc, :test do
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
end

group :profile do
  gem 'ruby-prof'
end
```

## Gemfile.lock

```
GIT
  remote: git://github.com/Saicheg/angular-rails-templates.git
  revision: 60ad64236a97079928917e3b2d7e763329c0c3c9
  specs:
    angular-rails-templates (0.0.5)
      actionpack
      railties (>= 3.1)
      sprockets

GIT
  remote: git://github.com/nixme/jazz_hands.git
  revision: 5e4b48f145883ecb14b55bf04eacc28ac9662676
  branch: bring-your-own-debugger
  specs:
    jazz_hands (0.5.2)
      awesome_print (~> 1.2)
      coolline (>= 0.4.2)
      hirb (~> 0.7.1)
      pry (~> 0.9.12)
      pry-doc (~> 0.4.6)
      pry-git (~> 0.2.3)
      pry-rails (~> 0.3.2)
      pry-remote (>= 0.1.7)
      pry-stack_explorer (~> 0.4.9)
      railties (>= 3.0, < 5.0)

GEM
  remote: https://rubygems.org/
  specs:
    actionmailer (4.0.10)
      actionpack (= 4.0.10)
      mail (~> 2.5, >= 2.5.4)
    actionpack (4.0.10)
      activesupport (= 4.0.10)
      builder (~> 3.1.0)
      erubis (~> 2.7.0)
      rack (~> 1.5.2)
      rack-test (~> 0.6.2)
    activemodel (4.0.10)
      activesupport (= 4.0.10)
      builder (~> 3.1.0)
    activerecord (4.0.10)
      activemodel (= 4.0.10)
      activerecord-deprecated_finders (~> 1.0.2)
      activesupport (= 4.0.10)
      arel (~> 4.0.0)
    activerecord-deprecated_finders (1.0.3)
    activesupport (4.0.10)
      i18n (~> 0.6, >= 0.6.9)
      minitest (~> 4.2)
      multi_json (~> 1.3)
      thread_safe (~> 0.1)
      tzinfo (~> 0.3.37)
    arel (4.0.2)
    atomic (1.1.16)
    awesome_print (1.2.0)
    binding_of_caller (0.7.2)
      debug_inspector (>= 0.0.1)
    builder (3.1.4)
    coderay (1.1.0)
    coolline (0.5.0)
      unicode_utils (~> 1.4)
    debug_inspector (0.0.2)
    diff-lcs (1.2.5)
    diffy (3.0.7)
    erubis (2.7.0)
    grit (2.5.0)
      diff-lcs (~> 1.1)
      mime-types (~> 1.15)
      posix-spawn (~> 0.3.6)
    hike (1.2.3)
    hirb (0.7.2)
    i18n (0.6.11)
    mail (2.6.1)
      mime-types (>= 1.16, < 3)
    method_source (0.8.2)
    mime-types (1.25.1)
    minitest (4.7.5)
    multi_json (1.10.1)
    posix-spawn (0.3.9)
    pry (0.9.12.6)
      coderay (~> 1.0)
      method_source (~> 0.8)
      slop (~> 3.4)
    pry-doc (0.4.6)
      pry (>= 0.9)
      yard (>= 0.8)
    pry-git (0.2.3)
      diffy
      grit
      pry (>= 0.9.8)
    pry-rails (0.3.2)
      pry (>= 0.9.10)
    pry-remote (0.1.8)
      pry (~> 0.9)
      slop (~> 3.0)
    pry-stack_explorer (0.4.9.1)
      binding_of_caller (>= 0.7)
      pry (>= 0.9.11)
    rack (1.5.2)
    rack-test (0.6.2)
      rack (>= 1.0)
    rails (4.0.10)
      actionmailer (= 4.0.10)
      actionpack (= 4.0.10)
      activerecord (= 4.0.10)
      activesupport (= 4.0.10)
      bundler (>= 1.3.0, < 2.0)
      railties (= 4.0.10)
      sprockets-rails (~> 2.0)
    railties (4.0.10)
      actionpack (= 4.0.10)
      activesupport (= 4.0.10)
      rake (>= 0.8.7)
      thor (>= 0.18.1, < 2.0)
    rake (10.1.0)
    ruby-prof (0.15.1)
    slop (3.6.0)
    sprockets (2.11.0)
      hike (~> 1.2)
      multi_json (~> 1.0)
      rack (~> 1.0)
      tilt (~> 1.1, != 1.3.0)
    sprockets-rails (2.2.0)
      actionpack (>= 3.0)
      activesupport (>= 3.0)
      sprockets (>= 2.8, < 4.0)
    thor (0.19.1)
    thread_safe (0.1.3)
      atomic
    tilt (1.4.1)
    tzinfo (0.3.42)
    unicode_utils (1.4.0)
    yard (0.8.7.4)

PLATFORMS
  ruby

DEPENDENCIES
  angular-rails-templates!
  jazz_hands!
  rails (~> 4.0.10rc2)
  ruby-prof

```

---
# Домашнее задание
Создать гем, который будет monkeypatch'ить объекты Time в руби и добавит  функционал http://www.ruby-doc.org/core-2.1.4/Time.html#method-i-strftime

### Примеры

DateTime.now.ymd => strftime("%y %m %d")
DateTime.now.Bd => strftime("%B %d")
DateTime.now.M3N => strftime("%M %3N")


### Документация

```
Date (Year, Month, Day):    

        
  %Y - Year with century (can be negative, 4 digits at least)
          -0001, 0000, 1995, 2009, 14292, etc.
  %C - year / 100 (rounded down such as 20 in 2009)
  %y - year % 100 (00..99)

  %m - Month of the year, zero-padded (01..12)
          %_m  blank-padded ( 1..12)
          %-m  no-padded (1..12)
  %B - The full month name (``January'')
          %^B  uppercased (``JANUARY'')
  %b - The abbreviated month name (``Jan'')
          %^b  uppercased (``JAN'')
  %h - Equivalent to %b

  %d - Day of the month, zero-padded (01..31)
          %-d  no-padded (1..31)
  %e - Day of the month, blank-padded ( 1..31)

  %j - Day of the year (001..366)
```

```
Time (Hour, Minute, Second, Subsecond):
  %H - Hour of the day, 24-hour clock, zero-padded (00..23)
  %k - Hour of the day, 24-hour clock, blank-padded ( 0..23)
  %I - Hour of the day, 12-hour clock, zero-padded (01..12)
  %l - Hour of the day, 12-hour clock, blank-padded ( 1..12)
  %P - Meridian indicator, lowercase (``am'' or ``pm'')
  %p - Meridian indicator, uppercase (``AM'' or ``PM'')

  %M - Minute of the hour (00..59)

  %S - Second of the minute (00..60)

  %L - Millisecond of the second (000..999)
       The digits under millisecond are truncated to not produce 1000.
  %N - Fractional seconds digits, default is 9 digits (nanosecond)
          %3N  millisecond (3 digits)
          %6N  microsecond (6 digits)
          %9N  nanosecond (9 digits)
          %12N picosecond (12 digits)
          %15N femtosecond (15 digits)
          %18N attosecond (18 digits)
          %21N zeptosecond (21 digits)
          %24N yoctosecond (24 digits)
       The digits under the specified length are truncated to avoid
       carry up.
```

```
Time zone:
  %z - Time zone as hour and minute offset from UTC (e.g. +0900)
          %:z - hour and minute offset from UTC with a colon (e.g. +09:00)
          %::z - hour, minute and second offset from UTC (e.g. +09:00:00)
          ```
  %Z - Abbreviated time zone name or similar information.
```

```
Weekday:
  %A - The full weekday name (``Sunday'')
          %^A  uppercased (``SUNDAY'')
  %a - The abbreviated name (``Sun'')
          %^a  uppercased (``SUN'')
  %u - Day of the week (Monday is 1, 1..7)
  %w - Day of the week (Sunday is 0, 0..6)

ISO 8601 week-based year and week number:
The first week of YYYY starts with a Monday and includes YYYY-01-04.
The days in the year before the first week are in the last week of
the previous year.
  %G - The week-based year
  %g - The last 2 digits of the week-based year (00..99)
  %V - Week number of the week-based year (01..53)
```

```
Week number:
The first week of YYYY that starts with a Sunday or Monday (according to %U
or %W). The days in the year before the first week are in week 0.
  %U - Week number of the year. The week starts with Sunday. (00..53)
  %W - Week number of the year. The week starts with Monday. (00..53)
```

```
Seconds since the Epoch:
  %s - Number of seconds since 1970-01-01 00:00:00 UTC.
```

```
Literal string:
  %n - Newline character (\n)
  %t - Tab character (\t)
  %% - Literal ``%'' character
```

```
Combination:
  %c - date and time (%a %b %e %T %Y)
  %D - Date (%m/%d/%y)
  %F - The ISO 8601 date format (%Y-%m-%d)
  %v - VMS date (%e-%^b-%4Y)
  %x - Same as %D
  %X - Same as %T
  %r - 12-hour time (%I:%M:%S %p)
  %R - 24-hour time (%H:%M)
  %T - 24-hour time (%H:%M:%S)
```