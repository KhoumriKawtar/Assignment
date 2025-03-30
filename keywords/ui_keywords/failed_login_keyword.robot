*** Settings ***
Resource  ../../resources/variables/ui_variables/order_process_variables.robot
Resource  ../../resources/variables/ui_variables/order_process_locators.robot
Library           SeleniumLibrary

*** Keywords ***

User is in the login page
  [Arguments]  ${URL}
       Open Browser    ${URL}    Chrome
       Maximize Browser Window

The user enter the user name
     [Arguments]  ${USER_NAME}
        Input Text  ${USER_NAME_LOCATOR}   ${USER_NAME}
The User enter the password
      [Arguments]  ${PASSWORD}
        Input Text  ${PASSWORD_LOCATOR}   ${PASSWORD}
The user submmit the login form
      Click Element   ${LOGIN_BUTTON_LOCATOR}

The login error message should be displayed
    Element Text Should Be  ${LOGIN_ERROR_MESSAGE_LOCATOR}  ${LOGIN_ERROR_MESSAGE}

The user name missing error message should be displayed
    Element Text Should Be  ${LOGIN_ERROR_MESSAGE_LOCATOR}   ${MISSING_USERNAME_MESSAGE}

The password missing error message should be displayed
     Element Text Should Be  ${LOGIN_ERROR_MESSAGE_LOCATOR}   ${MISSING_PASSWORD_MESSAGE}

The locked out error message should be displayed
    Element Text Should Be  ${LOGIN_ERROR_MESSAGE_LOCATOR}   ${LOCKEDOUT_MESSAGE}
