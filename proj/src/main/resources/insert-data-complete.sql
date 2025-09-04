-- Script SQL para inserção completa de dados no Sistema de Loja
-- Respeita a integridade referencial entre as tabelas
-- Ordem de inserção: Categoria → Fabricante → Funcionario → Cliente → Produto → Venda → ItemVenda

-- ======================================================
-- 1. INSERÇÃO DE CATEGORIAS (10 registros)
-- ======================================================
INSERT INTO categoria (nome) VALUES 
('Eletrônicos'),
('Roupas e Acessórios'),
('Livros e Mídia'),
('Casa e Jardim'),
('Esportes e Lazer'),
('Saúde e Beleza'),
('Alimentação'),
('Automotivo'),
('Brinquedos'),
('Ferramentas');

-- ======================================================
-- 2. INSERÇÃO DE FABRICANTES (10 registros)
-- ======================================================
INSERT INTO fabricante (nome) VALUES 
('Samsung'),
('Apple'),
('Nike'),
('Adidas'),
('Editora Saraiva'),
('Nestlé'),
('Bosch'),
('Mattel'),
('L''Oréal'),
('Tramontina');

-- ======================================================
-- 3. INSERÇÃO DE FUNCIONÁRIOS (10 registros)
-- ======================================================
INSERT INTO funcionario (nome, cpf) VALUES 
('João Silva Santos', '12345678901'),
('Maria Oliveira Costa', '23456789012'),
('Pedro Henrique Souza', '34567890123'),
('Ana Carolina Ferreira', '45678901234'),
('Carlos Eduardo Lima', '56789012345'),
('Juliana Santos Rocha', '67890123456'),
('Roberto Almeida Dias', '78901234567'),
('Fernanda Ribeiro Moura', '89012345678'),
('Ricardo Pereira Nunes', '90123456789'),
('Luciana Cardoso Silva', '01234567890');

-- ======================================================
-- 4. INSERÇÃO DE CLIENTES (10 registros)
-- ======================================================
INSERT INTO cliente (nome, cpf) VALUES 
('José da Silva', '11111111111'),
('Maria das Graças', '22222222222'),
('Antonio Carlos', '33333333333'),
('Ana Paula Gomes', '44444444444'),
('Carlos Alberto', '55555555555'),
('Fernanda Lima', '66666666666'),
('Roberto Santos', '77777777777'),
('Juliana Oliveira', '88888888888'),
('Pedro Henrique', '99999999999'),
('Lucia Ferreira', '10101010101');

-- ======================================================
-- 5. INSERÇÃO DE PRODUTOS (10 registros)
-- ======================================================
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES 
('Smartphone Galaxy S24', 2500.00, 15, '2025-12-31', 1, 1),
('iPhone 15 Pro Max', 5500.00, 8, '2025-12-31', 1, 2),
('Tênis Air Max 270', 450.00, 25, '2026-06-30', 5, 3),
('Camisa Adidas Originals', 180.00, 40, '2025-12-31', 2, 4),
('Livro: Java - Como Programar', 250.00, 20, '2027-12-31', 3, 5),
('Chocolate Kitkat 45g', 8.50, 100, '2024-06-30', 7, 6),
('Furadeira Bosch GSB 550', 320.00, 12, '2026-12-31', 10, 7),
('Boneca Barbie Fashionista', 89.90, 30, '2025-12-31', 9, 8),
('Shampoo Elseve 400ml', 15.90, 50, '2025-03-31', 6, 9),
('Panela Tramontina Antiaderente', 120.00, 18, '2028-12-31', 4, 10);

-- ======================================================
-- 6. INSERÇÃO DE VENDAS (10 registros)
-- ======================================================
INSERT INTO venda (horario, valor_total, quantidade_total, cliente_codigo, funcionario_codigo) VALUES 
('2024-01-15 09:30:00', 2500.00, 1, 1, 1),
('2024-01-16 14:20:00', 538.50, 4, 2, 2),
('2024-01-17 10:45:00', 450.00, 1, 3, 3),
('2024-01-18 16:15:00', 360.00, 2, 4, 4),
('2024-01-19 11:30:00', 250.00, 1, 5, 5),
('2024-01-20 13:45:00', 409.80, 8, 6, 6),
('2024-01-21 08:20:00', 320.00, 1, 7, 7),
('2024-01-22 15:50:00', 269.70, 3, 8, 8),
('2024-01-23 12:10:00', 135.90, 2, 9, 9),
('2024-01-24 17:30:00', 240.00, 2, 10, 10);

-- ======================================================
-- 7. INSERÇÃO DE ITENS DE VENDA (10 registros principais + extras)
-- ======================================================

-- Venda 1: 1 Smartphone Galaxy S24
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(2500.00, 1, 1, 1);

-- Venda 2: 3 Chocolates + 1 Tênis (total: 4 itens)
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(25.50, 3, 6, 2),
(450.00, 1, 3, 2),
(15.90, 1, 9, 2),
(89.90, 1, 8, 2);

-- Venda 3: 1 Tênis Air Max
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(450.00, 1, 3, 3);

-- Venda 4: 2 Camisas Adidas
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(360.00, 2, 4, 4);

-- Venda 5: 1 Livro Java
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(250.00, 1, 5, 5);

-- Venda 6: 8 Chocolates + 2 Shampoos + 2 Panelas
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(68.00, 8, 6, 6),
(31.80, 2, 9, 6),
(240.00, 2, 10, 6),
(89.90, 1, 8, 6);

-- Venda 7: 1 Furadeira Bosch
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(320.00, 1, 7, 7);

-- Venda 8: 3 Bonecas Barbie
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(269.70, 3, 8, 8);

-- Venda 9: 2 Shampoos + 2 Panelas
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(31.80, 2, 9, 9),
(240.00, 2, 10, 9);

-- Venda 10: 2 Panelas Tramontina
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(240.00, 2, 10, 10);

-- ======================================================
-- INSERÇÃO DE DADOS ADICIONAIS PARA COMPLETAR 10 REGISTROS
-- ======================================================

-- Mais 5 Categorias (total: 15)
INSERT INTO categoria (nome) VALUES 
('Informática'),
('Móveis'),
('Pet Shop'),
('Música e Instrumentos'),
('Jardinagem');

-- Mais 5 Fabricantes (total: 15)
INSERT INTO fabricante (nome) VALUES 
('Dell'),
('IKEA'),
('Pedigree'),
('Yamaha'),
('Vaso & Cia');

-- Mais 5 Funcionários (total: 15)
INSERT INTO funcionario (nome, cpf) VALUES 
('Marcos Vinícius', '12312312312'),
('Patrícia Gomes', '32132132132'),
('Rafael Costa', '45645645645'),
('Camila Santos', '78978978978'),
('Diego Oliveira', '96396396396');

-- Mais 5 Clientes (total: 15)
INSERT INTO cliente (nome, cpf) VALUES 
('Sandra Regina', '14714714714'),
('Maurício Silva', '25825825825'),
('Roberta Lima', '36936936936'),
('Fernando Santos', '74174174174'),
('Cristina Rocha', '85285285285');

-- Mais 10 Produtos (total: 20)
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES 
('Notebook Dell Inspiron', 3200.00, 6, '2025-12-31', 11, 11),
('Mesa IKEA Linnmon', 199.00, 12, '2027-12-31', 12, 12),
('Ração Pedigree Adulto 15kg', 180.00, 20, '2024-08-31', 13, 13),
('Violão Yamaha C40', 450.00, 8, '2028-12-31', 14, 14),
('Vaso Decorativo Cerâmica', 35.00, 25, '2030-12-31', 15, 15),
('Tablet Samsung Galaxy Tab', 1200.00, 10, '2025-12-31', 1, 1),
('AirPods Apple Pro', 1800.00, 15, '2025-12-31', 1, 2),
('Tênis Nike Air Force', 580.00, 18, '2026-06-30', 5, 3),
('Jaqueta Adidas Performance', 350.00, 22, '2025-12-31', 2, 4),
('Livro: Python para Iniciantes', 120.00, 30, '2027-12-31', 3, 5);

-- Mais 5 Vendas (total: 15)
INSERT INTO venda (horario, valor_total, quantidade_total, cliente_codigo, funcionario_codigo) VALUES 
('2024-01-25 09:15:00', 3200.00, 1, 11, 11),
('2024-01-26 14:30:00', 398.00, 2, 12, 12),
('2024-01-27 11:45:00', 1260.00, 3, 13, 13),
('2024-01-28 16:20:00', 1800.00, 1, 14, 14),
('2024-01-29 13:10:00', 1755.00, 5, 15, 15);

-- Itens das novas vendas
-- Venda 11: 1 Notebook Dell
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(3200.00, 1, 11, 11);

-- Venda 12: 2 Mesas IKEA
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(398.00, 2, 12, 12);

-- Venda 13: 1 Ração + 1 Violão + 1 Tablet
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(180.00, 1, 13, 13),
(450.00, 1, 14, 13),
(1200.00, 1, 16, 13);

-- Venda 14: 1 AirPods Apple
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(1800.00, 1, 17, 14);

-- Venda 15: 1 Tênis Nike + 1 Jaqueta + 3 Vasos + 2 Livros
INSERT INTO item_venda (valor_parcial, quantidade_parcial, produto_codigo, venda_codigo) VALUES 
(580.00, 1, 18, 15),
(350.00, 1, 19, 15),
(105.00, 3, 15, 15),
(240.00, 2, 20, 15);

-- ======================================================
-- VERIFICAÇÃO DE INTEGRIDADE DOS DADOS
-- ======================================================

-- Consultas para verificar a consistência dos dados inseridos
SELECT 'CATEGORIAS' as tabela, COUNT(*) as total FROM categoria
UNION ALL
SELECT 'FABRICANTES', COUNT(*) FROM fabricante
UNION ALL
SELECT 'FUNCIONARIOS', COUNT(*) FROM funcionario
UNION ALL
SELECT 'CLIENTES', COUNT(*) FROM cliente
UNION ALL
SELECT 'PRODUTOS', COUNT(*) FROM produto
UNION ALL
SELECT 'VENDAS', COUNT(*) FROM venda
UNION ALL
SELECT 'ITENS_VENDA', COUNT(*) FROM item_venda;

-- Verificar se os valores totais das vendas estão corretos
SELECT 
    v.codigo as venda_id,
    v.valor_total as valor_registrado,
    SUM(iv.valor_parcial) as valor_calculado,
    v.quantidade_total as qtd_registrada,
    SUM(iv.quantidade_parcial) as qtd_calculada,
    CASE 
        WHEN v.valor_total = SUM(iv.valor_parcial) AND v.quantidade_total = SUM(iv.quantidade_parcial) 
        THEN 'OK' 
        ELSE 'ERRO' 
    END as status
FROM venda v
INNER JOIN item_venda iv ON v.codigo = iv.venda_codigo
GROUP BY v.codigo, v.valor_total, v.quantidade_total
ORDER BY v.codigo;