Feature: User accounts
  In order to participate in Euruko, get notification and pay registration fee
  As a user
  I want to create account

  Scenario: Creating user account
    Given I access the site as guest
      And I am on the home page
    When I fill in "E-mail" with "user@example.com"
      And I fill in "Password" with "password"
      And I fill in "Password confirmation" with "password"
      And I fill in "First name" with "John"
      And I fill in "Last name" with "Doe"
      And I press "Create my account"
    Then I should see "We will notify you when the registration starts"

  Scenario: Creating user account with invalid e-mail
    Given I access the site as guest
      And I am on the home page
    When I fill in "E-mail" with "user.example.com"
      And I fill in "Password" with "password"
      And I fill in "Password confirmation" with "password"
      And I fill in "First name" with "John"
      And I fill in "Last name" with "Doe"
      And I press "Create my account"
    Then I should see "should look like an email address."

  Scenario: Creating the same user
    Given user with "E-mail" "user@example.com" exists
      And I access the site as guest
      And I am on the home page
    When I fill in "E-mail" with "user@example.com"
      And I fill in "Password" with "password"
      And I fill in "Password confirmation" with "password"
      And I fill in "First name" with "John"
      And I fill in "Last name" with "Doe"
      And I press "Create my account"
    Then I should see "already exists"
