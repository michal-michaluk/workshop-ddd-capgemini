Feature: New employee

  employee has unique identifier
  basic permissions was generated for new employee
  new user added to User List

  Scenario: Brajan is our new employee
    Given "Brajan" was not an employee
    When "Brajan" become an employee
    Then new user is create
    And "Brajan" is visible on User List
    And "Brajan" will receive permissions to:
      | user   | system          | permission      |
      | Brajan | exchange        | full-to-account |
      | Brajan | domain-accounts | can-log-in      |
    And new permissions for "Brajan" will be on Permissions Change Report / Log
    But new permissions are not applied automatically
