*** Settings ***
Documentation    Frontend can be found here: https://travels.praegus.nl/campsites
...              Browser documentation can be found here: https://marketsquare.github.io/robotframework-browser/Browser.html
Resource   resources/frontend_keywords.resource
Test Setup    Start Browser
Suite Teardown    Close Browser

*** Comments ***
This Suite continues on the demo project with assignments

*** Variables ***
${nameInput}=                    id=name
${locationInput}=                id=location
${campsiteTypeSelect}=           id=campsiteType
${terrainTypeSelect}=            id=terrainType
${pricePerNightInput}=           id=pricePerNight
${capacityInput}=                css=[name="capacity"]
${accessibilityLevelSelect}=     xpath=//select[@id="accessibilityLevel"]
${createCampsiteButton}=         text=Create Campsite
*** Test Cases ***
Add Basic Campsite
    Go To    url=${baseUrl}/campsites/new
    # TODO: Edit the "Fill Mandatory Campsite Fields" custom keyword
    #      Add arguments so that each mandatory field is an argument
    Fill Mandatory Campsite Fields    My Campsite    Amsterdam    Tent Camping    Beach    50.00    2    Difficult
    Click    ${createCampsiteButton}
    Get Url    should be    ${baseUrl}/campsites

Add Complete Campsite
    Go To    url=${baseUrl}/campsites/new
    Fill Mandatory Campsite Fields    My Campsite    Amsterdam    Tent Camping    Beach    50.00    2    Difficult

    #TODO: Edit the "Fill Optional Campsite Fields" custom keyword
    # Add optional arguments for "Amenities", "Image URL" and "Description" 
    # Make it so that these are filled when the argument is supplied
    Fill Optional Campsite Fields    Wifi, BBQ, Golf Cart    https://tinyurl.com/smileyplace    We are so happy here
    Click    text=Create Campsite
    Get Url    should be    ${baseUrl}/campsites

    #BONUS: check that the "Campsite created succesfully" message is visible
    # Hint: use "Get Element States" keyword from the Browser library

*** Keywords ***
Fill Mandatory Campsite Fields
    Fill Text    ${nameInput}    txt=RFW Campsite
    Fill Text    ${locationInput}    txt=Gouda
    Select Options By    ${campsiteTypeSelect}    Label    Tent Camping
    Select Options By    ${terrainTypeSelect}    Label    Forest
    Fill Text    ${pricePerNightInput}    25.55
    Fill Text    ${capacityInput}    2
    Select Options By    ${accessibilityLevelSelect}    Label    Easy

Fill Optional Campsite Fields
    #TODO: add Arguments and logic for the fields "Amenities", "Image URL" and "Description"