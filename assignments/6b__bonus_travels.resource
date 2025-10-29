*** Settings ***
Library    RequestsLibrary

*** Variables ***
${alias}=    PraegusTravelApi

*** Keywords ***
GET campsites and return response
    [Arguments]    ${url}=
    ${response}=    GET On Session    alias=${alias}    url=${url}
    [Return]    ${response}

GET campsite with maxPrice
    [Arguments]  ${maxPrice} 
    ${response}=    GET On Session    alias=${alias}    url=/search/price    params=maxPrice=${maxPrice}
    [Return]    ${response}

GET campsite with location
    [Arguments]        ${location}
        ${response}=    GET On Session    alias=${alias}    url=/search/location    params=location=${location}
    [Return]    ${response}

GET campsite with ID: "${id}"
    ${id}=    Convert To String    ${id}
    ${response}=    GET campsites and return response    url=${id}
    Check "${response}" has status: "200"
    [Return]    ${response}

DELETE campsite with ID: "${id}"
    ${id}=    Convert To String    ${id}
    ${response}=    DELETE On Session    alias=${alias}    url=${id}
    Check "${response}" has status: "204"
    [Return]    ${response}

DELETE all campsites
    Fatal Error    msg=Please do not delete all campsites
    ${response}=    DELETE On Session    alias=${alias}    url=
    Check "${response}" has status: "204"
    [Return]    ${response}

Setup Travel Suite
    Create Session     alias=PraegusTravelApi   url=http://travels.praegus.nl/api/campsites

Check "${response}" Has Status: "${status}"   
    Should Be Equal As Integers    ${response.status_code}    ${status}

POST campsite and return response
    [Documentation]    Returns the response to posting a campsite
    [Arguments]  
    ...    ${name}                        #Mandatory
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

    ${response}=    POST On Session    alias=${alias}    url=    json=${payload}

    RETURN     ${response}

PUT campsite and return response
    [Documentation]    Returns the response to updating a campsite via PUT
    [Arguments]   ${campsiteDict}
    ${id}=    Convert To String    ${campsiteDict}[id]
    ${response}=    PUT On Session    alias=${alias}    url=${id}   json=${campsiteDict}
    RETURN     ${response}

Update Campsite Dictionary
    [Documentation]    Takes a campsite dictionary, updates the key with the newValue and returns it
    [Arguments]    ${dict}    ${key}    ${newValue}
    &{newDict}=    Create Dictionary    &{dict}    ${key}=${newValue}
    [Return]     ${newDict}
