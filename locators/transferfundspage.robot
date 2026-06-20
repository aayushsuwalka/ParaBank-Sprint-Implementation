*** Variables ***
${transfer_funds_link}    xpath=//a[text()='Transfer Funds']
${amount_field}  xpath=//input[@id='amount']
${from_account}  xpath=//select[@id='fromAccountId']
${account_2}  xpath=(//select[@id='fromAccountId']/option)[1]
${account_1}  xpath=(//select[@id='fromAccountId']/option)[2]


${to_account}    xpath=//select[@id='toAccountId']
${transfer_btn}   xpath=//input[@value='Transfer']
${transfer_complete_message}   xpath=//h1[text()='Transfer Complete!']