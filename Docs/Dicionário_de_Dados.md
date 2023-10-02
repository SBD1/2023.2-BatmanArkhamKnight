# DD - Dicionário de Dados

## Entidade: Gotham

#### Descrição: 

#### Observação: Essa tabela não possui chave estrangeira.

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
|    gotham_id  | Código identificador de Gotham |       Int      |     4   |    PK             | 

## Entidade: Região

### Descrição: Armanezará a informação de Regiões			

### Observação: Essa tabela possui uma chave estrangeira da tabela Gotham			

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
|    regiao_id  | Código identificador da Região|       Int      |     4   |    PK             |
|    gotham_atual  | Chave estrangeira referenciando o código identificador de gotham|       Int      |     4   |    FK             |
|    regiao_nome  | nome da Região|       VarChar      |     20   |    Not Null             |

## Entidade: Local

### Descrição: Armanezará a informação dos Locais, ou quadrantes			

### Observação: Essa tabela possui uma chave estrangeira da tabela Gotham

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| local_id |         Código identificador do Local          | Int       | 4 | PK |
| regiao_atual |         Chave estrangeira referenciando ao nome da Região          | Int       | 4 | FK |
| coordenada_x |         Coordernada x para identificar onde estão os NPCs e PC          | Int       | 4 | Not Null |
| coordenada_y |         Coordernada y para identificar onde estão os NPCs e PC          | Int       | 4 | Not Null |

## Entidade: Viaja

### Descrição: Armanezará a informação das viajens entre regiões			

### Observação: 

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| regiao_origem |         Região de origem da viagem          | Int       | 4 | FK |
| regiao_destino |         Região de destino da viagem          | Int       | 4 | FK |

## Entidade: Pré-requisito

### Descrição: Armanezará a informação de pré-requisito das missões		

### Observação: Essa tabela possui duas chaves estrangeiras da tabela missão

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| requisito_id |         Chave estrangeira referenciando o código identificador de quando é requisito          | Int       | 4 | FK |
| possui_pre_req_id |         Chave estrangeira referenciando o código identificador de quando possui pré requisito          | Int       | 4 | FK |

## Entidade: NPC

### Descrição: Armanezará as informações de NPC

### Observação: Essa tabela possui uma chave estrangeira da tabela Local

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| NPC_id |         Código identificador de NPC         | Int       | 4 | PK |
| local_id |         Chave estrangeira referenciando o código identificador de local         | Int       | 4 | FK |
| NPC_tipo |         Tipo do NPC que será         | VarChar       | 20 | Not Null |
| situacao_vida |         Descreve a situação da vida do NPC         | VarChar       | 20 | Default |

## Entidade: Instância

### Descrição: Armanezará as informações das Instâncias

### Observação: Essa tabela possui uma chave estrangeira na tabela NPC

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| inst_id |         Código identificador da instância        | Int       | 4 | PK |
| NPC_id |         Chave estrangeira referenciando o código identificador de NPC         | Int       | 4 | FK |
| nivel_dificuldade |          Nível de dificuldade da instância         | VarChar       | 20 | Default |

## Entidade: Vilão

### Descrição: Armanezará as informações dos Personagens

### Observação: Essa tabela possui uma chave estrangeira da tabela NPC

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| vilao_id |         Código identificador do vilão      | Int       | 4 | PK |
| NPC_id |         Chave estrangeira referenciando o código identificador de NPC         | Int       | 4 | FK |
| nome_vilão |          Nome do vilão         | VarChar       | 20 | Not Null |
| inteligencia |          Quantidade de inteligência do personagem         | Int       | 4 | Default |
| forca |          Quantidade de força do personagem         | Int       | 4 | Default |

## Entidade: Armadura

### Descrição: Armanezará as informações de armadura			

### Observação: Essa tabela possui uma chave estrangeira da tabela equipamento			

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| armadura_id |         Código identificador de armadura      | Int       | 4 | PK |
| equip_id |         Chave estrangeira referenciando o código identificador de NPC         | Int       | 4 | FK |
| protecao |          Quantidade de proteção         | int       | 4 | Not Null/Check |

## Entidade: Arma

### Descrição: Armanezará as informações de arma

### Observação: Essa tabela possui uma chave estrangeira da tabela equipamento			

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| arma_id |         Código identificador de armadura      | Int       | 4 | PK |
| equip_id |         Chave estrangeira referenciando o código identificador de NPC         | Int       | 4 | FK |
| dano |          Quantidade de dano         | int       | 4 | Not Null/Check |

## Entidade: PC

### Descrição: Armanezará as informações do Presonagem Jogável

### Observação: Essa tabela possui uma chave estrangeira da tabela Local

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| personagem_id |         Código identificador do personagem      | Int       | 4 | PK |
| local_id |         Chave estrangeira referenciando o código identificador de local        | Int       | 4 | FK |
| nome |          Nome do personagem jogavél         | VarChar       | 20 | Not Null |
| HP |          Pontos de vida do personagem jogável         | Int       | 4 | Default |

## Entidade: ER PC x Equipamento

### Descrição: ER PC x Equipamento

### Observação: Armanezará as informações de desbloquear equipamento

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| personagem_id |         Chave estrangeira referenciando o código identificador do personagem      | Int       | 4 | FK |
| equip_id |         Chave estrangeira referenciando o código identificador de equipamento        | VarChar       | 20 | FK |
| level |          Level necessário para desbloquear equipamento         | int       | 4 | Not Null |
| HP |          Pontos de vida do personagem jogável         | Int       | 4 | Default |

## Entidade: Equipamento

### Descrição: Armanezará as informações de Equipamento

### Observação: Essa tabela não possui chaves estrangeiras

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| equip_id |         Código identificador do equipamento     | Int       | 4 | FK |
| tipo_equipamento |         tipo de equipamento que o PC está usando        | VarChar       | 20 | Not Null |
| nome_equipamento |          nome do equipamento         | VarChar       | 20 | Not Null |
| nivel |          nível de quanto esta aprimorado o equipamento         | Int       | 4 | Not Null/Check |
| descricao |          Descrição do equipamento         | VarChar       | 55 | Not Null |

## Entidade: Missão

### Descrição: Armazenará as informações das missões

### Observação: Essa tabela possui uma chave estrangeira da tabela PC

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| missao_id |         Código identificador de missao     | Int       | 4 | PK |
| personagem_id |         Chave estrangeira referenciando o código identificador do personagem        | Int       | 4 | FK |
| nome_missao |          nome da missão         | VarChar       | 20 | Not Null |
| descricao |          Descrição da missão         | VarChar       | 55 | Not Null |
| situacao |          situção da missão         | Int       | 4 | Not Null/Check |

## Entidade: Veículo

### Descrição: Armazenará as informações dos veículos

### Observação: Essa tabela possui uma chave estrangeira da tabela PC

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| veiculo_id |         Código identificador de veiculo     | Int       | 4 | PK |
| personagem_id |         Chave estrangeira referenciando o código identificador de PC        | Int       | 4 | FK |
| tipo_veiculo |          nome da missão         | VarChar       | 20 | Not Null |
| nome_veiculo |          Nome do veículo utilizado         | VarChar       | 20 | Not Null |

## Entidade: Terrestre

### Descrição: AArmazenará as informações do veículo terrestre

### Observação: Essa tabela possui uma chave estrangeira da tabela Veículo

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| veicTerrestre_id |         Código identificador do veiculo terrestre     | Int       | 4 | PK |
| veiculo_id |         Chave estrangeira referenciando o código identificador de veiculo        | Int       | 4 | FK |

## Entidade: Aquático

### Descrição: Armazenará as informações do veículo aquático

### Observação: Essa tabela possui uma chave estrangeira da tabela Veículo

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| veicAquatico_id |         Código identificador do veiculo aquático     | Int       | 4 | PK |
| veiculo_id |         Chave estrangeira referenciando o código identificador de veiculo        | Int       | 4 | FK |

## Entidade: Aéreo

### Descrição: Armazenará as informações do veículo aéreo

### Observação: Essa tabela possui uma chave estrangeira da tabela Veículo

| Nome Variável |         Descrição          | Tipo de dado       | Tamanho | Restrições de Domínio |
| :-----------: | :------------------------: | :----------------: | :------:| ----------------- |
| veicAereo_id |         Código identificador do veiculo aéreo     | Int       | 4 | PK |
| veiculo_id |         Chave estrangeira referenciando o código identificador de veiculo        | Int       | 4 | FK |

## Histórico de versões

| Versão |    Data    | Descrição               | Autor                                                                                                                 |
| :----: | :--------: | ----------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `1.0`  | 28/09/2023 | Criação do documento DD | Todos                                                                  |
| `1.3`  | 01/10/2023 | Revisão geral         |  [João Pedro](https://github.com/JoosPerro)     |
