-- Trigger para realizar a compra de um equipamento para um jogador

CREATE OR REPLACE FUNCTION compra_equipamento(
    p_pc_id INT,
    p_equip_id INT,
) RETURNS VOID AS $$
BEGIN
        INSERT INTO public.pc_equipa (PC_id, equip_id) 
        VALUES (p_pc_id, p_equip_id);

        RAISE NOTICE 'Compra realizada com sucesso!';
END;
$$ LANGUAGE plpgsql;

-- Procedure para realizar um combate entre um jogador e um inimigo


CREATE OR REPLACE FUNCTION realizar_combate() RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se o PC e o Inimigo existem e estão vivos
    IF (
        (SELECT COUNT(*) FROM PC WHERE person_id = NEW.PC_id AND HP > 0) > 0 AND
        (SELECT COUNT(*) FROM NPC WHERE person_id = NEW.NPC_id AND HP > 0) > 0
    ) THEN
        -- Lógica do combate (exemplo: subtrair ATK do atacante do HP do alvo)
        UPDATE PC SET HP = HP - (SELECT ATK FROM NPC WHERE person_id = NEW.NPC_id) WHERE person_id = NEW.PC_id;
        UPDATE NPC SET HP = HP - (SELECT ATK FROM PC WHERE person_id = NEW.PC_id) WHERE person_id = NEW.NPC_id;

        -- Verifica se algum dos combatentes ficou incapacitado
        IF (SELECT HP FROM PC WHERE person_id = NEW.PC_id) <= 0 THEN
            RAISE NOTICE 'O PC foi derrotado.';
        END IF;
        IF (SELECT HP FROM NPC WHERE person_id = NEW.NPC_id) <= 0 THEN
            RAISE NOTICE 'O Inimigo foi derrotado.';
        END IF;
    ELSE
        RAISE EXCEPTION 'Personagem ou Inimigo não encontrado ou incapacitado.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger que dispara o combate após a inserção de uma nova linha na tabela de combate
CREATE TRIGGER combate_trigger
AFTER INSERT ON combate
FOR EACH ROW
EXECUTE FUNCTION realizar_combate();

--Procedure para realizar uma melhoria no equipamento


CREATE OR REPLACE FUNCTION realizar_melhoria(
    IN p_pc_id INTEGER,
    IN p_equip_id INTEGER
) RETURNS VOID AS $$
BEGIN
    -- Verifica se o PC possui o equipamento
    IF (SELECT COUNT(*) FROM pc_equipa WHERE PC_id = p_pc_id AND equip_id = p_equip_id) > 0 THEN
        -- Obtém o preço da melhoria do equipamento
        DECLARE melhoria_preco INTEGER;
        SELECT preco INTO melhoria_preco FROM Equipamento WHERE id = p_equip_id;

        -- Verifica se o PC possui recursos suficientes para a melhoria
        IF (SELECT XP FROM PC WHERE person_id = p_pc_id) >= melhoria_preco THEN
            -- Atualiza o HP do PC após a melhoria
            UPDATE PC SET XP = XP - melhoria_preco WHERE person_id = p_pc_id;

            -- Realiza a melhoria no equipamento (pode adicionar lógica específica aqui)
            UPDATE pc_equipa SET preco = preco + melhoria_preco WHERE PC_id = p_pc_id AND equip_id = p_equip_id;

            RAISE NOTICE 'Equipamento aprimorado com sucesso.';
        ELSE
            RAISE EXCEPTION 'Recursos insuficientes para realizar a melhoria.';
        END IF;
    ELSE
        RAISE EXCEPTION 'Equipamento não encontrado no inventário do personagem.';
    END IF;
END;
$$ LANGUAGE plpgsql;

--Trigger para realizar uma melhoria no equipamento
CREATE OR REPLACE FUNCTION realizar_melhoria_trigger() RETURNS TRIGGER AS $$
BEGIN
    -- Chama o procedimento de melhoria ao inserir uma nova linha na tabela de melhoria
    PERFORM realizar_melhoria(NEW.PC_id, NEW.equip_id);
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger que dispara a melhoria após a inserção de uma nova linha na tabela de melhoria
CREATE TRIGGER melhoria_trigger
AFTER INSERT ON pc_melhora_equip
FOR EACH ROW
EXECUTE FUNCTION realizar_melhoria_trigger();

--PROCEDURE para melhoria na habilidade


CREATE OR REPLACE FUNCTION realizar_melhoria_habilidade(
    IN p_person_id INTEGER,
    IN p_hab_id INTEGER
) RETURNS VOID AS $$
BEGIN
    -- Verifica se o personagem possui a habilidade
    IF (SELECT COUNT(*) FROM pers_possui_hab WHERE person_id = p_person_id AND hab_id = p_hab_id) > 0 THEN
        -- Obtém os atributos associados à habilidade
        DECLARE hab_atributo CHAR(3);
        SELECT atributo INTO hab_atributo FROM Habilidade WHERE id = p_hab_id;

        -- Atualiza os atributos do personagem com base na habilidade aprimorada
        CASE
            WHEN hab_atributo = 'ATK' THEN
                UPDATE PC SET ATK = ATK + 1 WHERE person_id = p_person_id;
            WHEN hab_atributo = 'DEF' THEN
                UPDATE PC SET DEF = DEF + 1 WHERE person_id = p_person_id;
            WHEN hab_atributo = 'VEL' THEN
                UPDATE PC SET VEL = VEL + 1 WHERE person_id = p_person_id;
            ELSE
                RAISE EXCEPTION 'Atributo não reconhecido para a habilidade.';
        END CASE;

        RAISE NOTICE 'Habilidade aprimorada com sucesso.';
    ELSE
        RAISE EXCEPTION 'Habilidade não encontrada no personagem.';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION realizar_melhoria_habilidade_trigger() RETURNS TRIGGER AS $$
BEGIN
    -- Chama o procedimento de melhoria de habilidade ao inserir uma nova linha na tabela de melhoria de habilidade
    PERFORM realizar_melhoria_habilidade(NEW.person_id, NEW.hab_id);
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger que dispara a melhoria de habilidade após a inserção de uma nova linha na tabela de melhoria de habilidade
CREATE TRIGGER melhoria_habilidade_trigger
AFTER INSERT ON pers_possui_hab
FOR EACH ROW
EXECUTE FUNCTION realizar_melhoria_habilidade_trigger();

-- Trigger para evitar duplicações no nome do Mapa
CREATE OR REPLACE FUNCTION evita_duplicacao_mapa()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM public.Mapa WHERE nome = NEW.nome AND id != NEW.id) THEN
        RAISE EXCEPTION 'Já existe um Mapa com esse nome';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Atribuir a Trigger à tabela Mapa
CREATE TRIGGER trigger_evita_duplicacao_mapa
BEFORE INSERT OR UPDATE ON public.Mapa
FOR EACH ROW EXECUTE FUNCTION evita_duplicacao_mapa();

-- Trigger para atualizar status da missão 
CREATE OR REPLACE FUNCTION att_missao(
    
)

-- Trigger para evitar duplicações no nome da Regiao em um Mapa específico
CREATE OR REPLACE FUNCTION evita_duplicacao_regiao()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM public.Regiao WHERE nome = NEW.nome AND mapa_id = NEW.mapa_id AND id != NEW.id) THEN
        RAISE EXCEPTION 'Já existe uma Regiao com esse nome neste Mapa';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Atribuir a Trigger à tabela Regiao
CREATE TRIGGER trigger_evita_duplicacao_regiao
BEFORE INSERT OR UPDATE ON public.Regiao
FOR EACH ROW EXECUTE FUNCTION evita_duplicacao_regiao();

CREATE OR REPLACE FUNCTION insere_atualiza_local(
    p_regiao_id INTEGER,
    p_acesso INTEGER,
    p_origem_x INTEGER,
    p_origem_y INTEGER
)
RETURNS INTEGER AS $$
DECLARE
    local_id INTEGER;
BEGIN
    -- Verificar se já existe um Local com as mesmas coordenadas na Regiao especificada
    SELECT id INTO local_id
    FROM public.Local
    WHERE regiao_id = p_regiao_id
      AND origem_x = p_origem_x
      AND origem_y = p_origem_y;

    IF local_id IS NOT NULL THEN
        -- Se existe, atualiza o acesso
        UPDATE public.Local SET acesso = p_acesso WHERE id = local_id;
    ELSE
        -- Se não existe, insere um novo Local
        INSERT INTO public.Local (regiao_id, acesso, origem_x, origem_y)
        VALUES (p_regiao_id, p_acesso, p_origem_x, p_origem_y)
        RETURNING id INTO local_id;
    END IF;

    RETURN local_id;
END;
$$ LANGUAGE plpgsql;

--Trigger para Garantir Consistência de Dados:
CREATE OR REPLACE FUNCTION valida_tipo_personagem()
RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.tipo = 1 AND NOT EXISTS (SELECT 1 FROM public.NPC WHERE person_id = NEW.id)) OR
       (NEW.tipo = 2 AND NOT EXISTS (SELECT 1 FROM public.PC WHERE person_id = NEW.id)) THEN
        RAISE EXCEPTION 'O tipo de Personagem não corresponde às tabelas de especialização (NPC ou PC)';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_valida_tipo_personagem
BEFORE INSERT OR UPDATE ON public.Personagem
FOR EACH ROW EXECUTE FUNCTION valida_tipo_personagem();

--Stored Procedure para Inserir um Novo Personagem:

CREATE OR REPLACE FUNCTION insere_personagem(
    p_tipo INTEGER
    -- adicione outros parâmetros conforme necessário
)
RETURNS INTEGER AS $$
DECLARE
    person_id INTEGER;
BEGIN
    -- Inserir na tabela Personagem
    INSERT INTO public.Personagem (tipo) VALUES (p_tipo) RETURNING id INTO person_id;

    -- Verificar o tipo e inserir na tabela de especialização correspondente
    IF p_tipo = 1 THEN
        INSERT INTO public.NPC (person_id, nome, HP, ATK, DEF, Descr, NPC_foco)
        VALUES (person_id, 'Nome NPC', 100, 10, 10, 'Descrição NPC', 1);
    ELSIF p_tipo = 2 THEN
        INSERT INTO public.PC (person_id, NPC_alvo, HP, ATK, DEF, XP, furtividade, espaco, id_quadra, veic_id, descr)
        VALUES (person_id, NULL, 100, 10, 10, 0, 5, 2, 1, 1, 'Descrição PC');
    END IF;

    RETURN person_id;
END;
$$ LANGUAGE plpgsql;
