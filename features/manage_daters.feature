Feature: Manage daters
  As a dater
  In order to meet people
  I want to register for an account


  Background:
    Given I am on the home page
    And I follow "Sign Up"
    And I fill up to age with valid input
  
  Scenario: Register new dater with valid age
    And I fill in "Age" with "22"
    And I press "Save"
    Then I should be on the swipe page


  Scenario: Register A Dater That Is Too Young
    When I fill in "Age" with "16"
    And I press "Save"
    Then I should see "User requirements not met"

  Scenario: Delete dater
    Given the following daters:
      |name|username|password|phone_number|gender|age|
      |name 1|username 1|password 1|phone_number 1|gender 1|1|
      |name 2|username 2|password 2|phone_number 2|gender 2|2|
      |name 3|username 3|password 3|phone_number 3|gender 3|3|
      |name 4|username 4|password 4|phone_number 4|gender 4|4|
    When I delete the 3rd dater
    Then I should not see "username 3"

  Scenario: Succesfully create a dater
    Given I fill in "Username" with "username 1"
    And I fill in "Password" with "password"
    And I fill in "Age" with "25"
    And I fill in "Name" with "Abny"
    And I fill in "Username" with "joeyyy"
    And I fill in "Password" with "Malcolm"
    And I fill in "Phone number" with "69"
    And I fill in "Interests" with "juggling"
    And I press "Save"
    Then I should see "Swipe to find love"
