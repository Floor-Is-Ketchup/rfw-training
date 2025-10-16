*** Settings ***
Documentation     Custom keywords to showcase resourcing

*** Keywords ***
Special Password Generator
    [Documentation]    This keyword returns a special password for a given username
    #TODO: Add the argument username
    [Arguments]
    Set Variable    ${password}   ${username}@2025!
    [Return]
    ...    #TODO: Return the password here

Calculate Difference
    [Documentation]    This keyword calculates the difference between value 1 and 2
    [Arguments]    ${x}=1    ${y}=1
    ${diff}=    Evaluate    abs(${x} - ${y})
    [Return]    ${diff}

Format Campsite Info
    [Arguments]    ${campsite_name}    @{features}
    ${sentence}=    Set Variable    The campsite "${campsite_name}" 
    ...    has the following features: ${features}.
    [Return]    ${sentence}