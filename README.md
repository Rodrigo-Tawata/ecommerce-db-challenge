# 🛒 Banco de Dados para E-commerce

**Modelagem e implementação de um banco de dados relacional para um sistema de e-commerce**, com suporte completo a:

- Clientes Pessoa Física (PF) e Pessoa Jurídica (PJ)
- Múltiplas formas de pagamento por cliente
- Pedidos com código de rastreio e status de entrega
- Relação entre produtos, fornecedores e estoques
- Consultas complexas com filtros, agrupamentos e joins

---

## 📌 Sobre o Projeto

Este projeto foi desenvolvido como parte de um desafio de modelagem de banco de dados. A proposta é aplicar o mapeamento do modelo conceitual para o modelo lógico, com as regras de negócio adaptadas ao cenário de um e-commerce realista.

Inclui a criação do **schema completo**, inserção de dados para testes e diversas **consultas SQL complexas** que permitem explorar o banco de forma analítica e operacional.

---

## 🧠 Regras de Negócio

- Um cliente pode ser **PF** ou **PJ**, nunca ambos.
- Cada cliente pode possuir **mais de um pagamento cadastrado**.
- Pedidos têm **status** e **código de rastreio** associados à entrega.
- Produtos são vinculados a **fornecedores**, **vendedores** e **estoques**.
- **Vendedores podem ser também fornecedores**, e o sistema deve refletir isso.

---

## 🏗️ Estrutura do Banco de Dados

O banco é composto por diversas tabelas relacionadas:

- `clients`: Armazena os dados de clientes PF e PJ.
- `product`: Detalhes dos produtos vendidos.
- `orders`: Registro de pedidos realizados.
- `delivery`: Informações de entrega dos pedidos.
- `payments`: Formas de pagamento disponíveis por cliente.
- `supplier`: Fornecedores dos produtos.
- `seller`: Vendedores cadastrados.
- `productSupplier`: Relação entre fornecedores e produtos.
- `productSeller`: Relação entre vendedores e produtos.
- `productStorage`: Estoques físicos.
- `storageLocation`: Localização dos produtos em estoque.

---

## 📥 Inserção de Dados

O projeto inclui comandos `INSERT` para popular o banco com dados fictícios, incluindo:

- Clientes PF e PJ
- Produtos de diferentes categorias
- Vendedores e fornecedores
- Pedidos com status variados e entregas associadas
- Estoques com quantidade e localização

---

## 🧾 Consultas SQL Complexas

O projeto também apresenta uma série de **queries SQL** usando:

- `JOINs` entre múltiplas tabelas
- `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`
- Expressões para atributos derivados

### Exemplos de perguntas respondidas:
- Quantos pedidos foram feitos por cada cliente?
- Algum vendedor também é fornecedor?
- Relação de produtos, fornecedores e estoques?
- Quais clientes fizeram mais de um pedido?
- Quais produtos são fornecidos por cada fornecedor?

---

## 📁 Como usar

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/ecommerce-sql-db.git
2. Importe o script schema.sql em seu gerenciador de banco (ex: MySQL Workbench).
3. Execute os scripts de INSERT.
4. Teste as consultas SQL no seu ambiente preferido.

---

## ✅ Tecnologias
- MySQL
- SQL ANSI
- Modelagem com base em EER (Entidade-Relacionamento Estendido)

---

## 🚀 Autor
Desenvolvido por Rodrigo Tawata
🔗 [GitHub](https://github.com/Rodrigo-Tawata) | [LinkedIn](https://www.linkedin.com/in/rodrigo-tawata/)
