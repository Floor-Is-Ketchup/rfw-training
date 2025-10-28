*** Settings ***
Documentation     Demonstrates loops and conditional structures in Robot Framework

*** Variables ***
@{STATUSES}       OK    WARNING    ERROR    UNKNOWN

*** Test Cases ***
Loop Over Statuses
    [Documentation]    Iterate over all statuses and log them
    FOR    ${status}    IN    @{STATUSES}
        Log    Current status: ${status}
    END

Conditional Handling
    [Documentation]    Demonstrates IF/ELSE IF/ELSE/END
    ${status}=    Set Variable    WARNING

    IF    '${status}' == 'OK'
        Log    All good
    ELSE IF    '${status}' == 'WARNING'
        Log    Warning: Something needs attention
    ELSE IF    '${status}' == 'ERROR'
        Fail    Error encountered!
    ELSE
        Log    Unknown state
    END