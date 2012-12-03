

When /^I click "(.*?)"$/  do |target|
  page.click_on(target)
end

Given /^I am on home page$/ do
  visit "/"
end

Given /^the following user exist$/ do |table|
  table.hashes.each do |hash|
    user = User.new()
    user.username = hash[:username]
    user.password = hash[:password]
    user.save!
  end
end

When /^I type <"(.*?)"> to "(.*?)"$/ do |input, target|
  page.fill_in target, :with => input
end



Then /^I should see <"(.*?)">$/ do |content|
  page.should have_content content
end