*** Settings ***
Documentation   Frontend flow
Resource    saucedemo_resource.resource
Suite Setup    Start Browser
Test Setup    Login with user
Test Teardown   Logout via menu
Suite Teardown    Close Browser


*** Test Cases ***
Backpack test
    Click    text=Sauce Labs Backpack
    ${price}=    Get Text    ${priceTag}
    Should Contain    ${price}    29.99

Backpack test with problem user
    [Documentation]    This test overwrites the Test Setup from the Settings, with a different one.
    ...                This test will fail now, but will still logout, due to teardowns
    [Setup]    Login with user    user=problem_user
    Click    text=Sauce Labs Backpack
    ${price}=    Get Text    ${priceTag}
    Should Contain    ${price}    29.99