create database myfinance;
use myfinance;
create table PLANOCONTA(
	id int not null identity(1,1),
	nome varchar(500) not null,
	tipo char(1) not null,
	primary key(id)
);

create table TRANSACAO(
	id int not null identity(1,1),
	data datetime not null,
	valor decimal(9,2),
	historico varchar(500),
	tipo char(1) not null,
	planocontaid int not null,
	primary key(id),
	foreign key (planocontaid) references PLANOCONTA(id)
);

INSERT INTO planoconta (nome, tipo) VALUES 
('Receitas Operacionais', 'C'),
('Despesas Administrativas', 'D'),
('Salários e Ordenados', 'D'),
('Vendas de Produtos', 'C'),
('Aluguel de Imóveis', 'D'),
('Fornecedores a Pagar', 'C'),
('Serviços Contratados', 'D'),
('Investimentos em Ativos', 'D'),
('Recebimento de Clientes', 'C'),
('Manutenção de Equipamentos', 'D');

UPDATE planoconta
SET tipo = 'R'
WHERE tipo = 'C';

INSERT INTO transacao (data, valor, historico, tipo, planocontaid) VALUES
(GETDATE(), 120.50, 'Compra de Material de Escritório', 'D', 2),
(GETDATE(), 350.00, 'Venda de Equipamento Usado', 'R', 3),
(GETDATE(), 75.20, 'Almoço com Cliente', 'D', 4),
(GETDATE(), 980.00, 'Pagamento de Fornecedor', 'D', 5),
(GETDATE(), 5000.00, 'Recebimento de Venda', 'R', 6),
(GETDATE(), 45.80, 'Abastecimento de Veículo', 'D', 10),
(GETDATE(), 220.00, 'Serviço de Manutenção', 'D', 4),
(GETDATE(), 1500.00, 'Adiantamento de Cliente', 'R', 3),
(GETDATE(), 620.00, 'Pagamento de Salários', 'D', 7),
(GETDATE(), 300.00, 'Recebimento de Aluguel', 'R', 2);


select id from planoconta

UPDATE transacao
SET data = DATEFROMPARTS(
    YEAR(data), -- Mantém o ano original
    (ABS(CHECKSUM(NEWID())) % 12) + 1, 
    (ABS(CHECKSUM(NEWID())) % 28) + 1 
);
