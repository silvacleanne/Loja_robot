*** Settings ***
Resource     ../resources/variables.robot
Resource     ../resources/keywords.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

*** Test Cases ***

 CT 01 - Cadastrar a conta com sucesso
     Given que estou na página de cadastro
     When insiro um email válido
     And clico no botão "Create an account"
     And preencho os campos obrigatórios: "Title", "First name", "Last name", "Password", Date of Birth
     And clico no botão "Register"
     Then a conta deve ser criada com sucesso
     And devo ser redirecionado para a página inicial do sistema

CT 02 - Tentar cadastrar com email já existente
      Given que estou na página de cadastro
      When insiro um email já cadastrado
      And clico no botão "Create an account"
      Then deve ser exibida a mensagem "Email already registered"

 CT 03 - Tentar cadastrar sem preencher campos obrigatórios
      Given que estou na página de cadastro
      When insiro um email válido
      And clico no botão "Create an Account"
      And deixo os campos obrigatórios em branco
      And clico no botão "Register"
      Then deve ser exibida a mensagem de erro informando os campos obrigatórios

CT 04: Tentar cadastrar com senha menor que 5 caracteres
     Given que estou na página de cadastro
     When insiro um email válido
     And clico no botão "Create an Account"
     And preencho os campos obrigatórios: "Title", "First name", "Last name", Date of Birth
     And insiro uma senha com o mínimo caracteres
     And clico no botão "Register"
     Then deve ser exibida a mensagem "Password too short"

CT05 - Tentar cadastrar com senha maior que o limite permitido
     Given que estou na página de cadastro
     When insiro um email válido
     And clico no botão "Create an Account"
     And preencho os campos obrigatórios: "Title", "First name", "Last name", Date of Birth
     And insiro uma senha com o máximo de caracteres
     And clico no botão "Register"
     Then deve ser exibida a mensagem "Password too long"









 