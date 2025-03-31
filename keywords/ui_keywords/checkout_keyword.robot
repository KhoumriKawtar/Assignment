*** Settings ***

Resource  ../../resources/variables/ui_variables/order_process_locators.robot
Library         SeleniumLibrary
Library           String
*** Keywords ***
The user is in the home page
    Page should contain Element    ${SWAGLABS_LOCATOR}

The user add the products to the cart
    [Arguments]  @{USER_PRODUCTS}

    #Loop through the products and click add to cart and verify when the product matches the user input products
    FOR  ${product}  IN  @{USER_PRODUCTS}
        #Update the locator string for add to cart button based on product title allowing for dynamic targeting for each product
        #The product title is converted to lowercase and spaces are replaced with dashes to create a valid locator
        ${add_cart_locator}=    Evaluate     "${CART_BUTTONS_LOCATOR}".format("add-to-cart-${product.lower().replace(' ', '-')}")
        #Click add to cart when the product matches the user input products
        Click Element    ${add_cart_locator}
        #check if the add to cart button is changed to remove
        #Update the locator string for remove button based on product title allowing for dynamic targeting for each product
        #The product title is converted to lowercase and spaces are replaced with dashes to create a valid locator
        ${remove_cart_locator}=    Evaluate    "${CART_BUTTONS_LOCATOR}".format("remove-${product.lower().replace(' ', '-')}")
        #Verify that the button of the added to cart products are now changed to remove
        Element text should be   ${remove_cart_locator}  Remove
    END

The user verify the cart
   [Arguments]  @{USER_PRODUCTS}
   #Click on the shopping cart icon to open the cart
   Click Element  ${SHOPPING_CART_ICON}
   #Get a list of item elements in the shopping cart
   ${cart_Items} =  Get WebElements  ${INVENTORY_ITEM_NAME}

   ${items_count}=  Set Variable  0
   ${products_count}  Get Length  ${USER_PRODUCTS}

   #Loop through the products and match each product with the items in cart
   FOR   ${product}   IN    @{USER_PRODUCTS}
      #Loop through the items in the cart to check for the products
       FOR    ${item}    IN    @{cart_items}
            ${item_name}=    Get Text    ${item}
            #Check if the current item matches the product
             IF  '${product}' == '${item_name}'
                ${items_count} =  Evaluate  ${items_count} + 1
             END
       END
   END
   #Verify that the total number of products matched with cart is the same as the products count
   Should Be Equal As Numbers   ${items_count}  ${products_count}

The user click on checkout button
    Click Element  ${checkout_button}
The user fills in shipping information
    [Arguments]  ${FIRST_NAME}  ${LAST_NAME}  ${ZIP_CODE}
    Input Text  ${FIRST_NAME_LOCATOR}   ${FIRST_NAME}
    Input Text  ${LAST_NAME_LOCATOR}   ${LAST_NAME}
    Input Text  ${ZIP_CODE_LOCATOR}  ${ZIP_CODE}
    Click Element  ${CONTINUE_BUTTON_LOCATOR}

Check if the total price is equal to the items prices
    #Verify that the text of the checkout overview title matches the expected value
    Element Text Should Be  ${CHECKOUT_OVERVIEW_TITLE_LOCATOR}  Checkout: Overview
    #Get a list of the checkout items prices
    ${items_prices} =    Get WebElements    ${ITEMS_PRICE_LOCATOR}
    #Create a summation variable and initiate it with zero
    ${total_items_price} =  Set Variable  0
    #Loop through the prices to convert and sum them
    FOR    ${price}    IN    @{items_prices}
        ${item_price} =  Get Text  ${price}
        #Remove the dollar sign from the texts, convert the prices to float and sum them
        ${total_items_price} =  Evaluate  ${total_items_price} + float(${item_price.replace('$', '')})
    END

    #Get the total price written in the checkout overview page
    ${total_price} =    Get Text  ${TOTAL_PRICE_LOCATOR}
    #Remove the text before the price
    ${total_price} =    Set Variable    ${total_price.replace('Item total: $', '')}
    #Verify that the summation of items prices is the same as the total price
    Should Be Equal As Numbers    ${total_items_price}    ${total_price}

The user click on finish
    Click Element  ${FINISH_BUTTON_LOCATOR}
The checkout is complete and the cart is empty
    Page should contain Element  ${CONFIRMATION_MESSAGE_LOCATOR}