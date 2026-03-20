*** Settings ***
Documentation    
Suite Setup     Setup Travel Suite   
Suite Teardown    Delete All Sessions
Resource    6b_bonus_travels.resource
Test Setup    #TODO
Test Teardown    #TODO

*** Comments ***
!!! Use the Keywords defined in the .resource file to create your tests at hand !!!

TODO:
Add a variable called "test_campsite" that starts as an empty dict
Add a Test Setup to the Settings that calls the custom keyword "Create Test Campsite"
Complete the custom keyword called "Create test campsite" 
    # it should create a campsite for this test and store it in the variable
Add a Test Teardown to the Settings that calls the custom keyword "Delete Test Campsite"
Complete the custom keyword called "Delete Test Campsite"
    # it should delete the campsite again

Then complete the Test Campsite Update Test Case
After that, complete the "check maxPrice filter"


*** Variables ***
${newName}=    NewName

*** Test Cases ***
Test Campsite Update
#TODO: Test the updating of a campsite
    # use a GET request to get the campsite (using the test_campsite id)
    # Update the name (hint: use the provided keywords)
    # uses a PUT request to update the campsite
    # uses a GET request to get the updated campsite (using the id)
    # check if the campsite's name is now the expected value
    Fail    NOT IMPLEMENTED YET

Test Campsite Creation
#TODO: Test that a campsite is properly created
    # Create a dict with at the 9 mandatory key/value pairs for a campsite
    # Access the dict values to pass them to the POST keyword
        # OPTIONAL: figure out how to POST it directly for yourself
    # Loop through the response.json() and the original dict to check if each value was properly created
    # Since this test requires no Test Setup, make sure to override the default Test Setup with doing nothing
    # DELETE the campsite you created here, inside the Test Teardown
    Fail    NOT IMPLEMENTED YET

*** Keywords ***
Create Test Campsite
    # Create a campsite using a POST request
    # Save the full campsite information of the created campsite as variable on test scope
    # Log the name and id of the created campsite
    Log    created: ${test_campsite}[name] with id: ${test_campsite}[id]

Delete Test Campsite
    # Delete the campsite created during setup, using the available keywords
    # Log the name and id of the deleted campsite
    Log    deleted: ${test_campsite}[name] with id: ${test_campsite}[id]