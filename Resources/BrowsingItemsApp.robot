*** Settings ***
Library            SeleniumLibrary
Resource           PO/HomePage.robot
Resource           PO/LoginPage.robot
Resource           PO/TopNavigationBar.robot
Resource           PO/ResultsPage.robot
Resource           Common.robot
Resource           InputData.robot


Resource           RegisterAndLoginApp.robot

*** Variables ***
#ALGO DE PRODUCTTOS??

*** Keywords ***
Prerequisite
    [Tags]    requisite
    HomePage.Verify page loaded
    TopNavigationBar.Click SignIn Link
    LoginPage.Verify Page Loaded
    RegisterAndLoginApp.Valid Login

Item Search 1
    [Tags]    item-search    item1    item-details
    TopNavigationBar.Click All Brands link
    ResultsPage.Verify Page Loaded
    ResultsPage.Sort by price descending
    ResultsPage.Verify Sorting
    ResultsPage.Verify item 1 product loaded and details
    ResultsPage.Write a review
Item Search 2
    [Tags]    item-search    item2    window-size
    Common.Shrink Browser
    TopNavigationBar.Click Hamburger Button
    TopNavigationBar.Click Film Cameras link
    ResultsPage.Switch to grid product layout
    ResultsPage.Click and verify item 2 product loaded and details
    ResultsPage.Add item 2 to wishlist
Item Search 3
    [Tags]    item-search    item3
    TopNavigationBar.Top Navigation Item Search            ${RESULTS_STR_TO_SEARCH_ITEM3}
    ResultsPage.Verify item 3 product loaded in search