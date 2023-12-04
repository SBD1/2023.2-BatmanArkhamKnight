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
