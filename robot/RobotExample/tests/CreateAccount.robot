*** Settings ***

Resource        cumulusci/robotframework/Salesforce.robot
Library         cumulusci.robotframework.PageObjects

Suite Setup     Open Test Browser


*** Test Cases ***


Via UI

# Generates and store the account name
    ${account_name} =       Get fake data  company
    ${Account_Site } =      Get fake data  address
    ${Annual_Revenue} =     Get fake data  pyint
    ${Phone} =              Get fake data  phone_number
    ${Fax} =                Get fake data  phone_number
    

# Navigate to the account page and click new account name
    Go to page            Home  Account
    Click Object Button   New
    Wait for modal        New  Account

    Input Form Data
    ...  Account Name                 ${account_name}
    Click Modal Button    Save

    Wait Until Modal Is Closed

# stores account ID 
    ${account_id} =       Get Current Record Id
    Store Session Record  Account  ${account_id}

    Go to page                  Detail  Account  ${account_id}


    Click button         Edit
    Wait for modal       Edit  Account

    Input Form Data
    ...  Account Number                 ${account_name}
    ...  Account Site                   ${Account_Site}
    ...  Annual Revenue                 ${Annual_Revenue}
    ...  Employees                      100
    ...  Phone                          ${Phone}
    ...  Fax                            ${Fax}
    Click Modal Button    Save
    Wait Until Modal Is Closed
    Validate Account         ${account_id}  ${account_name}  ${Account_Site}  ${Annual_Revenue}


*** Keywords ***

Validate Account 
    [arguments]             ${account_id}  ${account_name}  ${Account_Site}  ${Annual_Revenue}
    [Documentation]
    ...  Given a account id, validate that the account has all the input Information

    # Validate Account via UI 
    Go to page              Detail  Account  ${account_id}
    Page Should Contain     ${account_name}  ${Account_Site}