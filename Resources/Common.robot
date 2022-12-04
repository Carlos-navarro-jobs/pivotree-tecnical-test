*** Settings ***
Library    SeleniumLibrary

*** Variables ***


${BROWSER} =                    chrome
${URL} =                        https://spartacus-demo.eastus.cloudapp.azure.com/electronics-spa/en/USD/
${ACCEPT_COOKIES_BUTTON} =      xpath=//button[@class="btn btn-primary"]
*** Keywords ***
Begin Test
    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window
    Go To           ${URL}
    #These failure checks are needed as cookies do not always appear
    Run keyword And Continue On Failure     Wait Until Page Contains Element    ${ACCEPT_COOKIES_BUTTON}
    Run keyword And Continue On Failure     Click Button    ${ACCEPT_COOKIES_BUTTON}

End Test
    Close Browser

Shrink Browser
    Set Window Size    900    700

Expand Browser
    Maximize Browser Window