*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary

*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Keywords ***

Fill the login Form
    [arguments]       ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      id:signInBtn

wait until Element is located in the page
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
   ${result}=    Get Text    ${Error_Message_Login}
   Should Be Equal As Strings    ${result}    Incorrect username/password.


Fill the Login Details and select the User option

    Input Text    id:username    rahulshettyacademy
    Input Password    id:password    learning
    Click Element    css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Double Click Element    id:okayBtn
    Click Button    id:okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    id:terms
    Checkbox Should Be Selected    id:terms