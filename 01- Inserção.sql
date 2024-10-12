use loja
go


INSERT INTO DBO.USUARIOS ([login], SENHA) VALUES ('OP1', 'OP1')
GO
INSERT INTO DBO.USUARIOS ([login], SENHA) VALUES ('OP2', 'OP2')
GO

INSERT INTO dbo.Produtos (Nome, Quantidade, PrecoVenda) 
VALUES 
('Banana', 100, 5.00),
('Laranja', 500, 2.00),
('Manga', 800, 4.00)


/*************************************************************** PESSOA FISICA *******************************/
DECLARE @PessoaID INT;
SET @PessoaID = NEXT VALUE FOR Seq_PessoaID;

INSERT INTO PessoasFisicas (PessoaID, Nome, logradouro, cidade, estado, Telefone, Email, cpf) 
VALUES (@PessoaID, 'jOAO', 'RUA 12, CASA 3, QUITANDA', 'RIACHO DO NORTE', 'PA', '1111-1111','JOAO@RIACHO.com.br','11111111111');

/*************************************************************** PESSOA JURIDICA *******************************/
DECLARE @PessoaID INT;
SET @PessoaID = NEXT VALUE FOR Seq_PessoaID;

INSERT INTO PessoasJuridicas (PessoaID, Nome, logradouro, cidade, estado, Telefone, Email, cnpj) 
VALUES (@PessoaID, 'JJC', 'RUA 11, CENTRO', 'RIACHO DO NORTE', 'PA', '1212-1212','Empresa@xyz.com.br','22222222222222');

/*************************************************************** GERANDO ALGUNS MOTIVMENTOS *******************************/
INSERT INTO Movimentos (UsuarioID, PessoaID, ProdutoID, Quantidade, Tipo, PrecoUnitario, DataMovimento)
VALUES 
(1, 8, 1, 20, 'S', 4.00, getdate()), 
(1, 8, 3, 15, 'S', 2.00, getdate()),  
(2, 8, 3, 10, 'S', 3.00, getdate()),  
(1, 9, 3, 15, 'E', 5.00, getdate()),  
(1, 9, 3, 20, 'E', 4.00, getdate())


