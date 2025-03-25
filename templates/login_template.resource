*** Settings ***
Library    SeleniumLibrary
Resource  ../pages/login_page.resource
*** Keywords ***
Login avec username et password
    [Arguments]    ${username}    ${password}     ${r_attendu}
    Set Browser Implicit Wait    2
    login_page.Saisir Username    ${username}
    login_page.Saisir Password    ${password}
    login_page.Cliquer Sur Le Bouton Login
   
    IF    "${r_attendu}"== "ok"
        ${text}    Get Page Title
        Should Be Equal As Strings    ${text}    Products
    ELSE
        ${res}    Get Error Message
        Element Should Be Visible    ${res}
    END
    [Teardown]    Close Browser