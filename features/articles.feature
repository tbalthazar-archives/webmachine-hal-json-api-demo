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

  Scenario: Create an article without a title in a category
    Given the client is signed in as "Alice"
    And the "Tech" category exists
    And the client provides valid media type headers
    When the client sends a request to create an article without a title in the "Tech" category
    Then the status code should be 400
    And the body should contain an error for the "title" field

  Scenario: Update an article
    Given the client is signed in as "Alice"
    And the "Linux on the desktop is a thing" article is in the "Tech" category
    And the client provides valid media type headers
    When the client sends a request to change the title of the "Linux on the desktop is a thing" article into "Linux rUleZ!"
    Then the status code should be 204
    And the response body should be empty

  Scenario: Delete an article
    Given the client is signed in as "Alice"
    And the "Linux on the desktop is a thing" article is in the "Tech" category
    And the client provides valid media type headers
    When the client sends a request to delete the "Linux on the desktop is a thing" article
    Then the status code should be 204
    And the response body should be empty

  Scenario: List readers of an article
    Given the client is signed in as "Alice"
    And the "Linux on the desktop is a thing" article is in the "Tech" category
    And the "Jane" reader exists
    And "Jane" has access to the "Linux on the desktop is a thing" article
    And the client provides valid media type headers
    When the client sends a request to list readers of the "Linux on the desktop is a thing" article
    Then the status code should be 200
    And the body should contain 1 readers

  Scenario: Search articles
    Given the client is signed in as "Alice"
    And the "Linux on the desktop is a thing" article is in the "Tech" category
    And the "Beautiful desktop wallpapers" article is in the "Tech" category
    And the "Everything in the terminal" article is in the "Tech" category
    And the client provides valid media type headers
    When the client sends a request to search for an article titled "desk"
    Then the status code should be 200
    And the body should contain 2 articles
