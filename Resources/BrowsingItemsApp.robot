*** Settings ***
Library            SeleniumLibrary
Resource           PO/HomePage.robot
Resource           PO/LoginPage.robot
Resource           PO/TopNavigationBar.robot
Resource           PO/ResultsPage.robot


Resource           RegisterAndLoginApp.robot

*** Variables ***
#ALGO DE PRODUCTTOS??

*** Keywords ***
Prerequisite
    [Tags]    requisite
    HomePage.Verify page loaded
    RegisterAndLoginApp.Valid Login

Item Search 1
    [Tags]    item-search    item1
    TopNavigationBar.Click All Brands link
    ResultsPage.Verify Page Loaded
    ResultsPage.Sort by price descending
    ResultsPage.Verify Sorting
    ResultsPage.Verify individual product loaded and details
    ResultsPage.Write a review
#Item Search 2

#Item Search 3