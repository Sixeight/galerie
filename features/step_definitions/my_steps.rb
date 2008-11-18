Before do
  Fixtures.create_fixtures("spec/fixtures", "users")
end

Given /^I visited "(\w+)"$/ do |page|
  visit page
end

Then /^I should get message "([^"]+)"$/ do |message|
  flash.now[:notice].should == message
end
