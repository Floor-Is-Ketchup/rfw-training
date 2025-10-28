*** Settings ***
Documentation   One Testcase in this Suite repeats itself multiple times using a template
Library    RequestsLibrary

*** Test Cases ***
Template requests
    [Template]    Repeatable Keyword with inline arg1: "${id}" and arg2: "${name}"
    #id  #name
    1    Floris
    2    Jan
    3    Klaas
    4    Pieter


*** Keywords ***
Repeatable Keyword with inline arg1: "${id}" and arg2: "${name}"
    Log    ${id}    console=true
    Log    ${name}    console=true