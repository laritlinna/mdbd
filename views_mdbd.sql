-- View 01 — Alunos e seus respectivos cursos
CREATE OR REPLACE VIEW view_alunos_cursos AS
SELECT 
    a.id_aluno AS codigo_aluno,
    a.nome AS nome_aluno,
    m.id_matricula AS codigo_matricula,
    m.situacao AS situacao_matricula,
    c.id_curso AS codigo_curso,
    c.nome AS nome_curso
FROM Alunos a
JOIN Matriculas m ON a.id_aluno = m.id_aluno
JOIN turmas t ON m.id_turma = t.id_turma
JOIN Cursos c ON t.id_curso = c.id_curso;

-- View 02 — Alunos, turmas e cursos
CREATE OR REPLACE VIEW view_alunos_turmas_cursos AS
SELECT 
    a.nome AS aluno,
    t.nome_turma AS turma,
    c.nome AS curso,
    t.ano AS ano_letivo,
    t.periodo AS turno
FROM Alunos a
JOIN Matriculas m ON a.id_aluno = m.id_aluno
JOIN turmas t ON m.id_turma = t.id_turma
JOIN Cursos c ON t.id_curso = c.id_curso;

-- View 03 — Disciplinas e seus professores
CREATE OR REPLACE VIEW view_disciplinas_professores AS
SELECT 
    d.id_disciplina AS codigo_disciplina,
    d.nome AS nome_disciplina,
    d.carga_horaria,
    p.id_professor AS codigo_professor,
    p.nome AS nome_professor,
    p.formacao AS formacao_professor
FROM Disciplinas d
LEFT JOIN Professores p ON d.id_professor = p.id_professor;

-- View 04 — Disciplinas, professores e cursos
CREATE OR REPLACE VIEW view_disciplinas_professores_cursos AS
SELECT 
    c.nome AS nome_curso,
    d.nome AS nome_disciplina,
    d.carga_horaria AS carga_horaria_disciplina,
    p.nome AS nome_professor_responsavel
FROM Disciplinas d
JOIN Cursos c ON d.id_curso = c.id_curso
LEFT JOIN Professores p ON d.id_professor = p.id_professor;

-- View 05 — Alunos e seus responsáveis
CREATE OR REPLACE VIEW view_alunos_responsaveis AS
SELECT 
    a.nome AS nome_aluno,
    a.cpf AS cpf_aluno,
    r.nome AS nome_responsavel,
    r.cpf AS cpf_responsavel,
    r.telefone AS telefone_responsavel,
    ar.parentesco AS grau_parentesco
FROM Alunos a
JOIN aluno_responsavel ar ON a.id_aluno = ar.id_aluno
JOIN Responsaveis r ON ar.id_responsavel = r.id_responsavel;

-- View 06 — Alunos, disciplinas e notas
CREATE OR REPLACE VIEW view_alunos_disciplinas_notas AS
SELECT 
    a.nome AS nome_aluno,
    d.nome AS nome_disciplina,
    n.nota AS nota,
    b.media_final AS media_final,
    b.situacao_final AS situacao_final
FROM Alunos a
JOIN Matriculas m ON a.id_aluno = m.id_aluno
JOIN Boletins b ON m.id_matricula = b.id_matricula
JOIN notas n ON b.id_boletim = n.id_boletim
JOIN avaliacoes av ON n.id_avaliacao = av.id_avaliacao
JOIN Disciplinas d ON av.id_disciplina = d.id_disciplina;

-- View 07 — Alunos, turmas, disciplinas e professores
CREATE OR REPLACE VIEW view_alunos_turmas_disciplinas_professores AS
SELECT 
    a.nome AS aluno,
    t.nome_turma AS turma,
    c.nome AS curso,
    d.nome AS disciplina,
    p.nome AS professor,
    t.ano AS ano_letivo,
    t.periodo AS turno
FROM Alunos a
JOIN Matriculas m ON a.id_aluno = m.id_aluno
JOIN turmas t ON m.id_turma = t.id_turma
JOIN Cursos c ON t.id_curso = c.id_curso
JOIN Disciplinas d ON c.id_curso = d.id_curso
LEFT JOIN Professores p ON d.id_professor = p.id_professor;

-- View 08 — Desempenho acadêmico dos alunos
CREATE OR REPLACE VIEW view_desempenho_academico AS
SELECT 
    a.nome AS aluno,
    c.nome AS curso,
    d.nome AS disciplina,
    AVG(n.nota) AS nota_media_avaliacoes,
    b.media_final AS media_final,
    b.frequencia AS frequencia,
    b.situacao_final AS situacao_final
FROM Alunos a
JOIN Matriculas m ON a.id_aluno = m.id_aluno
JOIN Boletins b ON m.id_matricula = b.id_matricula
JOIN notas n ON b.id_boletim = n.id_boletim
JOIN avaliacoes av ON n.id_avaliacao = av.id_avaliacao
JOIN Disciplinas d ON av.id_disciplina = d.id_disciplina
JOIN Cursos c ON d.id_curso = c.id_curso
GROUP BY a.id_aluno, c.id_curso, d.id_disciplina, b.id_boletim;

-- View 09 — Situação das matrículas
CREATE OR REPLACE VIEW view_situacao_matriculas AS
SELECT 
    a.nome AS aluno,
    c.nome AS curso,
    t.nome_turma AS turma,
    m.data_matricula AS data_da_matricula,
    m.situacao AS situacao_da_matricula,
    t.ano AS ano_letivo,
    t.periodo AS turno
FROM Alunos a
JOIN Matriculas m ON a.id_aluno = m.id_aluno
JOIN turmas t ON m.id_turma = t.id_turma
JOIN Cursos c ON t.id_curso = c.id_curso;

-- View 10 — Relatório acadêmico completo
CREATE OR REPLACE VIEW view_relatorio_academico_completo AS
SELECT 
    a.nome AS aluno,
    c.nome AS curso,
    t.nome_turma AS turma,
    d.nome AS disciplina,
    p.nome AS professor,
    n.nota AS nota,
    b.media_final AS media_final,
    b.frequencia AS frequencia,
    b.situacao_final AS situacao_final
FROM Alunos a
JOIN Matriculas m ON a.id_aluno = m.id_aluno
JOIN turmas t ON m.id_turma = t.id_turma
JOIN Cursos c ON t.id_curso = c.id_curso
JOIN Disciplinas d ON c.id_curso = d.id_curso
LEFT JOIN Professores p ON d.id_professor = p.id_professor
JOIN Boletins b ON m.id_matricula = b.id_matricula
LEFT JOIN notas n ON b.id_boletim = n.id_boletim;
