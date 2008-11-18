
Feature: I use galerie as normal user
  Scenario: Go to login form
    Given I visited "index"
    When I follow "download"
    Then I should see "name"
    And I should see "pass"
    And I should see "Please login"

  Scenario: I'll miss login
    Given I visited "index"
    When I fill in "name" with "hoge"
    And I fill in "password" with "piyo"
    And I press "login"
    Then I should see "login"
    And I should get message "Invalid user/password cimbination"

  Scenario: Login
    Given I visited "index"
    When I fill in "name" with "tomohiro"
    And I fill in "password" with "hogehoge"
    And I press "login"
    Then I should not see "login"
    And I should see "logout"

  Scenario: Logout
    Given I visited "index"
    And I fill in "name" with "tomohiro"
    And I fill in "password" with "hogehoge"
    And I press "login"
    When I follow "logout"
    Then I should see "login"
    And I should not see "logout"

