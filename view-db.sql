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
