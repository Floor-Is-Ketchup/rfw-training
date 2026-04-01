*** Settings ***
Library    Browser

*** Variables ***
${BASE_URL}=    https://travels.praegus.nl
${nameInput}=                    id=name
${locationInput}=                id=location
${campsiteTypeSelect}=           id=campsiteType
${terrainTypeSelect}=            id=terrainType
${pricePerNightInput}=           id=pricePerNight
${capacityInput}=                css=input[name="capacity"]
${accessibilityLevelSelect}=     xpath=//select[@id="accessibilityLevel"]
${amenitiesInput}=               id=amenities
${imageUrlInput}=                id=imageUrl
${descriptionInput}=             id=description
${availabilityCheckbox}=         css=input[name="available"]
${createCampsiteButton}=         text=Create Campsite             

*** Keywords ***
Start Browser
    [Arguments]    ${slowMo}=1s    ${url}=${BASE_URL}
    New Browser    browser=chromium    headless=False    slowMo=${slowMo}
    New Context    locale=nl-NL    timezoneId=Europe/Amsterdam    ignoreHTTPSErrors=True
    New Page    ${url}

Fill Campsite Fields
    [Arguments]    
    ...    ${name}    
    ...    ${location}    
    ...    ${campsiteType}=Tent Camping    
    ...    ${terrainType}=Forest
    ...    ${pricePerNight}=100    
    ...    ${capacity}=4
    ...    ${accessibilityLevel}=easy
    ...    ${amenities}=${EMPTY}
    ...    ${imageUrl}=${EMPTY}
    ...    ${description}=${EMPTY}
    ...    ${available}=${True}
    
    Fill Text            ${nameInput}                    txt=${name}
    Fill Text            ${locationInput}                txt=${location}
    Select Options By    ${campsiteTypeSelect}           Label    ${campsiteType}
    Select Options By    ${terrainTypeSelect}            Label    ${terrainType}
    Fill Text            ${pricePerNightInput}           txt=${pricePerNight}
    Fill Text            ${capacityInput}                txt=${capacity}
    Select Options By    ${accessibilityLevelSelect}     value    ${accessibilityLevel}
    Fill Text            ${amenitiesInput}               txt=${amenities}
    Fill Text            ${imageUrlInput}                txt=${imageUrl}
    Fill Text            ${descriptionInput}             txt=${description}

    IF    "${available}" == "${False}"
        Uncheck Checkbox    ${availabilityCheckbox}
    END
    
Check Current Url Equals: "${string}"
    ${currentUrl}=    Get Url
    Should Be Equal As Strings    ${currentUrl}    ${string}