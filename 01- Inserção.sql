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

INSERT INTO Pessoa(PessoaID, Nome, logradouro, cidade, estado, Telefone, Email) 
VALUES (@PessoaID, 'jOAO', 'RUA 12, CASA 3, QUITANDA', 'RIACHO DO NORTE', 'PA', '1111-1111','JOAO@RIACHO.com.br');

INSERT INTO PessoasFisicas  (PessoaID, cpf) 
VALUES (@PessoaID, '11111111111');

/*************************************************************** PESSOA JURIDICA *******************************/
DECLARE @PessoaID INT;
SET @PessoaID = NEXT VALUE FOR Seq_PessoaID;

INSERT INTO Pessoa (PessoaID, Nome, logradouro, cidade, estado, Telefone, Email) 
VALUES (@PessoaID, 'JJC', 'RUA 11, CENTRO', 'RIACHO DO NORTE', 'PA', '1212-1212','Empresa@xyz.com.br');

INSERT INTO PessoasJuridicas (PessoaID, cnpj) 
VALUES (@PessoaID, '22222222222222');
/*************************************************************** GERANDO ALGUNS MOTIVMENTOS *******************************/
INSERT INTO Movimentos (UsuarioID, PessoaID, ProdutoID, Quantidade, Tipo, PrecoUnitario, DataMovimento)
VALUES 
(1, 1, 1, 20, 'S', 4.00, getdate()), 
(1, 1, 3, 15, 'S', 2.00, getdate()),  
(2, 1, 3, 10, 'S', 3.00, getdate()),  
(1, 2, 3, 15, 'E', 5.00, getdate()),  
(1, 2, 3, 20, 'E', 4.00, getdate())


