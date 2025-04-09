-- INSERÇÃO DE DADOS

-- Inserção na tabela clients
INSERT INTO clients (Fname, Minit, Lname, CPF, CNPJ, Address, typeClient)
VALUES
  ('Maria','M','Silva','12345678901', NULL, 'Rua Silva de Prata 29, Carangola - Cidade das Flores', 'PF'),
  ('Matheus','O','Pimentel','98765432100', NULL, 'Rua Alameda 289, Centro - Cidade das Flores', 'PF'),
  ('Ricardo','F','Silva','45687912322', NULL, 'Rua Alameda Vinha 1009, Centro - Cidade das Flores', 'PF'),
  ('Julia','S','França','78912345633', NULL, 'Rua Laranjeiras 861 , Centro - Cidade das Flores', 'PF'),
  ('Empresa XPTO',NULL,NULL, NULL, '11222333000199', 'Av. das Empresas 1000, Centro - Cidade das Flores', 'PJ');

-- Inserção de pedidos com entrega
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
VALUES
  (1, DEFAULT, 'compra via app', 10, TRUE),
  (2, DEFAULT, 'compra via site', 50, FALSE),
  (3, 'Confirmado', 'compra presencial', 0, TRUE);

-- Inserção nas entregas (uma para cada pedido acima)
INSERT INTO delivery (idOrder, trackingCode, statusDelivery)
VALUES
  (1, 'BR123456789', 'Em trânsito'),
  (2, 'BR987654321', 'Entregue'),
  (3, 'BR456789123', 'Atrasado');

-- Inserção de Produto
INSERT INTO product (Pname, classification_kids, category, avaliação, size)
VALUES 
  ('Tablet X', false, 'Eletrônico', 4.5, 'Único'),
  ('Camiseta Algodão', false, 'Vestimenta', 4.7, 'M'),
  ('Carrinho de Brinquedo', true, 'Brinquedos', 4.2, 'Pequeno');

-- Inserção de Fornecedores
INSERT INTO supplier (socialName, CNPJ, contact)
VALUES 
  ('Tech Supplier', '11122233344455', '999888777'),
  ('Moda Fina Ltda', '22233344455566', '988877766'),
  ('Brinquedos Felizes', '33344455566677', '977766655');

-- Relacionamento Produto ↔ Fornecedor
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity)
VALUES 
  (1, 1, 100),  -- Tech Supplier fornece Tablet X
  (2, 2, 200),  -- Moda Fina fornece Camiseta
  (3, 3, 150);  -- Brinquedos Felizes fornece Carrinho


-- Inserção de vendedor com mesmo CNPJ de fornecedor
INSERT INTO seller (socialName, AbsName, CNPJ, CPF, location, contact)
VALUES 
  ('Tech Supplier', 'TS', '11122233344455', NULL, 'Cidade das Flores', '999888777');

-- Clientes com mais de 1 pedido
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
VALUES 
  (1, 'Confirmado', 'Pedido extra via site', 15, FALSE);


-- Inserção dos locais de estoque
INSERT INTO productStorage (storageLocation, quantity)
VALUES 
  ('Depósito Central', 80),           -- ID 1
  ('Galpão Zona Norte', 150),         -- ID 2
  ('Centro Logístico Oeste', 120);    -- ID 3

-- Vínculo entre produtos e estoques
INSERT INTO storageLocation (idLproduct, idLstorage, location)
VALUES 
  (1, 1, 'Depósito Central'),         -- Tablet X
  (2, 2, 'Galpão Zona Norte'),        -- Camiseta
  (3, 3, 'Centro Logístico Oeste');   -- Carrinho de Brinquedo
