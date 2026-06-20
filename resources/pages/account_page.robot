*** Settings ***
Resource    ../../locators/accountpage.robot
Resource    ../pages/register_page.robot
Resource    ../../resources/keywords/common_keywords.robot
Library     SeleniumLibrary

*** Variables ***
${ACCOUNT_NUMBER}    ${EMPTY}
*** Keywords ***
Open a Savings Account with Valid Details
    [Documentation]    This keyword opens a savings account with valid details. @
    Ensure User Is Logged In
    Click Element    ${open_new_account}
    Click Element    ${account_type_dropdown}

    Wait Until Page Contains Element    ${savings_option}    5s
    Sleep    3s
    Select From List By Index    ${account_type_dropdown}   0
    ${accounts}=    Get List Items    id=fromAccountId
    Sleep    6s
    ${source_account}=    Set Variable    ${accounts}[0]
    Set Suite Variable    ${SOURCE_ACCOUNT_NUMBER}    ${source_account}
    Click Element    ${savings_option}
    Sleep    1s
    Click Element    ${open_new_account_btn}
    Sleep  1s
    ${account_number}=    Get Text    xpath=//a[@id="newAccountId"]
    Set Suite Variable    ${SAVINGS_ACCOUNT_NUMBER}    ${account_number}
    Log To Console    ${SOURCE_ACCOUNT_NUMBER}
    Log To Console      ${SAVINGS_ACCOUNT_NUMBER}
    Wait Until Page Contains Element   ${account_open_message}    5s

Open Savings Account
    [Documentation]  Open Savings Account for API testing @
    Click Element    ${open_new_account}
    Click Element    ${account_type_dropdown}
    Wait Until Page Contains Element    ${savings_option}    5s
    Click Element    ${savings_option}
    Sleep    4s
    Click Element    ${open_new_account_btn}
    Sleep  5s
    Wait Until Page Contains Element   ${account_open_message}    5s
    ${acc_id}=  Get Text    ${acc_no}
    Set Suite Variable    ${ACCOUNT_NUMBER}     ${acc_id}
    Log To Console    Account Number = ${ACCOUNT_NUMBER}

Open a Checking Account with Valid Details
    [Documentation]    This keyword opens a checking account with valid details. @
    Ensure User Is Logged In
    Click Element    ${open_new_account}
    Click Element    ${account_type_dropdown}
    Wait Until Page Contains Element    ${checking_option}    5s
    Click Element    ${checking_option}
    Sleep    1s
    Click Element    ${open_new_account_btn}
    Sleep  2s
    Wait Until Page Contains Element   ${account_open_message}    5s

Creating Savings Account
    [Documentation]    This keyword creates a savings account for the user. @
    Click Element    ${open_new_account}
    Click Element    ${account_type_dropdown}
    Wait Until Page Contains Element    ${savings_option}    3s
    Click Element    ${savings_option}
    Sleep    4s
    Click Element    ${open_new_account_btn}
    Sleep  5s
    Wait Until Page Contains Element   ${account_open_message}    3s

Verify Successful Account Creation
    [Documentation]    This keyword verifies that the account was created successfully. @
    Click Element    ${open_new_account}
    Click Element    ${account_type_dropdown}
    Wait Until Page Contains Element    ${savings_option}    5s
    Click Element    ${savings_option}
    Sleep    4s
    Click Element    ${open_new_account_btn}
    Sleep  5s
    Wait Until Page Contains Element   ${account_open_message}    5s

Verify Account Overview Page
    [Documentation]    This keyword verifies that the account overview page is displayed. @
    Ensure User Is Logged In
    Click Element    ${account_overview_link}
    Wait Until Page Contains Element   ${account_overview_title}    5s

Verify Account Overview after Account Creation
    [Documentation]     This keyword verifies that the accounts created are shown on Account Overview Page @
    Ensure User Is Logged In
    Creating Savings Account
    Click Element    ${account_overview_link}
    Wait Until Page Contains Element   ${account_overview_title}    5s


