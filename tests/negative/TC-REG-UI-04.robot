*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/register_page.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-REG-UI-04
    [Documentation]    Test to validate that already registered user cannot register again with same username
    Register with Numeric Username