*** Variables ***
${COMPANY}=    Company
${NAME}=

*** Test Cases ***
Log and Console
    Log    message=This text will be written in the log.html
    Log To Console    message=This text will be written in the terminal only
    Log    message=This text will be written in the terminal and in the log.html    console=true
    # TODO: Log your name so that it is visible both in the terminal and in the console
    # You may use any number of Log statements to achieve this.

Bonus
    #TODO: fill in the variable at the top of this suite so that your name is being added into the Log statement below
    [Tags]  Bonus  robot:skip    # Remove this line to run the test
    Log To Console  my name is: ${NAME} and ${COMPANY} is a fun company to work for!
