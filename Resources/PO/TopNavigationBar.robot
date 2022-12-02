*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${TOPNAVIGATION_SIGNIN_REGISTER_LINK} =        xpath=//a[@role="link"]
${TOPNAVIGATION_ALLBRANDS_LINK} =              xpath=//a[@href="/electronics-spa/en/USD/Brands/all/c/brands"]                 
${TOPNAVIGATION_BRANDS_LIST} =                 xpath=//cx-navigation-ui[@class="flyout"]/nav/span
${TOPNAVIGATION_HAMBURGER_ELEMENT} =           xpath=//span[@class="hamburger-box"]
#This unique locator obtained by unspection in chrome is not locatable in run.
#${TOPNAVIGATION_CAMCORDERS_LINK} =             xapth=//a[@href="/electronics-spa/en/USD/Open-Catalogue/Cameras/Hand-held-Camcorders/c/584"]
${TOPNAVIGATION_FILM_CAMERAS_LINK} =           xpath=//cx-category-navigation/cx-navigation-ui/nav/cx-generic-link
${TOPNAVIGATION_SEARCHBAR} =                   xpath=//input[@aria-label="Search"]


*** Keywords ***
Click SignIn Link
    Click Link              ${TOPNAVIGATION_SIGNIN_REGISTER_LINK}
Click All Brands link
    Wait Until Page Contains      Brands
    Mouse Over                    ${TOPNAVIGATION_BRANDS_LIST}     
    Click Link                    ${TOPNAVIGATION_ALLBRANDS_LINK}
Click Hamburger Button
    #Reload Page
    Wait Until Element Is Visible        ${TOPNAVIGATION_HAMBURGER_ELEMENT}
    Click element                        ${TOPNAVIGATION_HAMBURGER_ELEMENT}
Click Film Cameras link
    Maximize Browser Window
    Wait Until Page Contains            Film Cameras
    Click Element                       ${TOPNAVIGATION_FILM_CAMERAS_LINK}

Search for Item 3 in top navigation Search
    Input Text                     ${TOPNAVIGATION_SEARCHBAR}        Wide Strap for EOS
    Press Keys                      NONE     ENTER