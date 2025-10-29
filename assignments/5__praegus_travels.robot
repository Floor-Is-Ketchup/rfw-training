*** Settings ***
Documentation    API definition can be found here: http://travels.praegus.nl/swagger-ui/index.html
...               NB: swagger-ui is HTTP, not HTTPS! Browsers will default to https
...              Frontend can be found here: https://travels.praegus.nl/campsites
Library    RequestsLibrary
Suite Setup    Create Session
...    alias=travelapi    
...    url=http://travels.praegus.nl/api
Suite Teardown    Delete All Sessions

*** Comments ***
This suite is to explore and "play around" with some actual testing and the Praegus Travels website
Feel free to "play around" with the different functionalities in the frontend and the backend

*** Variables ***
#OPTIONAL: Add custom variables to make your life easier

*** Test Cases ***
GET campsite with specific id
    [Tags]    GET
    [Setup]    Set Test Variable    ${id}    832
    ${response}=    GET request and return response   url=campsites/${id}
    &{campsite}=    Set Variable    ${response.json()}
    Should Be Equal As Integers    ${campsite}[id]    ${id}

GET all campsites
    [Tags]    GET
    ${response}=    GET request and return response    url=campsites
    FOR    ${campsite}    IN    @{response.json()}
        Log    ${campsite}[id]    console=true        
    END

Check large campsite
    [Tags]    IF
    ${response}=    GET request and return response    url=campsites
    FOR    ${campsite}    IN    @{response.json()}
        ${capacity}=    Set Variable    ${campsite}[capacity]
        IF    ${capacity} >= 8
        Pass Execution    Large campsite found
        END
    END
    Fail    No large campsite found

POST to add a campsite
    [Tags]    POST     robot:skip    #skip to avoid unnecessary additions
    ${response}=    POST campsite and return response
    ...    name=Praegus-camping
    ...    location=Leusden
    &{campsite}=    Set Variable    ${response.json()}
    Log    ${campsite}   level=DEBUG
    Should Be Equal As Integers    ${response.status_code}    201
    IF    "${response.status_code}" == "201"
        Log To Console    Created campsite has id: ${response.json()}[id]
    END


GET available locations
    [Tags]    GET
    ${response}=    GET request and return response   url=campsites/available
    # TODO: Add a testcase that tests if the "available" filter works properly
    #    - OPTIONAL: find or add a campsite you want to test with
    #    - check that the response contains the campsite that you have chosen to test with


GET with specific location
    [Tags]    GET
    ${response}=    GET request and return response   url=campsites/search/location?location=${location}
    # TODO: Add a testcase that tests if the "location" filter works properly
    #    - OPTIONAL: add a campsite (frontend or backend) with a specific location name for yourself
    #    - add a variable in this suite with the chosen location name
    #    - check that the response has the right campsite
    #    - BONUS: use a FOR loop to check that every campsite in the response has the correct location

Bonus
    [Tags]  bonus  robot:skip
    ${response}=    GET request and return response   url=campsites/search/price?maxPrice=${maxPrice}
    # TODO: this Test Case needs to check if the maxPrice filter works properly
    # Check both the positive flow (if the price is lower than the maxPrice, the campsite is returned)
    # And the negative flow (if the price is higher than the maxPrice, the campsite is not returned)

#OPTIONAL: feel free to add any testcases that you desire

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

    ${response}=    POST On Session    alias=travelapi    url=campsites    json=${payload}

    RETURN     ${response}

GET request and return response
    [Arguments]    ${alias}=travelapi    ${url}=campsites
    ${response}=    GET On Session    alias=${alias}    url=${url}

    [Return]    ${response}

# OPTIONAL: write custom keywords to make your life easier