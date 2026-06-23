*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/account_page.robot
Resource    ../../resources/keywords/common_keywords.robot
Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-API-05
    [Documentation]   Testcase to verify GET accounts response contains required fields
    Ensure User Is Logged In
    Get Customer Id
    Get all Accounts of Customer
    Verify GET Accounts Response Fields