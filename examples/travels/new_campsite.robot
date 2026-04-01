*** Settings ***
Documentation    Frontend can be found here: https://travels.praegus.nl/campsites/new
Library    Browser
Resource   travels_frontend.resource
Test Setup    Start Browser    slowMo=0s    url=${BASE_URL}/campsites/new
Suite Teardown    Close Browser
Test Template    Fill fields with values and check Create Campsite button state

*** Variables ***
${state}=    enabled

*** Test Cases ***
Fill only mandatory fields    
    ...    name=RFW Campsite
    ...    location=Gouda
    
Fill all fields
    ...    name=RFW Campsite
    ...    location=Gouda
    ...    amenities=Campfire
    ...    imageUrl=https://picsum.photos/200/300
    ...    description=Beautiful place


Mandatory and unavailable
    ...    name=RFW Campsite
    ...    location=Gouda
    ...    available=${False}

No Name or Location
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    state=disabled


*** Keywords ***
Fill fields with values and check Create Campsite button state
    [Arguments]
    ...    ${name}   
    ...    ${location}    
    ...    ${campsiteType}=Tent Camping    
    ...    ${terrainTypeSelect}=Forest
    ...    ${pricePerNight}=100    
    ...    ${capacity}=4
    ...    ${accessibilityLevel}=easy
    ...    ${amenities}=${EMPTY}
    ...    ${imageUrl}=${EMPTY}
    ...    ${description}=${EMPTY}
    ...    ${available}=${True}
    ...    ${state}=enabled

    Fill Campsite Fields
    ...    ${name}   
    ...    ${location}    
    ...    ${campsiteType}  
    ...    ${terrainTypeSelect}
    ...    ${pricePerNight}   
    ...    ${capacity}
    ...    ${accessibilityLevel}
    ...    ${amenities}
    ...    ${imageUrl}
    ...    ${description}
    ...    ${available}

    IF    "${state}" == "enabled"
        Get Element States   ${createCampsiteButton}    contains    enabled
        Click    ${createCampsiteButton}
        Wait Until Keyword Succeeds    10s    1s    Check Current Url Equals: "https://travels.praegus.nl/campsites"
        Wait For Elements State   text=Campsite created successfully    visible
    ELSE
        Wait For Elements State   ${createCampsiteButton}    disabled
        Click With Options    ${createCampsiteButton}    force=True
        Check Current Url Equals: "https://travels.praegus.nl/campsites/new"
    END
    