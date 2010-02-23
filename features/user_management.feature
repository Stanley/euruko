Feature: User management
  In order to list all users of Euruko
  As an admin
  I want to manage users

  Scenario: Detailing user
    Given I log in as admin
      And user with "email" "john@example.com" exists
    When I follow "Browse" within "li.users"
      And I follow "details"
    Then I should see "john@example.com"

  Scenario: Adding user
    Given I log in as admin
      And I follow "New"
    When I fill in "E-mail" with "user@example.com"
      And I fill in "Password" with "password"
      And I fill in "Password confirmation" with "password"
      And I fill in "First name" with "John"
      And I fill in "Last name" with "Doe"
      And I press "Create my account"
    Then I should see "All users"
      And I should see "user@example.com"
        

  Scenario: Editing user's presentation

  Scenario: Editing user's billing

