*** Settings ***
Library            SeleniumLibrary
Resource           PO/HomePage.robot
Resource           PO/LoginPage.robot
Resource           PO/RegisterPage.robot
Resource           PO/ForgotPasswordPage.robot
Resource           PO/TopNavigationBar.robot


*** Variables ***
@{INVALID_REGISTER_INFO} =    Carlos    Navarro    carlos@.com    Passwrd    Pass    carlos.unregistered@gmail.com
@{VALID_REGISTER_INFO} =      Carlos    Navarro    carlos.registered@gmail.com    Passwrd!1    Passwrd!1


*** Keywords ***
Prerequisite
    [Tags]    requisite
    HomePage.Verify page loaded

Invalid Register
    [Tags]    register    invalid
    TopNavigationBar.Click SignIn Link
    LoginPage.Verify Page Loaded
    LoginPage.Click Register Link
    RegisterPage.Verify Page Loaded
    RegisterPage.Manual Fill Title
    RegisterPage.Fill First Name          ${INVALID_REGISTER_INFO}[0]
    RegisterPage.Fill Last Name           ${INVALID_REGISTER_INFO}[1]
    RegisterPage.Fill Email Address       ${INVALID_REGISTER_INFO}[2]
    RegisterPage.Fill Password            ${INVALID_REGISTER_INFO}[3]
    RegisterPage.Fill Confirm Password    ${INVALID_REGISTER_INFO}[4]
    RegisterPage.Accept T&A
    RegisterPage.Check for register errors

Valid Register
    [Tags]    register    valid
    TopNavigationBar.Click SignIn Link
    LoginPage.Verify Page Loaded
    LoginPage.Click Register Link
    RegisterPage.Verify Page Loaded
    RegisterPage.Manual Fill Title
    RegisterPage.Fill First Name           ${VALID_REGISTER_INFO}[0]
    RegisterPage.Fill Last Name            ${VALID_REGISTER_INFO}[1]
    RegisterPage.Fill Email Address        ${VALID_REGISTER_INFO}[2]
    RegisterPage.Fill Password             ${VALID_REGISTER_INFO}[3]
    RegisterPage.Fill Confirm Password     ${VALID_REGISTER_INFO}[4]
    RegisterPage.Accept T&A
    RegisterPage.Click Register Button
    RegisterPage.Check For Correct Register

Blank Login
    [Tags]    login    blank    invalid
    TopNavigationBar.Click SignIn Link
    LoginPage.Verify Page Loaded
    LoginPage.Click SignIn Button
    LoginPage.Check for blank errors

Invalid Password Login
    [Tags]    login    invalid
    Reload Page
    LoginPage.Verify Page Loaded
    LoginPage.Fill Email Address    ${VALID_REGISTER_INFO}[2]
    LoginPage.Fill Password         ${INVALID_REGISTER_INFO}[3]
    LoginPage.Click SignIn Button
    LoginPage.Check for invalid credentials
    
Unregistered Email Login
    [Tags]    login    invalid
    Reload Page
    LoginPage.Verify Page Loaded
    LoginPage.Fill Email Address    ${INVALID_REGISTER_INFO}[5]
    LoginPage.Fill Password         ${VALID_REGISTER_INFO}[3]
    LoginPage.Click SignIn Button
    LoginPage.Check for invalid credentials
Forgot Password
    [Tags]    login    forgotpasssword
    Reload Page
    LoginPage.Verify Page Loaded
    LoginPage.Click Forgot Password Link
    #These two lines of code failed: The locators seem to be correct for both the email field and submit button they are unique and point to the desired objects. Neither one is selected with this code. An alternative more manual way using "Press Keys" is presented as "Manual fill email and submit".
    #ForgotPasswordPage.Fill Email Address      ${VALID_REGISTER_INFO}[1]
    #ForgotPasswordPage.Click Submit Button
    ForgotPasswordPage.Manual fill email and submit        ${VALID_REGISTER_INFO}[2]
    ForgotPasswordPage.Check For Recovery Email Sent
Valid Login
    [Tags]    login    valid
    Reload Page
    LoginPage.Verify Page Loaded
    LoginPage.Fill Email Address    ${VALID_REGISTER_INFO}[2]
    LoginPage.Fill Password         ${VALID_REGISTER_INFO}[3]
    LoginPage.Click SignIn Button
    LoginPage.Check for valid login