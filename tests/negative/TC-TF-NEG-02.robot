*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/transferfunds_page.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-TF-NEG-01
    [Documentation]    Test to validate that user cannot transfer funds with invalid amount
    Transfer Funds with Zero Amount in same Account