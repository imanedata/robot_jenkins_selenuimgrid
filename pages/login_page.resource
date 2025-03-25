*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${usernameElement}    id:user-name 
${passwordElement}    id:password
${loginButtonElement}    id:login-button   
${pageTitleElement}    css:.title    
${errorElement}    css:.error-button

*** Keywords ***

Saisir Username
    [Arguments]    ${username}
    Input Text    ${usernameElement}    ${username}

Saisir Password
    [Arguments]    ${password}
    Input Password    ${passwordElement}    ${password}

Cliquer Sur Le Bouton Login
    Click Button    ${loginButtonElement}

Get Page Title
    ${res}    Get Text    ${pageTitleElement}
    RETURN    ${res}

Get Error Message
    RETURN    ${errorElement}