Feature: Users Management
  In order to manage the users which can use the application
  As a privileged
  I want to be able to manage users


  Scenario: See List of user as an admin
    Given the following user exist
      | username | password | admin |  
      |  steven  | password | false |  
      |  admin   |  admin   | true  | 
    And I am on "home page"
    When I am authenticated as "admin"
    Then I should see "Daftar User"
    And I should see "steven"
    And I should see "admin"
    And I should see "user-table" element

  Scenario: Should not see list of user as non admin
    Given the following user exist
      | username | password | admin |  
      |  steven  | password | false |  
      |  admin   |  admin   | true  | 
    And I am on "home page"
    When I am authenticated as "steven"
    Then I should not see "Daftar User"
    And I should not see "admin"
    And I should not see "user-table" element

  Scenario: Add User with valid data
    Given the following user exist
      | username | password | admin |  
      |  steven  | password | false |  
      |  admin   |  admin   | true  | 
    And I am on "home page"
    When I am authenticated as "admin"
    And I click "new_user"
    And I fill "new_user_form" with valid data
    And I click "create_user"
    Then I should see "User telah berhasil dibuat"

  Scenario: Add User with invalid data
    Given the following user exist
      | username | password | admin |  
      |  steven  | password | false |  
      |  admin   |  admin   | true  | 
    And I am on "home page"
    When I am authenticated as "admin"
    And I click "new_user"
    And I fill "new_user_form" with invalid data
    And I click "create_user"
    Then I should see "yang salah"


  Scenario: Change user to admin
    Given the following user exist
      | username | password | admin |  
      |  steven  | password | false |  
      |  admin   |  admin   | true  | 
    And I am on "home page"
    When I am authenticated as "admin"
    And from "steven's row" I click "change_to_admin"
    Then from "steven's row" I should see "admin" 


  Scenario: Change user to normal user
    Given the following user exist
      | username | password | admin |  
      |  steven  | password | false |  
      |  admin   |  admin   | true  | 
    And I am on "home page"
    When I am authenticated as "admin"
    And from "steven's row" I click "demote_from_admin"
    Then from "steven's row" I should see "user"