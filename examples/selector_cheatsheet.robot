*** Settings ***
Library    Browser

*** Variables ***
${BASE_URL}    https://example.com

*** Test Cases ***
# Example usage of selectors
Example Selectors Test
    # Text selectors
    Click    text=View All Campsites
    Click    text=/View All/i

    # ID selectors
    Click    id=submit
    Fill Text    id=name    My Campsite
    Select Options By    id=accessibilityLevel    index    2

    # Data-TestId selectors
    Click    data-testid=view-campsites

    # Role selectors
    Click    role=button[name="Add Campsite"]
    Click    role=link[name="View All Campsites"]
    Fill Text    role=textbox[name="Email"]    test@example.com
    Click    role=checkbox[name="Remember me"]
    Select Options By    role=combobox[name="Campsite Type"]    value    tent

    # CSS selectors
    Click    css=button
    Click    css=.btn-primary
    Click    css=#submit
    Click    css=a[href="/campsites"]
    Click    css=div.card > button
    Fill Text    css=input[name="email"]    test@example.com
    Select Options By    css=#campsiteType    value    cabin

    # Combining selectors
    Click    css=div.card >> text=Buy Now
    Click    css=form >> css=input[name="email"]
    Click    role=dialog >> text=Confirm
    Click    css=.btn.btn-primary >> text=Add Campsite
    Fill Text    css=input[type="text"]#name    My Campsite

    # Index / nth selectors
    Click    css=button >> nth=0
    Click    xpath=(//button)[2]
    Select Options By    id=accessibilityLevel    index    2

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

    # Form selectors
    Select Options By    id=campsiteType    value    tent
    Select Options By    id=accessibilityLevel    index    2
    Fill Text    id=name    My Campsite
    Fill Text    role=textbox[name="Email"]    test@example.com

    # Label selectors
    Fill Text    label=Email    test@example.com
    Click    label=Accept Terms

    # Best Practice: Focus on the most stable selectors (often role or id, sometimes text)
