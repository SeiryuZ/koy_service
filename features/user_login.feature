Feature: Signing in
  In order to use the application
  As a user
  I want to login


  Scenario Outline: Valid Login
    Given the following user exist
      | username | password | admin |  
      |  steven  | password | false |  
      |  admin   |  admin   | true  |  
    And I am on home page
    When I type "<username>" to "username"
    And I type "<password>" to "password"
    And I click "login"
    Then I should see "<result>"

    Examples:
      | username | password |          result           |  
      |  steven  | password |         Hi steven         |  
      |  admin   | password | Maaf, Password anda salah |  
      |  admin   |  admin   |      Hi admin[admin]      |  
