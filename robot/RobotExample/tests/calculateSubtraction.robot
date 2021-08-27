*** Settings ***

Resource        cumulusci/robotframework/Salesforce.robot
Library         cumulusci.robotframework.PageObjects

Suite Setup     Open Test Browser


*** Test Cases ***


Via UI

# Generates two random numbers and add

    ${output}  Set Variable  100

# Navigate to the calculator page generate two numbers and click add
    Select App Launcher App            LWCcalculator

Input Form Data
    ...  Number 1                256
    ...  Number 2                100

    Click Button                 Subtraction
    Validate LWCcalculator       ${output}




    

*** Keywords ***

Validate LWCcalculator
    [Arguments]     ${output}

# Validate via UI
    Page Should Contain                ${output}

