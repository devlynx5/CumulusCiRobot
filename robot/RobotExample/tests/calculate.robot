*** Settings ***

Resource        cumulusci/robotframework/Salesforce.robot
Library         cumulusci.robotframework.PageObjects

Suite Setup     Open Test Browser


*** Test Cases ***


Via UI

# Generates two random numbers and add
    ${randomNumber1} =     Get fake data  pyint
    ${randomNumber2} =     Get fake data  pyint
    ${randomNumber3} =     Get fake data  pyint
    ${randomNumber4} =     Get fake data  pyint
    ${randomNumber5} =     Get fake data  pyint
    ${randomNumber6} =     Get fake data  pyint
    ${randomNumber7} =     Get fake data  pyint
    ${randomNumber8} =     Get fake data  pyint


# Navigate to the calculator page generate two numbers and click add
    Select App Launcher App            LWCcalculator
    

    Input Form Data
    ...  Number 1                ${randomNumber1}
    ...  Number 2                ${randomNumber2}

    Click Button                 Addition

    Input Form Data
    ...  Number 1                ${randomNumber3}
    ...  Number 2                ${randomNumber4}


    Click Button                 Divison

    Input Form Data
    ...  Number 1                ${randomNumber5}
    ...  Number 2                ${randomNumber6}
    Click Button                 Multification

    Input Form Data
    ...  Number 1                ${randomNumber7}
    ...  Number 2                ${randomNumber8}

    Click Button                 Subtraction



*** Keywords ***



    # Validate via UI
    Select App Launcher App            LWCcalculator
    

