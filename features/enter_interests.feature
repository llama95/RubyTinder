Feature: Enter Interests
  As a dater
  In order to express what I like
  I want to input my interests


  Background:
    Given I am on the home page
    And I follow "Sign Up"
    And I fill up to age with valid input
    And I fill in "Age" with "22"

  Scenario: Add an interest and see it on my profile
    Given I fill in "Interests" with "football,hockey,soccer"
    Then I press "Save"
    When I go to the view profile page of username 1
    Then I should see "football , hockey , soccer"


  Scenario: Add no interest and still succeed at creating account
    Given I do not fill in interests
    Then I press "Save"
    Then I should be on the swipe page