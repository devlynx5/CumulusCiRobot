*** Settings ***

Resource        cumulusci/robotframework/Salesforce.robot
Library         cumulusci.robotframework.PageObjects

Suite Setup     Open Test Browser


*** Test Cases ***


Via UI

#Generates two random numbers and multiply

    ${output}  Set Variable  1001

# Navigate to the calculator page generate two numbers and click multiply

    Select App Launcher App            LWCcalculator

    Input Form Data
    ...  Number 1                25
    ...  Number 2                5

    Click Button                 Multification
    Validate LWCcalculator       ${output}




    

*** Keywords ***

Validate LWCcalculator
    [Arguments]     ${output}

# Validate via UI
    Page Should Contain                ${output}
