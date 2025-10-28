*** Settings ***
Documentation     Answer the commented questions for yourself, run the suite and check your answers
...        
...        documentation: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#variables
Suite Setup       Set All Suite Variables    #sets SUITE_VAR to S_A

*** Variables ***
${GLOBAL_VAR}=     G_A

*** Test Cases ***
Test 1 - Set Variables
    [Documentation]    Setting and logging several vars with different scopes
    Set Test Variable    ${Test_VAR}    T_A
    Log   SUITE_VAR IS NOW: ${SUITE_VAR}        # What is the value here? S_A or S_B?
    Set Suite Variable    ${SUITE_VAR}   S_B
    Log    SUITE_VAR IS NOW: ${SUITE_VAR}        # What is the value here? S_A or S_B?
    Set Variable   ${global_var}    G_B
    Log    GLOBAL_VAR IS NOW: ${GLOBAL_VAR}        # What is the value here? G_A or G_B?

Test 2 - Log Variables
    [Documentation]    Setting and logging several vars with different scopes
    [Setup]    Set Test Variable    ${TEST_VAR}    T_B
    Log    TEST_VAR IS NOW: ${TEST_VAR}           # What is the value here?    T_A or T_B?
    Log    SUITE_VAR IS NOW: ${ S U I T E _ V A R }          # What is the value here?    S_A or S_B?
    Log    GLOBAL_VAR IS NOW: ${globaL_ var}        # What is the value here?     G_A or G_B?
    Keyword to Set my TEST_VAR
    Log    TEST_VAR IS NOW: ${TEST_VAR}        # What is the value here? T_A, T_B or T_C?

Bonus
    [Tags]    bonus    robot:skip
    Log To Console     ${suite_VAR}    # What is the value if you run the whole suite?
                                       # And what if you only run this test?

*** Keywords ***
Set All Suite Variables
    Set Suite Variable    ${Suite _ Var}    S_A

Keyword to Set my TEST_VAR
    Set Variable    ${TEST_Var}    T_C
    Log To Console    set the value for TEST_VAR to: ${TEST_VAR}
