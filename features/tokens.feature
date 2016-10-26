Feature: Tokens
  In order to use the protected API methods
  As a user
  I need to get an authentication token

  Scenario: Create a token
    Given the user "Alice" exists
    And the client provides valid media type headers
    When the client sends a valid request to create a token for "Alice"
    Then the status code should be 200
    And the body should contain a valid token

  Scenario: Create a token with an incorrect password
    Given the user "Alice" exists
    And the client provides valid media type headers
    When the client sends a request to create a token for "Alice" with a wrong password
    Then the status code should be 401
    And the response body should be empty

  Scenario: Create a token for a user that does not exist
    Given the client provides valid media type headers
    When the client sends a request to create a token for a user that does not exist
    Then the status code should be 401
    And the response body should be empty
