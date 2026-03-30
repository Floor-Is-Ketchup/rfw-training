*** Settings ***
Library    Browser

*** Variables ***
${baseUrl}=    https://travels.praegus.nl

*** Keywords ***
Start Browser
    [Arguments]    ${slowMo}=1s
    New Browser    browser=chromium    headless=False    slowMo=${slowMo}
    New Context    locale=nl-NL    timezoneId=Europe/Amsterdam    ignoreHTTPSErrors=True
    New Page    ${baseUrl}
