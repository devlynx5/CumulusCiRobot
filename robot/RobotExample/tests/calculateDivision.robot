*** Settings ***

Resource        cumulusci/robotframework/Salesforce.robot
Library         cumulusci.robotframework.PageObjects

Suite Setup     Open Test Browser


*** Test Cases ***


Via UI


# Generates two random numbers and divide

    
    ${output}  Set Variable  1

# Navigate to the calculator page generate two numbers and click divide

    Select App Launcher App            LWCcalculator


    Input Form Data
    ...  Number 1                10
    ...  Number 2                10
    
    Click Button                 Divison
    
    Validate LWCcalculator       ${output}




    

*** Keywords ***

Validate LWCcalculator
    [Arguments]     ${output}

# Validate via UI
    Page Should Contain                ${output}

    

