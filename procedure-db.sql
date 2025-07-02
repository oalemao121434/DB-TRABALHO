-- 1. Procedure para agendar nova apresentação
DELIMITER //
CREATE PROCEDURE sp_agendar_apresentacao(
    IN p_data_hora DATETIME,
    IN p_local VARCHAR(100),
    IN p_capacidade INT,
    IN p_id_numero INT
)
BEGIN
    INSERT INTO Apresentacoes (data_hora, local, capacidade, id_numero)
    VALUES (p_data_hora, p_local, p_capacidade, p_id_numero);
    SELECT LAST_INSERT_ID() AS nova_apresentacao;
END //
DELIMITER ;

-- 2. Procedure para calcular receita entre datas
DELIMITER //
CREATE PROCEDURE sp_receita_periodo(
    IN p_data_inicio DATE,
    IN p_data_fim DATE,
    OUT p_total_receita DECIMAL(12,2)
)
BEGIN
    SELECT SUM(preco) INTO p_total_receita
    FROM Publico
    WHERE data_compra BETWEEN p_data_inicio AND p_data_fim;
END //
DELIMITER ;

-- 3. Procedure para listar artistas por especialidade
DELIMITER //
CREATE PROCEDURE sp_artistas_especialidade(
    IN p_especialidade VARCHAR(50)
)
BEGIN
    SELECT nome, data_nascimento, nacionalidade
    FROM Artistas
    WHERE especialidade = p_especialidade
    ORDER BY nome;
END //
DELIMITER ;
