*** Settings ***
Library             SeleniumLibrary
Resource            ../Resources/Common.robot
Resource            ../Resources/RegisterAndLoginApp.robot
Resource            ../Resources/BrowsingItemsApp.robot
Resource            ../Resources/PlacingOrderApp.robot
Test Setup          Begin Test
Test Teardown       End Test




*** Variables ***


*** Keywords ***

*** Test Cases ***
Register and Login Scenarios
    [Documentation]    Testing valid and unvalid register and login scenarios
    [Tags]             Test1
    RegisterAndLoginApp.Prerequisite
    RegisterAndLoginApp.Invalid Register
    RegisterAndLoginApp.Valid Register
    RegisterAndLoginApp.Blank Login
    RegisterAndLoginApp.Invalid Password Login
    RegisterAndLoginApp.Unregistered Email Login
    RegisterAndLoginApp.Forgot Password
    RegisterAndLoginApp.Valid Login

Browsing items
    [Documentation]    Browsing items and checking for product details and some related web features
    [Tags]             Test2
    BrowsingItemsApp.Prerequisite
    BrowsingItemsApp.Item Search 1
    BrowsingItemsApp.Item Search 2
    BrowsingItemsApp.Item Search 3

Placing an Order
    [Documentation]    Placing an order through manual and quick order methods
    [Tags]             Test3
    PlacingOrderApp.Prerequisite
    PlacingOrderApp.Add Item 1 to cart
    PlacingOrderApp.Add Item 2 to cart
    PlacingOrderApp.Checkout & place order
    sleep  4