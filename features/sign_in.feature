Feature: Sign In
  As a dater
  Who does not want anyone else using my account
  I want to authenticate myself


  Background:
    Given the following daters:
      |name|username|password|phone_number|gender|age|
      |name 1|username 1|password 1|phone_number 1|gender 1|1|
    And I am on the home page
    And I follow "Login"

  Scenario: Sign in as dater with correct credentials
    Given I fill in "Username" with "username 1"
    And I fill in "Password" with "password 1"
    And I press "Sign in"
    Then I should be on the swipe page

  Scenario: Sign in as dater with incorrect credentials
    Given I fill in "Username" with "username 1"
    And I fill in "Password" with "password 2"
    And I press "Sign in"
    Then I should see "Username and/or password does not exist"

