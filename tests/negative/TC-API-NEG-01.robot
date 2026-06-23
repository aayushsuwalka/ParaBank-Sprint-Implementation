*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/account_page.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application
*** Test Cases ***
TC-API-NEG-01
    [Documentation]   Testcase to verify an error is returned for an invalid customer ID
    Ensure User Is Logged In
    Get Customer Id
    Get Error for Invalid Customer Id