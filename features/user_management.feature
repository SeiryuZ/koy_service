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

  Scenario: Should not see list of user as non admin
    Given the following user exist
      | username | password | admin |  
      |  steven  | password | false |  
      |  admin   |  admin   | true  | 
    And I am on "home page"
    When I am authenticated as "steven"
    Then I should not see "Daftar User"
    And I should not see "steven"
    And I should not see "admin"
