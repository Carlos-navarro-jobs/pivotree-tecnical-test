*** Settings ***
Library  SeleniumLibrary

Resource    TopNavigationBar.robot

*** Variables ***
${RESULTS_ALLBRANDS_RELEVANCE_LIST} =             xpath=//div[@role="combobox"]
${RESULTS_STR_TO_SEARCH} =                        DSLR-A900, body
${RESULTS_TOP_HIT_LINK} =                         xpath=//cx-product-list-item[1]/div/div/a[@class="cx-product-name"]
@{RESULTS_PRODUCT_DETAILS_INFO_LOCATORS} =        xpath=//cx-product-details-tab    xpath=//cx-product-attributes    xpath=//cx-product-reviews    xpath=//cx-paragraph    
@{RESULTS_PRODUCT_DETAILS_TITLE_LOCATORS} =       xpath=//cx-tab-paragraph-container/button[1]    xpath=//cx-tab-paragraph-container/button[2]    xpath=//cx-tab-paragraph-container/button[3]    xpath=//cx-tab-paragraph-container/button[4]
@{RESULTS_EXPECTED_RESULTS_INFO} =                24.6 megapixel Digital Single Lens Reflex (D-SLR) camera, body only. Supreme imaging and professional features. Full-frame CMOS sensor with Exmor™ technology. High-performance pentaprism viewfinder with 100% coverage. High-speed 9-point AF, SteadyShot INSIDE and photo quality 3.0-inch 921k dot LCD.   Technical details    Overall Rating    Lorem ipsum dolor sit amet, dolor sed, ut nam ut.
${RESULTS_WRITE_REIVEW_BUTTON} =                  xpath=//div[@class="header"]/button[@class="btn btn-primary"]
${RESULTS_SUMBIT_BUTTON} =                        xpath=//button[@class="btn btn-block btn-primary"]
@{RESULTS_REVIEW_INPUT_FILEDS} =                  xpath=//input[@formcontrolname="title"]    xpath=//textarea[@formcontrolname="comment"]    xpath=//input[@formcontrolname="reviewerName"]    xpath=//label/cx-star-rating/cx-icon[4]
@{RESULTS_REVIEW_INPUT_INFO} =                    Proper solid camera.    Top end camera with excellent features.    Carlos              



*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains            176 results for Brands

Sort by price descending
    Press Keys       ${RESULTS_ALLBRANDS_RELEVANCE_LIST}      ARROW_DOWN
    Repeat Keyword  4 times      Press Keys       None        ARROW_DOWN
    Press Keys       None        ENTER
    
Verify Sorting
    Wait Until Page Contains   ${RESULTS_STR_TO_SEARCH}
    #This specifically checks item number one in the list
    Element Should Contain     ${RESULTS_TOP_HIT_LINK}    ${RESULTS_STR_TO_SEARCH}
    Log    list sorted out correctly

Verify individual product loaded and details
    Click Link                              ${RESULTS_TOP_HIT_LINK}
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
