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
