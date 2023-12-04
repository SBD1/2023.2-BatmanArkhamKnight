-- Trigger para realizar a compra de um equipamento por um jogador

CREATE OR REPLACE FUNCTION compra_equipamento(
    pc_id INT,
    equipamento_id INT,
    valor INT
) RETURNS VOID AS $$
DECLARE
    valor_total INT;
BEGIN
    SELECT (CustoCompra * quantidade)
    INTO custo_total
    FROM Item
    WHERE IdItem = item_id;

    IF (SELECT Dinheiro FROM PC WHERE IdPlayer = jogador_id) >= custo_total THEN
        INSERT INTO Inventario (PC, CapacidadeMaxima)
        VALUES (jogador_id, 20)
        ON CONFLICT (PC) DO NOTHING;

        INSERT INTO Equipamento (nome, descr, preco)
        VALUES (pc_id, equipamento_id, valor)
        ON CONFLICT (Inventario, Item) DO UPDATE
        SET Quantidade = InventarioItem.Quantidade + quantidade;

        RAISE NOTICE 'Compra realizada com sucesso!';
    ELSE
        RAISE EXCEPTION 'Não foi possível realizar a compra!';
    END IF;
END;
$$ LANGUAGE plpgsql;
