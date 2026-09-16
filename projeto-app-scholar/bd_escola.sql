-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/06/2026 às 13:50
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_escola`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `id_aluno` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno_responsavel`
--

CREATE TABLE `aluno_responsavel` (
  `id_aluno` int(11) NOT NULL,
  `id_responsavel` int(11) NOT NULL,
  `parentesco` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoes`
--

CREATE TABLE `avaliacoes` (
  `id_valiacao` int(11) NOT NULL,
  `id_disciplina` int(11) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `data_avaliacao` date DEFAULT NULL,
  `valor` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `avaliacoes`
--

INSERT INTO `avaliacoes` (`id_valiacao`, `id_disciplina`, `descricao`, `data_avaliacao`, `valor`) VALUES
(1, 1, 'Prova 1', '2026-03-10', 3),
(2, 1, 'Prova 2', '2026-04-10', 3),
(3, 1, 'Trabalho', '2026-05-10', 2),
(4, 1, 'Atividade', '2026-06-10', 2),
(5, 2, 'Prova 1', '2026-03-10', 3),
(6, 2, 'Prova 2', '2026-04-10', 3),
(7, 2, 'Trabalho', '2026-05-10', 2),
(8, 2, 'Atividade', '2026-06-10', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `boletins`
--

CREATE TABLE `boletins` (
  `id_boletim` int(11) NOT NULL,
  `id_matricula` int(11) DEFAULT NULL,
  `media_final` decimal(10,0) DEFAULT NULL,
  `situacao_final` varchar(20) DEFAULT NULL,
  `frequencia` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `coordenadores`
--

CREATE TABLE `coordenadores` (
  `id_coordenador` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `formacao` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `coordenadores`
--

INSERT INTO `coordenadores` (`id_coordenador`, `nome`, `cpf`, `formacao`, `email`, `telefone`) VALUES
(1, 'Carlos Rocha', '11122233344', 'Mestrado', 'carlos@escola.com', '12999999991'),
(2, 'Ana Silva', '22233344455', 'Doutorado', 'ana@escola.com', '12999999992'),
(3, 'Marcos Souza', '33344455566', 'Especialização', 'marcos@escola.com', '12999999993'),
(4, 'Julia Costa', '44455566677', 'Mestrado', 'julia@escola.com', '12999999994'),
(5, 'Paulo Ramos', '55566677788', 'Doutorado', 'paulo@escola.com', '12999999995');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `duracao` varchar(50) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `id_coordenador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cursos`
--

INSERT INTO `cursos` (`id_curso`, `nome`, `carga_horaria`, `duracao`, `descricao`, `id_coordenador`) VALUES
(1, 'Desenvolvimento de Sistemas', 1200, '18 meses', 'Curso de TI', 1),
(2, 'Redes de Computadores', 1000, '18 meses', 'Infraestrutura', 2),
(3, 'Administração', 800, '12 meses', 'Gestão empresarial', 3),
(4, 'Logística', 800, '12 meses', 'Cadeia de suprimentos', 4),
(5, 'Marketing Digital', 600, '6 meses', 'Vendas online', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `id_disciplina` int(11) NOT NULL,
  `id_curso` int(11) DEFAULT NULL,
  `id_professor` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `disciplinas`
--

INSERT INTO `disciplinas` (`id_disciplina`, `id_curso`, `id_professor`, `nome`, `carga_horaria`) VALUES
(1, 1, 1, 'Lógica', 80),
(2, 1, 2, 'Algoritmos', 80),
(3, 1, 3, 'Web I', 80),
(4, 1, 4, 'Web II', 80),
(5, 1, 5, 'BD I', 80),
(6, 1, 6, 'BD II', 80),
(7, 1, 7, 'Mobile', 80),
(8, 1, 8, 'Testes', 80),
(9, 1, 9, 'Engenharia SW', 80),
(10, 1, 10, 'POO', 80),
(11, 2, 11, 'Redes I', 80),
(12, 2, 12, 'Redes II', 80),
(13, 2, 13, 'Roteamento', 80),
(14, 2, 14, 'Cabos', 80),
(15, 2, 15, 'Sistemas Op', 80),
(16, 2, 16, 'Segurança', 80),
(17, 2, 17, 'Wireless', 80),
(18, 2, 18, 'Servidores', 80),
(19, 2, 19, 'Cloud', 80),
(20, 2, 20, 'Infra', 80),
(21, 3, 1, 'Contabilidade', 80),
(22, 3, 2, 'Finanças', 80),
(23, 3, 3, 'RH', 80),
(24, 3, 4, 'Processos', 80),
(25, 3, 5, 'Estratégia', 80),
(26, 3, 6, 'Direito', 80),
(27, 3, 7, 'Economia', 80),
(28, 3, 8, 'Projetos', 80),
(29, 3, 9, 'TGA', 80),
(30, 3, 10, 'Ética', 80),
(31, 4, 11, 'Armazenagem', 80),
(32, 4, 12, 'Transportes', 80),
(33, 4, 13, 'Estoques', 80),
(34, 4, 14, 'Compras', 80),
(35, 4, 15, 'Distribuição', 80),
(36, 4, 16, 'Custos', 80),
(37, 4, 17, 'Supply Chain', 80),
(38, 4, 18, 'Modais', 80),
(39, 4, 19, 'Operações', 80),
(40, 4, 20, 'Qualidade', 80),
(41, 5, 1, 'SEO', 80),
(42, 5, 2, 'Tráfego Pago', 80),
(43, 5, 3, 'Social Media', 80),
(44, 5, 4, 'Copywriting', 80),
(45, 5, 5, 'Inbound', 80),
(46, 5, 6, 'Analytics', 80),
(47, 5, 7, 'Branding', 80),
(48, 5, 8, 'E-commerce', 80),
(49, 5, 9, 'CRM', 80),
(50, 5, 10, 'Estratégia Dig', 80);

-- --------------------------------------------------------

--
-- Estrutura para tabela `matriculas`
--

CREATE TABLE `matriculas` (
  `id_matricula` int(11) NOT NULL,
  `id_aluno` int(11) DEFAULT NULL,
  `id_turma` int(11) DEFAULT NULL,
  `data_matricula` date DEFAULT NULL,
  `situacao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notas`
--

CREATE TABLE `notas` (
  `id_nota` int(11) NOT NULL,
  `id_boletim` int(11) DEFAULT NULL,
  `id_valiacao` int(11) DEFAULT NULL,
  `nota` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professores`
--

CREATE TABLE `professores` (
  `id_professor` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `for_macao` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `professores`
--

INSERT INTO `professores` (`id_professor`, `nome`, `cpf`, `for_macao`, `email`, `telefone`) VALUES
(1, 'Prof 1', '10101010101', 'Graduação', 'p1@email.com', '123456789'),
(2, 'Prof 2', '20202020202', 'Especialização', 'p2@email.com', '123456789'),
(3, 'Prof 3', '30303030303', 'Mestrado', 'p3@email.com', '123456789'),
(4, 'Prof 4', '40404040404', 'Doutorado', 'p4@email.com', '123456789'),
(5, 'Prof 5', '50505050505', 'Graduação', 'p5@email.com', '123456789'),
(6, 'Prof 6', '60606060606', 'Mestrado', 'p6@email.com', '123456789'),
(7, 'Prof 7', '70707070707', 'Graduação', 'p7@email.com', '123456789'),
(8, 'Prof 8', '80808080808', 'Doutorado', 'p8@email.com', '123456789'),
(9, 'Prof 9', '90909090909', 'Especialização', 'p9@email.com', '123456789'),
(10, 'Prof 10', '11121112111', 'Mestrado', 'p10@email.com', '123456789'),
(11, 'Prof 11', '11131113111', 'Graduação', 'p11@email.com', '123456789'),
(12, 'Prof 12', '11141114111', 'Especialização', 'p12@email.com', '123456789'),
(13, 'Prof 13', '11151115111', 'Mestrado', 'p13@email.com', '123456789'),
(14, 'Prof 14', '11161116111', 'Doutorado', 'p14@email.com', '123456789'),
(15, 'Prof 15', '11171117111', 'Graduação', 'p15@email.com', '123456789'),
(16, 'Prof 16', '11181118111', 'Mestrado', 'p16@email.com', '123456789'),
(17, 'Prof 17', '11191119111', 'Graduação', 'p17@email.com', '123456789'),
(18, 'Prof 18', '11101110111', 'Doutorado', 'p18@email.com', '123456789'),
(19, 'Prof 19', '11112111211', 'Especialização', 'p19@email.com', '123456789'),
(20, 'Prof 20', '11113111311', 'Mestrado', 'p20@email.com', '123456789');

-- --------------------------------------------------------

--
-- Estrutura para tabela `responsaveis`
--

CREATE TABLE `responsaveis` (
  `id_responsavel` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `id_turma` int(11) NOT NULL,
  `nome_turma` varchar(50) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `periodo` varchar(20) DEFAULT NULL,
  `id_curso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `turmas`
--

INSERT INTO `turmas` (`id_turma`, `nome_turma`, `ano`, `periodo`, `id_curso`) VALUES
(1, 'Turma DS', 2026, 'Noturno', 1),
(2, 'Turma RC', 2026, 'Matutino', 2),
(3, 'Turma ADM', 2026, 'Noturno', 3),
(4, 'Turma LOG', 2026, 'Vespertino', 4),
(5, 'Turma MKT', 2026, 'Noturno', 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id_aluno`);

--
-- Índices de tabela `aluno_responsavel`
--
ALTER TABLE `aluno_responsavel`
  ADD PRIMARY KEY (`id_aluno`,`id_responsavel`),
  ADD KEY `id_responsavel` (`id_responsavel`);

--
-- Índices de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`id_valiacao`),
  ADD KEY `id_disciplina` (`id_disciplina`);

--
-- Índices de tabela `boletins`
--
ALTER TABLE `boletins`
  ADD PRIMARY KEY (`id_boletim`),
  ADD KEY `id_matricula` (`id_matricula`);

--
-- Índices de tabela `coordenadores`
--
ALTER TABLE `coordenadores`
  ADD PRIMARY KEY (`id_coordenador`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `id_coordenador` (`id_coordenador`);

--
-- Índices de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`id_disciplina`),
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_professor` (`id_professor`);

--
-- Índices de tabela `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`id_matricula`),
  ADD KEY `id_aluno` (`id_aluno`),
  ADD KEY `id_turma` (`id_turma`);

--
-- Índices de tabela `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_boletim` (`id_boletim`),
  ADD KEY `id_valiacao` (`id_valiacao`);

--
-- Índices de tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`id_professor`);

--
-- Índices de tabela `responsaveis`
--
ALTER TABLE `responsaveis`
  ADD PRIMARY KEY (`id_responsavel`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id_turma`),
  ADD KEY `id_curso` (`id_curso`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id_aluno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  MODIFY `id_valiacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `boletins`
--
ALTER TABLE `boletins`
  MODIFY `id_boletim` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `coordenadores`
--
ALTER TABLE `coordenadores`
  MODIFY `id_coordenador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id_disciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `id_matricula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notas`
--
ALTER TABLE `notas`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `id_professor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `responsaveis`
--
ALTER TABLE `responsaveis`
  MODIFY `id_responsavel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluno_responsavel`
--
ALTER TABLE `aluno_responsavel`
  ADD CONSTRAINT `aluno_responsavel_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`),
  ADD CONSTRAINT `aluno_responsavel_ibfk_2` FOREIGN KEY (`id_responsavel`) REFERENCES `responsaveis` (`id_responsavel`);

--
-- Restrições para tabelas `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id_disciplina`);

--
-- Restrições para tabelas `boletins`
--
ALTER TABLE `boletins`
  ADD CONSTRAINT `boletins_ibfk_1` FOREIGN KEY (`id_matricula`) REFERENCES `matriculas` (`id_matricula`);

--
-- Restrições para tabelas `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`id_coordenador`) REFERENCES `coordenadores` (`id_coordenador`);

--
-- Restrições para tabelas `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD CONSTRAINT `disciplinas_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`),
  ADD CONSTRAINT `disciplinas_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `professores` (`id_professor`);

--
-- Restrições para tabelas `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`),
  ADD CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`id_turma`) REFERENCES `turmas` (`id_turma`);

--
-- Restrições para tabelas `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`id_boletim`) REFERENCES `boletins` (`id_boletim`),
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`id_valiacao`) REFERENCES `avaliacoes` (`id_valiacao`);

--
-- Restrições para tabelas `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
