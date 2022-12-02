*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${TOPNAVIGATION_SIGNIN_REGISTER_LINK} =        xpath=//a[@role="link"]
${TOPNAVIGATION_ALLBRANDS_LINK} =              xpath=//a[@href="/electronics-spa/en/USD/Brands/all/c/brands"]                 
${TOPNAVIGATION_BRANDS_LIST} =                 xpath=//cx-navigation-ui[@class="flyout"]/nav/span

*** Keywords ***
Click SignIn Link
    Click Link              ${TOPNAVIGATION_SIGNIN_REGISTER_LINK}
Click All Brands link
    Wait Until Page Contains      Brands
    Mouse Over                    ${TOPNAVIGATION_BRANDS_LIST}     
    Click Link                    ${TOPNAVIGATION_ALLBRANDS_LINK}