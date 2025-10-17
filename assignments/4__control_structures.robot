*** Settings ***
Documentation    This Suite is meant for practicing the control structures IF and FOR
...
...            Documentation can be found here: 
...    6.1:    https://robotframework.org/robotframework/6.1/RobotFrameworkUserGuide.html#control-structures
...    latest: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#control-structures

*** Variables ***
@{STATUSES}    200    400    404    500    999    FOO
${current_status}=    200     # Change this status to test your "Log status" test

*** Test Cases ***
Check single status
    Log status    ${current_status}

Check every status
    [Tags]    robot:continue-on-failure    #Special robot tag
    Log status    200    #OK
    Log status    400    #ERROR: Bad Request
    Log status    404    #WARN: Not Found
    Log status    500    #Should Fail the test
    Log status    999    #Should result in a sentence in the log, on DEBUG level
    Log To Console    Checked all statusses

Loop over statussen
    #TODO: Replace the questionmarks to make this loop work
    FOR     ?   IN     ?
        Log To Console   Status received: ${status}
    END

Bonus
    [Tags]    bonus    robot:skip
    #TODO: Combine a FOR loop with the "Log status" keyword to simplify the previous Tasks into a few lines

*** Keywords ***
#TODO: Fix this keyword to do the following:
# Status 200 already works as intended
# Status 400 should log "Bad Request" to the log.html to the console and to the log.html with loglevel "ERROR"
# Status 404 should log "Not Found" to the log.html with loglevel "WARN"
# Status 500 should FAIL the task/test (use the Fail keyword from BuiltIn) with text "Internal Server Error"
# Any other status should be logged as "received unknown status:" followed by the status, at loglevel DEBUG
    # Tip: dont forget about the ELSE statement

Log status
    [Arguments]    ${status}
    IF    "${status}" == "200"
        Log To Console    OK         
    ELSE IF  "" == ""
        # TODO: Replace and continue the logic here
        Log    Nothing happens
    END


    