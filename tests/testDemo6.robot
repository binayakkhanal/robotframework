*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
Library    ../customLibraries/Shop.py
Test Setup        Open the browser with the Mortgage payment url
Test Teardown     Close Window
Resource        ../PO/Generic.robot
Resource    ../PO/LandingPage.robot
Resource    ../PO/ShopPage.robot
Resource    ../PO/CheckoutPage.robot
Resource    ../PO/ConfirmationPage.robot





*** Variables ***


${cardName}    Blackberry
@{listofProducts}    Blackberry    Nokia Edge


*** Test Cases ***
Validate UnSuccessful Login
    
    LandingPage.Fill the login form    ${user_name}    ${invalid_password}
    LandingPage.wait until Element is located in the page
    LandingPage.verify error message is correct
    
Validate Cards display in the Shopping Page
    LandingPage.Fill the login form    ${user_name}    ${valid_password}
    ShopPage.wait until Element is located in the page
    ShopPage.Verify Card titles in the Shop page
    add_items_to_cart_and_checkout    ${listofProducts}
    CheckoutPage.Verify items in the Checkout Page and proceed
    ConfirmationPage.Enter the Country and select the terms    ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase
    #Select the Card    ${cardName}
    

Select the Form and navigate to Child window
    LandingPage.Fill the Login Details and select the User option








    



   

    

    



    



    
