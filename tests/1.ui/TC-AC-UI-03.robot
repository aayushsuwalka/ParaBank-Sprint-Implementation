*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/account_page.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-AC-UI-03
    [Documentation]    Test to verify success message after account creation
    Ensure User Is Logged In
    Verify Successful Account Creation