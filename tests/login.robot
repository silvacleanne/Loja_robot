*** Settings ***
Resource     ../resources/variables.robot
Resource     ../resources/keywords.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

Documentation  Feature: Login e Cadastro de Usuário
...    Como um novo visitante
...    Quero criar uma conta no sistema
...    Para acessar as funcionalidades restritas

*** Test Cases ***
  
CT 01 - Fazer login com sucesso
    
    Given que estou na página de login
    When insiro um email válido e senha válida
    And clico no botão "Sign in"
    And devo ser redirecionado para a página inicial do sistema
    
 Cenário: Login com senha inválida
     Given que estou na página de login
     When ele informa um email válido e uma senha inválida
     And clico no botão "Sign in"
#     Then o sistema deve exibir uma mensagem de erro

# @negativo
# Cenário: Login com campos vazios
#     Given que o usuário acessa a página de login
#     When ele não preenche email e senha
#     And clica no botão de login
#     Then o sistema deve exibir mensagem de obrigatoriedade

