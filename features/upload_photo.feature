Feature: Upload Photos
  As a dater
  In order to meet people
  I want to register for an account



  Scenario: I can attatch a file without an error
    Given I am on the home page
    And I follow "Sign Up"
    And I fill up to age with valid input
    And I fill in "Age" with "22"
    And I attach the file "features/a.jpg" to "dater[profpic]"
    And I press "Save"
    Then I should be on the swipe page
