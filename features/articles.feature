Feature: Articles
  In order to handle a collection of articles
  As a user
  I need to be able to add/remove/list/get articles

  Scenario: List articles in a category
    Given the client is signed in as "Alice"
    And the "Tech" category exists
    And there are 2 articles in the "Tech" category
    And the client provides valid media type headers
    When the client sends a request to list articles in the "Tech" category
    Then the status code should be 200
    And the body should contain 2 articles

  Scenario: Get an article
    Given the client is signed in as "Alice"
    And the "Linux on the desktop is a thing" article is in the "Tech" category
    And the client provides valid media type headers
    When the client sends a request to get the "Linux on the desktop is a thing" article
    Then the status code should be 200
    And the body should contain the "Linux on the desktop is a thing" article

  Scenario: Create an article in a category
    Given the client is signed in as "Alice"
    And the "Tech" category exists
    And the client provides valid media type headers
    When the client sends a request to create an article in the "Tech" category
    Then the status code should be 201
    And the response body should be empty
