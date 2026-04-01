*** Settings ***
Library    Browser

*** Test Cases ***
# Example usage of selectors
Example Selectors Test
    # Text selectors
    Click    text=View All Campsites    #Exact Match
    Click    text=View All           #Partial Match also works

    # ID selectors
    Click    id=submit
    Select Options By    id=accessibilityLevel    index    2

    # Data-TestId selectors
    Click    data-testid=view-campsites

    # Role selectors
    Click    role=button[name="Add Campsite"]
    Click    role=link[name="View All Campsites"]
    Fill Text    role=textbox[name="Email"]    test@example.com
    Click    role=checkbox[name="Remember me"]

    # CSS selectors
    Click    css=button    #type
    Click    css=.btn-primary    #class
    Click    css=#submit    #id
    Click    css=a[href="/campsites"]    #combine
    Click    css=div.card > button    #child

    # Combining selectors
    Click    css=div.card >> text=Buy Now
    Click    css=form >> css=input[name="email"]
    Click    role=dialog >> text=Confirm
    Click    css=.btn.btn-primary >> nth=0
    Fill Text    css=input[type="text"]#name    My Campsite

    # Select Options
    Select Options By    id=accessibilityLevel    index    2
    Select Options By    role=combobox[name="Campsite Type"]    value    tent
    Select Options By    css=#campsiteType    value    cabin

    # XPath selectors
    Click    xpath=//a[@href='/campsites/new']
    Click    xpath=//a[contains(@href, '/campsites')]
    Click    xpath=//a[@class='btn bg-white text-primary-700 hover:bg-gray-100']
    Click    xpath=//a[contains(@class, 'btn') and contains(@class, 'bg-white')]
    Click    xpath=//a[text()='List Your Campsite']
    Click    xpath=//a[contains(text(), 'List Your')]
    Click    xpath=//a[contains(@class, 'btn') and text()='List Your Campsite']
    Click    xpath=//a[@href='/campsites/new' and text()='List Your Campsite']
    Click    xpath=//a[starts-with(@href, '/campsites') and contains(@class, 'btn')]
    Click    xpath=(//a[contains(@class, 'btn')])[1]

    # Best Practice: Focus on the most stable selectors (often role or id, sometimes text)
