*** Settings ***
Documentation   Frontend flow
Library    Browser

*** Variables ***
${password}=    secret_sauce
${priceTag}=    data-test=inventory-item-price
${shoppingCart}=    data-test=shopping-cart-link


*** Keywords ***
Start Browser
    [Arguments]    ${slowMo}=1s
    New Browser    browser=chromium    headless=False    slowMo=${slowMo}
    New Context
    New Page        https://www.saucedemo.com/

Login with user
    [Arguments]    ${user}=standard_user
    Fill Text    id=user-name    ${user}
    Fill Text    id=password    ${password}
    Click    text=Login

Logout via menu
    Click    id=react-burger-menu-btn
    Click    text=Logout

Click Add to cart number: "${number}"
    Click    text=Add to cart >> nth=${number+1}

Click on text: "${text}"
    Click    text=${text}

Click link with text: "${text}"
    Click    a >> text=${text}

Fill Checkout info
    [Arguments]    ${firstName}=Praegus    ${lastName}=Tator    ${postalCode}=3832 RC
    Fill Text    id=first-name    ${firstName}
    Fill Text    id=last-name    ${lastName}
    Fill Text    id=postal-code    ${postalCode}