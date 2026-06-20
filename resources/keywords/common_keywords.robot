*** Settings ***
Library  SeleniumLibrary
Library  ../../config/environment.py
Resource    ../pages/login.robot
Resource    ../pages/register_page.robot

*** Variables ***
${BROWSER}  chrome
${ENV}  qa

*** Keywords ***
Load Environment
    Load Env    ${ENV}
    ${url}=  Get Env    baseurl
    ${username}=  Get Env    username
    ${password}=  Get Env    password

    Set Global Variable    ${BASE_URL}  ${url}
    Set Global Variable    ${USERNAME}  ${username}
    Set Global Variable    ${PASSWORD}  ${password}
Open Application
    [Documentation]  Opens the application
    Open Browser  ${BASE_URL}  ${BROWSER}
    Maximize Browser Window
Ensure User Is Logged In
    Login User    ${USERNAME}    ${PASSWORD}
    ${login_success}=    Run Keyword And Return Status
    ...    Wait Until Page Contains
    ...    Accounts Overview
    ...    10s

    IF    not ${login_success}
        Go To    ${BASE_URL}
        Register With Valid Credentials
    END
Close Application
    [Documentation]  Closing the application
    Close All Browsers