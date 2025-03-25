*** Settings ***
Resource    ../pages/login_page.resource

*** Keywords ***
Login Avec Username Et Password
    [Arguments]    ${username}    ${password}    ${resultat}
    Saisir Username    ${username}
    Saisir Password    ${password}
    Cliquer Sur Le Bouton Login

    IF    "${resultat}"== "ok"
        ${text}    Get Page Title
        Should Be Equal As Strings    ${text}    Products
    ELSE
        ${res}    Get Error Message
        Element Should Be Visible    ${res}
    END