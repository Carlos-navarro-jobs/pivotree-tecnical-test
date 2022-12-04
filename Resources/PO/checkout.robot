*** Settings ***
Library  SeleniumLibrary

Resource    TopNavigationBar.robot
Resource    LoginPage.robot

*** Variables ***
${CHECKOUT_COUNTRY_LIST} =                   xpath=//ng-select[@formcontrolname="isocode"]    
${CHECKOUT_TITLE_LIST} =                     xpath=//ng-select[@formcontrolname="titleCode"]
${CHECKOUT_FIRSTNAME_FIELD} =                xpath=//input[@formcontrolname="firstName"]
${CHECKOUT_LASTNAME_FIELD} =                 xpath=//input[@formcontrolname="lastName"]
${CHECKOUT_ADRESS1_FIELD} =                  xpath=//input[@formcontrolname="line1"] 
${CHECKOUT_CITY_FIELD} =                     xpath=//input[@formcontrolname="town"]
${CHECKOUT_ZIPCODE_FIELD} =                  xpath=//input[@formcontrolname="postalCode"]
${CHECKOUT_PHONE_NUMBER_FIELD} =             xpath=//input[@formcontrolname="phone"] 
${CHECKOUT_CONTINUE_BUTTON_1} =              xpath=//button[@type="submit"]
${CHECKOUT_CONTINUE_BUTTON_2} =              xpath=//button[@class="btn btn-block btn-primary"]
${CHECKOUT_PREMIUM_DELIVERY} =               xpath=//input[@id="deliveryMode-premium-gross"]
${CHECKOUT_T&A} =                            xpath=//input[@formcontrolname="termsAndConditions"]
#The commented out variables are unsused as I failed to select the doprdown menus succesfully, I decided to fill out the payment details page using TAB keystrokes.
#${CHECKOUT_PAYMENT_TYPE_LIST} =              xpath=//ng-select[@formcontrolname="code"]/div/div/div[@role="combobox"]
${CHECKOUT_ACCOUNT_HOLDER_FIELD} =           xpath=//input[@formcontrolname="accountHolderName"]
#${CHECKOUT_CARD_NUMBER_FIELD} =              xpath=//input[@formcontrolname="cardNumber"]
#${CHECKOUT_EXPIRATION_DATE_MONTH_LIST} =     xpath=//ng-select[@aria-label="Expiration month "]/div/div/div/input
#${CHECKOUT_EXPIRATION_DATE_YEAR_LIST} =      xpath=//ng-select[@aria-label="Expiration year "]/div/div/div/input
#${CHECKOUT_SECURITY_CODE} =                  xpath=//input[@formcontrolname="cvn"]



*** Keywords ***
Manual Fill country name
    [Arguments]
    Wait For Condition	return document.readyState == "complete"
    Wait Until Keyword Succeeds    5    1    click element         ${CHECKOUT_COUNTRY_LIST}
    Repeat Keyword    53    Press Keys        None        ARROW_DOWN
    Press Keys            ${CHECKOUT_COUNTRY_LIST}    ENTER
Manual Fill Title
    Press Keys        ${CHECKOUT_TITLE_LIST}    ARROW_DOWN
    Press Keys        ${CHECKOUT_TITLE_LIST}    ENTER
Fill First Name
    [Arguments]       ${firstname}
    input text        ${CHECKOUT_FIRSTNAME_FIELD}        ${firstname}
Fill Last Name
    [Arguments]       ${lastname}
    input text        ${CHECKOUT_LASTNAME_FIELD}        ${lastname}
Fill Address 
    [Arguments]       ${adress}
    input text        ${CHECKOUT_ADRESS1_FIELD}        ${adress}
Fill city
    [Arguments]       ${city}
    input text        ${CHECKOUT_CITY_FIELD}        ${city}
Fill Zip code
    [Arguments]       ${zipcode}
    input text        ${CHECKOUT_ZIPCODE_FIELD}        ${zipcode}
Fill Phone Number
    [Arguments]       ${phonenumber}
    input text        ${CHECKOUT_PHONE_NUMBER_FIELD}        ${phonenumber}
Click Continue1
    wait until page contains element         ${CHECKOUT_CONTINUE_BUTTON_1}
    click button                             ${CHECKOUT_CONTINUE_BUTTON_1}
    Wait For Condition	return document.readyState == "complete"
Click Continue2
    wait until page contains element         ${CHECKOUT_CONTINUE_BUTTON_2}
    click button                             ${CHECKOUT_CONTINUE_BUTTON_2}
    Wait For Condition	return document.readyState == "complete"
Select premium delivery
    wait until page contains element         ${CHECKOUT_PREMIUM_DELIVERY}
    click element                            ${CHECKOUT_PREMIUM_DELIVERY}
    click button                             ${CHECKOUT_CONTINUE_BUTTON_2}


Manual fill payment details
    [Arguments]        ${name}    ${cardnumber}    ${cvn}
    #This protocol fails without the pauses
    click element        ${CHECKOUT_ACCOUNT_HOLDER_FIELD}
    sleep  0.5
    Press Keys        None    SHIFT+TAB
    sleep  0.5
    Press Keys        None    ENTER
    sleep  0.5
    Repeat Keyword    3    Press Keys    None    ARROW_DOWN 
    sleep  0.5
    Press Keys        None    ENTER
    sleep  0.5
    Press Keys        None    TAB
    sleep  0.5
    Press Keys        None    ${name}
    sleep  0.5
    Press Keys        None    TAB
    sleep  0.5
    Press Keys        None    ${cardnumber}
    sleep  0.5
    Press Keys        None    TAB
    sleep  0.5
    Press Keys        None    ENTER
    sleep  0.5
    Repeat Keyword    2    Press Keys    None    ARROW_DOWN
    sleep  0.5
    Press Keys        None    ENTER
    sleep  0.5
    Press Keys        None    TAB
    sleep  0.5
    Press Keys        None    ENTER
    sleep  0.5
    Repeat Keyword    2    Press Keys    None    ARROW_DOWN
    sleep  0.5
    Press Keys        None    ENTER
    sleep  0.5
    Press Keys        None    TAB
    sleep  0.5
    Press Keys        None    ${cvn}
    sleep  0.5
accept T&A
    wait until page contains element         ${CHECKOUT_T&A}
    click element                            ${CHECKOUT_T&A}





#Select Payment type
#    Wait Until Keyword Succeeds    5    1    click element                  ${CHECKOUT_PAYMENT_TYPE_LIST}
#    press Keys                     None    ARROW_DOWN
#    press Keys                     None    ENTER
#fill Account holder name
#    [Arguments]                    ${name}
#    input text                     ${CHECKOUT_ACCOUNT_HOLDER_FIELD}    ${name}   
#fill Card Number
#    [Arguments]                    ${cardnumber}
#    input text                     ${CHECKOUT_CARD_NUMBER_FIELD}    ${cardnumber}
#select expiration month
#    click element                  ${CHECKOUT_EXPIRATION_DATE_MONTH_LIST}
#    Repeat Keyword                 2    Press Keys        None        ARROW_DOWN
#    Press Keys                     None    ENTER
#select expiration year
#    click element                  ${CHECKOUT_EXPIRATION_DATE_YEAR_LIST}
#    Repeat Keyword                 3    Press Keys        None        ARROW_DOWN
#    Press Keys                     None    ENTER
#fill security number
#    [Arguments]                    ${cvn}
#    input text                     ${CHECKOUT_SECURITY_CODE}    ${cvn}
