# Ruby testing


```
rails g model category name
rails g model beer name category:references quantity:integer
rails g model beer_action action:string beer:references quantity:integer
rails g controller beers

```

```
Category.create(name: 'Light'); Category.create(name: 'Dark')
100.times { |i| Beer.create(name: "Beer #{i}", category: Category.all.sample, quantity: rand(1..20)) }

```

* show some basic UI
* review tests
* explain fixtures
* switch to minitest

config.autoload_paths +=  Dir["#{config.root}/lib/"


* rspec explanation
* testing models
* simple beer creating test
* explaining database cleaner


http://loudcoding.com/posts/quick-tutorial-starting-with-cucumber-and-capybara-bdd-on-rails-project/


```
  1 Given(/^I bought (\d+) (\w+) beers$/) do |number, category|
  2   category = Category.find_or_create_by(name: category)
  3   number.to_i.times { |n| Beer.create(name: '', category: category) }
  4 end
  5
  6 When(/^Open Home page$/) do
  7   visit root_path
  8 end
  9
 10 Then(/^I should see (\d+) beers in list$/) do |arg1|
 11   page.has_css?('.table tbody tr:nth-child(2)')
 12 end
```


```
  1 Feature: Beer list
  2     Scenario: Open beer list
  3         Given I bought 2 Light beers
  4         When Open Home page
  5         Then I should see 2 beers in list
```

