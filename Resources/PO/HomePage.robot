*** Settings ***
Library            SeleniumLibrary


*** Variables ***
${HOMEPAGE_HEADER_LABEL} =               xpath=//cx-storefront[@class="LandingPage2Template stop-navigating"]


*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element    ${HOMEPAGE_HEADER_LABEL}
