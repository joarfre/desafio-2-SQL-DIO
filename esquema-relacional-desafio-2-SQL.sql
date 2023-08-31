-- criação do banco de dados para o cenário oficina
-- drop database workshop;
create database workshop;
use workshop;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit varchar(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(100),
    constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;

-- criar tabela veículo
create table vehicle(
	idVehicle int auto_increment,
    idVClient int,
    Vbrand varchar(15) not null,
    Vmodel varchar(15) not null,
    Vcolor varchar(10),
    licensePlate char(7) not null,
    primary key(idVehicle, idVClient),
    constraint fk_vehicle_client foreign key(idVClient) references clients(idClient),
    constraint unique_license_plate unique (licensePlate)
);

alter table vehicle auto_increment=1;

-- criar tabela pagamento
create table payments(
	idPayment int auto_increment,
    idClient int,
    typePayment ENUM('Crédito', 'Débito', 'Dinheiro') not null default 'Débito',
    price float,
    primary key(idPayment, idClient),
    constraint fk_payments_client foreign key (idClient) references clients(idClient)
		on update cascade
);

-- criar tabela funcionário
create table employee(
	idEmployee int auto_increment primary key,
	Fname varchar(15) NOT NULL,
	Minint char,
	Lname varchar(15) NOT NULL,
    CPF char(11) not null,
    Bdate DATE,
	Adress varchar(100),
	sex char,
	Salary decimal(10,2)
);


-- criar tabela serviço
create table service(
	idService int auto_increment,
    idSClient int,
    idSVehicle int,
    idSEmployee int,
    serviceStatus enum('Em espera','Em andamento','Finalizado') default 'Em espera',
    typeService varchar(255),
    primary key(idService, idSClient, idSVehicle, idSEmployee),
    constraint fk_service_client foreign key (idSClient) references clients(idClient)
		on update cascade,
	constraint fk_service_vehicle foreign key(idSVehicle) references vehicle(idVehicle)
		on update cascade,
	constraint fk_service_employee foreign key(idSEmployee) references employee(idEmployee)
		on update cascade
);


-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    productName varchar(255) not null,
    quantify int default 0
);

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15) not null,
    contact varchar(11) not null,
    constraint unique_cnpj_supplier unique(CNPJ),
    constraint unique_socialName_supplier unique(socialName)
);

alter table supplier auto_increment=1;

