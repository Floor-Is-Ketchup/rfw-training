*** Settings ***
Documentation     Test suite using CustomKeywords.robot
...            
...               Documentation: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#creating-user-keywords
# Add your Resource here here

*** Variables ***
${default_username}=    user
${expected_password}=    user@${YEAR}!
${num1}=              ${10}
${num2}=              ${3}
${campsite_name}=     Sunny Meadows
@{features}=          Pool    Wifi    Barbecue

*** Test Cases ***
Test Resource import
    #TODO: Make this test pass and log the variable, by adding a "Resource" in the Settings
    # Make that Resource point to your <name>.resources file (optional: in another directory)
    # Note that we are using the same variable in our Variables section, which should also work after adding the Resource
    Log To Console    ${YEAR}

Test Difference Keyword
    #TODO: Pass the variables "num1" and "num2" in the proper way, so that the test passes
    ${diff}=      Calculate Difference
    Should Be Equal As Integers    ${diff}    7

Test Password Generator Keyword
    #TODO: go to the custom_keywords.resource file and fix the keyword so this test passes
    ${special_password}=    Special Password Generator   username=${default_username}
    Should Be Equal As Strings   ${special_password}    ${expected_password}

Test Print Keyword
    ${formatted_info}=    Get Formatted Campsite Info
    ...    campsite_name=${campsite_name}
    ...    features=${features}
    # TODO: Check that the campsite name and all features are included in the sentence that is returned, 
    # use the "Should Contain" keyword from BuiltIn library (any number of times)
    Should Contain    #TODO: Finish this statement

Bonus
    [Tags]   bonus   robot:skip
    # TODO: Create the "Custom Create Sentence" Keyword so that this test passes
    ${information}=    Custom Format Campsite Info    ${campsite_name}    ${features}
    Log    Custom formatted campsite information: ${information}    console=true
    Check "${information}" Contains: "${features}"
    Check "${information}" Contains: "${campsite_name}"


*** Keywords ***
Custom Format Campsite Info
    #BONUS TODO: Add required argument(s), logic and return statement
    [Arguments]
    # ADD your logic to make a single string/sentence
    RETURN
    # Make sure to also return it


# This keyword is for BONUS test only, and does NOT need to be adjusted. Feel free to ignore this.
Check "${string}" Contains: "${items}"
    [Arguments]  ${items}
    FOR    ${item}    IN    @{items}
        Should Contain    @{string}[0]    ${item}    msg=String "${string}" does NOT contain "${item}"
    END
