*** Settings ***
Documentation   Frontend flow
Library    DataDriver    file=price_check.csv
Resource    saucedemo_resource.resource
Suite Setup    Start Browser    slowMo=1s
Test Setup    Login with user
Test Teardown   Logout via menu
Suite Teardown    Close Browser
Test Template    Price test template


*** Test Cases ***
This test gets overwritten   item    0.00

*** Keywords ***
Price test template
    [Arguments]    ${itemName}    ${expectedPrice}
    Click    a >> text=${itemName}
    ${priceLabel}=    Get Text    ${priceTag}
    Should Contain    ${priceLabel}    ${expectedPrice}