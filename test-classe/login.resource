*** Settings ***
Library    .venv/Lib/site-packages/SeleniumLibrary/__init__.py
*** Keywords ***


Login
    [Arguments]    ${url}  ${browser}   
    Open Browser  ${url}  ${browser}    options=add_argument("--headless")

Enter Username
    [Arguments]      ${username}   
    Input Text    id:user-name    ${username}  

Enter Password
    [Arguments]      ${password}
    Input Password    id:password   ${password}

Click Login Button 
    Click Button    id:login-button 
