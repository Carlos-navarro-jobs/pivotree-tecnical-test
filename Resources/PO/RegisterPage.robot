*** Settings ***
Library            SeleniumLibrary
Resource           ../Common.robot

*** Variables ***
${REGISTER_HEADER_TEXT} =                Create an Account
${REGISTER_TITLE_LIST} =                 xpath=//select[@formcontrolname="titleCode"]    
${REGISTER_FIRSTNAME_FIELD} =            xpath=//input[@name="firstname"]
${REGISTER_LASTNAME_FIELD} =             xpath=//input[@name="lastname"]   
${REGISTER_EMAIL_FIELD} =                xpath=//input[@name="email"]
${REGISTER_PASSWORD_FIELD} =             xpath=//input[@name="password"] 
${REGISTER_CONFIRM_PASSWORD_FIELD} =     xpath=//input[@name="confirmpassword"] 
${REGISTER_TERMS_RADIO} =                xpath=//input[@name="termsandconditions"]
${REGISTER_REGISTER_BUTTON} =            xpath=//button[@type="submit"]



*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains           ${REGISTER_HEADER_TEXT}


Fill title   #All of the keywords below failed to select any option the locator is correct and it indeed works in the  "Manual Fill Title" fix shown following, but  no option is selected.
   Select From List By Value    ${REGISTER_TITLE_LIST}    mr
   Select From List By Label    ${REGISTER_TITLE_LIST}    Mr.
   Select From List By Index    ${REGISTER_TITLE_LIST}    1
Manual Fill Title
    Press Keys        ${REGISTER_TITLE_LIST}    ARROW_DOWN
    Press Keys        ${REGISTER_TITLE_LIST}    ENTER
 
Fill First Name
    [Arguments]   ${firstname}
    Input Text              ${REGISTER_FIRSTNAME_FIELD}    ${firstname}
Fill Last Name
    [Arguments]   ${lastname}
    Input Text              ${REGISTER_LASTNAME_FIELD}     ${lastname}
Fill Email Address
    [Arguments]   ${email}
    Input Text              ${REGISTER_EMAIL_FIELD}        ${email}
Fill Password
    [Arguments]   ${password}
    Input Text              ${REGISTER_PASSWORD_FIELD}     ${password}
Fill Confirm Password
    [Arguments]   ${confirmpassword}
    Input Text              ${REGISTER_CONFIRM_PASSWORD_FIELD}       ${confirmpassword}
Accept T&A
    Click Element         ${REGISTER_TERMS_RADIO}
Check For Register Errors
    Wait Until Page Contains    This is not a valid email format
    Log        Email format shoud have valid ending e.g. "@gmail.com"
    Wait Until Page Contains    This is not a valid password format
    Log        Password should have at least one each of: uppper case letter, number, non alphanumeric character and 6 characters total. 
    Wait Until Page Contains    Password fields must match
    Log        Password fields must match
Check For Correct Register
    Wait Until Page Contains    Please log in with provided credentials.
    Log    register was succesfull.
Click Register Button
    Click Button                ${REGISTER_REGISTER_BUTTON}
