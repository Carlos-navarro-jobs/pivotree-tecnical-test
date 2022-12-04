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
    #This wait breaks the code, I do not understand why
    #Wait until Page Contains      ${TOPNAVIGATION_BRANDS_LIST}  
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

Top Navigation Item Search
    [Arguments]                    ${item}
    Input Text                     ${TOPNAVIGATION_SEARCHBAR}        ${item}
    Press Keys                      NONE     ENTER
    Wait For Condition	return document.readyState == "complete"