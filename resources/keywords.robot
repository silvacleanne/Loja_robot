*** Settings ***
Library    SeleniumLibrary
Resource   variables.robot

*** Keywords ***

Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Sleep    10s    # Pausa o teste por 60 segundos
    Close Browser

Given que estou na página de cadastro
    Click Element    ${SING_IN}
    Wait Until Element Is Visible    ${AUTHENTICATION}    

When insiro um email válido
    Input Text    ${EMAIL_ADDRESS}    ${EMAIL_VALIDO}

And clico no botão "Create an account"
    Click Button    ${BUTTON_CREATE_ACCOUNT}

And preencho os campos obrigatórios: "Title", "First name", "Last name", "Password", Date of Birth
    Wait Until Element Is Visible    ${MRS}    5s
    Click Element                    ${MRS}              
    Input Text                       ${FIRST_NAME}     ${FIRST_NAME_VALIDO}             
    Input Text                       ${LAST_NAME}      ${LAST_NAME_VALIDO}            
    Input Password                   ${PASSWORD_1}     ${SENHA_VALIDA}         
    Select From List By Value        ${SELETOR_DIA}    ${VALOR_DIA}
    Select From List By Value        ${SELETOR_MES}    ${VALOR_MES}
    Select From List By Value        ${SELETOR_ANO}    ${VALOR_ANO}
                          
                             
And clico no botão "Register"
    Click Button    ${BUTTON_REGISTER}

Then a conta deve ser criada com sucesso
    Wait Until Element Is Visible    ${ACCOUNT_SUCESSO}    timeout=10s
    Element Text Should Be           ${ACCOUNT_SUCESSO}    ${MSG_SUCESSO}

And devo ser redirecionado para a página inicial do sistema
    Wait Until Element Is Visible    ${MY_ACCOUNT}

When insiro um email já cadastrado
    Input Text    ${EMAIL_ADDRESS}    ${USUARIO_VALIDO}    

Then deve ser exibida a mensagem "Email already registered"
    Wait Until Element Is Visible    ${MSG_JA_CADASTRADO}    5s
    Element Text Should Be           ${MSG_JA_CADASTRADO}    ${EMAIL_EXISTENTE}

And deixo os campos obrigatórios em branco 
    Wait Until Element Is Visible         ${FIRST_NAME}    timeout=10s
    Input Text          ${FIRST_NAME}     ${VAZIO}            
    Input Text          ${LAST_NAME}      ${VAZIO}           
    Input Password      ${PASSWORD_1}     ${VAZIO}        
    
Then deve ser exibida a mensagem de erro informando os campos obrigatórios
    Wait Until Element Is Visible    ${ALERT_BOX}                timeout=10s
    Element Text Should Be           ${ALERT_MSG}                There are 3 errors
    Element Text Should Be           ${ALERT_ERROR_LASTNAME}     lastname is required.
    Element Text Should Be           ${ALERT_ERROR_FIRSTNAME}    firstname is required.
    Element Text Should Be           ${ALERT_ERROR_PASSWD}       passwd is required.

And preencho os campos obrigatórios: "Title", "First name", "Last name", Date of Birth
    Wait Until Element Is Visible    ${MRS}    5s
    Click Element                    ${MRS}              
    Input Text                       ${FIRST_NAME}     ${FIRST_NAME_VALIDO}             
    Input Text                       ${LAST_NAME}      ${LAST_NAME_VALIDO}            
    Select From List By Value        ${SELETOR_DIA}    ${VALOR_DIA}
    Select From List By Value        ${SELETOR_MES}    ${VALOR_MES}
    Select From List By Value        ${SELETOR_ANO}    ${VALOR_ANO}
           
And insiro uma senha com o mínimo caracteres
    Input Password     ${PASSWORD_1}     ${SENHA_CURTA} 

Then deve ser exibida a mensagem "Password too short"
    Wait Until Element Is Visible    ${ALERT_BOX}                timeout=10s 
    Element Text Should Be           ${ALERT_SENHA_INVALIDA}     passwd is invalid.

And insiro uma senha com o máximo de caracteres
    Input Password     ${PASSWORD_1}    ${SENHA_LONGA} 

Then deve ser exibida a mensagem "Password too long"  
    Wait Until Element Is Visible    ${ALERT_BOX}                timeout=10s  
    Element Text Should Be           ${ALERT_SENHA_MAX}          passwd is too long. Maximum length: 32
    