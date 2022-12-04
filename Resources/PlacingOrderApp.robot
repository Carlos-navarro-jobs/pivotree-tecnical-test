*** Settings ***
Library            SeleniumLibrary
Resource           PO/HomePage.robot
Resource           PO/LoginPage.robot
Resource           PO/TopNavigationBar.robot
Resource           PO/ResultsPage.robot
Resource           Common.robot
Resource           PO/checkout.robot

Resource           RegisterAndLoginApp.robot


*** Variables ***
${PLACING_ORDER_STR_TO_SEARCH_ITEM1} =                        DSLR-A900
${PLACING_ORDER_STR_TO_SEARCH_ITEM2} =                        1V
@{CHECKOUT_SHIPPING_DETAILS} =    Carlos    Navarro    Calle Buenavista 1    Valencia    46115     156845928  
@{CHECKOUT_CARD_DETAILS} =        Carlos Navarro    1234567812345678    123      

*** Keywords ***
Prerequisite
    [Tags]    requisite
    HomePage.Verify page loaded
    TopNavigationBar.Click SignIn Link
    LoginPage.Verify Page Loaded
    RegisterAndLoginApp.Valid Login

Add Item 1 to cart
    TopNavigationBar.Top Navigation Item Search                         ${PLACING_ORDER_STR_TO_SEARCH_ITEM1}
    ResultsPage.Verify generic search worked and click first link       ${PLACING_ORDER_STR_TO_SEARCH_ITEM1}
    ResultsPage.Add product to cart and view cart                       ${PLACING_ORDER_STR_TO_SEARCH_ITEM1}
    ResultsPage.Verify Cart count    1

Add Item 2 to cart
    TopNavigationBar.Top Navigation Item Search                         ${PLACING_ORDER_STR_TO_SEARCH_ITEM2}
    ResultsPage.Verify generic search worked and click first link       ${PLACING_ORDER_STR_TO_SEARCH_ITEM2}
    ResultsPage.Add product to cart and view cart                       ${PLACING_ORDER_STR_TO_SEARCH_ITEM2}
    ResultsPage.Verify Cart count    2

Checkout & place order
    ResultsPage.proceed to checkout
    Checkout.Manual Fill country name
    Checkout.Manual Fill Title
    Checkout.Fill First Name                  ${CHECKOUT_SHIPPING_DETAILS}[0]
    Checkout.Fill Last Name                   ${CHECKOUT_SHIPPING_DETAILS}[1]
    Checkout.Fill Address                     ${CHECKOUT_SHIPPING_DETAILS}[2]
    Checkout.Fill city                        ${CHECKOUT_SHIPPING_DETAILS}[3]
    Checkout.Fill Zip code                    ${CHECKOUT_SHIPPING_DETAILS}[4]
    Checkout.Fill Phone Number                ${CHECKOUT_SHIPPING_DETAILS}[5]
    Checkout.Click Continue2
    Checkout.Select premium delivery
    Checkout.Click Continue2
    #I did not manage to succeed with any strategy for selecting the dropdown menus, I decided to employ a tab strategy to fill al the info of this page.
    Checkout.Manual fill payment details      ${CHECKOUT_CARD_DETAILS}[0]    ${CHECKOUT_CARD_DETAILS}[1]    ${CHECKOUT_CARD_DETAILS}[2]     
    Checkout.Click Continue1
    Checkout.accept T&A
    Checkout.Click Continue1




