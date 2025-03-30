*** Settings ***
Documentation    Failed log in test suite
Metadata         Author     Kawtar KHOUMRI

Resource  ../../keywords/ui_keywords/failed_login_keyword.robot
Library  SeleniumLibrary

*** Test Cases ***
TC01:Login with locked out user
    User is in the login page   ${URL}
    The user enter the user name     ${LOCKEDOUT_USER}
    The User enter the password     ${PASSWORD}
    The user submmit the login form
    The locked out error message should be displayed


TC02:Login with invalid username
    User is in the login page   ${URL}
    The user enter the user name     ${WRONG_USERNAME}
    The User enter the password      ${PASSWORD}
    The user submmit the login form
    The login error message should be displayed

TC03:Login with invalid password
    User is in the login page   ${URL}
    The user enter the user name     ${USER_NAME}
    The User enter the password      ${WRONG_PASSWORD}
    The user submmit the login form
    The login error message should be displayed

TC04:Login with missing username
    User is in the login page   ${URL}
    The User enter the password      ${WRONG_PASSWORD}
    The user submmit the login form
    The user name missing error message should be displayed

TC05:Login with missing password
    User is in the login page   ${URL}
    The user enter the user name     ${USER_NAME}
    The user submmit the login form
    The password missing error message should be displayed