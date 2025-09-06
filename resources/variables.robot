*** Settings ***
Library     SeleniumLibrary    screenshot_root_directory=results
Resource    keywords.robot

*** Variables ***
${URL}                       http://www.automationpractice.pl/index.php
${BROWSER}                   chrome
${SING_IN}                   //a[@href="http://www.automationpractice.pl/index.php?controller=my-account"]

#Variáveis de formulário de cadastro
${AUTHENTICATION}            //*[@id="center_column"]/h1
${EMAIL_ADDRESS}             id=email_create
${EMAIL_VALIDO}              clesil06@teste.com 
${BUTTON_CREATE_ACCOUNT}     id=SubmitCreate
${MR}                        id=id_gender1
${MRS}                       id=id_gender2
${FIRST_NAME}                id=customer_firstname
${FIRST_NAME_VALIDO}         Cleo
${LAST_NAME}                 id=customer_lastname
${LAST_NAME_VALIDO}          Silva
${PASSWORD_1}                //*[@id="passwd"]
${SENHA_VALIDA}              Test@123
${SELETOR_DIA}               id=days
${VALOR_DIA}                 15
${SELETOR_MES}               id=months
${VALOR_MES}                 5
${SELETOR_ANO}               id=years
${VALOR_ANO}                 1990
${BUTTON_REGISTER}           id=submitAccount
${ACCOUNT_SUCESSO}           //*[@id="center_column"]/p[1]
${MY_ACCOUNT}                //*[@id="center_column"]/h1
${SENHA_CURTA}               12
${SENHA_LONGA}               100000999999468465168781348711695257

# Variável vazia para cenários de campos em branco
${EMPTY}
${VAZIO} 

# Mensagens esperadas
${MSG_SUCESSO}              Your account has been created.
${MSG_JA_CADASTRADO}        id=create_account_error
${EMAIL_EXISTENTE}          An account using this email address has already been registered. 
...                         Please enter a valid password or request a new one.
${ALERT_BOX}                xpath=//div[@class="alert alert-danger"]
${ALERT_MSG}                xpath=//div[@class="alert alert-danger"]/p
${ALERT_ERROR_LASTNAME}     xpath=(//div[@class="alert alert-danger"]/ol/li)[1]
${ALERT_ERROR_FIRSTNAME}    xpath=(//div[@class="alert alert-danger"]/ol/li)[2]
${ALERT_ERROR_PASSWD}       xpath=(//div[@class="alert alert-danger"]/ol/li)[3]
${LOGIN_SUCESSO}            Welcome to your account
${ERRO_LOGIN}               Authentication failed.
${PERSONAL_INFORMATION}     Your personal information
${ALERT_SENHA_INVALIDA}     xpath=(//div[@class="alert alert-danger"]/ol/li)[1]
${ALERT_SENHA_MAX}          xpath=(//div[@class="alert alert-danger"]/ol/li)[1]

#Variáveis de login
${USUARIO_VALIDO}            silvacle@test.com