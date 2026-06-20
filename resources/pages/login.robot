*** Settings ***
Library     SeleniumLibrary
Resource    ../../locators/loginpage.robot

*** Keywords ***
Login User
    [Arguments]     ${username}     ${password}
    Input Text    ${login_username}    ${username}
    Input Text    ${login_password}    ${password}
    Click Element    ${login_btn}