*** Settings ***
Documentation    Every TC in this suite is created with a test template
Library    RequestsLibrary
Test Template    mijn te herhalen template keyword
Test Tags    Template

*** Test Cases ***                          Testcase      Variatie
Testcase 1, variatie A                         1        A
    [Tags]    TC1
Testcase 1, Variatie B                         1        B
    [Tags]    TC1
Aantal data records groter dan pagesize        2        A
    [Tags]    TC2

*** Keywords ***
mijn te herhalen template keyword
    [Arguments]    ${arg1}    ${arg2}
    Log    \nTestcase nummer is: ${arg1}    console=true
    Log    Variatie type is: ${arg2}    console=true