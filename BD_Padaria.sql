create database padaria;

use padaria;

create table produto(
codigo varchar(12) not null,
nome varchar(100),
validade varchar(20),
preco float,
quantidade varchar(9),
primary key(codigo));

create table cliente(
cpf varchar(11) not null,
nome varchar(100),
idade date,
sexo char(1),
primary key(cpf));

create table fornecedora(
cnpj varchar(15) not null,
nome varchar(100),
produto varchar(45),
endereco varchar(100),
produto_codigo varchar(12),
primary key(cnpj),
foreign key (produto_codigo) references produto(codigo));
 
create table padaria(
cnpj varchar(15) not null,
nome varchar(100),
endereco varchar(100),
primary key (cnpj));

create table funcionario(
cpf varchar(11) not null,
nome varchar(100),
idade date,
sexo char(1),
padaria_cnpj varchar(15),
primary key(cpf),
foreign key(padaria_cnpj) references padaria(cnpj));

create table fatura(
id_pedido varchar(12) not null,
data_compra varchar(10),
valor_total FLOAT,
cliente_cpf varchar(11),
funcionario_cpf varchar(11),
primary key(id_pedido),
foreign key (cliente_cpf) references cliente(cpf),
foreign key(funcionario_cpf) references funcionario(cpf));

create table itensFatura(
id_pedido varchar(12) not null,
produto_codigo varchar(9) not null,
quantidade varchar(5),
valor float,
primary key(id_pedido, produto_codigo),
foreign key(id_pedido) references fatura(id_pedido),
foreign key(produto_codigo) references produto(codigo));

insert into produto value('123','arroz','31/12/2025',25.00,'200');
insert into produto value('124','feijao','02/03/2026',11.00,'300');
insert into produto value('125','batata palha','15/05/2026',12.00,'100');
insert into produto value('126','macarrao','08/09/2026',7.00,'250');


insert into cliente value('12375892811','Rodrigo','1968-05-06','M');
insert into cliente value('67183046812','Alexandre','2004-04-17','M');
insert into cliente value('21386497017','Sandra','1980-07-01','F');
insert into cliente value('84967120764','Samara','2015-12-15','F');

insert into padaria value('74264244000118','Padaria Shekina','Rua Brasil 24');
insert into padaria value('13245634000165','Padaria Avante','Rua Inglaterra 75');
insert into padaria value('19484920000184','Padaria Dom Pedro','Rua Portugal 53');
insert into padaria value('31852913000158','Padaria Valorar','Rua Suica 83');

insert into fornecedora value('32859237000148','Grãos Nobres','Arroz','Rua Bahia 31','123');
insert into fornecedora value('94123854000129','Familia Agricultora','feijao','Rua Sao Paulo 421','124');
insert into fornecedora value('49120323000164','Rei das Batatas','batata palha','Rua Acre 311','125');
insert into fornecedora value('49127582000149','Massas e Doces','macarrao','Rua Rondonia 02','126');

insert into funcionario value('83910257812','Carol','1995-06-09','F','19484920000184');
insert into funcionario value('13028518301','Joao','2005-09-22','M','74264244000118');
insert into funcionario value('48259403890','Marcela','1976-03-19','F','13245634000165');
insert into funcionario value('83381923821','Diogo','2007-06-25','M','31852913000158');

insert into fatura value('942183','09/09/2025',135.90,'12375892811','83910257812');
insert into fatura value('125830','30/12/2025',250.00,'67183046812','13028518301');
insert into fatura value('301294','5/08/2025',512.56,'21386497017','48259403890');
insert into fatura value('581203','29/09/2025',63.45,'84967120764','83381923821');

insert into itensFatura value('942183','123','10',300.00);
insert into itensFatura value('125830','124','2',24.00);
insert into itensFatura value('301294','125','5',65.00);
insert into itensFatura value('581203','126','20',140.00);

UPDATE padaria SET endereco = 'Rua Franca 71' where nome='Padaria Shekina';
UPDATE fatura SET valor_total = valor_total * 0.9 WHERE valor_total > 200.00;
DELETE FROM itensFatura where quantidade > 10;
DELETE FROM itensFatura where valor < 100.00;


select id_pedido, nome from fatura,funcionario where fatura.funcionario_cpf = funcionario.cpf order by nome;
select P.nome,P.endereco,F.nome,F.idade from padaria P,funcionario F where P.cnpj = F.padaria_cnpj order by idade;  

select nome from cliente where nome like '%ra%';

select * from fatura where valor_total between 50.00 and 200.00;

insert into funcionario value('38219422305','Rodrigo','1995-06-09','M','19484920000184');


select distinct idade from funcionario;

