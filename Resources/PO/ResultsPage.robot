*** Settings ***
Library  SeleniumLibrary

Resource    TopNavigationBar.robot
Resource    LoginPage.robot

*** Variables ***
${RESULTS_ALLBRANDS_RELEVANCE_LIST} =             xpath=//div[@role="combobox"]
${RESULTS_STR_TO_SEARCH_ITEM1} =                        DSLR-A900, body
${RESULTS_STR_TO_SEARCH_ITEM2} =                        1V
${RESULTS_STR_TO_SEARCH_ITEM3} =                        Wide Strap for EOS
#The position of this locator references the top hit
${RESULTS_ITEM1_LINK} =                           xpath=//cx-product-list-item[1]/div/div/a[@class="cx-product-name"]
@{RESULTS_PRODUCT_DETAILS_INFO_LOCATORS} =        xpath=//cx-product-details-tab    xpath=//cx-product-attributes    xpath=//cx-product-reviews    xpath=//cx-paragraph    
@{RESULTS_PRODUCT_DETAILS_TITLE_LOCATORS} =       xpath=//cx-tab-paragraph-container/button[1]    xpath=//cx-tab-paragraph-container/button[2]    xpath=//cx-tab-paragraph-container/button[3]    xpath=//cx-tab-paragraph-container/button[4]
@{RESULTS_EXPECTED_RESULTS_INFO} =                24.6 megapixel Digital Single Lens Reflex (D-SLR) camera, body only. Supreme imaging and professional features. Full-frame CMOS sensor with Exmor™ technology. High-performance pentaprism viewfinder with 100% coverage. High-speed 9-point AF, SteadyShot INSIDE and photo quality 3.0-inch 921k dot LCD.   Technical details    Overall Rating    Lorem ipsum dolor sit amet, dolor sed, ut nam ut.
${RESULTS_WRITE_REIVEW_BUTTON} =                  xpath=//div[@class="header"]/button[@class="btn btn-primary"]
${RESULTS_SUMBIT_BUTTON} =                        xpath=//button[@class="btn btn-block btn-primary"]
@{RESULTS_REVIEW_INPUT_FILEDS} =                  xpath=//input[@formcontrolname="title"]    xpath=//textarea[@formcontrolname="comment"]    xpath=//input[@formcontrolname="reviewerName"]    xpath=//label/cx-star-rating/cx-icon[4]
@{RESULTS_REVIEW_INPUT_INFO} =                    Proper solid camera.    Top end camera with excellent features.    Carlos              
${RESULTS_PRODUCT_LAYOUT_GRID_BUTTON} =           xpath=//button[@aria-label="Select to change to Grid View"]
${RESULTS_PRODUCT_LAYOUT_LIST_BUTTON} =           xpath=//button[@aria-label="Select to change to List View"]
${RESULTS_ITEM2_LINK} =                           xpath=//a[@href="/electronics-spa/en/USD/product/898503/1V"]
${RESULTS_ADD_TO _WICHLIST_LINK} =                xpath=//span[@class="button-text"]
${RESULTS_WISHLIST_FULL_HEART} =                  xpath=//cx-icon[@class="cx-icon fas fa-heart"]
${RESULTS_ITEM3_LINK} =                           xpath=//a[@href="/electronics-spa/en/USD/product/1422706/Wide%20Strap%20for%20EOS%20450D"]
${RESULTS_ADD_PRODUCT_TO_CART_BUTTON} =           xpath=//form/button[@type="submit"]
${RESULTS_VIEW_CART_LINK} =                       xpath=//a[@cxmodalreason="View Cart click"]
${RESULTS_CART_COUNT} =                           xpath=//span[@class="count"]
${RESULTS_PROCEED_TO_CHECKOUT_BUTTON} =           xpath=//button[@class="btn btn-primary btn-block"]


*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains            176 results for Brands

Sort by price descending
    Press Keys       ${RESULTS_ALLBRANDS_RELEVANCE_LIST}      ARROW_DOWN
    Repeat Keyword  4 times      Press Keys       None        ARROW_DOWN
    Press Keys       None        ENTER
    
Verify Sorting
    Wait Until Page Contains   ${RESULTS_STR_TO_SEARCH_ITEM1}
    #This specifically checks item number one in the list
    Element Should Contain     ${RESULTS_ITEM1_LINK}    ${RESULTS_STR_TO_SEARCH_ITEM1}
    Log    list sorted out correctly

Verify item 1 product loaded and details
    Click Link                              ${RESULTS_ITEM1_LINK}
    Wait Until Page Contains Element        ${RESULTS_PRODUCT_DETAILS_INFO_LOCATORS}[0]
    
    #Waiting for complete page to load does not work for me
    #Wait For Condition	return document.readyState == "complete"
    #Adding a sleep of >= 0.3s here results in correct reading of the Product details below
    sleep     0.3
    
    FOR     ${index}     IN RANGE   4 
        Click Button                   ${RESULTS_PRODUCT_DETAILS_TITLE_LOCATORS}[${index}]
        Element Should Contain         ${RESULTS_PRODUCT_DETAILS_INFO_LOCATORS}[${index}]           ${RESULTS_EXPECTED_RESULTS_INFO}[${index}]
    END  
    
    Log    Correct product details page

Write a review
    Wait For Condition	return document.readyState == "complete"
    Click Button                 ${RESULTS_PRODUCT_DETAILS_TITLE_LOCATORS}[2]
    Click Button                 ${RESULTS_WRITE_REIVEW_BUTTON}
    Input Text                   ${RESULTS_REVIEW_INPUT_FILEDS}[0]           ${RESULTS_REVIEW_INPUT_INFO}[0]
    Input Text                   ${RESULTS_REVIEW_INPUT_FILEDS}[1]           ${RESULTS_REVIEW_INPUT_INFO}[1]
    Input Text                   ${RESULTS_REVIEW_INPUT_FILEDS}[2]           ${RESULTS_REVIEW_INPUT_INFO}[2]
    Click Element                ${RESULTS_REVIEW_INPUT_FILEDS}[3]
    Click Button                 ${RESULTS_SUMBIT_BUTTON}
    Wait Until Page Contains     Thank you for the review

Switch to grid product layout
    Wait Until Page Contains Element    ${RESULTS_PRODUCT_LAYOUT_GRID_BUTTON}
    Click Button                        ${RESULTS_PRODUCT_LAYOUT_GRID_BUTTON}
    Wait Until Page Contains Element    ${RESULTS_PRODUCT_LAYOUT_LIST_BUTTON}
    Log                                 Page is in a grid layout

Click and verify item 2 product loaded and details
    Click Element                          ${RESULTS_ITEM2_LINK} 
    Wait Until page Contains Element       ${RESULTS_ADD_TO _WICHLIST_LINK}
Add item 2 to wishlist
    Click Element                          ${RESULTS_ADD_TO _WICHLIST_LINK}
    Wait Until Page Contains Element       ${RESULTS_WISHLIST_FULL_HEART}

Verify item 3 product loaded in search
    Wait Until page Contains Element       ${RESULTS_ITEM3_LINK}

Verify generic search worked and click first link
    [Arguments]                             ${itemname}
    #This doesnt actually wait for the page to load and the previous item is clicked twice, a manual slee has to be inserted
    #Wait For Condition	return document.readyState == "complete"
    sleep     1        
    Wait Until page Contains Element        ${RESULTS_ITEM1_LINK}
    click link                              ${RESULTS_ITEM1_LINK}
    Wait until page contains                ${itemname}

Add product to cart and view cart
    [Arguments]                             ${itemname}
    Wait For Condition	return document.readyState == "complete"
    wait until page contains                 ${itemname}
    Wait For Condition	return document.readyState == "complete"
    Wait Until page Contains Element         ${RESULTS_ADD_PRODUCT_TO_CART_BUTTON}
    Click button                             ${RESULTS_ADD_PRODUCT_TO_CART_BUTTON}
    Wait For Condition	return document.readyState == "complete"
    Wait Until page Contains Element         ${RESULTS_VIEW_CART_LINK}
    Click Link                               ${RESULTS_VIEW_CART_LINK}
Verify Cart count
    [Arguments]        ${count}
    Wait until element Contains              ${RESULTS_CART_COUNT}   ${count}
proceed to checkout
    Wait Until Keyword Succeeds    5    1    click button                             ${RESULTS_PROCEED_TO_CHECKOUT_BUTTON}

    
    
    