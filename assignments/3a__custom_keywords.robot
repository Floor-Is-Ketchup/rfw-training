*** Settings ***
Documentation     Test suite using CustomKeywords.robot
...            
...               Documentation: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#creating-user-keywords
# Add a Resource here

*** Variables ***
${default_username}=    user
${expected_password}=    user@${year}!
${num1}=              ${10}
${num2}=              ${3}
${campsite_name}=     Sunny Meadows
@{features}=          Pool    Wifi    Barbecue

*** Test Cases ***
Test Resource import
    #TODO: Make this test pass and log the variable, by adding a "Resource" in the Settings
    # Make that Resource point to your <name>.resources file (optional: in another directory)
    # Note that we are using the same variable in our Variables section, which should also work after adding the Resource
    Log To Console    ${year}

Test Difference Keyword
    #TODO: Pass the variables "num1" and "num2" in the proper way, so that the test passes
    ${diff}=      Calculate Difference
    Should Be Equal As Integers    ${diff}    7

Test Password Generator Keyword
    #TODO: go to the custom_keywords.resource file and fix the keyword so this test passes
    ${special_password}=    Special Password Generator   username=${default_username}
    Should Be Equal As Strings   ${special_password}    ${expected_password}

Test Formatting Keyword
    ${sentence}=    Format Campsite Info    
    ...    ${campsite_name}    @{features}
    # TODO: Check that the campsite name is included in the sentence that is returned, 
    # use the "Should Contain" keyword from BuiltIn library

Bonus
    [Tags]   bonus   robot:skip
    ${default_sentence}=    Format Campsite Info
    ...   ${campsite_name}    
    ...   ${features}

    # TODO: Create the "Custom Create Sentence" Keyword so that this test passes

    ${custom_sentence}=    Custom Format Campsite Info
    ...   ${campsite_name}    
    ...   ${features}

    Should Be Equal As Strings    ${default_sentence}    ${custom_sentence}

    

*** Keywords ***
Custom Format Campsite Info
    [Arguments]    ${campsite_name}    @{features}
    ${sentence}=    Custom Create Sentence     ${campsite_name}    ${features}
    [Return]    ${sentence}

#BONUS TODO: Create the missing Keyword here
    # Add the proper arguments, logic and return statement
    # Look at "Format Campsite Info" for inspiration
