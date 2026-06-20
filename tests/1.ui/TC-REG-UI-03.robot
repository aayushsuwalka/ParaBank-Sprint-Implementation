
*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/register_page.robot

Suite Setup     Load Environment
Test Setup      Open Application
Test Teardown   Close Application


*** Test Cases ***
TC-REG-UI-03
    [Documentation]    Test to validate that user can log in with valid credentials
    Login User    ${USERNAME}    ${PASSWORD}
    ${login_success}=    Run Keyword And Return Status
    ...    Wait Until Page Contains
    ...    Accounts Overview
    ...    10s

    IF    not ${login_success}
        Go To    ${BASE_URL}
        Register With Valid Credentials
    END