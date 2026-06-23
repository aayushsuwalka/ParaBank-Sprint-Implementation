*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/transferfunds_page.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-TF-UI-01
    [Documentation]    Test to perform a fund transfer between two valid accounts
    Transfer Funds Between Two Accounts