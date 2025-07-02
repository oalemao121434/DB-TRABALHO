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
