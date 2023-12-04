-- Trigger para realizar a compra de um equipamento para um jogador

CREATE OR REPLACE FUNCTION compra_equipamento(
    pc_id INT,
    equipamento_id INT,
    valor INT
) RETURNS VOID AS $$
DECLARE
    valor_total INT;
BEGIN
    SELECT (equip_preco)
    INTO equip_preco
    FROM Equipamento
    WHERE id = equipamento_id;

        INSERT INTO Equipamento (nome, descr, preco)
        VALUES (pc_id, equipamento_id, valor)

        RAISE NOTICE 'Compra realizada com sucesso!';
    ELSE
        RAISE EXCEPTION 'Não foi possível realizar a compra!';
    END IF;
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

