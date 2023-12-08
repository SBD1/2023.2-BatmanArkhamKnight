# DD - Dicionário de Dados

Abaixo podemos visualizar as tabelas referentes ao Dicionário de Dados.

## Entidade: Mapa

### Descrição: Armanezará a informação de Mapa

### Observação: Essa tabela não possui chave estrangeira

| Variável  | Descrição                       | Tipo | Tamanho | Restrições de Domínio |
|-----------|---------------------------------|------|---------|-----------------------|
| id        | Chave primária do mapa          | Int  | 4       | PK                    |
| nome      | Nome do mapa                    | Char | 48      | Not Null              |
| total_pts | Pontuação total do jogador      | Int  | 4       | Not Null              |
| tamanho_x | Largura do mapa                 | Int  | 4       | Not Null              |
| tamanho_y | Altura do mapa                  | Int  | 4       | Not Null              |

## Entidade: Região

### Descrição: Armanezará a informação de Região

### Observação: Essa tabela possui chave estrangeira de Mapa

| Variável  | Descrição                                       | Tipo | Tamanho | Restrições de Domínio   |
|-----------|-------------------------------------------------|------|---------|-------------------------|
| id        | Chave primária da região                        | Int  | 4       | PK                      |
| mapa_id   | Referência ao mapa que a região pertence        | Int  | 4       | FK                      |
| nome      | Nome da região                                  | Char | 24      | Not Null, Unique        |

## Entidade: Local

### Descrição: Armanezará a informação de Mapa

### Observação: Essa tabela não possui chave estrangeira

| Variável   | Descrição                                                                                                  | Tipo | Tamanho | Restrições de Domínio                                                                                                        |
|------------|------------------------------------------------------------------------------------------------------------|------|---------|-----------------------------------------------------------------------------------------------------------------------------|
| id         | Chave primária do local                                                                                   | Int  | 4       | PK                                                                                                                          |
| regiao_id  | Referência à região do local                                                                              | Int  | 4       | FK                                                                                                                          |
| nome       | Nome do local                                                                                             | Char | 32      | Not Null, Unique                                                                                                            |
| acesso     | Indica se o local está acessível se local_acesso = 0. Caso contrário, local_acesso assume um valor relacionado à uma evidência que libere o acesso ao local | Int  | 4       | Not Null                                                                                                                    |
| origem_x   | Indica a posição x da quadra que é ponto de controle do local                                              | Int  | 4       | Not Null                                                                                                                    |
| origem_y   | Indica a posição y da quadra que é ponto de controle do local                                              | Int  | 4       | Not Null                                                                                                                    |

## Entidade: Quadra

### Descrição: Armanezará a informação de Quadra

### Observação: Essa tabela possui chave estrangeira de Local

| Variável  | Descrição                                   | Tipo  | Tamanho | Restrições de Domínio                     |
|-----------|---------------------------------------------|-------|---------|------------------------------------------|
| id        | Identificador da quadra                     | Int   | 4       | PK                                       |
| local_id  | Referência ao local que a quadra pertence   | Int   | 4       | FK                                       |
| escalavel | Indica se a quadra possui alguma construção escalável | Bool  | 1       | Not Null                                 |
| coord_x   | Indica a posição x da quadra no mapa         | Int   | 4       | Not Null                                 |
| coord_y   | Indica a posição y da quadra no mapa         | Int   | 4       | Not Null                                 |

## Entidade: NPC

### Descrição: Armanezará a informação de NPC

### Observação: Essa tabela possui chave estrangeira de Personagem, Quadra e Veículo

| Variável   | Descrição                                                                   | Tipo    | Tamanho | Restrições de Domínio                                                                                                      |
|------------|-----------------------------------------------------------------------------|---------|---------|---------------------------------------------------------------------------------------------------------------------------|
| person_id  | Chave primária e chave estrangeira para a tabela genérica de personagem    | Int     | 4       | PK, FK                                                                                                                    |
| NPC_foco   | Indica se o NPC está distraído ou focado no PC. Um NPC amigo deve estar focado no PC para poder dialogar.                | Int     | 4       | Not Null                                                                                                                  |
| nome       | Nome do NPC                                                                 | Char    | 32      | Not Null                                                                                                                  |
| HP         | Pontos de saúde. Começa a ser afetado por ataques se DEF = 0 ou se o NPC estiver distraído                                   | Int     | 4       | Not Null                                                                                                                  |
| DEF        | Pontos de defesa. Se regenera se NPC sair do combate.                         | Int     | 4       | Not Null                                                                                                                  |
| id_quadra  | Referência para quadra onde o personagem está                               | Int     | 4       | FK                                                                                                                        |
| veic_id    | Referência para veículo em que o personagem está                             | Int     | 4       | FK                                                                                                                        |
| descr      | Uma curta descrição do personagem                                           | Varchar | 512     | Not Null                                                                                                                  |

## Entidade: PC

### Descrição: Armanezará a informação de PC

### Observação: Essa tabela possui chave estrangeira de Personagem, Quadra e Veículo

| Variável   | Descrição                                                                   | Tipo    | Tamanho | Restrições de Domínio                                                                                                      |
|------------|-----------------------------------------------------------------------------|---------|---------|---------------------------------------------------------------------------------------------------------------------------|
| person_id  | Chave primária do PC                                                       | Int     | 4       | PK                                                                                                                          |
| NPC_alvo   | Referência para NPC inimigo que está na mira do PC                         | Int     | 4       | FK                                                                                                                          |
| HP         | Pontos de saúde do PC                                                      | Int     | 4       | Not Null                                                                                                                    |
| ATK        | Pontos de ataque do PC                                                     | Int     | 4       | Not Null                                                                                                                    |
| DEF        | Pontos de defesa do PC                                                     | Int     | 4       | Not Null                                                                                                                    |
| XP         | Saldo de pontos do PC                                                      | Int     | 4       | Not Null                                                                                                                    |
| furtividade| Indica se o PC está sendo furtivo ou não. PC é furtivo ao atacar furtivamente, ao se esgueirar ou ao escalar prédios.| Int     | 4       | Not Null                                                                                                                    |
| espaco     | Número de equipamentos que podem ser equipados de uma vez                  | Int     | 4       | Not Null                                                                                                                    |
| id_quadra  | Referência para quadra onde o personagem está                               | Int     | 4       | FK                                                                                                                          |
| veic_id    | Referência para veículo em que o personagem está                             | Int     | 4       | FK                                                                                                                          |
| descr      | Uma curta descrição do personagem                                           | Varchar | 512     | Not Null                                                                                                                    |

## Entidade: Personagem

### Descrição: Armanezará a informação de Personagem

### Observação: Essa tabela não possui chave estrangeira

| Variável | Descrição                                     | Tipo | Tamanho | Restrições de Domínio |
|----------|-----------------------------------------------|------|---------|------------------------|
| id       | Referência para personagem                     | Int  | 4       | PK                     |
| tipo     | Especificação do tipo de personagem (PC ou NPC)| Int  | 4       | Not Null               |

## Entidade: Missão

### Descrição: Armanezará a informação de Missão

### Observação: Essa tabela possui chave estrangeira de NPC

| Variável | Descrição                                           | Tipo    | Tamanho | Restrições de Domínio   |
|----------|-----------------------------------------------------|---------|---------|-------------------------|
| id       | Chave primária da missão                            | Int     | 4       | PK                      |
| nome     | Nome da missão                                      | Char    | 32      | Not Null                |
| descr    | Texto explicativo da missão                         | Varchar | 256     | Not Null                |
| pontos   | Indica os pontos ganhos ao completar a missão        | Int     | 4       | Not Null                |
| NPC_id   | Referência ao inimigo a ser combatido ou à vítima a ser resgatada | Int | 4       | FK                      |

## Entidade: Habilidade

### Descrição: Armanezará a informação de Habilidade

### Observação: Essa tabela não possui chave estrangeira

| Variável | Descrição                                                               | Tipo  | Tamanho | Restrições de Domínio                                   |
|----------|-------------------------------------------------------------------------|-------|---------|---------------------------------------------------------|
| id       | Chave primária da habilidade                                          | Int   | 4       | PK                                                      |
| nome     | Nome da habilidade                                                     | Char  | 32      | Not Null                                                |
| descr    | Descrição da habilidade                                                | Char  | 128     | Not Null                                                |
| alcance  | Indica o alcance, em quadras, da habilidade. Se alcance = 0, a habilidade é útil apenas no combate corpo-a-corpo | Int   | 4       | Not Null                                                |

## Entidade: Objetivo

### Descrição: Armanezará a informação de Objetivo

### Observação: Essa tabela possui chave estrangeira de Missão e Local

| Variável   | Descrição                                                                                            | Tipo    | Tamanho | Restrições de Domínio                                   |
|------------|------------------------------------------------------------------------------------------------------|---------|---------|---------------------------------------------------------|
| id         | Chave primária do objetivo                                                                           | Int     | 4       | PK                                                      |
| missao_id  | Referência à missão a qual o objetivo pertence                                                       | Int     | 4       | FK                                                      |
| local_id   | Referência ao local onde começa o cumprimento do objetivo. Pode ser o local onde estão as evidências, as vítimas ou os inimigos | Int | 4       | FK                                                      |
| status     | Indica se a missão está oculta, pendente ou cumprida                                                | Int     | 4       | Not Null                                                |
| descr      | Texto que explica o objetivo                                                                        | Varchar | 128     | Not Null                                                |

## Entidade: Diálogo

### Descrição: Armanezará a informação de Diálogo

### Observação: Essa tabela possui chave estrangeira de NPC

| Variável    | Descrição                                             | Tipo    | Tamanho | Restrições de Domínio                                   |
|-------------|-------------------------------------------------------|---------|---------|---------------------------------------------------------|
| id          | Chave primária do diálogo                            | Int     | 4       | PK                                                      |
| NPC_id      | Referência ao NPC dono do diálogo                     | Int     | 4       | FK                                                      |
| dial_numero | Número do diálogo do NPC. Serve para ordenar os diálogos | Int | 4       | Not Null                                                |
| dial_texto  | Texto do diálogo                                      | Varchar | 512     | Not Null                                                |
| dial_falado | Indica se o diálogo já foi falado                      | Bool    | 1       | Not Null                                                |

## Entidade: Inimigo

### Descrição: Armanezará a informação de Inimigo

### Observação: Essa tabela possui chave estrangeira de NPC

| Variável      | Descrição                                                   | Tipo    | Tamanho | Restrições de Domínio                                   |
|---------------|-------------------------------------------------------------|---------|---------|---------------------------------------------------------|
| NPC_id        | Referência ao NPC inimigo                                    | Int     | 4       | PK, FK                                                  |
| nome_real     | Nome real do inimigo                                         | Char    | 32      | PK                                                      |
| agressividade | Regula a insistência do inimigo ao perseguir PC, e a insistência de continuar em combate com HP baixo | Int | 4       | Not Null                                                |

## Entidade: Efeito

### Descrição: Armanezará a informação de Efeito

### Observação: Essa tabela não possui chave estrangeira

| Variável | Descrição                 | Tipo | Tamanho | Restrições de Domínio   |
|----------|---------------------------|------|---------|-------------------------|
| id       | Chave primária do efeito  | Int  | 4       | PK                      |
| nome     | Nome do efeito            | Int  | 4       | Not Null                |

## Entidade: Equipamento

### Descrição: Armanezará a informação de Equipamento

### Observação: Essa tabela não possui chave estrangeira

| Variável | Descrição                                             | Tipo   | Tamanho | Restrições de Domínio                                   |
|----------|-------------------------------------------------------|--------|---------|---------------------------------------------------------|
| id       | Chave primária do equipamento                         | Int    | 4       | PK                                                      |
| nome     | Nome do equipamento                                   | Char   | 32      | Not Null                                                |
| descr    | Descrição do equipamento                              | Char   | 128     | Not Null                                                |
| preco    | Indica quantos pontos são necessários para comprar o equipamento. Se o preço for negativo, então o equipamento não foi desbloqueado pela missão | Int | 4 | Not Null                                                |

## Entidade: equip_tem_efeito

### Descrição: Armanezará a informação de equip_tem_efeito

### Observação: Essa tabela possui chave estrangeira de Equipamento e Efeito

| Variável  | Descrição                                               | Tipo | Tamanho | Restrições de Domínio   |
|-----------|---------------------------------------------------------|------|---------|-------------------------|
| equip_id  | Referência para o equipamento                           | Int  | 4       | PK, FK                  |
| efeito_id | Referência para o efeito do equipamento                  | Int  | 4       | PK, FK                  |

## Entidade: Evidência

### Descrição: Armanezará a informação de Evidência

### Observação: Essa tabela possui chave estrangeira de Objetivo, Quadra e Local

| Variável  | Descrição                                                               | Tipo   | Tamanho | Restrições de Domínio                                   |
|-----------|-------------------------------------------------------------------------|--------|---------|---------------------------------------------------------|
| id        | Chave primária da evidência                                           | Int    | 4       | PK                                                      |
| objet_id  | Referência ao objetivo ao qual a evidência pertence. A evidência só é visível se o status do seu objetivo for em andamento. Um objetivo pode ter várias evidências | Int | 4 | FK |
| id_quadra | Referência à quadra onde a evidência está                                | Int    | 4       | FK                                                      |
| local_id  | Referência ao possível local liberado pela evidência                  | Int    | 4       | FK                                                      |
| aparencia | Texto que descreve a evidência quando é vista a olho nu               | Char   | 48      | Not Null                                                |
| analise   | Texto que descreve a evidência quando vista com equipamento certo      | Char   | 64      | Not Null                                                |

## Entidade: Veículo

### Descrição: Armanezará a informação de Veículo

### Observação: Essa tabela possui chave estrangeira de Local

| Variável  | Descrição                                               | Tipo   | Tamanho | Restrições de Domínio                                   |
|-----------|---------------------------------------------------------|--------|---------|---------------------------------------------------------|
| id        | Chave primária do veículo                               | Int    | 4       | PK                                                      |
| local_id  | Referência ao local onde o veículo está. Deve ser atualizado quando for chamado ou quando for pilotado | Int | 4 | FK |
| HP        | Se chegar em zero, o veículo quebra e só volta a ser utilizável após o cumprimento de uma missão. | Int | 4 | Not Null |
| VEL       | Indica o número de ações por turno que o veículo pode realizar | Int | 4 | Not Null |
| nome      | Nome do veículo                                          | Char   | 32      | Not Null                                                |

## Entidade: PC_melhora_equip

### Descrição: Armanezará a informação de PC_melhora_equip

### Observação: Essa tabela possui chave estrangeira de PC e Equipamento

| Variável  | Descrição                                               | Tipo | Tamanho | Restrições de Domínio   |
|-----------|---------------------------------------------------------|------|---------|-------------------------|
| PC_id     | Referência para PC                                       | Int  | 4       | PK, FK                  |
| equip_id  | Referência para equipamento                              | Int  | 4       | PK, FK                  |
| preco     | Preço da melhoria                                        | Int  | 4       | Not Null                |

## Entidade: pre_requisito

### Descrição: Armanezará a informação de pre_requisito

### Observação: Essa tabela possui chave estrangeira de Missão

| Variável           | Descrição                                               | Tipo | Tamanho | Restrições de Domínio   |
|--------------------|---------------------------------------------------------|------|---------|-------------------------|
| missao_id          | Referência à missão dependente                           | Int  | 4       | PK, FK                  |
| missao_pre_req_id   | Referência à missão pré-requisito                        | Int  | 4       | PK, FK                  |

## Entidade: desbloqueia_equip

### Descrição: Armanezará a informação de desbloqueia_equip

### Observação: Essa tabela possui chave estrangeira de Missão e Equipamento

| Variável  | Descrição                                               | Tipo | Tamanho | Restrições de Domínio   |
|-----------|---------------------------------------------------------|------|---------|-------------------------|
| missao_id | Referência para missão                                   | Int  | 4       | PK, FK                  |
| equip_id  | Referência para equipamento                              | Int  | 4       | PK, FK                  |

## Entidade: cumpre_missao

### Descrição: Armanezará a informação de cumpre_missao

### Observação: Essa tabela possui chave estrangeira de PC e Missão 

| Variável  | Descrição                                               | Tipo | Tamanho | Restrições de Domínio   |
|-----------|---------------------------------------------------------|------|---------|-------------------------|
| PC_id     | Referência para PC                                       | Int  | 4       | PK, FK                  |
| missao_id | Referência para uma missão                                | Int  | 4       | PK, FK                  |
| status    | Indica se a missão está indisponível (falta pré-req.), disponível (falta diálogo), pendente (só falta cumprir), ou cumprida | Int | 4 | Not Null |

## Entidade: veic_possui_hab

### Descrição: Armanezará a informação de veic_possui_hab

### Observação: Essa tabela possui chave estrangeira de Veículo e Habilidade

| Variável  | Descrição                                               | Tipo | Tamanho | Restrições de Domínio   |
|-----------|---------------------------------------------------------|------|---------|-------------------------|
| veic_id   | Referência para veículo                                  | Int  | 4       | PK, FK                  |
| hab_id    | Referência para habilidade                               | Int  | 4       | PK, FK                  |

## Entidade: libera_missao

### Descrição: Armanezará a informação de libera_missao

### Observação: Essa tabela possui chave estrangeira de Missão e Diálogo

| Variável  | Descrição                                               | Tipo | Tamanho | Restrições de Domínio   |
|-----------|---------------------------------------------------------|------|---------|-------------------------|
| missao_id | Referência à missão                                      | Int  | 4       | PK, FK                  |
| dial_id   | Referência para o diálogo

## Histórico de versões

| Versão |    Data    | Descrição               | Autor                                                                                                                 |
| :----: | :--------: | ----------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `1.0`  | 28/09/2023 | Criação do documento DD | Todos                                                                  |
| `1.1`  | 01/10/2023 | Revisão geral         |  [João Pedro](https://github.com/JoosPerro)     |
| `2.0`  | 07/10/2023 | Atualização         |  [Milena Baruc](https://github.com/MilenaBaruc)     |