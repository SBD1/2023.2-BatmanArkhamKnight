-- FAKE DADOS

-- Inserir dados na tabela Mapa
INSERT INTO public.Mapa (nome, total_pts, tamanho_x, tamanho_y)
VALUES ('Mapa1', 100, 50, 50),
       ('Mapa2', 150, 60, 60),
       ('Mapa3', 200, 70, 70);

-- Inserir dados na tabela Regiao
INSERT INTO public.Regiao (mapa_id, nome)
VALUES (4, 'RegiaoA'),
       (4, 'RegiaoB'),
       (6, 'RegiaoC');

-- Inserir dados na tabela Local
INSERT INTO public.Local (regiao_id, acesso, origem_x, origem_y)
VALUES (7, 1, 10, 10),
       (8, 0, 20, 20),
       (9, 1, 30, 30);

-- Inserir dados na tabela Quadra
INSERT INTO public.Quadra (local_id, escalavel, coord_x, coord_y)
VALUES (4, true, 5, 5),
       (5, false, 15, 15),
       (6, true, 25, 25);

-- Inserir dados na tabela Habilidade
INSERT INTO public.Habilidade (nome, descr, alcance)
VALUES ('Ataque Rápido', 'Ataque rápido de curto alcance', 5),
       ('Defesa', 'Aumenta a defesa do personagem', 0),
       ('Curar', 'Recupera pontos de vida', 3);

-- Inserir dados na tabela Veiculo
INSERT INTO public.Veiculo (local_id, HP, VEL, nome)
VALUES (4, 100, 20, 'Veiculo1'),
       (5, 120, 25, 'Veiculo2'),
       (6, 80, 18, 'Veiculo3');

-- Inserir dados na tabela Efeito
INSERT INTO public.Efeito (nome)
VALUES (1),
       (2),
       (3);

-- Inserir dados na tabela Equipamento
INSERT INTO public.Equipamento (nome, descr, preco)
VALUES ('Equipamento1', 'Descrição do Equipamento1', 50),
       ('Equipamento2', 'Descrição do Equipamento2', 75),
       ('Equipamento3', 'Descrição do Equipamento3', 100);

-- Inserir dados na tabela Personagem
INSERT INTO public.Personagem (tipo)
VALUES (1),
       (2),
       (3);

-- Inserir dados na tabela NPC
INSERT INTO public.NPC (quadra_id, veic_id, nome, HP, ATK, DEF, Descr, NPC_foco)
VALUES (4, 4, 'NPC1', 80, 10, 8, 'Descrição NPC1', 1),
       (5, 5, 'NPC2', 100, 12, 10, 'Descrição NPC2', 2),
       (6, 6, 'NPC3', 70, 8, 6, 'Descrição NPC3', 3);

-- Inserir dados na tabela PC
INSERT INTO public.PC (NPC_alvo, HP, ATK, DEF, XP, furtividade, espaco, quadra_id, veic_id, descr)
VALUES (1, 120, 15, 12, 500, 8, 2, 4, 4, 'Descrição PC1'),
       (2, 150, 18, 14, 700, 10, 3, 5, 5, 'Descrição PC2'),
       (3, 170, 23, 16, 1000, 12, 4, 6, 6, 'Descrição PC3');

-- Inserir dados na tabela Missao
INSERT INTO public.Missao (nome, descr, pontos, NPC_id)
VALUES ('Missao1', 'Descrição Missao1', 100, 4),
       ('Missao2', 'Descrição Missao2', 150, 5),
       ('Missao3', 'Descrição Missao3', 200, 6);
	   
-- Inserir dados na tabela Objetivo
INSERT INTO public.Objetivo (local_id, missao_id, status)
VALUES (4, 1, 0),
       (5, 2, 1),
       (6, 3, 2);

-- Inserir dados na tabela Dialogo
INSERT INTO public.Dialogo (NPC_id, dial_texto, dial_numero, dial_falado)
VALUES (4, 'Diálogo 1 NPC1', 1, true),
       (5, 'Diálogo 1 NPC2', 2, false),
       (6, 'Diálogo 1 NPC3', 3, true);

-- Inserir dados na tabela Inimigo
INSERT INTO public.Inimigo (NPC_id, nome_real, agressividade)
VALUES (4, 'Nome Real Inimigo1', 5),
       (5, 'Nome Real Inimigo2', 8),
       (6, 'Nome Real Inimigo3', 6);

-- Inserir dados na tabela veic_possui_hab
INSERT INTO public.veic_possui_hab (veic_id, hab_id)
VALUES (4, 4),
       (5, 5),
       (6, 6);

-- Inserir dados na tabela PC_melhora_equip
INSERT INTO public.PC_melhora_equip (PC_id, equip_id, preco)
VALUES (4, 1, 20),
       (5, 2, 30),
       (6, 3, 40);

-- Inserir dados na tabela pc_equipa
INSERT INTO public.pc_equipa (PC_id, equip_id)
VALUES (4, 1),
       (5, 2),
       (6, 3);

-- Inserir dados na tabela pers_possui_hab
INSERT INTO public.pers_possui_hab (person_id, hab_id)
VALUES (1, 4),
       (2, 5),
       (3, 6);

-- Inserir dados na tabela equip_tem_efeito
INSERT INTO public.equip_tem_efeito (equip_id, efeito_id)
VALUES (1, 1),
       (2, 2),
       (3, 3);

-- Inserir dados na tabela pre_requisito
INSERT INTO public.pre_requisito (missao_id, missao_pre_req_id)
VALUES (1, 2),
       (2, 3),
       (3, 1);

-- Inserir dados na tabela cumpre_missao
INSERT INTO public.cumpre_missao (PC_id, missao_id, status)
VALUES (4, 1, 1),
       (5, 2, 0),
       (6, 3, 2);

-- Inserir dados na tabela desbloqueia_equip
INSERT INTO public.desbloqueia_equip (missao_id, equip_id)
VALUES (1, 1),
       (2, 2),
       (3, 3);

-- Inserir dados na tabela libera_missao
INSERT INTO public.libera_missao (missao_id, dial_id)
VALUES (1, 1),
       (2, 2),
       (3, 3);

-- Inserir dados na tabela guarda_dialogo
INSERT INTO public.guarda_dialogo (PC_id, dial_id)
VALUES (4, 1),
       (5, 2),
       (6, 3);

-- Inserir dados na tabela combate
INSERT INTO public.combate (PC_id, NPC_id, distancia)
VALUES (4, 4, 10),
       (5, 5, 15),
       (6, 6, 20);