# DER - DIAGRAMA ENTIDADE E RELACIONAMENTO

O Modelo Entidade Relacionamento, mais conhecido como MER, é um modelo conceitual importante para projetar sistemas de banco de dados de maneira eficaz e entender como as entidades (objetos ou conceitos) estão interconectadas. Sendo usado como base para o nosso trabalho sobre o jogo Batman Arkham Knight da disciplina de Banco de Dados 1, ministrada pelo professor Maurício Serrano.  

## DER - Batman Arkham Knight

Abaixo seguem os Diagramas Entidade Relacionamento, com suas respectivas versões:

<center>

**Imagem 1** - Diagrama Entidade Relacionamento Batman Arkham Knight.

![image](../../Images/DER_Batman.jpg)

**Fonte:** Autores.

</center>

<center>

**Imagem 2** - Segunda versão do Diagrama Entidade Relacionamento Batman Arkham Knight..

![image](../../Images/DER_Batman2.jpg)

**Fonte:** Autores.

</center>

## Entidades

Segue a baixo a descrição de cada entidade.

| **Entidade** | **Descrição** |
| ------------ | ------------- |
| Mapa         | Localidade onde se encontra tudo o que acontece dentro do jogo. |
| Região       | Superfície terrestre que apresenta características naturais e específicas. |
| Local        | Localidade da Região. |
| Quadra       | Específicação dentro de Local, com coordenadas. |
| Personagem   | Personagens sem ser o PC. |
| NPC          | Personagem dentro do jogo que não é controlado por um player. |
| Inimigo      | Personagem que atua como um adversário do protagonista. |
| Habilidade   |               |
| Veículo      | Um meio de transporte utilizado pelo PC dentro do jogo para se locomover. |
| PC           | Personagem dentro do jogo que é controlado e manipulado diretamente pelo player. |
| Equipamento  | Ferramenta que o PC utiliza para realizar alguma tarefa ou função |
| Efeito       | O que a Ferramenta oferece ao jogador ao usá-la |
| Diálogo      | Falas durante o jogo. |
| Missão       | Uma tarefa ou objetivo específico designado dentro do jogo para que o PC complete. |
| Objetivo     | O que deve ser realizado. |
| Evidência    | Após realizar um objetivo é revelado uma Evidência.  |

## Relacionamentos

### Mapa x Região

- *Relacionamento:* Mapa possui regiões.

### Região x Local

- *Relacionamento:* Região divide-se em locais.

### Local x Quadra

- *Relacionamento:* Local divide-se em quadras, onde o jogador consegue se locomover de acordo com coodenadas.

### Quadra x Personagem

- *Relacionamento:* Quadra abriga os personagens.

### Personagem x Veículo

- *Relacionamento:* Personagem é transportado por veículos, de forma "manual".

### Personagem x Habilidade

- *Relacionamento:* Personagem possui habilidades.

### Veículo x Habilidade

- *Relacionamento:* Veículo possui habilidades.

### Veículo x Local

- *Relacionamento:* Veículo chega em locais, fazendo viagens rápidas.

### Local x Evidência

- *Relacionamento:* Local é liberado após conseguir uma evidência.

### Missão x Objetivo

- *Relacionamento:* Missão tem objetivos à serem feitos.

### Objetivo x Evidência

- *Relacionamento:* Objetivo revela evidência, ao ser completado.

### Diálogo x Missão

- *Relacionamento:* Diálogo libera missão para o jogador.

### Missão x Equipamento

- *Relacionamento:* Missões completas desbloqueiam equipamentos.

### PC x Inimigo

- *Relacionamento:* PC combate os inimigos.

### PC x Equipamento

- *Relacionamento:* PC mlhora, compra e equipa equipamentos.

### Equipamento x Efeito

- *Relacionamento:* Equipamento tem efeitos sobre o jogador.

## Histórico de versões

| Versão |    Data    | Descrição | Autor |
| ------ | ---------- | -- ------ | ----- |
| `1.0`  | 25/09/2023 | Criação do DER | Todos  |
| `1.1`  | 01/10/2023 | Revisão | Todos  |
| `2.0`  | 01/12/2023 | Segunda versão | [João Pedro](https://github.com/JoosPerro) |
| `2.1`  | 07/12/2023 | Adicionando relacionamentos e entidades. Adicionando imagem quebrada | [João Pedro](https://github.com/MilenaBaruc) |
