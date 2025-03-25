*** Settings ***
Documentation  a sample test.
Variables    ./varibales.py
Library    ./Mathematiques.py
Resource    keywords.resource
Resource    login.resource
Library    SeleniumLibrary



*** Variables ***
${URL}      https://www.saucedemo.com/ 
${BROWSER}  chrome
${USERNAME}  standardd_user
${PASSWORD}  secrett_sauce





*** Test Cases ***
Test Case 1
    [Documentation]  A sample case test.
    Calcul Somme    ${a}   ${b}
    Calcul Divi    ${a}   ${b}
    Calcul Multi    ${a}   ${b}
    Calcul Sous    ${a}   ${b}    
    log   Hello,world! ${a} et ${b}

Test Case 2
    [Documentation]  calcu de produit
    Calcul Produit    ${a}    ${b}


Login correct
    [Documentation]    Login
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id:user-name    standard_user
    Input Password    id:password    secret_sauce
    Click Button    id:login-button  
    ${txt}    Get Text    class:title
    Should Be Equal As Strings    ${txt}    Products
    Log To Console    ${txt}    Products
    [Teardown]  Close All Browsers





Login Incorrect
    [Tags]    invalid
    [Documentation]    Tester un login incorrect
    
    Login   ${URL}  ${BROWSER}
    Enter Username    ${USERNAME}
    Enter Password    ${PASSWORD}
    Click Login Button 

    ${txt}    Get Text    css:.error-message-container
    Should Be Equal As Strings    ${txt}    Epic sadface: Username and password do not match any user in this service
    Log To Console    ${txt}  Epic sadface: Username and password do not match any user in this service

    [Teardown]  Close All Browsers




 