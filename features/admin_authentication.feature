Feature: Admin authentication
  In order to access my account
  As a admin
  I want to log in with my credentials

  Scenario: Logging in as admin
    Given admin with "email" "john@example.com" exists
    When I go to the administration home page
      And I fill in "E-mail" with "john@example.com"
      And I fill in "Password" with "user123"
      And I press "Log in"
    Then I should see "You are now logged in as admin"
      And I should see "Administrator: Chuck Norris"

  Scenario: Logging out
    Given admin with "email" "john@example.com" exists
    When I go to the administration home page
      And I fill in "E-mail" with "john@example.com"
      And I fill in "Password" with "user123"
      And I press "Log in"
      And I follow "Log out"
    Then I should see "logged out"
      And I should see "Log in"

  Scenario: Log in fail
    Given admin with "email" "john@example.com" exists
    When I go to the administration home page
      And I fill in "E-mail" with "john@example.com"
      And I fill in "Password" with "user124"
      And I press "Log in"
    Then I should see "Login or password is not valid"
