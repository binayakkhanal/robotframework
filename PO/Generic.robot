*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...    
...              The system specific keywords created here from our own
...              domain specific language. They utilize keywords provided
...              by the imported SeleniumLibrary.
Library          SeleniumLibrary


*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}     12345678
${valid_password}       learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/
${country_name}         India


*** Keywords ***
Open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To               ${url}
