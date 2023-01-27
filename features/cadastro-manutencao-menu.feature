Scenario: Cadastrando novo produto
Given Estou logado como "Admin" com login "Erlan Lira" e senha "1234"
And Estou na página "Cadastrar Produto"
And Eu vejo os campos "Nome, descrição, preço, foto, forma de pagamento, disponibilidade" vazios
When Eu adiciono as informações "Camisa polo, Camisa polo preta esportiva com bom pano, R$80, camisa.png, Cartão, 20 unidades" nos campos "Nome, descrição, preço, foto, forma de pagamento, disponibilidade"
And Eu clico em "Cadastrar"
Then Eu vejo na tela a requisição da senha para concluir o procedimento
And Eu preencho a senha
And Eu clico em "Minha Loja" no menu
And Eu estou na página "Minha Loja"
And Eu vejo o novo produto cadastrado

Scenario: Atualizando um produto
Given Estou logado como "Admin" com login "Erlan Lira" e senha "1234"
And Estou na página "Minha Loja"
And Eu clico no ícone de atualizar produto
And Eu estou na página "Atualizar produto"
And Eu vejo as informações "Camisa polo, Camisa polo preta esportiva com bom pano, R$80, camisa.png, Cartão, 20 unidades" nos campos “Nome, descrição, preço, foto, forma de pagamento, disponibilidade”
When Eu altero as informações dos campos "preço, disponibilidade" de "R$80, 20 unidades" para "R$100, 10 unidades"
And Eu clico em "Editar"
Then Eu vejo na tela a requisição da senha para concluir o procedimento
And Eu preencho a senha
And Eu clico em "Minha Loja" no menu
And Eu estou na página "Minha Loja"
And Eu vejo o produto alterado com as novas informações

Scenario: Removendo um produto
Given Estou logado como "Admin" com login "Erlan Lira" e senha "1234"
And Estou na página "Remover Produto"
And Eu vejo todos os itens da minha loja
When Eu seleciono o item da minha loja que quero remover
And Eu clico em "Remover"
Then Eu vejo na tela a requisição da senha para concluir o procedimento
And Eu preencho a senha
And Eu clico em "Minha Loja" no menu
And Eu estou na página "Minha Loja"
And Eu vejo que o produto foi excluído da minha loja

Scenario: Tentativa mal-sucedida de cadastro de novo produto com título já existente
Given Estou logado como "Admin" com login "Erlan Lira" e senha "1234"
And Estou na página "Cadastrar Produto"
And Eu vejo os campos "Nome, descrição, preço, foto, forma de pagamento, disponibilidade" vazios
When Eu adiciono as informações "Camisa polo, Camisa polo preta esportiva com bom pano, R$80, camisa.png, Cartão, 20 unidades" nos campos "Nome, descrição, preço, foto, forma de pagamento, disponibilidade"
And Eu clico em "Cadastrar"
Then Eu vejo na tela uma mensagem de erro indicando que o título(nome) do produto já pertence a outro produto na minha loja
And Eu clico em "Retornar"
And E estou no preenchimento do cadastro do produto novamente

Scenario: Tentativa mal-sucedida de cadastro de novo produto deixando algum campo em branco
Given Estou logado como "Admin" com login "Erlan Lira" e senha "1234"
And Estou na página "Cadastrar Produto"
And Eu vejo os campos "Nome, descrição, preço, foto, forma de pagamento, disponibilidade" vazios
When Eu adiciono as informações "Camisa polo, Camisa polo preta esportiva com bom pano, R$80, camisa.png, Cartão, -" nos campos "Nome, descrição, preço, foto, forma de pagamento, disponibilidade"
And Eu clico em "Cadastrar"
Then Eu vejo na tela uma mensagem de erro indicando que algum dos campos não foi preenchido
And Eu clico no botão de icone que indica "Remover aviso"
And E estou no preenchimento do cadastro do produto novamente

Scenario: Tentativa mal-sucedida de remoção de produto sem selecionar nenhum item
Given Estou logado como "Admin" com login "Erlan Lira" e senha "1234"
And Estou na página "Remover Produto"
And Eu vejo todos os itens da minha loja
When Eu não seleciono o item da minha loja que quero remover
And Eu clico em "Remover"
Then Eu vejo na tela a mensagem de erro indicando que nenhum item foi selecionado
And Eu clico no botão de icone que indica "Remover aviso"
And Eu continuo na página "Remover Produto"
And Eu vejo que todos os itens permanecem na loja

Scenario: Tentativa mal-sucedida de atualizar um produto deixando algum campo em branco
Given Estou logado como "Admin" com login "Erlan Lira" e senha "1234"
And Estou na página "Minha Loja"
And Eu clico no ícone de atualizar produto
And Eu estou na página "Atualizar produto"
And Eu vejo as informações "Camisa regata, Camisa regata branca esportiva com bom pano, R$120, camisa_regata.png, Dinheiro, 30 unidades" nos campos “Nome, descrição, preço, foto, forma de pagamento, disponibilidade”
When Eu altero as informações dos campos "preço, disponibilidade" de "R$120, 30 unidades" para "R$80, -"
And Eu clico em "Editar"
Then Eu vejo na tela uma mensagem de erro indicando que algum dos campos não foi preenchido
And Eu clico no botão de icone que indica "Remover aviso"
And E estou no preenchimento da atualização do produto novamente

Scenario: Copiando e obtendo o ID único do produto
Given Estou logado como "Admin" com login "Erlan Lira" e senha "1234"
And Estou na página "Minha Loja"
And Eu clico no ícone que indica "Atualizar produto"
And Eu estou na página "Atualizar produto"
And Eu vejo as informações "Moletom, Moletom cinza com capuz, R$180, moleton_ciza.png, Cartão, 3 unidades" nos campos “Nome, descrição, preço, foto, forma de pagamento, disponibilidade”
When Eu vejo "23eeb2" no campo "ID único do produto"
And Eu no botão de icone que indica em "Copiar ID"
Then Eu vejo na tela a confirmação "O ID foi copiado com sucesso"
And Eu vejo que o ID foi copiado para área de transferência