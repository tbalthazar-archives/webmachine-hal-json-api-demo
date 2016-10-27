Feature: Readers
  In order to handle the readers of the articles
  As a user
  I need to be able to add/remove/list/get readers

  Scenario: List readers
    Given the client is signed in as "Alice"
    And there are 2 readers
    And the client provides valid media type headers
    When the client sends a request to list readers
    Then the status code should be 200
    And the body should contain 2 readers
