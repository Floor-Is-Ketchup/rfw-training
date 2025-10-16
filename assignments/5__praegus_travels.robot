*** Settings ***
Documentation    API definition can be found here: https://travels.praegus.nl/swagger-ui/index.html
Library    RequestsLibrary
Suite Setup    Create Session    
...    alias=lvnl    
...    url=https://travels.praegus.nl/api

Suite Teardown    Delete All Sessions

*** Variables ***

*** Test Cases ***
Testcase 1
    Log    nothing

Testcase 2
    Log    nothing

Testcase 3
    Log    nothing

*** Keywords ***
POST campsite and return response
    [Documentation]    Returns the response to posting a campsite
    [Arguments]  
    ...     ${name}                        #Mandatory
    ...    ${location}                     #Mandatory
    ...    ${description}=""   
    ...    ${pricePerNight}=0    
    ...    ${capacity}=1    
    ...    ${amenities}=""    
    ...    ${campsiteType}="camping"    
    ...    ${terrainType}="Urban"    
    ...    ${accessibilityLevel}="hard"

        &{payload}=    Create Dictionary    
    ...    name=${name}
    ...    location=${location}
    ...    description=${description}
    ...    pricePerNight=${pricePerNight}
    ...    capacity=${capacity}
    ...    amenities=${amenities}
    ...    campsiteType=${campsiteType}
    ...    terrainType=${terrainType}
    ...    accessibilityLevel=${accessibilityLevel}

    ${response}=    POST On Session    alias=lvnl    url=campsites    json=${payload}

    RETURN     ${response}

GET request and return response
    [Arguments]    ${alias}=lvnl    ${url}=${Empty}
    ${response}=    GET On Session    alias=${alias}    url=${url}

    [Return]    ${response}
