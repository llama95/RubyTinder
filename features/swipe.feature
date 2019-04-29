Feature: Swiping
  As a dater
  In order to select who I like
  I want to be able to swipe on potential matches


  Background:
    Given the following daters:
      |name|username|password|phone_number|gender|age|
      |name 1|username 1|password 1|phone_number 1|gender 1|1|
      |name 2|username 2|password 2|phone_number 2|gender 2|2|
      |name 3|username 3|password 3|phone_number 3|gender 3|3|
      |name 4|username 4|password 4|phone_number 4|gender 4|4|
    When I login as user 1

  Scenario: Sign in as dater with correct credentials
    When I press "✓"
    Then I should be on the swipe page

  Scenario: Sign in as dater with correct credentials
    When I press "X"
    Then I should be on the swipe page

