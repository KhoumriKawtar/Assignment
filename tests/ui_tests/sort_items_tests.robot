*** Settings ***
Documentation    Sorts the items by name Z-A and validate that the sorting is correct
Metadata         Author     Kawtar KHOUMRI

Resource  ../../keywords/ui_keywords/failed_login_keyword.robot
Resource  ../../keywords/ui_keywords/checkout_keyword.robot
Resource  ../../keywords/ui_keywords/sort_items_keyword.robot
Library  SeleniumLibrary

*** Test Cases ***
TC01: Sort items by nsmes from z-a
    User is in the login page   ${URL}
    The user enter the user name     ${USER_NAME}
    The User enter the password      ${PASSWORD}
    The user submmit the login form
    The user is in the home page
    The user select from list       ${SORT_BY_NAME_Z}
    The items should be sorted