*** Settings ***
Documentation    importer la lib selenium
Library    SeleniumLibrary
Resource    ../pages/login_page.resource
Resource    ../templates/login_template.robot
Test Template    login avec username et password
Test Setup  Open Browser    https://www.saucedemo.com/

*** Test Cases ***                        Username    Password    Resultat
login correct username et correct password        standard_user   secret_sauce    ok

login correct username et correct password        visual_user   secret_sauce    ok
login correct username et correct password        error_user   secret_sauce    ok
login correct username et correct password        problem_user   secret_sauce    ok
login correct username et correct password        performance_glitch_user   secret_sauce    ok


login incorrect username et correct password        standard_user    admin123    ko
login correct username et incorrect password        Admin    secret_sauce    ko