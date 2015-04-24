 Given(/^I bought (\d+) (\w+) beers$/) do |number, category|
   category = Category.find_or_create_by(name: category)
   number.to_i.times { |n| Beer.create(name: '', category: category) }
 end

 When(/^Open Home page$/) do
   visit root_path
   binding.pry
 end

Then(/^I should see (\d+) beers in list$/) do |arg1|
  page.has_css?('.table tbody tr:nth-child(2)')
end
