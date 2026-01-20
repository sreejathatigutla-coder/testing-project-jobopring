
@feature_user_login
Feature: LoginScreenforRecruiters

Background: 
  Given the user is on the Login Screen

@valid-login
Scenario Outline: Login Screen for Recruiters
  When I enter "<email_id>" in the Email ID field
  And I enter "<password>" in the Password field
  And I click on the 'Show Password' option
  And I click the Login button
  Then the user should be redirected to the dashboard
  And the dashboard should load without errors

  Examples:
    | email_id             | password            |
    | recruiter@example.com | SecurePassword123   |

@valid_login_button_state
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email_id>" in the Email ID field
  And I enter "<password>" in the Password field
  Then the Login button should be enabled

  Examples:
    | email_id            | password            |
    | krishna@gmail.com   | ValidPassword123    |

@toggle_password_visibility
Scenario Outline: Login Screen for Recruiters
  Given the user enters a valid password in the Password field
  When the user clicks on the 'Show Password' option
  Then the password should be visible
  When the user clicks on the 'Hide Password' option
  Then the password should be hidden

  Examples:
    | password            |
    | ValidPassword123!   |

@failed_then_successful_login
Scenario Outline: Login Screen for Recruiters
  When I enter "<email>" in the Email ID field
  And I enter "<password>" in the Password field
  And I click the Login button
  Then the error message 'Incorrect email ID or password.' should be displayed
  And the user remains on the login screen
  When I enter "<valid_email>" in the Email ID field
  And I enter "<valid_password>" in the Password field
  And I click the Login button again
  Then the user is redirected to the dashboard

  Examples:
    | email                       | password | valid_email              | valid_password     |
    | invalid_email@domain       | short    | valid_email@example.com  | ValidPassword123   |

@valid-login-chrome
Scenario Outline: Login Screen for Recruiters - Chrome
  When I open the application in "<browser>"
  And I enter a valid email ID "<email>"
  And I enter a valid password "<password>"
  And I click the Login button
  Then the user should be redirected to the dashboard in "<browser>"

  Examples:
    | browser | email               | password          |
    | Chrome  | <email>            | <password>        |

@valid-login-firefox
Scenario Outline: Login Screen for Recruiters - Firefox
  When I open the application in "<browser>"
  And I enter a valid email ID "<email>"
  And I enter a valid password "<password>"
  And I click the Login button
  Then the user should be redirected to the dashboard in "<browser>"

  Examples:
    | browser | email               | password          |
    | Firefox | <email>            | <password>        |

@valid-login-safari
Scenario Outline: Login Screen for Recruiters - Safari
  When I open the application in "<browser>"
  And I enter a valid email ID "<email>"
  And I enter a valid password "<password>"
  And I click the Login button
  Then the user should be redirected to the dashboard in "<browser>"

  Examples:
    | browser | email               | password          |
    | Safari  | <email>            | <password>        |

Examples:
    | email               | password          |
    | krishna@gmail.com   | ValidPassword123  |

@valid-email-login
Scenario Outline: Login Screen for Recruiters
  When I enter "<email>"
  And I enter "<password>"
  And I click the Login button
  Then the user should be redirected to the dashboard

  Examples:
    | email                   | password           |
    | user123@domain.com     | validPassword123   |

@valid-email-login
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Recruiter Login Screen
  When I enter "<email>"
  And I enter "<password>"
  And the user clicks the Login button
  Then the user should be redirected to the dashboard

  Examples:
    | email                | password            |
    | USER@DOMAIN.COM     | ValidPassword123    |

@valid_login
Scenario Outline: Login Screen for Recruiters
  When I enter "<email_id>" in the Email ID field
  And I enter "<password>" in the Password field
  And I click the Login button
  Then the user should be redirected to the dashboard

  Examples:
    | email_id             | password    |
    | user123@domain.com   | Passw0rd!   |

  @invalid-login
  Scenario Outline: Login Screen for Recruiters
    When I enter an invalid email ID in the Email ID field
    And I enter an invalid password in the Password field
    And I click the Login button
    Then an error message 'Incorrect email ID or password.' is displayed
    And the user remains on the login screen

    Examples:
      | email              | password |
      | invalid_email@domain | short    |

@disabled_login_button
Scenario Outline: Login Screen for Recruiters
  Given the user leaves the Email ID field empty
  And the user enters "<password>" in the Password field
  Then the Login button should be disabled

  Examples:
    | password          |
    | valid_password123 |

@empty_email_error
Scenario Outline: Login Screen for Recruiters
  When the user leaves the Email ID field empty
  And the user enters "<password>" in the Password field
  And the user clicks the Login button
  Then the Email ID field is empty
  And the password is correctly entered
  And an error message 'Please enter your email ID.' is displayed
  And the user remains on the login screen

  Examples:
    | password        |
    | valid_password  |

@empty_password_error
Scenario Outline: Login Screen for Recruiters
  Given I enter "<email_id>" in the Email ID field
  And I leave the Password field empty
  When I click the Login button
  Then an error message 'Please enter your password.' is displayed
  And the user remains on the login screen

  Examples:
    | email_id         |
    | krishna@gmail.com |

@invalid-email-format
Scenario Outline: Login Screen for Recruiters
  When I enter "<email>" in the Email ID field
  And I enter "<password>" in the Password field
  And I click the Login button
  Then the error message 'Please enter a valid email ID.' is displayed
  And the user remains on the login screen

  Examples:
    | email        | password           |
    | user@domain  | validPassword123    |

@invalid-password
Scenario Outline: Login Screen for Recruiters
  Given I enter "<email>"
  And I enter "<password>"
  When I click the Login button
  Then an error message 'Password must be at least 6 characters long.' is displayed
  And the user remains on the login screen

  Examples:
    | email               | password |
    | krishna@gmail.com   | 123      |

  @invalid-email-id
  Scenario Outline: Login Screen for Recruiters
    When I enter "<email_id>" in the Email ID field
    And I enter "<password>" in the Password field
    And I click the Login button
    Then an error message 'Please enter a valid email ID.' is displayed
    And the user remains on the login screen

    Examples:
      | email_id           | password            |
      | user@domain#.com   | ValidPassword123    |

@spaces-input
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email_id>" in the Email ID field
  And I enter "<password>" in the Password field
  And the user clicks the Login button
  Then the user should see an error message 'Please enter your email ID.'
  And the user remains on the Login Screen

  Examples:
    | email_id | password |
    | "       " | "       " |

@maximum-character-login
Scenario Outline: Login Screen for Recruiters
  When I enter "<email_id>"
  And I enter "<password>"
  And I click the Login button
  Then the user is redirected to the dashboard

  Examples:
    | email_id                                                                 | password                                                                |
    | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

@valid-login
Scenario Outline: Login Screen for Recruiters
  When I enter "<email_id>" in the Email ID field
  And I enter "<password>" in the Password field
  And I click the Login button
  Then the user should be redirected to the dashboard

  Examples:
    | email_id          | password          |
    | krishna@gmail.com | !@#$%^&*()       |

@valid_login_with_spaces
Scenario Outline: Login Screen for Recruiters
  When I enter "<email_id>"
  And I enter "<password>"
  And I click the Login button
  Then the user should be redirected to the Dashboard

  Examples:
    | email_id            | password         |
    | " user@domain.com " | " password123 "  |
