Feature: Categories
  In order to categorize the articles
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

  Scenario: Get category
    Given the client is signed in as "Alice"
    And the "Tech" category exists
    And the client provides valid media type headers
    When the client sends a request to get the "Tech" category
    Then the status code should be 200
    And the body should contain the "Tech" category

  Scenario: Get category that does not exist
    Given the client is signed in as "Alice"
    And the client provides valid media type headers
    When the client sends a request to get a category that does not exist
    Then the status code should be 404

  Scenario: Create a category
    Given the client is signed in as "Alice"
    And the client provides valid media type headers
    When the client sends a request to create a category
    Then the status code should be 201
    And the response body should be empty

  Scenario: Create a category without a name
    Given the client is signed in as "Alice"
    And the client provides valid media type headers
    When the client sends a request to create a category without a name
    Then the status code should be 400
    And the body should contain an error for the "name" field

  Scenario: Create a category with a name that already exists
    Given the client is signed in as "Alice"
    And the "Tech" category exists
    And the client provides valid media type headers
    When the client sends a request to create the "Tech" category
    Then the status code should be 400
    And the body should contain an error for the "name" field

  Scenario: Update category
    Given the client is signed in as "Alice"
    And the "Tech" category exists
    And the client provides valid media type headers
    When the client sends a request to rename the "Tech" category to "Technology"
    Then the status code should be 204
    And the response body should be empty

  Scenario: Update category with an empty name
    Given the client is signed in as "Alice"
    And the "Tech" category exists
    And the client provides valid media type headers
    When the client sends a request to rename the "Tech" category to ""
    Then the status code should be 400
    And the body should contain an error for the "name" field

  Scenario: Delete category
    Given the client is signed in as "Alice"
    And the "Tech" category exists
    And the client provides valid media type headers
    When the client sends a request to delete the "Tech" category
    Then the status code should be 204
    And the response body should be empty

  Scenario: Search categories
    Given the client is signed in as "Alice"
    And the "Politics" category exists
    And the "Tech" category exists
    And the "Architecture" category exists
    And the client provides valid media type headers
    When the client sends a request to search for a category named "tec"
    Then the status code should be 200
    And the body should contain 2 categories
    And the body should contain the "Tech" category in the list
