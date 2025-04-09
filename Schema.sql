-- CRIAÇÃO DO BANCO DE DADOS
-- drop database ecommerce_desafio;
create database ecommerce_desafio;
use ecommerce_desafio;

-- Tabela de Clientes com PF e PJ
create table clients (
	idClient int auto_increment primary key,
    Fname varchar(255),
    Minit char(3),
    Lname varchar(255),
    CPF char(11),
    CNPJ char(15),
    typeClient enum('PF','PJ') not null,
    Address varchar(255),
    constraint unique_cpf_client unique (CPF),
    constraint unique_cnpj_client unique (CNPJ),
    check ((typeClient = 'PF' and CPF is not null and CNPJ is null) or
           (typeClient = 'PJ' and CNPJ is not null and CPF is null))
);

-- Tabela de Produtos
create table product (
	idProduct int auto_increment primary key,
    Pname varchar(255) not null,
    classification_kids bool,
    category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'),
    avaliação float,
    size varchar(255)
);

-- Tabela de Estoque
create table productStorage (
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- Tabela de Fornecedores
create table supplier (
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
	constraint unique_supplier unique (CNPJ)
);

-- Tabela de Vendedores
create table seller (
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    AbsName varchar(255),
    CNPJ char(15),
    CPF char(11),
    location varchar(255),
    contact char(11) not null,
	constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

-- Tabela de Vínculo Produto-Vendedor
create table productSeller (
	idPseller int,
    idProduct int,
    prodQuantity int default 1,
    primary key(idPSeller, idProduct),
    constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
    constraint fk_product_product foreign key(idProduct) references product(idProduct)
);

-- Tabela de Pedidos
create table orders (
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado', 'Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
        on update cascade
);

-- Tabela de Produtos do Pedido
create table productOrder (
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key(idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);

-- Tabela de Pagamentos
CREATE TABLE payments (
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    typePayment ENUM('Boleto', 'Cartão', 'Dois cartões'),
    limitAvailable FLOAT,
    CONSTRAINT fk_payment_client FOREIGN KEY (idClient) REFERENCES clients(idClient)
);


-- Tabela de Localização de Estoque
create table storageLocation (
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key(idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

-- Tabela de Fornecimento de Produtos
create table productSupplier (
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);

-- Tabela de Entregas
create table delivery (
	idDelivery int auto_increment primary key,
    idOrder int,
    trackingCode varchar(50),
    statusDelivery enum('Em trânsito', 'Entregue', 'Atrasado') default 'Em trânsito',
    constraint fk_delivery_order foreign key (idOrder) references orders(idOrder)
);
