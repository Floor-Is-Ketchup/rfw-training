*** Settings ***
Documentation   Frontend flow
Resource    saucedemo_resource.resource
Suite Setup    Start Browser    slowMo=1s
Test Setup    Login with user    standard_user
Test Teardown   Logout via menu
Suite Teardown    Close Browser


*** Test Cases ***
Buy Backpack test
    Click link with text: "Backpack"
    Click on text: "Add to cart"
    Click    ${shoppingCart}
    Click on text: "Checkout"
    Fill Checkout info
    Click on text: "Continue"
    Click on text: "Finish"
    Click on text: "Back Home"