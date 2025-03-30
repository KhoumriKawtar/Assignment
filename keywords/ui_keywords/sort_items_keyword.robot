*** Settings ***

Library     SeleniumLibrary
Library     Collections

Resource  ../../resources/variables/ui_variables/order_process_variables.robot
Resource  ../../resources/variables/ui_variables/order_process_locators.robot
Resource  ../../keywords/ui_keywords/checkout_keyword.robot
*** Keywords ***
The user select from list
     [Arguments]  ${SORT_BY_NAME_Z}
       Select From List By Value  ${SELECT_LIST_LOCATOR}  ${SORT_BY_NAME_Z}

The items should be sorted
     Wait Until Element Is Visible    ${product_locator}
     #Get a list of all products
     ${products_list} =  Get WebElements  ${product_locator}
     #Create an empty list to add the sorted items
     ${product_names} =  Create List
     #Loop through the products and add the product name to the list
     FOR    ${product}    IN    @{products_list}
        ${product_title}=    Get Text    ${product}
        Append To List  ${product_names}   ${product_title}
     END

     #Create a copy of the product names list
     ${sorted_products_name} =  Copy List  ${product_names}
     #Sort the list in descending order (Z to A)
     ${sorted_products_name} =  Evaluate    sorted(${product_names}, reverse=True)
     #Verify the list is sorted Z-A
     Should Be Equal    ${sorted_products_name}    ${product_names}
