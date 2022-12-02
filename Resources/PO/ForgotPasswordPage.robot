*** Settings ***
Library        SeleniumLibrary


*** Variables ***

${FORGOTPASSWORD_SUBMIT_BUTTON} =            xpath=//button[@class="btn btn-block btn-primary"]
${FORGOTPASSWORD_EMAIL_FIELD} =              xpath=//input[@type="email"]
*** Keywords ***

Click Submit Button
    Click Button                ${FORGOTPASSWORD_SUBMIT_BUTTON}

Check For Recovery Email Sent
    Wait Until Page Contains        An email has been sent to you with information on how to reset your password.
    Log    Recovery email succesfully sent.
Fill Email Address
    [Arguments]       ${email}
    Input Text        ${FORGOTPASSWORD_EMAIL_FIELD}        ${email}

Manual fill email and submit
    [Arguments]       ${email}
    Press Keys    none   TAB
    sleep   2                #This sleep is necesarry or else the tab goes to FAQ at the bottom of  the page
    Press Keys    none   TAB
    Press Keys    none   ENTER
    Press Keys    none   ${email}
    Press Keys    none   TAB
    Press Keys    none   TAB
    Press Keys    none   ENTER
