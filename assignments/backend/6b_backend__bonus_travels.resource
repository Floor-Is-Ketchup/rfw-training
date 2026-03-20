*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${alias}=    PraegusTravelApi

*** Keywords ***
GET campsites and return response
    [Arguments]    ${url}=
    ${response}=    GET On Session    alias=${alias}    url=${url}
    RETURN    ${response}

GET campsite with maxPrice
    [Arguments]  ${maxPrice} 
    ${response}=    GET On Session    alias=${alias}    url=/search/price    params=maxPrice=${maxPrice}
    RETURN    ${response}

GET campsite with location
    [Arguments]        ${location}
        ${response}=    GET On Session    alias=${alias}    url=/search/location    params=location=${location}
    RETURN    ${response}

GET campsite with ID: "${id}"
    ${id}=    Convert To String    ${id}
    ${response}=    GET campsites and return response    url=${id}
    Check "${response}" has status: "200"
    RETURN    ${response}

DELETE campsite with ID: "${id}"
    ${id}=    Convert To String    ${id}
    ${response}=    DELETE On Session    alias=${alias}    url=${id}
    Check "${response}" has status: "204"
    RETURN    ${response}

DELETE all campsites
    Fatal Error    msg=Please do not delete all campsites
    ${response}=    DELETE On Session    alias=${alias}    url=
    Check "${response}" has status: "204"
    RETURN    ${response}

Setup Travel Suite
    Create Session     alias=PraegusTravelApi   url=http://travels.praegus.nl/api/campsites

Check "${response}" Has Status: "${status}"   
    Should Be Equal As Integers    ${response.status_code}    ${status}

Create Campsite Dictionary
    [Documentation]    Returns a dictionary with all the keys for a campsite, each argument is a key
    [Arguments]  
    ...    ${name}                        #Mandatory for keyword
    ...    ${location}                     #Mandatory for keyword
    ...    ${description}=""   
    ...    ${pricePerNight}=99.99    
    ...    ${capacity}=2
    ...    ${amenities}=""
    ...    ${imageUrl}=${None}
    ...    ${available}=true
    ...    ${campsiteType}="camping"    
    ...    ${terrainType}="Urban"    
    ...    ${accessibilityLevel}="hard"

        &{campsite}=    Create Dictionary    
    ...    name=${name}
    ...    location=${location}
    ...    description=${description}
    ...    pricePerNight=${pricePerNight}
    ...    capacity=${capacity}
    ...    amenities=${amenities}
    ...    imageUrl=${imageUrl}
    ...    available=${available}
    ...    campsiteType=${campsiteType}
    ...    terrainType=${terrainType}
    ...    accessibilityLevel=${accessibilityLevel}

    RETURN    ${campsite}

POST campsite dictionary and return response
    [Documentation]    Posts a new campsite and returns the response to posting a campsite dictionary
    [Arguments]   &{campsite_dictionary}

    ${response}=    POST On Session    alias=${alias}    url=    json=${campsite_dictionary}

    RETURN     ${response}

PUT campsite and return response
    [Documentation]    Returns the response to updating a campsite via PUT
    [Arguments]   ${campsiteDict}
    ${id}=    Convert To String    ${campsiteDict}[id]
    ${response}=    PUT On Session    alias=${alias}    url=${id}   json=${campsiteDict}
    RETURN     ${response}

Update dict "${dict}" key "${key}" with value "${value}"
    [Documentation]    Takes a dictionary, updates the key with the new value and returns it
    ...    This can also be done directly using the Set To Dictionary keyword
    Set To Dictionary    ${dict}    ${key}=${value}
    RETURN     ${dict}

Update Dictionary with partial dictionary
    [Documentation]    Takes a dictionary, updates the key with the partial_dict and returns it
    ...    This can also be done directly using the Set To Dictionary keyword
    [Arguments]    ${dict}    &{partial_dict}
    Set To Dictionary    ${dict}    &{partial_dict}
    RETURN     ${dict}