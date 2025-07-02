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
