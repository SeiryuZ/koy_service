Then /^I should (not )?see "(.*?)" element$/ do |flag, target|
  if not flag
  	page.should have_selector("#"+target) or   page.should have_selector("."+target)
  else
  	page.should_not have_selector("#"+target) and   page.should_not have_selector("."+target)
  end
end




When /^I fill "(.*?)" with (in)?valid data$/ do |target, flag|
  if not flag
    page.fill_in "user[username]", :with => "admin123"
    page.fill_in "user[password]", :with => "admin123"
    page.fill_in "user[password_confirmation]", :with => "admin123"
  else
    page.fill_in "user[username]", :with => ""
    page.fill_in "user[password]", :with => "admin123"
    page.fill_in "user[password_confirmation]", :with => "admin123"
  end

end
