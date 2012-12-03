Given /^user on home page$/ do
  visit "/"
end

Given /^the following user exist$/ do |table|
  table.hashes.each do |hash|
    User.create(hash)
  end
end

When /^he typed <"(.*?)"> to "(.*?)"$/ do |input, target|
  fill_in target, :with => input
end

When /^he clicked "(.*?)"$/ do |target|
  clicked_on target
end

Then /^he should see <"(.*?)">$/ do |content|
  page.should have_content content
end