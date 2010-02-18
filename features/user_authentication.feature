Feature: User authentication
  In order to access my account
  As a user
  I want to log in with my previously provided credentials
  
  Scenario: Logging in
    Given user with "email" "john@example.com" exists
    When I go to the home page
      And I follow "Log in"
      And I fill in "E-mail" with "john@example.com"
      And I fill in "Password" with "user123"
      And I press "Log in"
    Then I should see "We will notify you when the registration starts"

  Scenario: Logging in fail
    Given user with "email" "john@example.com" exists
    When I go to the home page
      And I follow "Log in"
      And I fill in "E-mail" with "john@example.com"
      And I fill in "Password" with "user1234"
      And I press "Log in"
    Then I should see "Please log in"

  Scenario: Logging out
    Given I log in as user with email "john@example.com"
    When I follow "Log out"
    Then I should not be logged in
