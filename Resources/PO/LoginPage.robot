*** Settings ***
Library            SeleniumLibrary

*** Variables ***
${LOGIN_HEADER_TEXT} =              Login
${LOGIN_REGISTER_LINK} =            xpath=//a[@class="btn btn-block btn-secondary btn-register"]    
${LOGIN_SIGNIN_BUTTON} =            xpath=//button[@type="submit"]
${LOGIN_EMAIL_FIELD} =              xpath=//input[@type="email"]
${LOGIN_PASSWORD_FIELD} =           xpath=//input[@type="password"]
${LOGIN_FORGOTPASSWORD_LINK}=       xpath=//a[@class="btn-link"]
${LOGIN_SUCCESFUL_LOGIN_GREET} =    xpath=//div[@class="cx-login-greet"]

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains    ${LOGIN_HEADER_TEXT}
Click Register Link
    Click Link                  ${LOGIN_REGISTER_LINK}
Click Forgot Password Link
    Click Link                  ${LOGIN_FORGOTPASSWORD_LINK}
Click SignIn Button
    Click Button                ${LOGIN_SIGNIN_BUTTON}
Check for blank errors
    Wait Until Page Contains     This field is required
    Log    Fields must be filled in
Check for invalid credentials
    Wait Until Page Contains        Bad credentials. Please login again
    Log    Invalid email and/or passsword
Check for valid login
    Wait Until Page Contains Element        ${LOGIN_SUCCESFUL_LOGIN_GREET}
    Log        Correctly logged in
Fill Email Address
    [Arguments]   ${email}
    Input Text              ${LOGIN_EMAIL_FIELD}        ${email}
Fill Password
    [Arguments]   ${password}
    Input Text              ${LOGIN_PASSWORD_FIELD}        ${password}