*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${URL}   https://parabank.parasoft.com/parabank/services/bank
${username}=   ${USERNAME}
${password}=    ${PASSWORD}


*** Keywords ***
Get Customer Id
    [Documentation]    Getting the customer id of the logged in user @
    Create Session    bank    ${URL}   verify=True  headers={'Accept':'application/json'}
    ${response}=   GET On Session    bank    /login/${USERNAME}/${PASSWORD}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
#    Log To Console    ${body}
    ${customerID}=    Set Variable    ${body}[id]
    Set Suite Variable     ${Customer_Id}   ${customerID}
Get Error for Invalid Customer Id
    [Documentation]    Getting the error for invalid customer id
    Create Session    bank    ${URL}   verify=True  headers={"Accept": "application/json"}
    ${response}=   GET On Session    bank    /customers/99999/accounts   expected_status=any
    Should Be Equal As Integers    ${response.status_code}    400
    Log To Console    ${response.status_code}

Get all Accounts of Customer
    [Documentation]    Getting all the accounts of a customer @
    Create Session    bank    ${URL}   verify=True  headers={"Accept": "application/json"}
    ${response}=   GET On Session    bank    /customers/${Customer_Id}/accounts
    Log To Console    ${response.status_code}
    ${body}=    Set Variable    ${response.json()}
    Log To Console    ${body}
    ${acc_Id}=    Set Variable    ${body}[0][id]
    ${acc_type}=    Set Variable    ${body}[0][type]
    Set Suite Variable    ${Expected_Account_Type}    ${acc_type}
    Set Suite Variable     ${Account_Id}   ${acc_Id}


Check Account ID
    [Documentation]    Checking if the account id is present in the list of accounts @
    Create Session    bank    ${URL}   verify=True   headers={"Accept": "application/json"}
    ${response}=   GET On Session    bank    /customers/${Customer_Id}/accounts
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
    ${found}=    Set Variable    ${False}
    FOR   ${account}    IN    @{body}
        ${id}=    Get From Dictionary
        ...    ${account}
        ...    id
        IF    $id == $Account_Id
            ${found}=    Set Variable    ${True}
            Exit For Loop
        END
    END
    Should Be True
    ...    ${found}
    ...    Account ${Account_Id} was not found in API response.x

Check Account Type
    [Documentation]    Checking if the account type matches to that of UI @
    Create Session    bank    ${URL}   verify=True   headers={"Accept": "application/json"}
    ${response}=   GET On Session    bank    /accounts/${Account_Id}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
#    Log To Console    ${body}
    ${account_type}=    Get From Dictionary
    ...    ${body}
    ...    type
    Should Be Equal    ${account_type}    ${Expected_Account_Type}

Check Account Balance
    [Documentation]     Checks the account balance @
    Create Session    bank    ${URL}   verify=True     headers={"Accept": "application/json"}
    ${response}=  GET On Session    bank    /accounts/${Account_Id}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
    Log To Console    ${body}[balance]
    RETURN  ${body}[balance]

Transfer Funds through API
    [Documentation]     Tranfer funds between account through API @
    [Arguments]    ${amt}    ${src_acc}    ${to_acc}
    Create Session    bank    ${URL}   verify=True     headers={"Accept": "application/json"}
    ${params}=    Create Dictionary
    ...    amount=${amt}
    ...    fromAccountId=${src_acc}
    ...    toAccountId=${to_acc}

    ${response}=    POST On Session
    ...    bank
    ...    /transfer
    ...    params=${params}
    RETURN  ${response}


Verify GET Accounts Response Fields
    [Documentation]    Verify that GET Accounts API response contains all mandatory fields @
    Create Session    bank    ${URL}    verify=True    headers={"Accept":"application/json"}
    ${response}=    GET On Session    bank    /accounts/${Account_Id}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${body}    id
    Dictionary Should Contain Key    ${body}    customerId
    Dictionary Should Contain Key    ${body}    type
    Dictionary Should Contain Key    ${body}    balance
    Log To Console    Required fields are present in the response.

Verify AccountID Through API
    [Documentation]    Verify AccountId form UI @
    Create Session    bank    ${URL}    verify=True    headers={"Accept":"application/json"}
    ${response}=    GET On Session    bank    /accounts/${ACCOUNT_NUMBER}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${body}    id
    Dictionary Should Contain Key    ${body}    customerId
    Dictionary Should Contain Key    ${body}    type
    Dictionary Should Contain Key    ${body}    balance

    ${apiAccountId}=    Set Variable    ${body}[id]
    Should Be Equal As Integers    ${apiAccountId}    ${ACCOUNT_NUMBER}
    Log To Console    Account successfully verified through API.



