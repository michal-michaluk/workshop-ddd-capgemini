Feature: New employee

  User Story:
  In order to guarantee correct permissions at very first day
  we want to generate user permissions automatically

  Domain Story:
  employee has unique identifier
  basic permissions was generated for new employee
  new user added to User List
  permissions are not applied byt presented on Permissions Change Report

  Background:
    Given Basic Permissions are defined:
      | system          | permission      |
      | exchange        | full-to-account |
      | domain-accounts | can-log-in      |

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

  Scenario: user with colliding identifier
    Given there is an user with identifier "Brajan"
    When "Brajan" become an employee
    Then not new account will be created
    And notification is emitted about problem with colliding identifier "Brajan" and existing user details
