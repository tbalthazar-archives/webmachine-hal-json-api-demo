Feature: Access
  In order to handle the access to the articles
  As a user
  I need to be able to grant/revoke access to articles

  Scenario: Grant access
    Given the client is signed in as "Alice"
    And the "Linux on the desktop is a thing" article is in the "Tech" category
    And the "Jane" reader exists
    And the client provides valid media type headers
    When the client sends a request to grant "Jane" access to "Linux on the desktop is a thing"
    Then the status code should be 204
    And the response body should be empty

  Scenario: Revoke access
    Given the client is signed in as "Alice"
    And the "Linux on the desktop is a thing" article is in the "Tech" category
    And the "Jane" reader exists
    And "Jane" has access to the "Linux on the desktop is a thing" article
    And the client provides valid media type headers
    When the client sends a request to revoke "Jane" access to "Linux on the desktop is a thing"
    Then the status code should be 204
    And the response body should be empty
