*** Variables ***
${company}=     
${name}=

*** Test Cases ***
Log and Console
    Log    in log.html
    Log To Console    in terminal only
    Log    in log.html and terminal CCC    console=true
    # TODO: Log your name so that it is visible both in the terminal and in the console
    # You may use any number of Log statements to achieve this.

Bonus
    #TODO: fill in the variables at the top so that your name is printed in the sentence
    [Tags]    robot:skip
    Log To Console
    ...    my name is: ${name} and ${company} is a fun company to work for!