*** Settings ***
Documentation    API definition can be found here: https://travels.praegus.nl/swagger-ui/index.html
Library    RequestsLibrary
Suite Setup    Create Session    
...    alias=lvnl    
...    url=https://travels.praegus.nl/api/campsites

Suite Teardown    Delete All Sessions

*** Variables ***

*** Test Cases ***
GET request for specific id
    [Tags]    GET
    Set Test Variable    $id    844
    ${response}=    GET On Session    alias=lvnl   url=${id}
    Should Be Equal As Integers    ${response.json()}[id]    ${id}

GET all campsites
    [Tags]    GET
    ${response}=    GET request and return response
    FOR    ${campsite}    IN    @{response.json()}
        Log    ${campsite}[id]    console=true
    END

POST om campsite toe te voegen
    [Tags]    POST     robot:skip
    ${response}=    POST request and return response
    ...    name=LVNL-camping
    ...    location=Schiphol
    Log    ${response.json()}    level=DEBUG
    Should Be Equal As Integers    ${response.status_code}    201
    IF    "${response.status_code}" == "201"
        Log To Console    Aangemakte campsite heeft id: ${response.json()}[id]
    END
    
*** Keywords ***
POST request and return response
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

    ${response}=    POST On Session    alias=lvnl    url=    json=${payload}

    RETURN     ${response}

GET request and return response
    ${response}=    GET On Session    alias=lvnl    url=

    [Return]    ${response}
