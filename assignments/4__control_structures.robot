*** Settings ***
Documentation    This Suite is meant for practicing the control structures IF and FOR, tests DO NOT need to be adjusted for the main assignment
...              For the Bonus excercise, an adjustment of the Test is required.
...
...            Documentation can be found here: 
...    latest: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#control-structures

*** Variables ***
@{STATUSES}    200   404    500    FOO

*** Test Cases ***
Check information for status 200
    ${info_200}=    Custom Return Status Information    status=${STATUSES}[0]
    Should Contain   container=${info_200}    item=OK    msg=for status "200" the information should contain "OK"

Check information for status 404
    ${info_404}=    Custom Return Status Information    status=${STATUSES}[1]
    Should Contain   container=${info_404}    item=Not Found    msg=for status "404" the information should contain "Not Found"

Check information for status 500
    ${info_500}=    Custom Return Status Information    status=${STATUSES}[2]
    Should Contain   container=${info_500}    item=Error    msg=for status "500" the information should contain "Error"

Check information for status foo
    ${info_foo}=    Custom Return Status Information    status=${STATUSES}[3]
    Should Contain    container=${info_foo}    item=Unknown    msg=for status "FOO" the information should contain "Unknown"

Bonus
    [Documentation]    This test utilizes a FOR loop to run all the tests at once.
    ...    For actual practical use, it would be advised to use a test template instead to achieve the same goal.
    [Tags]    bonus    robot:skip
    #TODO: Replace the "?" and "???" in the following test to make it pass
    #TIP: every "?" is replaced by the exact same string
    VAR    &{status_and_information}=    200=OK    404=Not Found    500=Error    FOO=Unknown
    FOR     ?    IN      ???
        ${status_info}=    Custom Return Status Information    status=?
        Should Contain   container=${status_info}   item=${status_and_information}[?]
        Log To Console    info for status "?" is: ${status_info}
    END

*** Keywords ***
Custom Return Status Information
    [Documentation]    returns information regarding the status
    ...  status 200 = OK, status 404 = Not Found, status 500 = Internal Server Error, other statusses are unknown.
    [Arguments]    ${status}
    IF    "${status}" == "200"
        RETURN   OK  
    ELSE IF  "${status}" == "404"
        RETURN
        # TODO: Replace and continue the logic here to complete the keyword
    END

    RETURN