*** Variables ***

###---------------- Checkout Locators -------------------##

${SWAGLABS_LOCATOR}         xpath://div[@data-test='inventory-list']//div[1]//div[2]//div[2]

${ITEM_LOCATOR}             xpath://div[@data-test='inventory-item']
${PRODUCT_LOCATOR}          xpath://div[2]/div[1]/a/div[contains(@data-test, 'inventory-item-name')]
${CART_BUTTONS_LOCATOR}     xpath://button[contains(@data-test, '{0}')]
${SHOPPING_CART_ICON}       xpath://a[@data-test='shopping-cart-link']
${INVENTORY_ITEM_NAME}      xpath://div[@data-test='cart-list']//div[@data-test='inventory-item-name']
${CHECKOUT_BUTTON}           xpath://button[@data-test='checkout']
${FIRST_NAME_LOCATOR}        xpath://input[@data-test='firstName']
${LAST_NAME_LOCATOR}         xpath://input[@data-test='lastName']
${ZIP_CODE_LOCATOR}          xpath://input[@data-test='postalCode']
${CONTINUE_BUTTON_LOCATOR}   xpath://input[@data-test= 'continue']
${FINISH_BUTTON_LOCATOR}     xpath://button[@data-test='finish']
${ITEMS_PRICE_LOCATOR}      xpath://div[@data-test='inventory-item-price']
${TOTAL_PRICE_LOCATOR}      xpath://div[@data-test='subtotal-label']

${CHECKOUT_OVERVIEW_TITLE_LOCATOR}  xpath://span[@data-test='title']
${CONFIRMATION_MESSAGE_LOCATOR}        xpath://h2[normalize-space()='Thank you for your order!']

###---------------- Failed Login Locators -------------------##
${USER_NAME_LOCATOR}         xpath://input[@data-test='username']
${PASSWORD_LOCATOR}          xpath://input[@data-test='password']
${LOGIN_BUTTON_LOCATOR}      xpath://input[@data-test= 'login-button']
${LOGIN_ERROR_MESSAGE_LOCATOR}      xpath://h3[@data-test='error']

###---------------- Sorted Items Locators#-------------------##
${SELECT_LIST_LOCATOR}  xpath://select[@data-test='product-sort-container']