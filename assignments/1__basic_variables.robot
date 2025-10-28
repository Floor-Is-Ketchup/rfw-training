*** Settings *** 
Documentation     #TODO quick description of this suite
Suite Setup       #TODO: Log your list here
Suite Teardown    #TODO: Log your dict here
Metadata          Author   Anonymous

*** Variables ***
# TODO: give appropriate names and values for the following Variables
# e.g. the scalar is your name,
# the list are 3 of your hobbies
# and the dict is your birthday with keys "year", "month", "day"

${SCALAR}=
@{LIST}=
&{DICT}=

*** Test Cases ***
Test Case Title
    #TODO: Log your scalar here

Bonus
    [Tags]  Bonus  robot:skip    # Remove this line to run the test
    # TODO:
    # - Log the second element of your list
    # - Log the value of the first key of your dict
    Log    nothing yet

#BONUS: Add the comments section here with a single comment in it.