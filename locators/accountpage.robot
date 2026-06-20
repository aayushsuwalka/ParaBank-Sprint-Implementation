*** Variables ***
${open_new_account}    xpath=//a[text()='Open New Account']
${account_type_dropdown}    xpath=//select[@id='type']
${checking_option}   xpath=//option[@value='0']
${savings_option}   xpath=//option[@value='1']
${open_new_account_btn}   xpath=//input[@value='Open New Account']
${account_open_message}   xpath=//h1[text()='Account Opened!']
${account_overview_link}   xpath=//a[text()='Accounts Overview']
${account_overview_title}   xpath=//div[@id='showOverview']/h1
${acc_no}   xpath=//a[@id='newAccountId']