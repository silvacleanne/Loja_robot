*** Settings ***
Resource     ../resources/variables.robot
Resource     ../resources/keywords.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

*** Test Cases ***

#Casos de teste com cadastro

CT01: Cadastrar conta e endereço com sucesso
    Given que estou na página de cadastro
    When insiro um email válido
    And clico no botão "Create an account"
    And preencho os campos obrigatórios: "Title", "First name", "Last name", "Password", Date of Birth
    And clico no botão "Register"
    And clico em My Addresses e Add New Address
    And preencho os campos obrigatórios de endereço
    And clico em Save
    Then o sistema deve salvar o endereço com sucesso

CT02: Validar campo obrigatório City
    Given que estou na página de cadastro
    When insiro um email válido
    And clico no botão "Create an account"
    And preencho os campos obrigatórios: "Title", "First name", "Last name", "Password", Date of Birth
    And clico no botão "Register"
    And clico em My Addresses e Add New Address
    And não preencher o campo City
    And clico em Save
    Then o sistema deve exibir a mensagem de erro "City is required"  

CT03: Validar obrigatoriedade do contato
    Given que estou na página de cadastro
    When insiro um email válido
    And clico no botão "Create an account"
    And preencho os campos obrigatórios: "Title", "First name", "Last name", "Password", Date of Birth
    And clico no botão "Register"
    And clico em My Addresses e Add New Address
    And não preencher Home phone e Mobile phone
    And clico em Save
    Then o sistema deve exibir a mensagem de erro "You must register at least one phone number."

CT04: Validar CEP inválido
    Given que estou na página de cadastro
    When insiro um email válido
    And clico no botão "Create an account"
    And preencho os campos obrigatórios: "Title", "First name", "Last name", "Password", Date of Birth
    And clico no botão "Register"
    And clico em My Addresses e Add New Address
    When preencher o campo Zip/Postal Code com "123"
    And clico em Save
    Then o sistema deve exibir a mensagem de erro "Invalid Zip/Postal Code"

# CT05: Editar endereço existente
#     Given que o usuário tenha um endereço cadastrado
#     When alterar o campo Address
#     And clicar em Save
#     Then o sistema deve salvar a alteração com sucesso

# CT06: Excluir endereço existente
#     Given que o usuário tenha um endereço cadastrado
#     When excluir o endereço
#     Then o sistema deve remover o endereço da lista

#Casos de teste com login       

CT07: Fazer login e cadastro de endereço com sucesso
    Given que estou na página de login
    When insiro um email válido e senha válida
    And clico no botão "Sign in"
    And devo ser redirecionado para a página inicial do sistema
    And clico em My Addresses e Add New Address
    And preencho os campos obrigatórios de endereço
    And clico em Save
    Then o sistema deve salvar o endereço com sucesso
    




