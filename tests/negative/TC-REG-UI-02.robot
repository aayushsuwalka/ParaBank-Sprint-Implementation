*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/register_page.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-REG-UI-02
    [Documentation]    Test to validate that user cannot register with empty Mandatory fieds
    Register with Mandatory Fields Empty