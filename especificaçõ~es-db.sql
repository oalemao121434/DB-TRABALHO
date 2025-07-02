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
