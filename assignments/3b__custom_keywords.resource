*** Settings ***
Documentation     Custom keywords to showcase resourcing
...
...               Documentation: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#resource-and-variable-files

*** Variables ***
${year}=    2025

*** Keywords ***
Special Password Generator
    [Documentation]    This keyword returns a special password for a given username
    #TODO: Add the argument: username
    [Arguments]
    Set Variable    ${password}   ${username}@2025!
    [Return]    TODO: Return the password here

Calculate Difference
    [Documentation]    This keyword returns the difference between x and y
    [Arguments]    ${x}    ${y}=${0}
    ${diff}=    Evaluate    abs(${x} - ${y})
    [Return]    ${diff}

Format Campsite Info
    [Documentation]    Returns a full sentence including the provided information
    [Arguments]    ${campsite_name}    @{features}
    ${sentence}=    Set Variable    The campsite "${campsite_name}" has the following features: ${features}.
    [Return]    ${sentence}