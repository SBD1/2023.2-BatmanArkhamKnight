# Data Query Language

## Introdução
DQL ( Data Query Language ) é uma parte fundamental de um sistema de gerenciamento de banco de dados (SGBD) que se concentra na recuperação de informações de um banco de dados. DQL é uma linguagem de consulta que permite aos usuários realizar consultas para recuperar dados específicos ou conjuntos de dados de um banco de dados relacional.

Abaixo segue algumas consultas com código SQL para o jogo do Batman Arkham Knight: 

```
--Selecionar todos os Mapas:
SELECT * FROM public.Mapa;

--Selecionar todas as regiões:

SELECT * FROM public.Regiao;

--Selecionar todos os NPCs:

SELECT * FROM public.NPC;

--Selecionar todas as Regiões com o nome do Mapa associado:

SELECT R.*, M.nome as nome_mapa
FROM public.Regiao R
JOIN public.Mapa M ON R.mapa_id = M.id;

--Listar todas as Habilidades e os Veículos que as possuem:

SELECT H.*, V.nome as nome_veiculo
FROM public.Habilidade H
JOIN public.veic_possui_hab VP ON H.id = VP.hab_id
JOIN public.Veiculo V ON VP.veic_id = V.id;

--Encontrar todas as Missões que um NPC está associado:

SELECT N.nome as nome_npc, M.*
FROM public.NPC N
JOIN public.Missao M ON N.person_id = M.NPC_id;

--Encontrar todas as Missões que um PC cumpriu com sucesso:

SELECT P.*, M.*
FROM public.PC P
JOIN public.cumpre_missao CM ON P.person_id = CM.PC_id
JOIN public.Missao M ON CM.missao_id = M.id
WHERE CM.status = 1; 

--Encontrar todos os NPCs que estão associados a uma determinada missão:

SELECT N.*, M.nome AS nome_missao
FROM public.NPC N
JOIN public.Missao M ON N.person_id = M.NPC_id;

--Listar todos os Objetivos e seus status associados a uma missão específica:

SELECT O.*, M.nome AS nome_missao, M.descr AS descr_missao
FROM public.Objetivo O
JOIN public.Missao M ON O.missao_id = M.id;

-- Listar todas as Missões não cumpridas por um PC específico(substituir [ID_DO_SEU_PC] pelo ID específico do seu PC):

SELECT M.*
FROM public.Missao M
WHERE M.id NOT IN (
    SELECT missao_id
    FROM public.cumpre_missao
    WHERE PC_id = [ID_DO_SEU_PC]
);

--Encontrar todos os NPCs que têm um equipamento específico(Substitua [ID_DO_SEU_EQUIPAMENTO] pelo ID do equipamento desejado):

SELECT N.*, E.nome AS nome_equipamento
FROM public.NPC N
JOIN public.equip_tem_efeito EE ON N.person_id = EE.equip_id
JOIN public.Equipamento E ON EE.equip_id = E.id
WHERE E.id = [ID_DO_SEU_EQUIPAMENTO];

--Encontrar todos os Objetivos de Missão que ainda não foram concluídos:

SELECT O.*, M.nome AS nome_missao
FROM public.Objetivo O
JOIN public.Missao M ON O.missao_id = M.id
WHERE O.status <> 1; 

--Contar o número de Efeitos associados a cada Equipamento e listar apenas os Equipamentos com mais de um efeito:

SELECT E.*, COUNT(EE.efeito_id) AS num_efeitos_associados
FROM public.Equipamento E
LEFT JOIN public.equip_tem_efeito EE ON E.id = EE.equip_id
GROUP BY E.id
HAVING COUNT(EE.efeito_id) > 1;


--Listar todos os Locais que têm pelo menos um NPC e ordenar pelo número de NPCs em ordem decrescente:

SELECT L.id, COUNT(N.person_id) AS num_npcs
FROM public.Local L
LEFT JOIN public.Quadra Q ON L.id = Q.local_id
LEFT JOIN public.NPC N ON Q.id = N.quadra_id
GROUP BY L.id
ORDER BY num_npcs DESC;

```

## Histórico de versões

| Versão |    Data    | Descrição                | Autor                                                                                                                 |
| :----: | :--------: | ------------------------ | --------------------------------------------------------------------------------------------------------------------- |
| `1.0`  | 29/10/2023 | Criação do documento DQL | [Milena Baruc](https://github.com/MilenaBaruc)                                                                        |
