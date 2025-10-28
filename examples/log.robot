*** Settings ***
Documentation     Demonstrates all Robot Framework log levels
Suite Setup       Log    Suite setup message at INFO level
Suite Teardown    Log    Suite teardown message at INFO level
Test Setup        Log    Test setup message at INFO level
Test Teardown     Log    Test teardown message at INFO level

*** Test Cases ***
Demo Logging Levels
    [Documentation]    This test shows different logging levels
    Log    This is an INFO message
    Log To Console    This goes directly to the console
    Log    This is a DEBUG message    level=DEBUG
    Log    This is a TRACE message    level=TRACE
    Log    This is a WARN message    level=WARN
    Log    This is an ERROR message    level=ERROR
    Log    <b>This is HTML bold</b>    html=True