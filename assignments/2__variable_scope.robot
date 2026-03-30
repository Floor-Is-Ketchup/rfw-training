*** Settings ***
Documentation     Answer the commented questions for yourself, run the suite and check your answers
...        
...        documentation: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#variables
Suite Setup       Set All Global Variables    #sets GLOBAL_VAR to G_A

*** Variables ***
${SUITE_VAR}=     S_A

*** Test Cases ***
Test 1 - Set Variables
    [Documentation]    Setting and logging several vars with different scopes
    Log To Console   SUITE_VAR IS NOW: ${SUITE_VAR}        # What is the value here? S_A or S_B?
    Set Suite Variable    ${SUITE_VAR}   S_B
    Log To Console    SUITE_VAR IS NOW: ${SUITE_VAR}        # What is the value here? S_A or S_B?
    Log To Console    GLOBAL_VAR IS: ${GLOBAL_VAR}
    ${global_var}=     Set Variable    G_B                # What is the value here? G_A or G_B?
    Log To Console    GLOBAL_VAR IS NOW: ${GLOBAL_VAR}     # What is the value here? G_A or G_B?

Test 2 - Log Variables
    [Documentation]    Setting and logging several vars with different scopes
    [Setup]    Set Test Variable    ${TEST_VAR}    T_B
    Log To Console    TEST_VAR IS NOW: ${TEST_VAR}           # What is the value here?    T_A or T_B?
    Log To Console    SUITE_VAR IS NOW: ${ S U I T E _ V A R }          # What is the value here?    S_A or S_B?
    Log To Console    GLOBAL_VAR IS NOW: ${globaL_ var}        # What is the value here?     G_A or G_B?
    Keyword to Set Variables
    Log To Console    TEST_VAR IS NOW: ${TEST_VAR}        # What is the value here? T_A, T_B or T_C?
    Log To Console    ${my_var}    # What is the value here?    v_a    or is it unknown?

Bonus
    [Tags]    bonus
    Log To Console     suite var in bonus is: ${suite_VAR}    # What is the value if you run the whole suite?
    Log To Console     Global var in bonus is: ${global_var}
                                       # And what if you only run this test?

*** Keywords ***
Set All Global Variables
    Set Global Variable    ${Global _ Var}    G_A

Keyword to Set Variables
    ${TEST_Var}=     Set Variable   T_C
    Log To Console    set the value for TEST_VAR to: ${TEST_VAR}    # What is the value here? T_A, T_B or T_C?
    ${my_var}=    Set Variable     v_a
    Set Suite Variable    ${suite_VAR}    S_C