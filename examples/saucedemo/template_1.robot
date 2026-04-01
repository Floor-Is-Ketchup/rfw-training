*** Settings ***
Documentation   Frontend flow
Resource    saucedemo_resource.resource
Suite Setup    Start Browser    slowMo=1s
Test Setup    Login with user
Test Teardown   Logout via menu
Suite Teardown    Close Browser
Test Template    Price test template


*** Test Cases ***
Backpack    Sauce Labs Backpack    29.99
Bike Light    Sauce Labs Bike Light    9.99
Bolt T-Shirt    Sauce Labs Bolt T-Shirt    15.99
Jacket    Sauce Labs Fleece Jacket    49.99
Onesie    Sauce Labs Onesie    7.99
Test T-Shirt    Test.allTheThings() T-Shirt (Red)    15.99


*** Keywords ***
Price test template
    [Arguments]    ${itemname}    ${expectedPrice}
    Click    a >> text=${itemname}
    ${priceLabel}=    Get Text    ${priceTag}
    Should Contain    ${priceLabel}    ${expectedPrice}