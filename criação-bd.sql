-- Criar o banco de dados
CREATE DATABASE circo_db;
USE circo_db;

-- Tabela Funcionarios
CREATE TABLE Funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_contratacao DATE NOT NULL
);

-- Tabela Treinadores
CREATE TABLE Treinadores (
    id_treinador INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    anos_experiencia INT NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

-- Tabela Artistas
CREATE TABLE Artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    especialidade VARCHAR(50) NOT NULL,
    nacionalidade VARCHAR(50)
);

-- Tabela Numeros
CREATE TABLE Numeros (
    id_numero INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    duracao INT NOT NULL COMMENT 'Duração em minutos',
    dificuldade VARCHAR(20) NOT NULL,
    id_artista_principal INT,
    FOREIGN KEY (id_artista_principal) REFERENCES Artistas(id_artista)
);

-- Tabela Apresentacoes
CREATE TABLE Apresentacoes (
    id_apresentacao INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    local VARCHAR(100) NOT NULL,
    capacidade INT NOT NULL,
    id_numero INT NOT NULL,
    FOREIGN KEY (id_numero) REFERENCES Numeros(id_numero)
);

-- Tabela Animais
CREATE TABLE Animais (
    id_animal INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    data_nascimento DATE,
    id_treinador INT,
    FOREIGN KEY (id_treinador) REFERENCES Treinadores(id_treinador)
);

-- Tabela Equipamentos
CREATE TABLE Equipamentos (
    id_equipamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    id_responsavel INT,
    FOREIGN KEY (id_responsavel) REFERENCES Funcionarios(id_funcionario)
);

-- Tabela Publico
CREATE TABLE Publico (
    id_ingresso INT AUTO_INCREMENT PRIMARY KEY,
    id_apresentacao INT NOT NULL,
    tipo VARCHAR(20) NOT NULL COMMENT 'Adulto, Criança, Idoso',
    preco DECIMAL(10,2) NOT NULL,
    data_compra DATE NOT NULL,
    FOREIGN KEY (id_apresentacao) REFERENCES Apresentacoes(id_apresentacao)
);

-- Tabela de relacionamento Artistas_Numeros
CREATE TABLE Artistas_Numeros (
    id_artista INT NOT NULL,
    id_numero INT NOT NULL,
    papel VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_artista, id_numero),
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista),
    FOREIGN KEY (id_numero) REFERENCES Numeros(id_numero)
);

-- Inserir funcionários
INSERT INTO Funcionarios (nome, cargo, salario, data_contratacao) VALUES
('João Silva', 'Gerente', 5000.00, '2015-03-10'),
('Maria Oliveira', 'Contador', 4500.00, '2016-05-15'),
('Carlos Souza', 'Segurança', 2500.00, '2018-07-20'),
('Ana Costa', 'Limpeza', 1800.00, '2019-01-05'),
('Pedro Rocha', 'Técnico', 3000.00, '2017-11-12'),
('Luiza Mendes', 'Treinador', 3500.00, '2018-04-22'),
('Fernando Lima', 'Treinador', 3800.00, '2016-09-30');

-- Inserir treinadores
INSERT INTO Treinadores (id_funcionario, especialidade, anos_experiencia) VALUES
(6, 'Animais selvagens', 8),
(7, 'Animais domesticados', 10);

-- Inserir artistas
INSERT INTO Artistas (nome, data_nascimento, especialidade, nacionalidade) VALUES
('Márcio Almeida', '1985-04-12', 'Malabarista', 'Brasileiro'),
('Sophie Dupont', '1990-07-25', 'Acrobata', 'Francesa'),
('Ivan Petrov', '1982-11-03', 'Palhaço', 'Russo'),
('Luna Rodriguez', '1995-02-18', 'Trapezista', 'Mexicana'),
('Zhang Wei', '1988-09-30', 'Equilibrista', 'Chinês');

-- Inserir números
INSERT INTO Numeros (nome, duracao, dificuldade, id_artista_principal) VALUES
('Voo da Águia', 15, 'Alta', 4),
('Risos Incontroláveis', 20, 'Média', 3),
('Esferas Mágicas', 10, 'Baixa', 1),
('Torre Humana', 12, 'Alta', 2),
('Corda Bamba', 8, 'Alta', 5);

-- Inserir apresentações
INSERT INTO Apresentacoes (data_hora, local, capacidade, id_numero) VALUES
('2023-06-15 20:00:00', 'Lona Principal', 500, 1),
('2023-06-15 21:30:00', 'Lona Principal', 500, 2),
('2023-06-16 16:00:00', 'Lona Principal', 500, 3),
('2023-06-16 19:00:00', 'Lona Principal', 500, 4),
('2023-06-17 18:00:00', 'Lona Principal', 500, 5);

-- Inserir animais
INSERT INTO Animais (nome, especie, data_nascimento, id_treinador) VALUES
('Rex', 'Leão', '2015-08-10', 1),
('Maya', 'Elefante', '2010-05-12', 1),
('Bolinha', 'Cachorro', '2018-03-15', 2),
('Ziggy', 'Macaco', '2017-11-20', 2);

-- Inserir equipamentos
INSERT INTO Equipamentos (nome, tipo, estado, id_responsavel) VALUES
('Trapézio Duplo', 'Acrobacia', 'Ótimo', 5),
('Bolas de Malabares', 'Malabarismo', 'Bom', 5),
('Corda Bambá 15m', 'Equilíbrio', 'Regular', 5),
('Trampolim', 'Acrobacia', 'Ótimo', 5);

-- Inserir público
INSERT INTO Publico (id_apresentacao, tipo, preco, data_compra) VALUES
(1, 'Adulto', 50.00, '2023-06-10'),
(1, 'Criança', 25.00, '2023-06-11'),
(1, 'Idoso', 30.00, '2023-06-12'),
(2, 'Adulto', 50.00, '2023-06-10'),
(2, 'Criança', 25.00, '2023-06-13'),
(3, 'Adulto', 40.00, '2023-06-11'),
(3, 'Idoso', 25.00, '2023-06-14'),
(4, 'Adulto', 60.00, '2023-06-12'),
(5, 'Adulto', 60.00, '2023-06-13'),
(5, 'Criança', 30.00, '2023-06-15');

-- Inserir artistas_numeros
INSERT INTO Artistas_Numeros (id_artista, id_numero, papel) VALUES
(1, 3, 'Principal'),
(2, 4, 'Principal'),
(3, 2, 'Principal'),
(4, 1, 'Principal'),
(5, 5, 'Principal'),
(1, 4, 'Auxiliar'),
(2, 1, 'Auxiliar'),
(3, 5, 'Auxiliar'),
(4, 2, 'Auxiliar'),
(5, 3, 'Auxiliar');

-- 1. INNER JOIN: Listar apresentações com detalhes do número e artista principal
SELECT a.data_hora, a.local, n.nome AS numero, n.duracao, ar.nome AS artista_principal
FROM Apresentacoes a
INNER JOIN Numeros n ON a.id_numero = n.id_numero
INNER JOIN Artistas ar ON n.id_artista_principal = ar.id_artista;

-- 2. LEFT JOIN: Listar todos os artistas e os números em que participam (mesmo os que não participam)
SELECT ar.nome AS artista, n.nome AS numero, an.papel
FROM Artistas ar
LEFT JOIN Artistas_Numeros an ON ar.id_artista = an.id_artista
LEFT JOIN Numeros n ON an.id_numero = n.id_numero;

-- 3. RIGHT JOIN: Listar todos os equipamentos e seus responsáveis (mesmo os sem responsável definido)
SELECT e.nome AS equipamento, e.tipo, f.nome AS responsavel
FROM Funcionarios f
RIGHT JOIN Equipamentos e ON f.id_funcionario = e.id_responsavel;

-- 4. FULL OUTER JOIN (simulado com UNION): Listar todos os funcionários e treinadores
SELECT f.id_funcionario, f.nome, f.cargo, 'Funcionário' AS tipo
FROM Funcionarios f
LEFT JOIN Treinadores t ON f.id_funcionario = t.id_funcionario
WHERE t.id_treinador IS NULL
UNION
SELECT f.id_funcionario, f.nome, f.cargo, 'Treinador' AS tipo
FROM Funcionarios f
INNER JOIN Treinadores t ON f.id_funcionario = t.id_funcionario;

-- 5. JOIN com múltiplas tabelas: Listar animais com seus treinadores e funcionários
SELECT an.nome AS animal, an.especie, t.especialidade, f.nome AS treinador
FROM Animais an
JOIN Treinadores t ON an.id_treinador = t.id_treinador
JOIN Funcionarios f ON t.id_funcionario = f.id_funcionario;

-- 1. Subquery na cláusula WHERE: Artistas que são principais em números de alta dificuldade
SELECT nome, especialidade
FROM Artistas
WHERE id_artista IN (
    SELECT id_artista_principal
    FROM Numeros
    WHERE dificuldade = 'Alta'
);

-- 2. Subquery na cláusula FROM: Média de salário por cargo comparada com salário individual
SELECT f.nome, f.cargo, f.salario, avg_salarios.media_salario
FROM Funcionarios f
JOIN (
    SELECT cargo, AVG(salario) AS media_salario
    FROM Funcionarios
    GROUP BY cargo
) avg_salarios ON f.cargo = avg_salarios.cargo
WHERE f.salario > avg_salarios.media_salario;

-- 3. Subquery com EXISTS: Números que têm apresentações agendadas
SELECT n.nome, n.duracao
FROM Numeros n
WHERE EXISTS (
    SELECT 1
    FROM Apresentacoes a
    WHERE a.id_numero = n.id_numero
);

-- 4. Subquery na cláusula SELECT: Total de ingressos vendidos por apresentação
SELECT a.data_hora, n.nome AS numero, 
       (SELECT COUNT(*) FROM Publico p WHERE p.id_apresentacao = a.id_apresentacao) AS total_ingressos
FROM Apresentacoes a
JOIN Numeros n ON a.id_numero = n.id_numero;

-- 1. View para relatório de apresentações
CREATE VIEW vw_relatorio_apresentacoes AS
SELECT a.id_apresentacao, a.data_hora, a.local, 
       n.nome AS numero, n.duracao, 
       ar.nome AS artista_principal,
       COUNT(p.id_ingresso) AS ingressos_vendidos,
       SUM(p.preco) AS receita_total
FROM Apresentacoes a
JOIN Numeros n ON a.id_numero = n.id_numero
JOIN Artistas ar ON n.id_artista_principal = ar.id_artista
LEFT JOIN Publico p ON a.id_apresentacao = p.id_apresentacao
GROUP BY a.id_apresentacao, a.data_hora, a.local, n.nome, n.duracao, ar.nome;

-- 2. View para artistas e seus números
CREATE VIEW vw_artistas_numeros AS
SELECT ar.nome AS artista, ar.especialidade, 
       n.nome AS numero, n.duracao, an.papel
FROM Artistas ar
JOIN Artistas_Numeros an ON ar.id_artista = an.id_artista
JOIN Numeros n ON an.id_numero = n.id_numero;

-- 3. View para equipamentos e responsáveis
CREATE VIEW vw_equipamentos_responsaveis AS
SELECT e.nome AS equipamento, e.tipo, e.estado,
       f.nome AS responsavel, f.cargo
FROM Equipamentos e
LEFT JOIN Funcionarios f ON e.id_responsavel = f.id_funcionario;

-- 1. Total de receita por tipo de ingresso
SELECT tipo, COUNT(*) AS quantidade, SUM(preco) AS total_receita
FROM Publico
GROUP BY tipo
ORDER BY total_receita DESC;

-- 2. Média de duração dos números por dificuldade
SELECT dificuldade, AVG(duracao) AS media_duracao
FROM Numeros
GROUP BY dificuldade;

-- 3. Número de animais por espécie e treinador
SELECT a.especie, f.nome AS treinador, COUNT(*) AS total_animais
FROM Animais a
JOIN Treinadores t ON a.id_treinador = t.id_treinador
JOIN Funcionarios f ON t.id_funcionario = f.id_funcionario
GROUP BY a.especie, f.nome
ORDER BY total_animais DESC;

-- 4. Top 3 apresentações com maior público
SELECT a.data_hora, n.nome AS numero, COUNT(p.id_ingresso) AS total_publico
FROM Apresentacoes a
JOIN Numeros n ON a.id_numero = n.id_numero
LEFT JOIN Publico p ON a.id_apresentacao = p.id_apresentacao
GROUP BY a.id_apresentacao, a.data_hora, n.nome
ORDER BY total_publico DESC
LIMIT 3;

-- 5. Total de salários por cargo
SELECT cargo, COUNT(*) AS qtd_funcionarios, SUM(salario) AS total_salarios
FROM Funcionarios
GROUP BY cargo
ORDER BY total_salarios DESC;

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

