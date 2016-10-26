Feature: Categories
  In order to to categorize the articles
  As a user
  I need to interact with the categories

  Scenario: List categories
    Given the client is signed in as "Alice"
    And 2 categories exist
    And the client provides valid media type headers
    When the client sends a request to list categories
    Then the status code should be 200
    And the body should contain 2 categories

  Scenario: List categories while not signed in
    Given the client not signed in
    And the client provides valid media type headers
    When the client sends a request to list categories
    Then the status code should be 401
    And the response body should be empty
