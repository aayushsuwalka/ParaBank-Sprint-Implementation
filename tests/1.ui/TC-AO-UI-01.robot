*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/account_page.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-AO-UI-01
    [Documentation]     Test to verify account balance is displayed on the accounts overview page
    Verify Account Overview Page