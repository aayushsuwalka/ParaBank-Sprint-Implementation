*** Settings ***
Library    SeleniumLibrary
Library    DataDriver   file=${EXECDIR}/login_data.csv  dialect=excel

Test Setup    Navigate To Parabank Register Page
Test Teardown  Close Browser
Test Template  Register User

*** Variables ***
${BASE_URL}=    https://parabank.parasoft.com/parabank/index.htm
${first_name_field}  xpath=//input[@id="customer.firstName"]
${last_name_field}  xpath=//input[@id="customer.lastName"]
${address_field}  xpath=//input[@id="customer.address.street"]
${city_field}  xpath=//input[@id="customer.address.city"]
${state_field}  xpath=//input[@id="customer.address.state"]
${zip_field}  xpath=//input[@id="customer.address.zipCode"]
${phone_field}  xpath=//input[@id="customer.phoneNumber"]
${ssn_field}  xpath=//input[@id="customer.ssn"]
${username_field}  xpath=//input[@id="customer.username"]
${password_field}  xpath=//input[@id="customer.password"]
${confirm_password_field}  xpath=//input[@id="repeatedPassword"]
${register_field}  xpath=//input[@value="Register"]

*** Test Cases ***
Test Case For Data Driven   ${Firstname}    ${Lastname}    ${Address}    ${City}    ${State}    ${Zipcode}    ${Phno}    ${SSN}    ${Username}    ${Password}    ${Confirm}
   [Tags]   datadriver

*** Keywords ***
Navigate To Parabank Register Page
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Wait Until Element Is Visible    xpath=//a[text()="Register"]  timeout=10s
    Click Element    xpath=//a[text()="Register"]
    
Register User
    [Arguments]    ${Firstname}    ${Lastname}    ${Address}    ${City}    ${State}    ${Zipcode}    ${Phno}    ${SSN}    ${Username}    ${Password}    ${Confirm}
    Input Text    ${first_name_field}   ${Firstname}
    Input Text    ${last_name_field}  ${Lastname}
    Input Text    ${address_field}  ${Address}
    Input Text    ${city_field}  ${City}
    Input Text    ${state_field}  ${State}
    Input Text    ${zip_field}  ${Zipcode}
    Input Text    ${phone_field}  ${Phno}
    Input Text    ${ssn_field}  ${SSN}
    Input Text    ${username_field}  ${Username}
    Input Text    ${password_field}  ${Password}
    Input Text    ${confirm_password_field}  ${Confirm}
    Click Element  ${register_field}






