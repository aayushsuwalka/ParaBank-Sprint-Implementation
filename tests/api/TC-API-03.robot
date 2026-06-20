*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/account_page.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-API-03
    [Documentation]    Test to get the customerId of the user
    Ensure User Is Logged In
    Get Customer Id
    Get all Accounts of Customer
    Check Account Type
