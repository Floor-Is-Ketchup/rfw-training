*** Settings ***
Documentation     Example Robot Framework template showing all key sections and syntaxes.
...               Copy & paste friendly — good for learning.
Library           RequestsLibrary
Library           OperatingSystem
Resource          resources/commons.resource
Suite Setup       Setup Suite
Suite Teardown    Teardown Suite
Test Setup        Setup Test
Test Teardown     Teardown Test
Metadata          Author     Your Name
Metadata          Version    1.0
Default Tags      demo  template

*** Variables ***
# Global variables (can be overridden in resource or command line)
${URL}            ${BASE_URL}        #resource: commons.resource
${SCALAR_EXAMPLE}        hello world
@{LIST_EXAMPLE}   apple  orange  banana
&{DICT_EXAMPLE}   username=user  password=very_secret!

*** Test Cases ***
Example Test Case
    [Documentation]    This test demonstrates basic keywords and structure.
    [Tags]    smoke  regression
    Log    Starting Example Test Case

Example Test With Custom Keyword
    [Documentation]    Shows using a user-defined keyword.
    Custom Keyword Example    ${SCALAR_EXAMPLE}

Example Test Using Dictionary And List
    [Tags]    dict
    Log    ${DICT_EXAMPLE}[username]
    Log    ${LIST_EXAMPLE}[0]

Example Test Using FOR Loop
    [Tags]    loop    list
    FOR    ${fruit}    IN    @{LIST_EXAMPLE}
        Log    ${fruit}
    END
    
Test With Overriden Test Setup and Test Teardown
    [Setup]    #Do nothing
    [Teardown]    #Do nothing
    Log    This test had no Test Setup or Test Teardown


*** Keywords ***
Setup Suite
    Log    Running Suite Setup    console=true
    # Add suite-level initialization here

Teardown Suite
    Log To Console   Running Suite Teardown
    # Add suite-level cleanup here

Setup Test
    Log    Running Test Setup    level=DEBUG
    # Add per-test setup here

Teardown Test
    Log    Running Test Teardown
    # Add per-test cleanup here

Custom Keyword Example
    [Arguments]    ${arg1}
    Log To Console    \nRunning custom keyword with argument: ${arg1}
    ${upper}=    Convert "${arg1}" To Uppercase        # imported from commons.resource
    Log    Converted: ${upper}
    [Return]    ${upper}

Conditional Keyword Example
    [Arguments]    ${status}    ${optional_argument}=${EMPTY}
    IF    '${status}'=='OK'
    ...    Log    Status OK
    ...    ELSE IF    '${status}'=='WARN'    Log    Status Warning
    ...    ELSE    Fail    Unexpected Status: ${status}

    IF    '${optional_argument}' != '${EMPTY}'
        Log To Console    ${optional_argument}
    END
    

*** Comments ***
# - Each section starts with *** SectionName ***
# - Sections: Settings, Variables, Test Cases (Tasks (for RPA)), Keywords, Comments
# - Use [Setup], [Teardown], [Tags], [Documentation], [Template], [Timeout] in tests.
# - Lines starting with '#' are comments.
