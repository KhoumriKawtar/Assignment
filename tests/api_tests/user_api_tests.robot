*** Settings ***
Documentation    Users api test
Metadata         Author     Kawtar KHOUMRI

Resource  ../../keywords/api_keywords/user_api_keyword.robot
*** Test Cases ***
TC01:Retrieve the users list
    Retrieve the users list
TC02:Perform a successful login
    Perform a successful login
TC03:Update user with different credentials
    Update user with different credentials
TC04:Perform a user deletion
    Perform a user deletion
TC05:Perform unsuccessful user registration
    Perform unsuccessful user registration
TC06:Verify single user not found
    Verify single user not found
TC07:Execute a parameterized delayed request (max 3 seconds) and evaluate how long the request takes
    Execute a parameterized delayed request (max 3 seconds) and evaluate how long the request takes