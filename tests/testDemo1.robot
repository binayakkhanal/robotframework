*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Teardown    Close Window

*** Variables ***
${Error_Message_Login}    css:.alert-danger


*** Test Cases ***
Validate Successful Login
    open the browser with the Mortgage payment url
    Fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    12345678
    Click Button      id:signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
   ${result}=    Get Text    ${Error_Message_Login}
   Should Be Equal As Strings    ${result}    Incorrect username/password.
