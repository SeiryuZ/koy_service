

When /^I click "(.*?)"$/  do |target|
  page.click_on(target)
end

Given /^I am on "(.*?)"$/ do |target|

  if target == "home page"
    visit root_path
  elsif target == "user index page"
    visit user_index_path
  end

end

Given /^the following user exist$/ do |table|
  table.hashes.each do |hash|
    user = User.new()
    user.username = hash[:username]
    user.password = hash[:password]
    user.set_admin = hash[:admin]
    user.save!
  end
end

When /^I type "(.*?)" to "(.*?)"$/ do |input, target|
  page.fill_in target, :with => input
end



Then /^I should see "(.*?)"$/ do |content|
  page.text.should include content
end


When /^I am authenticated$/ do
  page.fill_in "username", :with => "admin"
  page.fill_in "password", :with => "passwordadmin"
  page.click_on("login")
end
