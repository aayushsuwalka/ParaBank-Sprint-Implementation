*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/account_page.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-API-04
    [Documentation]   Test to verify the sender's account balance is reduced after the transfer
    Open a Savings Account with Valid Details
    Get Customer Id
    Get all Accounts of Customer
    ${balance_before}=  Check Account Balance
    Log To Console    ${balance_before}
    ${res}=  Transfer Funds through API    100    ${SOURCE_ACCOUNT_NUMBER}    ${SAVINGS_ACCOUNT_NUMBER}
    Should Be Equal As Strings    ${res.status_code}   200
    ${balance_after}=  Check Account Balance
    Log To Console    ${balance_after}
    ${difference}=  Evaluate    ${balance_before} - ${balance_after}
    Should Be Equal As Numbers    ${difference}    100

