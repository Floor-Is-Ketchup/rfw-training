*** Settings ***
Documentation    Frontend can be found here: https://travels.praegus.nl/campsites/new
Library    Browser
Resource   travels_frontend.resource
Resource    travels_backend.resource
Suite Setup   Setup Travel Api Session
Test Setup    Run Keywords    Start Browser    slowMo=0s     url=${BASE_URL}/campsites/new    AND
...           Setup Campsite    TEST
# Test Teardown    DELETE campsite with ID: "${campsite_id}"
Suite Teardown   Close Browser

*** Variables ***
${state}=    enabled
${campsite_id}=    None
${campsite_data}=    None

*** Test Cases ***
Campsite Name is Present  
    Go To    url=${BASE_URL}/campsites/${campsite_id}
    Get Element States    text=${campsite_data}[name]    contains    visible

Campsite Can Be Deleted
    Go To    url=${BASE_URL}/campsites/${campsite_id}
    GET campsite with ID: "${campsite_id}"    expected_status=200
    Handle Future Dialogs    action=accept
    Click    css=button.btn.btn-danger
    Wait For Elements State  text=Campsite deleted successfully    visible
    Wait Until Keyword Succeeds    10s    1s    GET campsite with ID: "${campsite_id}"    expected_status=404

*** Keywords ***
Setup Campsite
    [Arguments]  ${scope}=TEST

    ${new_campsite}=  Create Campsite Dictionary    name=RFW    location=Leusden
    ${campsite_response}=    POST campsite dictionary and return response    &{new_campsite}
    VAR    ${campsite_data}=    ${campsite_response.json()}    scope=${scope}
    VAR    ${campsite_id}=    ${campsite_data}[id]    scope=${scope}