*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
Test Setup        Open the browser with the Mortgage payment url
Test Teardown     Close Window
Resource        ../PO/Generic.robot



*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_Page_Load}         css:.nav-link
${cardName}    Blackberry


*** Test Cases ***
Validate UnSuccessful Login
    
    Fill the login form    ${user_name}    ${invalid_password}
    wait until Element is located in the page    ${Error_Message_Login} 
    verify error message is correct
    
Validate Cards display in the Shopping Page
    Fill the login form    ${user_name}    ${valid_password}
    wait until Element is located in the page    ${Shop_Page_Load}
    Verify Card titles in the Shop page
    Select the Card    ${cardName}
    

Select the Form and navigate to Child window
    Fill the Login Details and select the User option

*** Keywords ***

Fill the login Form
    [arguments]       ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      id:signInBtn

wait until Element is located in the page
    [arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    


verify error message is correct
   ${result}=    Get Text    ${Error_Message_Login}
   Should Be Equal As Strings    ${result}    Incorrect username/password.
   
Verify Card titles in the Shop page
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =    Get Webelements    css:.card-title
    @{actualList}=    Create List
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}
    END
    
    Lists Should Be Equal    ${expectedList}    ${actualList}
    
Select the Card
    [arguments]    ${cardName}
    ${elements} =    Get Webelements    css:.card-title
    ${index}=    Set Variable    1 
    FOR    ${element}    IN    @{elements}
        ${condition}=    Evaluate    '${element.text}' == '${cardName}'
        Exit For Loop If    ${condition}
        ${index} =    Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
    
    
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


    



    
