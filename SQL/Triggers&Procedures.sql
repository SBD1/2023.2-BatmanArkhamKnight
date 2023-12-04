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
        INSERT INTO public.PC (person_id, NPC_alvo, HP, ATK, DEF, XP, furtividade, espaco, quadra_id, veic_id, descr)
        VALUES (person_id, NULL, 100, 10, 10, 0, 5, 2, 1, 1, 'Descrição PC');
    END IF;

    RETURN person_id;
END;
$$ LANGUAGE plpgsql;
