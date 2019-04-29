Feature: Matches Inbox
  As a dater
  In order to meet people of similar interests
  I want to see other peoples interests


  Background:
    Given the following daters:
      |name|username|password|phone_number|gender|age|
      |name 1|username 1|password 1|phone_number 1|gender 1|1|
      |name 2|username 2|password 2|phone_number 2|gender 2|2|
    And username 2 has interests football,soccer


  Scenario: Can see a person's  interests while matching
    When I login as user 1
    Then I should see "football"
    And I should see "soccer"


