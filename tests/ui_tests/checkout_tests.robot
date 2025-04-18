*** Settings ***
Documentation    Checkout process test suite
Metadata         Author     Kawtar KHOUMRI

Resource  ../../keywords/ui_keywords/checkout_keyword.robot
Resource  ../../keywords/ui_keywords/failed_login_keyword.robot
Library  SeleniumLibrary

*** Test Cases ***
TC01:Valid checkout
    User is in the login page   ${URL}
    The user enter the user name     ${USER_NAME}
    The User enter the password      ${PASSWORD}
    The user submmit the login form
    The user is in the home page
    The user add the products to the cart  @{USER_PRODUCTS}
    The user verify the cart    @{USER_PRODUCTS}
    The user click on checkout button
    The user fills in shipping information      ${FIRST_NAME}  ${LAST_NAME}  ${ZIP_CODE}
    Check if the total price is equal to the items prices
    The user click on finish
    The checkout is complete and the cart is empty
