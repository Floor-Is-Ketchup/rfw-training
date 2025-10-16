*** Settings ***
Documentation     Common keywords and variables shared across test suites.

*** Variables ***
${BASE_URL}       http://travels.praegus.nl/api/campsites

*** Keywords ***
Validate Status Code
    [Documentation]    Checks that the response status code matches the expected one.
    [Arguments]    ${response}    ${expected_status}
    Should Be Equal As Integers    ${response.status_code}    ${expected_status}

Convert "${Text}" To Uppercase
    [Documentation]    This has not yet been implemented
    #TODO
    Log    Work in Progress