-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 27/12/2023 às 15:04
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd-lavajato2`
--
CREATE DATABASE IF NOT EXISTS `bd-lavajato2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd-lavajato2`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `id` int(255) NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `statusAtendimento` tinyint(1) NOT NULL,
  `statusPagamento` tinyint(1) NOT NULL,
  `valorTotal` double NOT NULL,
  `observacao` varchar(600) NOT NULL,
  `id_usuario` int(100) NOT NULL,
  `id_cliente` int(100) NOT NULL,
  `id_veiculo` int(100) NOT NULL,
  `id_funcionario` int(100) NOT NULL,
  `id_forma_pagamento` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `atendimento`
--

INSERT INTO `atendimento` (`id`, `data`, `statusAtendimento`, `statusPagamento`, `valorTotal`, `observacao`, `id_usuario`, `id_cliente`, `id_veiculo`, `id_funcionario`, `id_forma_pagamento`) VALUES
(15, '2023-12-01 20:53:51', 1, 1, 220, 'oioi', 3, 10, 7, 1, 4),
(16, '2023-12-01 20:56:44', 0, 0, 150, 'ok', 3, 10, 7, 1, 4),
(19, '2023-12-01 22:21:57', 0, 0, 500, 'oi', 3, 1, 1, 1, 4),
(23, '2023-12-02 00:54:08', 0, 0, 35, 'nao quer cera', 3, 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(100) NOT NULL,
  `nomeCompleto` varchar(100) NOT NULL,
  `telefone` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nomeCompleto`, `telefone`, `status`) VALUES
(1, 'DEISE SALES', '61999999999', 1),
(2, 'RONALDO MACEDO', '61999999999', 1),
(8, 'JACY FILHO', '61999999999', 1),
(10, 'LUCILENE SALES DE OLIVEIRA', '61999999999', 1),
(11, 'LUCILENE SALES DE OLIVEIROYY', '61999999999', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fluxo_caixa`
--

CREATE TABLE `fluxo_caixa` (
  `id` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `descricao` varchar(100) NOT NULL,
  `valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fluxo_caixa`
--

INSERT INTO `fluxo_caixa` (`id`, `data`, `descricao`, `valor`) VALUES
(5, '2023-12-02 00:09:00', 'ALUGUEL', 750),
(6, '2023-12-02 00:09:00', 'CONTA DE LUZ', 650.75);

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id` int(100) NOT NULL,
  `nomeCompleto` varchar(100) NOT NULL,
  `apelido` varchar(100) NOT NULL,
  `telefone` varchar(30) NOT NULL,
  `dataCadastro` date NOT NULL,
  `id_perfil` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`id`, `nomeCompleto`, `apelido`, `telefone`, `dataCadastro`, `id_perfil`, `status`) VALUES
(1, 'LIDIA SALES DE OLIVEIRA', 'LIDIA', '61999999999', '2023-10-29', 22, 1),
(2, 'RAFAEL MARLON SOUSA DE MACEDO', 'RAFA', '61999999999', '2023-10-29', 22, 1),
(3, 'ANTONIA SALES DE AZEVEDO', 'TOINHA', '61999999999', '2023-10-29', 22, 0),
(4, 'LETICIA DE ANDRADE', 'LETY', '61999999999', '2023-10-29', 22, 1),
(5, 'ANTONIO CARLOS DE AZEVEDO', 'CARLINHOS', '61999999999', '2023-11-05', 22, 1),
(6, 'DEISE SALES DE ARAUJO', 'DEISE', '61999999999', '2023-11-22', 17, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `menu` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `menu`
--

INSERT INTO `menu` (`id_menu`, `menu`, `link`) VALUES
(1, 'INICIO', 'pagina-inicial.jsp'),
(2, 'USUARIO', 'listar-usuario.jsp'),
(3, 'FUNCIONARIO', 'listar-funcionario.jsp'),
(4, 'TABELA DE PRECOS', 'listar-tabela-preco.jsp'),
(5, 'FORMAS DE PAGAMENTO', 'listar-tipo-pagamento.jsp'),
(6, 'CLIENTES E VEICULOS', 'listar-cliente-veiculo.jsp'),
(7, 'MENU', 'listar-menu.jsp'),
(9, 'PERFIL', 'listar-perfil.jsp');

-- --------------------------------------------------------

--
-- Estrutura para tabela `menu_perfil`
--

CREATE TABLE `menu_perfil` (
  `id_menu` int(100) NOT NULL,
  `id_perfil` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `menu_perfil`
--

INSERT INTO `menu_perfil` (`id_menu`, `id_perfil`) VALUES
(9, 17),
(1, 18),
(6, 18),
(4, 17),
(6, 17),
(2, 17),
(5, 17),
(7, 17),
(3, 17),
(10, 18),
(1, 17);

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nome`, `status`) VALUES
(17, 'administrador(a)', 1),
(18, 'recepcionista', 0),
(22, 'lavador(a) de veiculos', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_preco`
--

CREATE TABLE `tabela_preco` (
  `id` int(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `precoVeiculoPequeno` double NOT NULL,
  `precoVeiculoMedio` double NOT NULL,
  `precoVeiculoGrande` double NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tabela_preco`
--

INSERT INTO `tabela_preco` (`id`, `nome`, `precoVeiculoPequeno`, `precoVeiculoMedio`, `precoVeiculoGrande`, `status`) VALUES
(1, 'AMERICANA SIMPLES', 40, 50, 70, 1),
(2, 'AMERICANA DETALHADA', 100, 120, 150, 1),
(3, 'LAVAGEM EXTERNA', 20, 25, 35, 1),
(4, 'LAVAGEM INTERNA', 25, 30, 35, 1),
(5, 'LAVAGEM TECNICA DE MOTORES', 50, 55, 60, 1),
(6, 'ASPIRACAO INTERNA', 15, 15, 15, 1),
(7, 'HIGIENIZACAO DE BANCOS', 150, 170, 200, 1),
(8, 'HIDRATACAO DE BANCOS DE COURO', 180, 200, 220, 1),
(9, 'HIGIENIZACAO DE TETO', 80, 100, 120, 1),
(10, 'VITRIFICACAO DE FAROIS', 0, 0, 0, 0),
(11, 'VITRIFICACAO DE PLASTICOS', 0, 0, 0, 0),
(12, 'HIGIENIZACAO DE AR CONDICIONADO', 0, 0, 0, 0),
(13, 'KIT PREPARACAO PARA VENDA (COMPLETA)', 400, 450, 500, 1),
(14, 'ENVERNIZAMENTO DE MOTORES', 0, 0, 0, 0),
(15, 'APLICACAO DE CERA CARNAUBA', 20, 20, 25, 1),
(16, 'ENCERAMENTO COM POLITRIZ', 0, 0, 0, 0),
(17, 'LAVAGEM DE MOTOCICLETA', 30, 40, 50, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_pagamento`
--

CREATE TABLE `tipo_pagamento` (
  `id` int(30) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_pagamento`
--

INSERT INTO `tipo_pagamento` (`id`, `nome`, `status`) VALUES
(1, 'cartao de credito', 1),
(2, 'cartao de debito', 1),
(3, 'pix', 1),
(4, 'dinheiro', 1),
(5, 'nota promissoria', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nomeCompleto` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `dataCadastro` date NOT NULL,
  `id_perfil` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nomeCompleto`, `login`, `senha`, `dataCadastro`, `id_perfil`, `status`) VALUES
(1, 'LARA MELISSA PIEROTE', 'lara.pierote', '10', '2023-10-29', 17, 1),
(2, 'LUCILENE SALES DE OLIVEIRA', 'lu.oliveira', '10', '2023-10-29', 18, 0),
(3, 'DEISE SALES DE ARAUJO', 'deise.araujo', '10', '2023-10-29', 17, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `id` int(30) NOT NULL,
  `id_cliente` int(30) NOT NULL,
  `placa` varchar(30) NOT NULL,
  `cor` varchar(30) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `modelo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `veiculo`
--

INSERT INTO `veiculo` (`id`, `id_cliente`, `placa`, `cor`, `marca`, `modelo`) VALUES
(1, 1, 'UIO1010', 'preto', 'fiat', 'Argo Drive'),
(2, 2, 'UIO2020', 'VERDE', 'FIAT', 'SIENA'),
(5, 8, 'UIO3030', 'VERMELHO', 'BMW', 'XP3009'),
(7, 10, 'UIO4040', 'PRETO', 'FIAT', 'ARGO DRIVE'),
(8, 11, 'UIO5050', 'PRETAYY', 'FIATYYY', 'ARGO DRIVEYY'),
(15, 11, 'UIO6060', 'VERMELHO', 'FIAT', 'UNO MILLE'),
(16, 1, 'UIO7070', 'PRETO', 'BMW', 'PEGAPEGA'),
(17, 2, 'UIO8080', 'VERMELHO', 'JEEP', 'COMPASS');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fluxo_caixa`
--
ALTER TABLE `fluxo_caixa`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Índices de tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Índices de tabela `tabela_preco`
--
ALTER TABLE `tabela_preco`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tipo_pagamento`
--
ALTER TABLE `tipo_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `fluxo_caixa`
--
ALTER TABLE `fluxo_caixa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `tabela_preco`
--
ALTER TABLE `tabela_preco`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `tipo_pagamento`
--
ALTER TABLE `tipo_pagamento`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
