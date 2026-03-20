*** Settings ***
Documentation    Frontend can be found here: https://travels.praegus.nl/campsites
...              Browser documentation can be found here: https://marketsquare.github.io/robotframework-browser/Browser.html
Resource   resources/frontend_keywords.resource
Test Setup    Start Browser
Suite Teardown    Close Browser

*** Comments ***
This Suite continues on the demo project with assignments

*** Variables ***
${CreateCampsiteButton}=

*** Test Cases ***
Test List Your Campsites Button
    Click    text=List Your Campsite
    Get Url    should be    ${baseUrl}/campsites/new

Test View All Campsites Button
    Click    #TODO: add the selector for the "View All Campsites" button here
    Get Url    should be    ${baseUrl}/campsites

Create Campsite is disabled when fields are empty
    # TODO: Complete the Variable statement on the top of this file with a css selector
    # Hint: use the fact that it is a button and it has "type=submit"
    
    Go To    url=${baseUrl}/campsites/new

    # TODO: Use your selector to determine that it is disabled when no data is filled in
    # Hint: use the "Wait For Elements Sate" keyword from Browser Library

Bonus
    [Tags]  Bonus  robot:skip    # Remove this line to run the test
    # BONUS: add a test for the red "Add Campsite" button at the top
    # Hint: There are 2 elements with the text "Add Campsite", try to find a solution
    # Check the cheat sheet or feel free to search the web for solutions
    Log    Not implemented yet
