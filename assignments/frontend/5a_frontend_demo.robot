*** Settings ***
Documentation    This is a demo Suite
...              Frontend can be found here: https://travels.praegus.nl/campsites
...              Browser documentation can be found here: https://marketsquare.github.io/robotframework-browser/Browser.html
Library    Browser
Resource   resources/frontend_keywords.resource
Test Setup    Start Browser
Suite Teardown    Close Browser

*** Comments ***
This suite is to explore and "play around" with very basic Browser actions on the praegus travels website
Feel free to "play around" with the different functionalities of the website
Since this is a demo Suite, there are no TODO's here 

*** Variables ***
${nameInput}=                    id=name
${locationInput}=                id=location
${campsiteTypeSelect}=           id=campsiteType
${terrainTypeSelect}=            id=terrainType
${pricePerNightInput}=           id=pricePerNight
${capacityInput}=                css=[name="capacity"]
${accessibilityLevelSelect}=     xpath=//select[@id="accessibilityLevel"]

*** Test Cases ***
Go to campsite overview with View All
    Click    text=List Your Campsites
    Get Url    should be    ${baseUrl}/campsites/new

Add Basic Campsite
    Go To    url=${baseUrl}/campsites/new
    Fill Campsite Fields
    Click    text=Create Campsite
    Get Url    should be    ${baseUrl}/campsites

*** Keywords ***
Fill Campsite Fields
    Fill Text            ${nameInput}                    txt=RFW Campsite
    Fill Text            ${locationInput}                txt=Gouda
    Select Options By    ${campsiteTypeSelect}           Label    Tent Camping
    Select Options By    ${terrainTypeSelect}            value    forest
    Fill Text            ${pricePerNightInput}           txt=25.55
    Fill Text            ${capacityInput}                txt=2
    Select Options By    ${accessibilityLevelSelect}     index    2
