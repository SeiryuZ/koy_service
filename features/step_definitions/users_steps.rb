Then /^I should (not )?see "(.*?)" element$/ do |flag, target|
  if not flag
  	page.should have_selector("#"+target) or   page.should have_selector("."+target)
  else
  	page.should_not have_selector("#"+target) and   page.should_not have_selector("."+target)
  end
end
