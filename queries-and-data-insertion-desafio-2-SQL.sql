-- inserção de dados e queries

use workshop;

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into Clients (Fname, Minit, Lname, CPF, Address)
	values('Maria', 'M', 'Silva', 123456789, 'rua silva da prata 29, Carangola - Cidade das flores'),
		  ('Matheus', 'O', 'Pimentel', 987654321, 'rua alemeda 289, Centro - Cidade das flores'),
          ('Ricardo', 'F', 'Silva', 456789123, 'avenida alemeda vinha 1009, Centro - Cidade das flores'),
          ('Julia', 'S', 'França', 789123456, 'rua laranjeiras 861, Centro - Cidade das flores');
          
-- idVehicle, idVClient, Vbrand, Vmodel, Vcolor, licensePlate
insert into vehicle (idVClient, Vbrand, Vmodel, Vcolor, licensePlate) values
								(1,'Volkswagen','Gol','Branco',1234567),
                                (2, 'Fiat ','Palio','Vermelho',7654321),
                                (3, 'Toyota ','Corolla ','Preto',1236547),
                                (4, 'Honda','XRE 300','Preto',3217654);
                                
select * from clients;
select * from vehicle;
-- idClient, idPayment, typePayment('Crédito', 'Débto', 'Dinheiro'), price
insert into payments (idClient, typePayment, price) values
							(1, default, 250.00),
                            (2,'Crédito',500.00),
                            (3,'Dinheiro',160.65),
                            (4,'Débito',1500.53);
                            
						
-- idEmployee, Fname, Minint, Lname, CPF, Bdate, Adress, sex, Salary
insert into employee (Fname, Minint, Lname, CPF, Bdate, Adress, sex, Salary) values
						   ('José','S','Carneiro',12345678901, '1983-12-31', 'Rua dos Inválidos, 465 - Centro', 'M', 3000.65),
                           ('Carlos','P','Silva', 32165498710, '1987-05-15', 'Rua das Travessas, 10 - Flores', 'M', 2753.00);                        

-- idService, idSClient, idSVehicle,idSEmployee, serviceStatus ('Em espera','Em andamento','Finalizado'), typeService
select * from payments;
insert into service (idSClient, idSVehicle, idSEmployee, serviceStatus, typeService) values
						 (1,1,2,'Finalizado','martelinho de ouro'),
                         (2,2,1,'Em espera','troca de peça faltando no estoque'),
                         (3,3,1, 'Em andamento', 'cambagem'),
                         (4,4,2,'Em andamento','troca de componetes eletrônico e martelinho de ouro');
                         
                           
                           
-- idProdStorage, productName, quantify
insert into productStorage (productName, quantify) values
							('Injeção eletrônica', default),
                            ('Pneu carro', 64),
                            ('Pneu moto', 26),
                            ('Lãmpada farol', 100);
                            
                            
-- idSupplier, SocialName, AbstName, CNPJ, contact
insert into supplier (SocialName, AbstName, CNPJ, contact) values
						('Almeida e filhos ltda', 'Auto peças Almenida', 123456789123456, '21985474'),
                        ('Eletrônicos Silva SA',"Silvas's Eletronics ", 854519649143457, '21985484'),
                        ('Eletrônico Valma ltda', 'Casa do Eletrônico', 934567893934695, '21975474');
                        
                        
select * from supplier;


                            
select * from clients c, service s where c.idClient = s.idSClient;

select count(*) from clients;


select Fname,Lname,idService, serviceStatus from clients c, service s where c.idClient = s.idSClient;
select concat(Fname,' ',Lname) as Client ,idService as Service, serviceStatus as Status from clients c, service s where c.idClient = s.idSClient;