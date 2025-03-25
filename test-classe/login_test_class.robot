*** Settings ***
Documentation    importer la lib selenium
Library    SeleniumLibrary
Resource    ../pages/login_page.resource

*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    chrome
${validUser}    standard_user
${validPassword}    secret_sauce

*** Test Cases ***
Test Case 1
    [Tags]    @valid
    [Documentation]    login valid
    Open Browser    ${url}    ${browser}    options=add_argument("--headless")
    Saisir Username    ${validUser}
    Saisir Password    ${validPassword}
    Login_page.Cliquer Sur Le Bouton Login
    ${text}    Get Page Title
    Should Be Equal As Strings    ${text}    Products
    [Teardown]    Close All Browsers

Test Case 2
    [Tags]    @invalid
    [Documentation]    login invalid
    Open Browser    ${url}    ${browser}
    Saisir Username    invalid
    Saisir Password    ${validPassword}
    Cliquer Sur Le Bouton Login
    ${res}    Get Error Message
    Element Should Be Visible    ${res}
    [Teardown]    Close All Browsers