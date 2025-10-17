*** Settings ***
Documentation    API definition can be found here: http://travels.praegus.nl/swagger-ui/index.html
...
...              Frontend is here: https://travels.praegus.nl/campsites
Library    RequestsLibrary
Suite Setup    Create Session    
...    alias=lvnl    
...    url=http://travels.praegus.nl/api

Suite Teardown    Delete All Sessions

*** Variables ***

*** Test Cases ***
GET campsite with specific id
    [Tags]    GET
    [Setup]    Set Test Variable    ${id}    832
    ${response}=    GET request and return response   url=campsites/${id}
    Should Be Equal As Integers    ${response.json()}[id]    ${id}

GET all campsites
    [Tags]    GET
    ${response}=    GET request and return response    url=campsites
    FOR    ${campsite}    IN    @{response.json()}
        Log    ${campsite}[id]    console=true
    END

POST to add a campsite
    [Tags]    POST     robot:skip    #skip to avoid unnecessary additions
    ${response}=    POST campsite and return response
    ...    name=Praegus-camping
    ...    location=Leusden
    Log    ${response.json()}    level=DEBUG
    Should Be Equal As Integers    ${response.status_code}    201
    IF    "${response.status_code}" == "201"
        Log To Console    Created campsite has id: ${response.json()}[id]
    END
    
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
    ...    ${terrainType}="grass"    
    ...    ${accessibilityLevel}="low"

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
