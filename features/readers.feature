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

  Scenario: Get reader
    Given the client is signed in as "Alice"
    And the "Jane" reader exists
    And the client provides valid media type headers
    When the client sends a request to get the "Jane" reader
    Then the status code should be 200
    And the body should contain the "Jane" reader

  Scenario: List articles of a reader
    Given the client is signed in as "Alice"
    And the "Linux on the desktop is a thing" article is in the "Tech" category
    And the "Jane" reader exists
    And "Jane" has access to the "Linux on the desktop is a thing" article
    And the client provides valid media type headers
    When the client sends a request to list articles of the "Jane" reader
    Then the status code should be 200
    And the body should contain 1 articles
