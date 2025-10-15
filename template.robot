*** Settings ***
Documentation     Example Robot Framework API testing template using only RequestsLibrary.
Library           RequestsLibrary
Resource          resources/commons.resource
Suite Setup       Create Session    api    ${BASE_URL}
Suite Teardown    Delete All Sessions
Test Setup        Log    Starting Test...
Test Teardown     Log    Test Finished.
Metadata          Author     Your Name
Metadata          Version    1.0
Default Tags      api  demo

*** Variables ***
${url}=            ${BASE_URL}         # commons.resource
${RESOURCE}       /posts
${HEADERS}        {"Content-Type": "application/json"}
${EXAMPLE_ID}     1
${NEW_POST}       {"title": "foo", "body": "bar", "userId": 1}

*** Test Cases ***
Get All Posts
    [Documentation]    Example of a simple GET request
    [Tags]    get
    ${response}=    GET On Session    api    ${RESOURCE}
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.json()}    console=True
    Length Should Be    ${response.json()}    100

Get Single Post
    [Documentation]    Demonstrates a GET with a parameter
    [Tags]    get
    ${response}=    GET On Session    api    ${RESOURCE}/${EXAMPLE_ID}
    Validate Status Code    response=${response}    expected_status=200    #commons.resource
    Should Contain   ${response.json()}    title
    Log    Title: ${response.json()['title']}

Create New Post
    [Documentation]    Demonstrates POST request with JSON body
    [Tags]    post
    ${response}=    POST On Session    api    ${RESOURCE}    data=${NEW_POST}    headers=${HEADERS}
    Should Be Equal As Integers    ${response.status_code}    201
    Log To Console    Created Post ID: ${response.json()['id']}

Update Post
    [Documentation]    Demonstrates PUT request
    [Tags]    put
    ${updated_post}=    Set Variable    {"id": ${EXAMPLE_ID}, "title": "updated", "body": "content", "userId": 1}
    ${response}=    PUT On Session    api    ${RESOURCE}/${EXAMPLE_ID}    data=${updated_post}    headers=${HEADERS}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Updated Post: ${response.json()}

Delete Post
    [Documentation]    Demonstrates DELETE request
    [Tags]    delete
    ${response}=    DELETE On Session    api    ${RESOURCE}/${EXAMPLE_ID}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Deleted Post ID ${EXAMPLE_ID}

*** Keywords ***
# Add your reusable logic here (optional)
Validate JSON Response Should Have Keys
    [Arguments]    ${json}    @{expected_keys}
    FOR    ${key}    IN    @{expected_keys}
        Should Contain     ${json}    ${key}
    END
