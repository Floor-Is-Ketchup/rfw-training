*** Settings ***
Documentation    API definition can be found here: https://travels.praegus.nl/swagger-ui/index.html
Library    RequestsLibrary
Suite Setup    Create Session    
...    alias=lvnl    
...    url=http://travels.praegus.nl/api/campsites

Suite Teardown    Delete All Sessions

*** Test Cases ***
GET request for specific id
    Set Variable    ${id}    844
    ${response}=    GET On Session    alias=lvnl   url=${id}
    Should Be Equal As Integers    ${response.json()}[id]    ${id}

GET all campsites
    ${response}=    GET request and return response
    Log    ${response.json()[0]} is de eerstgevonden campsite

POST om campsite toe te voegen
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
    FOR    ${campsite}    IN    @{response.json()}
        Log    ${campsite}[name]    console=true
    END
    [Return]    ${response}
