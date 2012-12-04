Feature: Signing in
  In order to use the application
  As a user
  I want to login


  Scenario Outline: Login
    Given the following user exist
      | username | password | admin |  
      |  steven  | password | false |  
      |  admin   |  admin   | true  |  
    And I am on "home page"
    When I type "<username>" to "username"
    And I type "<password>" to "password"
    And I click "login"
    Then I should see "<result>"

    Examples:
      | username | password |          result           |  
      |  steven  | password |         Hi steven         |  
      |  steven  | password |          logout           |  
      |  admin   | password | Maaf, Password anda salah |  
      |  admin   |  admin   |      Hi admin[admin]      |  

  Scenario: Logout
    Given the following user exist
      | username | password | admin |  
      |  steven  | password | false |  
      |  admin   |  admin   | true  | 
    And I am on "home page"
    When I am authenticated
    And I click "logout"
    Then I should see "Anda telah berhasil logout"

