*** Settings ***
Resource    ../../locators/loginpage.robot
Resource    ../../resources/keywords/common_keywords.robot
Library     SeleniumLibrary

*** Keywords ***
Open Browser To ParaBank
    Open Browser    https://parabank.parasoft.com/parabank/index.htm    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Set Selenium Timeout    10s
Register With Valid Credentials
    [Documentation]    Test case to verify login with valid credentials  @
    Click Element       ${register_btn}
    Wait Until Element Is Visible    ${easy_sign_up}
    Click Element       ${first_name_field}
    Input Text    ${first_name_field}    Aayush
    Click Element    ${last_name_field}
    Input Text    ${last_name_field}    Suwalka
    Click Element    ${address_field}
    Input Text    ${address_field}    B-325, Subhash Nagar
    Click Element    ${city_field}
    Input Text    ${city_field}    Bhilwara
    Click Element    ${state_field}
    Input Text    ${state_field}    Rajasthan
    Click Element    ${zipcode-field}
    Input Text    ${zipcode-field}    311001
    Click Element    ${phone_field}
    Input Text    ${phone_field}    6350032742
    Click Element    ${ssn_field}
    Input Text    ${ssn_field}    123456
    Click Element    ${username_field}
    Input Text    ${username_field}    ${USERNAME}
    Click Element    ${password_field}
    Input Text    ${password_field}    ${PASSWORD}
    Click Element    ${confirm_password_field}
    Input Text    ${confirm_password_field}   ${PASSWORD}
    Click Button    ${reg_btn}
    Wait Until Element Is Visible    ${welcome_msg}


Log Out from ParaBank
    [Documentation]   Testcases to verify the logout process from ParaBank @
    Ensure User Is Logged In
    Click Element    ${logout_btn}
    Wait Until Page Contains Element    ${customer_login}   5s


Register with Mandatory Fields Empty
    [Documentation]    Test case to verify login with mandatory fields empty @
    Click Element       ${register_btn}
    Wait Until Element Is Visible    ${easy_sign_up}
    Click Element    ${first_name_field}
    Input Text    ${first_name_field}    Aayush
    Click Element    ${last_name_field}
    Input Text    ${last_name_field}    Suwalka

    Click Button    ${reg_btn}
    Wait Until Element Is Visible    ${error_message}   5s

Register with Numeric Username
    [Documentation]     Tests to verify registration with numeric username
    Click Element       ${register_btn}
    Wait Until Element Is Visible    ${easy_sign_up}
    Click Element       ${first_name_field}
    Input Text    ${first_name_field}    Aayush
    Click Element    ${last_name_field}
    Input Text    ${last_name_field}    Suwalka
    Click Element    ${address_field}
    Input Text    ${address_field}    B-325, Subhash Nagar
    Click Element    ${city_field}
    Input Text    ${city_field}    Bhilwara
    Click Element    ${state_field}
    Input Text    ${state_field}    Rajasthan
    Click Element    ${zipcode-field}
    Input Text    ${zipcode-field}    311001
    Click Element    ${phone_field}
    Input Text    ${phone_field}    6350032742
    Click Element    ${ssn_field}
    Input Text    ${ssn_field}    123456
    Click Element    ${username_field}
    Input Text    ${username_field}    456231
    Click Element    ${password_field}
    Input Text    ${password_field}    1234
    Click Element    ${confirm_password_field}
    Input Text    ${confirm_password_field}   1234

    Click Button    ${reg_btn}
    Wait Until Element Is Visible    ${welcome_msg}


Login with Wrong Credentials
    [Documentation]    Test case to verify login with wrong credentials @
    Input Text    ${login_username}    bjp121
    Input Text    ${login_password}    12345
    Wait Until Page Contains Element  ${login_btn}  2s
    Click Element    ${login_btn}
    Wait Until Page Contains Element  ${login_error_message}  2s
