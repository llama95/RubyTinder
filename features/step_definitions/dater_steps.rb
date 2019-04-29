Given /^the following daters:$/ do |daters|
  Dater.create!(daters.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) dater$/ do |pos|
  visit daters_path
  within("table tr:nth-child(#{pos.to_i})") do
    click_link "Destroy"
  end
end

Then /^I should see the following daters:$/ do |expected_daters_table|
  expected_daters_table.diff!(tableish('table tr', 'td,th'))
end

When /I login as user (.*)/ do |user|
  steps %Q{
    And I am on the home page
    And I follow "Login"
    Given I fill in "Username" with "username #{user}"
    And I fill in "Password" with "password #{user}"
    And I press "Sign in"
        }
end
Given /^the following interests:$/ do |interests|
  Interest.create!(interests.hashes)
end
When /^(?:|I )fill in interests with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end
Then /^(?:|I )should see "dater was successfully created"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Given(/^I do not fill in interests$/) do
end

And(/^(.*) has interests (.*)$/) do |user, interests|
  a = Dater.find_by_username user
  interestsarr = interests.split ","
  interestsarr.each do |e|
    a.interests << Interest.new(:interest_name => e)
  end
end