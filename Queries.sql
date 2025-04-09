-- QUERIES 

-- Quantos pedidos foram feitos por cada cliente?
SELECT 
  c.idClient,
  CONCAT_WS(' ', Fname, Lname) AS Nome,
  COUNT(o.idOrder) AS TotalPedidos
FROM clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient
ORDER BY TotalPedidos DESC;

-- Algum vendedor também é fornecedor?
SELECT s.socialName AS NomeVendedor, f.socialName AS NomeFornecedor
FROM seller s
JOIN supplier f ON s.CNPJ = f.CNPJ

UNION

SELECT s.socialName AS NomeVendedor, f.socialName AS NomeFornecedor
FROM seller s
JOIN supplier f ON s.CPF = f.CNPJ;


-- Relação de produtos, fornecedores e estoques
SELECT 
  p.Pname AS Produto,
  s.socialName AS Fornecedor,
  ps.quantity AS QuantidadeFornecida,
  st.storageLocation AS EstoqueLocal,
  st.quantity AS EstoqueDisponivel
FROM product p
JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
JOIN supplier s ON ps.idPsSupplier = s.idSupplier
JOIN storageLocation sl ON p.idProduct = sl.idLproduct
JOIN productStorage st ON sl.idLstorage = st.idProdStorage;

-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT 
  s.socialName AS Fornecedor,
  p.Pname AS Produto
FROM supplier s
JOIN productSupplier ps ON s.idSupplier = ps.idPsSupplier
JOIN product p ON ps.idPsProduct = p.idProduct
ORDER BY s.socialName;

-- Clientes com mais de 1 pedido	
SELECT 
  c.idClient, 
  CONCAT_WS(' ', Fname, Lname) AS Nome,
  COUNT(o.idOrder) AS TotalPedidos
FROM clients c
JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient
HAVING COUNT(o.idOrder) > 1;
