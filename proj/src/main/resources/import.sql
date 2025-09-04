-- Script atualizado para o Quarkus - import.sql
-- Este arquivo substitui o import.sql original com dados mais completos

-- ======================================================
-- CATEGORIAS (15 registros)
-- ======================================================
INSERT INTO categoria (nome) VALUES ('Eletrônicos');
INSERT INTO categoria (nome) VALUES ('Roupas e Acessórios');
INSERT INTO categoria (nome) VALUES ('Livros e Mídia');
INSERT INTO categoria (nome) VALUES ('Casa e Jardim');
INSERT INTO categoria (nome) VALUES ('Esportes e Lazer');
INSERT INTO categoria (nome) VALUES ('Saúde e Beleza');
INSERT INTO categoria (nome) VALUES ('Alimentação');
INSERT INTO categoria (nome) VALUES ('Automotivo');
INSERT INTO categoria (nome) VALUES ('Brinquedos');
INSERT INTO categoria (nome) VALUES ('Ferramentas');
INSERT INTO categoria (nome) VALUES ('Informática');
INSERT INTO categoria (nome) VALUES ('Móveis');
INSERT INTO categoria (nome) VALUES ('Pet Shop');
INSERT INTO categoria (nome) VALUES ('Música e Instrumentos');
INSERT INTO categoria (nome) VALUES ('Jardinagem');

-- ======================================================
-- FABRICANTES (15 registros)
-- ======================================================
INSERT INTO fabricante (nome) VALUES ('Samsung');
INSERT INTO fabricante (nome) VALUES ('Apple');
INSERT INTO fabricante (nome) VALUES ('Nike');
INSERT INTO fabricante (nome) VALUES ('Adidas');
INSERT INTO fabricante (nome) VALUES ('Editora Saraiva');
INSERT INTO fabricante (nome) VALUES ('Nestlé');
INSERT INTO fabricante (nome) VALUES ('Bosch');
INSERT INTO fabricante (nome) VALUES ('Mattel');
INSERT INTO fabricante (nome) VALUES ('L''Oréal');
INSERT INTO fabricante (nome) VALUES ('Tramontina');
INSERT INTO fabricante (nome) VALUES ('Dell');
INSERT INTO fabricante (nome) VALUES ('IKEA');
INSERT INTO fabricante (nome) VALUES ('Pedigree');
INSERT INTO fabricante (nome) VALUES ('Yamaha');
INSERT INTO fabricante (nome) VALUES ('Vaso & Cia');

-- ======================================================
-- FUNCIONÁRIOS (15 registros)
-- ======================================================
INSERT INTO funcionario (nome, cpf) VALUES ('João Silva Santos', '12345678901');
INSERT INTO funcionario (nome, cpf) VALUES ('Maria Oliveira Costa', '23456789012');
INSERT INTO funcionario (nome, cpf) VALUES ('Pedro Henrique Souza', '34567890123');
INSERT INTO funcionario (nome, cpf) VALUES ('Ana Carolina Ferreira', '45678901234');
INSERT INTO funcionario (nome, cpf) VALUES ('Carlos Eduardo Lima', '56789012345');
INSERT INTO funcionario (nome, cpf) VALUES ('Juliana Santos Rocha', '67890123456');
INSERT INTO funcionario (nome, cpf) VALUES ('Roberto Almeida Dias', '78901234567');
INSERT INTO funcionario (nome, cpf) VALUES ('Fernanda Ribeiro Moura', '89012345678');
INSERT INTO funcionario (nome, cpf) VALUES ('Ricardo Pereira Nunes', '90123456789');
INSERT INTO funcionario (nome, cpf) VALUES ('Luciana Cardoso Silva', '01234567890');
INSERT INTO funcionario (nome, cpf) VALUES ('Marcos Vinícius', '12312312312');
INSERT INTO funcionario (nome, cpf) VALUES ('Patrícia Gomes', '32132132132');
INSERT INTO funcionario (nome, cpf) VALUES ('Rafael Costa', '45645645645');
INSERT INTO funcionario (nome, cpf) VALUES ('Camila Santos', '78978978978');
INSERT INTO funcionario (nome, cpf) VALUES ('Diego Oliveira', '96396396396');

-- ======================================================
-- CLIENTES (15 registros)
-- ======================================================
INSERT INTO cliente (nome, cpf) VALUES ('José da Silva', '11111111111');
INSERT INTO cliente (nome, cpf) VALUES ('Maria das Graças', '22222222222');
INSERT INTO cliente (nome, cpf) VALUES ('Antonio Carlos', '33333333333');
INSERT INTO cliente (nome, cpf) VALUES ('Ana Paula Gomes', '44444444444');
INSERT INTO cliente (nome, cpf) VALUES ('Carlos Alberto', '55555555555');
INSERT INTO cliente (nome, cpf) VALUES ('Fernanda Lima', '66666666666');
INSERT INTO cliente (nome, cpf) VALUES ('Roberto Santos', '77777777777');
INSERT INTO cliente (nome, cpf) VALUES ('Juliana Oliveira', '88888888888');
INSERT INTO cliente (nome, cpf) VALUES ('Pedro Henrique', '99999999999');
INSERT INTO cliente (nome, cpf) VALUES ('Lucia Ferreira', '10101010101');
INSERT INTO cliente (nome, cpf) VALUES ('Sandra Regina', '14714714714');
INSERT INTO cliente (nome, cpf) VALUES ('Maurício Silva', '25825825825');
INSERT INTO cliente (nome, cpf) VALUES ('Roberta Lima', '36936936936');
INSERT INTO cliente (nome, cpf) VALUES ('Fernando Santos', '74174174174');
INSERT INTO cliente (nome, cpf) VALUES ('Cristina Rocha', '85285285285');

-- ======================================================
-- PRODUTOS (20 registros)
-- ======================================================
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Smartphone Galaxy S24', 2500.00, 15, '2025-12-31', 1, 1);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('iPhone 15 Pro Max', 5500.00, 8, '2025-12-31', 1, 2);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Tênis Air Max 270', 450.00, 25, '2026-06-30', 5, 3);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Camisa Adidas Originals', 180.00, 40, '2025-12-31', 2, 4);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Livro: Java - Como Programar', 250.00, 20, '2027-12-31', 3, 5);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Chocolate Kitkat 45g', 8.50, 100, '2024-06-30', 7, 6);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Furadeira Bosch GSB 550', 320.00, 12, '2026-12-31', 10, 7);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Boneca Barbie Fashionista', 89.90, 30, '2025-12-31', 9, 8);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Shampoo Elseve 400ml', 15.90, 50, '2025-03-31', 6, 9);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Panela Tramontina Antiaderente', 120.00, 18, '2028-12-31', 4, 10);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Notebook Dell Inspiron', 3200.00, 6, '2025-12-31', 11, 11);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Mesa IKEA Linnmon', 199.00, 12, '2027-12-31', 12, 12);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Ração Pedigree Adulto 15kg', 180.00, 20, '2024-08-31', 13, 13);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Violão Yamaha C40', 450.00, 8, '2028-12-31', 14, 14);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Vaso Decorativo Cerâmica', 35.00, 25, '2030-12-31', 15, 15);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Tablet Samsung Galaxy Tab', 1200.00, 10, '2025-12-31', 1, 1);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('AirPods Apple Pro', 1800.00, 15, '2025-12-31', 1, 2);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Tênis Nike Air Force', 580.00, 18, '2026-06-30', 5, 3);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Jaqueta Adidas Performance', 350.00, 22, '2025-12-31', 2, 4);
INSERT INTO produto (nome, preco, quantidade, validade, categoria_codigo, fabricante_codigo) VALUES ('Livro: Python para Iniciantes', 120.00, 30, '2027-12-31', 3, 5);