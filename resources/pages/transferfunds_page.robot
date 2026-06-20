*** Settings ***
Library     SeleniumLibrary
Resource    ../../locators/transferfundspage.robot
Resource    ../../resources/keywords/common_keywords.robot
Resource    register_page.robot
Resource    account_page.robot


*** Keywords ***
Transfer Funds Between Two Accounts
    [Documentation]    This keyword transfers funds between two accounts.
    Ensure User Is Logged In
    Creating Savings Account
    Click Element    ${transfer_funds_link}
    Wait Until Page Contains Element    ${amount_field}  2s
    Input Text    ${amount_field}    200
    Click Element    ${from_account}
    Sleep  6s
    Select From List By Index    ${from_account}    0
    Click Element    ${to_account}
    Sleep    6s
    Select From List By Index    ${to_account}    1
    Sleep    6s
    Click Element    ${transfer_btn}
    Wait Until Page Contains Element    ${transfer_complete_message}  5s
    Sleep  6s

Transfer Funds with Invalid Amount
    [Documentation]    This keyword transfers funds between two accounts.
    Ensure User Is Logged In
    Creating Savings Account
    Click Element    ${transfer_funds_link}
    Wait Until Page Contains Element    ${amount_field}  2s
    Input Text    ${amount_field}    -200
    Click Element    ${from_account}
    Sleep  4s
    Select From List By Index    ${from_account}    0
    Click Element    ${to_account}
    Sleep    4s
    Select From List By Index    ${to_account}    1
    Sleep    4s
    Click Element    ${transfer_btn}
    Wait Until Page Contains Element    ${transfer_complete_message}  5s
    Sleep  4s


Transfer Funds with Zero Amount in same Account
    Ensure User Is Logged In
    Click Element    ${transfer_funds_link}
    Wait Until Page Contains Element    ${amount_field}  2s
    Input Text    ${amount_field}    0
    Click Element    ${transfer_btn}
    Wait Until Page Contains Element    ${transfer_complete_message}  5s