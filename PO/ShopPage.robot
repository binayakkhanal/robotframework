*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary

*** Variables ***
${Shop_Page_Load}         css:.nav-link

*** Keywords ***


wait until Element is located in the page
    Wait Until Element Is Visible    ${Shop_Page_Load}


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
