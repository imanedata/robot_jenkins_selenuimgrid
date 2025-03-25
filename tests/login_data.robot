*** Settings ***
Documentation    importer la lib selenium
Library    SeleniumLibrary
Resource    ../templates/login_template.resource    
Test Template    affichage
Test Setup    Open Browser    ${url}    ${browser}    remote_url=http://192.168.1.112:4444/wd/hub
Test Teardown    Close All Browsers
Library    DataDriver    ../data/login.csv    dialect=excel    delimiter=,    encoding=utf-8


*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    chrome

*** Test Cases ***
affichage ${username}    ${password}    ${resultat}

*** Keywords ***
affichage
    [Arguments]    ${username}    ${password}    ${resultat}
    Login Avec Username Et Password    ${username}    ${password}    ${resultat}