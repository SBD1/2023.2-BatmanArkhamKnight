# Data Query Language

## Introdução
DQL ( Data Query Language ) é uma parte fundamental de um sistema de gerenciamento de banco de dados (SGBD) que se concentra na recuperação de informações de um banco de dados. DQL é uma linguagem de consulta que permite aos usuários realizar consultas para recuperar dados específicos ou conjuntos de dados de um banco de dados relacional.

Abaixo segue algumas consultas com código SQL para o jogo do Batman Arkham Knight: 

```
--Informações do PC
SELECT *
FROM Pc
WHERE personagem_id = 1; --Id do personagem

--Missões realizadas pelo PC
SELECT m.nome_missao, m.descricao, m.situacao
FROM Missao m
WHERE m.personagem_id = 1; --Id do personagem

--Armas do PC
SELECT a.nome_equipamento, a.nivel, a.descricao
FROM Equipamento a
JOIN Pcequip pe ON a.equip_id = pe.equip_id
WHERE pe.personagem_id = 1 AND a.tipo_equipamento = 'Arma'; --Id do personagem

--Veículos do PC
SELECT v.nome_veiculo, v.tipo_veiculo
FROM Veiculo v
WHERE v.personagem_id = 1; --Id do personagem
      --Para que consiga separar os veículos por tipo é só add 'GROUP BY'

--Equipamentos do PC
SELECT e.nome_equipamento, e.tipo_equipamento, e.nivel, e.descricao
FROM Equipamento e
JOIN Pcequip pe ON e.equip_id = pe.equip_id
WHERE pe.personagem_id = 1; --Id do personagem

--Armaduras do PC
SELECT a.nome_equipamento, a.nivel, a.descricao, a.protecao
FROM Equipamento a
JOIN Pcequip pe ON a.equip_id = pe.equip_id
JOIN Armadura ar ON a.equip_id = ar.equip_id
WHERE pe.personagem_id = 1; --Id do personagem

--Vilões derrotados
SELECT v.nome_vilao, v.inteligencia, v.forca
FROM Vilao v
WHERE v.npc_id IN (
    SELECT i.npc_id
    FROM Instancia i
    WHERE i.nivel_dificuldade = 'Derrotado' AND i.npc_id = v.npc_id
) AND v.npc_id IN (
    SELECT npc_id
    FROM Npc
    WHERE situacao_vida = 'Derrotado'
);

--NPC Derrotado
SELECT n.npc_tipo, n.situacao_vida
FROM Npc n
WHERE n.local_id IN (
    SELECT local_id
    FROM Pc
    WHERE personagem_id = 1 --Id do personagem
) AND n.situacao_vida = 'Derrotado';

--Viagens realizadas
SELECT r1.regiao_nome AS origem, r2.regiao_nome AS destino
FROM Viagem v
JOIN Regiao r1 ON v.viagem_origem = r1.regiao_id
JOIN Regiao r2 ON v.viagem_destino = r2.regiao_id
WHERE v.viagem_origem IN (
    SELECT l.regiao_atual
    FROM Local l
    WHERE l.local_id = 1 --Id do personagem
);

--Locais visitados
SELECT r.regiao_nome AS local_visitado
FROM Local l
JOIN Regiao r ON l.regiao_atual = r.regiao_id
WHERE l.local_id = 1; --Id do personagem

--Regiões visitadas
SELECT DISTINCT r.regiao_nome AS regiao_visitada
FROM Local l
JOIN Regiao r ON l.regiao_atual = r.regiao_id
WHERE l.local_id = 1;

```
