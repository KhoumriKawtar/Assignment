*** Settings ***
Library   RequestsLibrary
Library   OperatingSystem
Library  DateTime

Resource  ../../resources/variables/api_variables/user_api_variables.robot
Resource  ../../keywords/api_keywords/user_api_keyword.robot
*** Keywords ***

Get the complete file path
    [Arguments]  ${request_path}
       ${request_file}=  Catenate   SEPARATOR=/  ${EXECDIR}  ${request_path}
       Log  ${request_file}
       ${request_file_content}=  Get File  ${request_file}
    RETURN   ${request_file_content}

Retrieve the users list
    Create Session   req_session  ${URL}
    #Send a get request on the created session and passing the url endpoint
    ${get_response} =  Get On Session  req_session    url=${GET_USERS_LIST_URL}
    #Verify the status response is as expected
    Status should be  200
    #Verify that the response body contains 'data'
    Should Contain  ${get_response.json()}  data

Perform a successful login
    Create Session   req_login_session  ${URL}
    #Create a dicionary to indicate that the type of the content body is json
    ${header} =  Create Dictionary   Content-Type=application/json
    #Call the predifine Keyword 'Get the complete file path' to get the login file request
    ${request_file_content}=  Get the complete file path  ${LOGIN_REQUEST_PATH}
    #Convert the file into a json format
    ${request_content_body}=  Evaluate  json.loads('''${request_file_content}''')  json
    #Send post request on the created session and passing the url and the header and the json body
    ${response_object}=  Post On Session  req_login_session   url=${LOGIN_URL}   headers=${header}  json=${request_content_body}
    #Verify the status response is as expected
    Status Should Be  200
    #Verify that the response body contains created token
    Should Contain  ${response_object.json()}  token

Update user with different credentials
    Create Session   req_update_session  ${URL}
    #Create a dicionary to indicate that the type of the content body is json
    ${header} =  Create Dictionary   Content-Type=application/json
    #Call the predifine Keyword 'Get the complete file path' to update the login file request
    ${request_file_content}=  Get the complete file path  ${UPDATE_REQUEST_PATH}
    #Convert the file into a json format
    ${update_content_body}=  Evaluate  json.loads('''${request_file_content}''')  json
    #Send put request on the created session passing the update url, header and the updated information
    ${response_object}=  Put On Session  req_login_session   url=${UPDATE_URL}  headers=${header}    json=${update_content_body}
    #Verify the status response is as expected
    Status Should Be  200
    #Verify that the response body contains 'updatedAt'
    Should Contain  ${response_object.json()}  updatedAt

Perform a user deletion
    Create Session   req_delete_session  ${URL}
    #Create a dicionary to indicate that the type of the content body is json
    ${header} =  Create Dictionary   Content-Type=application/json
    #Send delete request on the created session passing the update url contient the user number, header
    ${response}=  DELETE On Session  req_delete_session   url=${DELETE_URL}  headers=${header}
    #Verify the status response is as expected
    Status Should Be  204

Perform unsuccessful user registration
    Create Session   req_session  ${URL}
    #Create a dictionary that contain the content-type header and the email for the request body
    ${header_and_data}=  Create Dictionary   Content-Type=application/json  email=${email}
    #Send post request on the created session and passing the unsuccessful login url, header and the data
    ${response_object}=  Post On Session  req_session   url=${UNSUCCESSFUL_REGISTER_URL}  json=${header_and_data}  expected_status=any
    #Verify the status response is as expected
    Status Should Be  400
    #Verify that the response body contains 'Missing password'
    Should Contain  ${response_object.text}  Missing password

Verify single user not found
    Create Session   req_session  ${URL}
    #Send a get request using the created session passing the url and the expected status to ensure that the request does not fail automatically if the response status is not checked immediately.
    ${get_response} =  Get On Session   req_session    url=/api/users/233     expected_status=any
    #Verify the status response is as expected
    Status Should Be  404

Execute a parameterized delayed request (max 3 seconds) and evaluate how long the request takes
    Create Session   delayed_req_session  ${URL}
    #Get start time of the request in seconds and convert it to integer
    ${start_time_request}=  Get Current Date  result_format=%S
    ${start_time_request} =    Evaluate    int("${start_time_request}")
    #Send the delayed request
    ${get_response} =  Get On Session  delayed_req_session    url=${DELAYED_RESP_URL}  expected_status=any
    #Get the end time of the response in seconds and convert it to integer
    ${end_time_response}=  Get Current Date  result_format=%S
    ${end_time_response} =    Evaluate    int("${end_time_response}")
    #Calculate the time it takes for the request
    ${request_time} =  Evaluate  ${end_time_response} -${start_time_request}
    #If negative, it means that the end time seconds are are coming from the next minute
    IF    ${request_time} < 0
        #Add 60 seconds to ensure the request time is correct
        ${request_time}=  Evaluate  ${request_time}+60
    END
    Log  request time : ${request_time}
    #Verify the status response is as expected
    Status should be  200





