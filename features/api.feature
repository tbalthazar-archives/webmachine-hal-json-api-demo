Feature: API
  In order to be able to use the API
  As a user of the API
  I want to get a list of all available services

  Scenario: Get the API index
    When the client provides valid media type headers
    And the client sends a GET request to the root URL
    Then the response boddy should be:
      """json
      {
        "_links": {
          "self": {
            "href": "http://example.org/"
          }
        }
      }
      """
