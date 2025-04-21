*** Settings ***
Documentation    To validate the child window
Library    SeleniumLibrary
Library    Collections
Library    String
Test Setup        Open the browser with the Mortgage payment url
Test Teardown     Close Window
Resource        ../PO/Generic.robot



*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_Page_Load}         css:.nav-link
${cardName}    Blackberry


*** Test Cases ***
Validate Child window functionality
    Select the link of child window
    Verify the user is switched to child window
    Grab the Email-id in the child window
    Switch to parent window and enter the Email

    

*** Keywords ***
Select the link of child window
    Click Element    css:.blinkingText
    Sleep    5

Verify the user is switched to child window
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST
    
Grab the Email-id in the child window
    ${text}=    Get Text    css:.red
    @{words}=    Split String    ${text}    at
    ${text_split}=    Get From List    ${words}    1
    Log    ${text_split}
    @{words_2}=    Split String    ${text_split}
    ${email}=    Get From List    ${words_2}    0
    Log    ${email}
    Set Global Variable    ${email}

Switch to parent window and enter the Email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}




    
    








    
