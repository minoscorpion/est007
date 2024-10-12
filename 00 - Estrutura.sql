use loja
go

CREATE SEQUENCE Seq_PessoaID
AS INT
START WITH 1
INCREMENT BY 1;

CREATE TABLE dbo.Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    [login] NVARCHAR(100) NOT NULL,
    senha NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE dbo.Produtos (
    ProdutoID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL,
    Quantidade INT NOT NULL, 
    PrecoVenda DECIMAL(10, 2) NOT NULL
);
GO


CREATE TABLE dbo.Pessoas (
    PessoaID INT PRIMARY KEY DEFAULT NEXT VALUE FOR Seq_PessoaID,
    Nome NVARCHAR(100) NOT NULL,
    Endereco NVARCHAR(200) NOT NULL,
    Telefone NVARCHAR(20),
    Email NVARCHAR(100)
);
GO

drop table Pessoasjuridicas


CREATE TABLE dbo.PessoasFisicas (
    PessoaID INT PRIMARY KEY,
	Nome NVARCHAR(100) NOT NULL,
    Endereco NVARCHAR(200) NOT NULL,
    Telefone NVARCHAR(20),
    Email NVARCHAR(100),
    CPF CHAR(11) NOT NULL UNIQUE,
    CONSTRAINT FK_PessoaFisica_Pessoa FOREIGN KEY (PessoaID) REFERENCES Pessoas(PessoaID)
);
GO

CREATE TABLE dbo.PessoasJuridicas (
    PessoaID INT PRIMARY KEY,
    CNPJ CHAR(14) NOT NULL UNIQUE,
    CONSTRAINT FK_PessoaJuridica_Pessoa FOREIGN KEY (PessoaID) REFERENCES Pessoas(PessoaID)
);
GO


CREATE TABLE dbo.Movimentos (
    MovimentoID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT NOT NULL,
    ProdutoID INT NOT NULL,
    PessoaID INT NOT NULL,
    Quantidade INT NOT NULL CHECK (Quantidade > 0),
	Tipo varchar(1) not null,
    PrecoUnitario DECIMAL(10, 2) NOT NULL CHECK (PrecoUnitario > 0),
    DataMovimento DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Movimento_Usuario FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    CONSTRAINT FK_Movimento_Produto FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID),
    CONSTRAINT FK_Movimento_PessoaJuridica FOREIGN KEY (PessoaID) REFERENCES PessoasJuridicas(PessoaID),
	CONSTRAINT FK_Movimento_PessoaFisica FOREIGN KEY (PessoaID) REFERENCES PessoasFisicas(PessoaID)
);
GO
