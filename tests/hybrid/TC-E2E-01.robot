*** Settings ***
Resource    ../../resources/pages/register_page.robot
Resource    ../../resources/pages/account_page.robot
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-E2E-01
    [Documentation]     Test to create an account from the UI and verify its details through the API
    Ensure User Is Logged In
    Open Savings Account
    Verify AccountID Through API
