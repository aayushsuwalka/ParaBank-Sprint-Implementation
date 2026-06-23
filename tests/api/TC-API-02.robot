*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-API-02
    [Documentation]    Test to new account ID is present in API response
    Ensure User Is Logged In
    Get Customer Id
    Get all Accounts of Customer
    Check Account ID
