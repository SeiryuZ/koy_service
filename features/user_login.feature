Feature: Signing in
  In order to use the application
  As a user
  I want to login


  Scenario Outline: Valid Login
    Given the following user exist
      | username | password | admin |  
      |  steven  | password | false |  
      |  admin   |  admin   | true  |  
    And user on home page
    When he typed <"username"> to "username"
    And he typed <"password"> to "password"
    And he clicked "login"
    Then he should see <"result">

    Examples:
      | username | password |           result            |  
      |  steven  | password |         "Hi Steven"         |  
      |  admin   | password | "Maaf, Password anda salah" |  
      |  admin   |  admin   |      "Hi admin[admin]"      |  
