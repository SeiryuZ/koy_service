

When /^I click "(.*?)"$/  do |target|
  page.find("##{target}").click()
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



Then /^I should (not )?see "(.*?)"$/ do |flag, content|
  if not flag
    page.text.should include content
  else
    page.text.should_not include content
  end
end


When /^I am authenticated as "(.*?)"$/ do |target|
  if target == "admin"
    page.fill_in "username", :with => "admin"
    page.fill_in "password", :with => "admin"
    page.click_on("login")
  else
    page.fill_in "username", :with => "steven"
    page.fill_in "password", :with => "password"
    page.click_on("login")
  end
end
