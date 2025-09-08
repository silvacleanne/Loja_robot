*** Settings ***
Resource     ../resources/variables.robot
Resource     ../resources/keywords.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

*** Test Cases ***
  
CT 01: Fazer login com sucesso
    Given que estou na página de login
    When insiro um email válido e senha válida
    And clico no botão "Sign in"
    And devo ser redirecionado para a página inicial do sistema
    
CT 02: Login com senha inválida
    Given que estou na página de login
    When ele informa um email válido e uma senha inválida
    And clico no botão "Sign in"
    Then o sistema deve exibir uma mensagem de erro de senha

CT 03: Login com email inválido
    Given que estou na página de login
    When ele informa um email inválido e uma senha válida
    And clico no botão "Sign in"
    Then o sistema deve exibir uma mensagem informando que o email esta errado 

CT 04: Login com campos vazios
    Given que estou na página de login
    When ele não preenche email e senha
    And clico no botão "Sign in"
    Then o sistema deve exibir mensagem de obrigatoriedade

