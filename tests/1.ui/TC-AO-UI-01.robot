*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/account_page.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-AO-UI-01
    [Documentation]     Test to verify Account Overview page
    Verify Account Overview Page