# Data Manipulation Language- DML

## Conceito

DML, ou Liguagem de Manipulação de Dados, é um subconjunto da linguagem SQL que é usado para manipular dados em um banco de dados relacional. O DML fornece três comandos básicos para manipular dados:

- INSERT: Insere uma nova linha em uma tabela.

- UPDATE: Atualiza os valores de uma ou mais colunas em uma linha existente.

- DELETE: Exclui uma linha de uma tabela.

O presente documento possui apenas os INSERT's para as respectivas tabelas do banco, pois ainda não há necessidade de deletar ou atualizar algo nas tabelas.

Mas, caso precise, segue um exemplo de como seria feito:

UPDATE:

```
UPDATE public.Pc
SET nome = 'Novo Nome'
WHERE personagem_id = 1;
```
DELETE:

```
DELETE FROM public.Missao
WHERE missao_id = 2;
```
## DML do projeto:

A seguir, estão exemplos fictícios de como será feita as inserções nas tabelas do projeto da disciplina.

```
-- Gotham
INSERT INTO public.Gotham (gotham_id)
VALUES
    (1),
    (2),
    (3);

-- Região
INSERT INTO public.Regiao (regiao_id, regiao_nome, gotham_atual)
VALUES (1, 'Nome da Região 1', 1),
       (2, 'Nome da Região 2', 2),
       (3, 'Nome da Região 3', 3);

-- Viagem
INSERT INTO public.Viagem (viagem_origem, viagem_destino)
VALUES
    (1, 2),
    (2, 3),
    (3, 1);

-- Local
INSERT INTO public.Local (local_id, regiao_atual, coordenada_x, coordenada_y)
VALUES
    (1, 1, 100, 200),
    (2, 1, 150, 250),
    (3, 2, 300, 400);

-- PC
INSERT INTO public.Pc (personagem_id, local_id, nome, hp)
VALUES
    (1, 1, 'Herói 1', 100),
    (2, 2, 'Herói 2', 120),
    (3, 3, 'Herói 3', 90);

-- NPC
INSERT INTO public.Npc (npc_id, local_id, npc_tipo, situacao_vida)
VALUES
    (1, 1, 'Civil', 'Vivo'),
    (2, 2, 'Vilão', 'Vivo'),
    (3, 3, 'Alien', 'Morto');

-- Instância
INSERT INTO public.Instancia (instancia_id, npc_id, nivel_dificuldade)
VALUES
    (1, 1, 'Fácil'),
    (2, 2, 'Médio'),
    (3, 3, 'Difícil'),
    (4, 1, 'Médio');

--Vilão
INSERT INTO public.Vilao (vilao_id, npc_id, nome_vilao, inteligencia, forca)
VALUES
    (1, 2, 'Coringa', 90, 80),
    (2, 3, 'Alien Vilão', 20, 20);
    (3, 4, 'Pinguim', 80, 40);

-- Missão
INSERT INTO public.Missao (missao_id, personagem_id, nome_missao, descricao, situacao)
VALUES
    (1, 1, 'Missao 1', 'Descrição 1', 'Em andamento'),
    (2, 2, 'Missao 2', 'Descrição 2', 'Concluída'),
    (3, 3, 'Missao 3', 'Descrição 3', 'Pendente'),
    (4, 1, 'Missao 4', 'Descrição 4', 'Concluída');

-- Pré-rquisito

INSERT INTO public.Prerequisito (requisito, possuiPreReq)
VALUES
    (1, 2),
    (2, 3),
    (3, 4),
    (1, 4);

-- Veiculo
INSERT INTO public.Veiculo (veiculo_id, personagem_id, nome_veiculo, tipo_veiculo)
VALUES
    (1, 1, 'Batmóvel', 'Terrestre'),
    (2, 2, 'Helicóptero', 'Aéreo'),
    (3, 3, 'Submarino', 'Aquático');


-- Terrestre
INSERT INTO public.Terrestre (veicterrestre_id, veiculo_id)
VALUES
    (1, 1),
    (2, 3);
    (3, 4),
    (4, 2);

-- Aquatico
INSERT INTO public.Aquatico (veicaquatico_id, veiculo_id)
VALUES
    (1, 5);
    (3, 6),
    (4, 7);
    (5, 8);

-- Aereo
INSERT INTO public.Aereo (veicaereo_id, veiculo_id)
VALUES
    (1, 9);
    (2, 10),
    (3, 11);
    (4, 12);

-- Equipameto
INSERT INTO public.Equipamento (equip_id, tipo_equipamento, nome_equipamento, nivel, descricao)
VALUES
    (1, 'Lâmina', 'Faca', 5, 'Equipamento cortante que pode ser lançado.'),
    (2, 'Armadura', 'Armadura de Ferro', 3, 'Uma armadura resistente feita de ferro.'),
    (3, 'Utilitario', 'Bomba de gás', 1, 'Uma bomba que sola gás lacrimogênio.');

-- Equipamento do PC
INSERT INTO public.Pcequip (personagem_id, equip_id, level)
VALUES
    (1, 1, 5),
    (1, 2, 3),
    (2, 1, 2);


-- Armadura
INSERT INTO public.Armadura (armadura_id, equip_id, protecao)
VALUES
    (1, 1, 10),
    (2, 2, 8),
    (3, 1, 12);

-- Arma
INSERT INTO public.Arma (arma_id, equip_id, dano)
VALUES
    (1, 1, 20),
    (2, 2, 15),
    (3, 1, 25);

```

## Histórico de versões

| Versão |    Data    | Descrição                | Autor                                                                                                                 |
| :----: | :--------: | ------------------------ | --------------------------------------------------------------------------------------------------------------------- |
| `1.0`  | 29/10/2023 | Criação do documento DML | [Mateus Orlando](https://github.com/MateusPy)                                                                         |
