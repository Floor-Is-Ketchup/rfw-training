*** Settings ***
Documentation    This Suite is meant for practicing the control structures IF and FOR
...
...            Documentation can be found here: 
...    6.1:    https://robotframework.org/robotframework/6.1/RobotFrameworkUserGuide.html#control-structures
...    latest: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#control-structures

*** Variables ***
@{STATUSES}    200    400    404    500    FOO
${current_status}=    200     # Change this status to test your "Check single status" test

*** Test Cases ***
Check single status
    Custom Log Status Checker    ${current_status}

Check every status
    [Tags]    robot:continue-on-failure    #Special robot tag
    Custom Log Status Checker    200    #OK
    Custom Log Status Checker    400    #ERROR: Bad Request
    Custom Log Status Checker    404    #WARN: Not Found
    Custom Log Status Checker    500    #Should result in a sentence in the log, on DEBUG level
    Log To Console    Checked all statusses

Loop over statussen
    #TODO: Replace the questionmarks to make this loop work
    # End result should be a Log statement in the terminal per status in the list (6 total)
    FOR     ?   IN     ?
        Log To Console   Status received: ${status}
    END

Bonus
    [Tags]    bonus    robot:skip    robot:continue-on-failure
    #TODO: Combine a FOR loop with the "Custom Log Status Checker" keyword to simplify the previous Tasks into a few lines
    # Even when executed correctly, this test will not pass due to the "Fail" keyword being called.

*** Keywords ***
#TODO: Fix this keyword to do the following:
# Status 200 already works as intended
# Status 400 should log "Bad Request" to the log.html to the console and to the log.html with loglevel "ERROR"
# Status 404 should log "Not Found" to the log.html with loglevel "WARN"
# Any other status should be logged as "received unknown status:" followed by the status, at loglevel DEBUG
    # And this should also result in a failed test (use the "Fail" keyword from the builtIn library)
    # Tip: dont forget about the ELSE statement

Custom Log Status Checker
    [Arguments]    ${status}
    IF    "${status}" == "200"
        Log To Console    OK         
    ELSE IF  "" == ""
        # TODO: Replace and continue the logic here
        Log    Nothing happens
    END


    