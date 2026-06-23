*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/account_page.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-E2E-02
    [Documentation]   Test to check that the amount taken from the source is exactly equal to the amount added to the destination — no money lost or duplicated
    Open a Savings Account with Valid Details
    Get Customer Id
    Get all Accounts of Customer
    ${amount_before}=  Check Account Balance
    Log To Console    ${amount_before}
    ${res}=  Transfer Funds through API    100    ${SOURCE_ACCOUNT_NUMBER}    ${SAVINGS_ACCOUNT_NUMBER}
    Should Be Equal As Strings    ${res.status_code}   200
    ${amount_after}=  Check Account Balance
    Log To Console    ${amount_after}
    ${difference}=  Evaluate    ${amount_before} - ${amount_after}
    Should Be Equal As Numbers    ${difference}    100