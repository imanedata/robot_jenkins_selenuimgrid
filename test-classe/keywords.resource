*** Keywords ***
Calcul Produit
    [Arguments]    ${a}  ${b}
    ${result}  Evaluate    ${a}*${b}
    [Return]    ${result}
