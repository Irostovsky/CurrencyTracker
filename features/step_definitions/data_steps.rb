Given /^user with email "([^"]*)" exists$/ do |email|
  Factory :user, :email => email
end

Given /^I log in as user with email "([^"]*)"$/ do |email|
  steps <<-EOS
    And I fill in the following:
     | Email    | #{email} |
     | Password | 123123   |
    And I press "Sign in"
    And I should see "Signed in successfully."
  EOS
end

