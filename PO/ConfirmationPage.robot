*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary

*** Variables ***
${Shop_Page_Load}         css:.nav-link

*** Keywords ***


Enter the Country and select the terms
    [Arguments]    ${country_name}
    Input Text    css:#country    ${country_name}
    Sleep    3
    Wait Until Element Is Visible    //a[text()='${country_name}']
    Click Element    //a[text()='${country_name}']
    Click Element    css:.checkbox label
    

Purchase the Product and Confirm the Purchase
    Click Button    css:.btn-success
    Page Should Contain    Success!