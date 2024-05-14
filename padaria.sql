CREATE DATABASE PADARIA_DADOS;

USE PADARIA_DADOS;

CREATE TABLE padaria (
  PadariaID INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(30) NOT NULL,
  Email VARCHAR(40) NOT NULL,
  Telefone VARCHAR(20) NOT NULL,
  Endereco VARCHAR(40) NOT NULL
);

CREATE TABLE fornecedor (
	FornecedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Endereco VARCHAR(40) NOT NULL,
    Cnpj VARCHAR(30) NOT NULL,
    Telefone VARCHAR (20) NOT NULL,
    PadariaID INT, 
    FOREIGN KEY(PadariaID) REFERENCES padaria(PadariaID)
);

CREATE TABLE fornecimento (
	FornecimentoID INT AUTO_INCREMENT PRIMARY KEY,
    FornecedorID INT,
    Nome VARCHAR(30),
    Tipo VARCHAR(30),
    Data_Fornecimento DATETIME,
    FOREIGN KEY (FornecedorID) REFERENCES fornecedor(FornecedorID)
);

CREATE TABLE estoque (
	EstoqueID INT AUTO_INCREMENT PRIMARY KEY,
    FornecimentoID INT,
    Quantidade INT,
    Data_Atualizacao DATETIME,
    FOREIGN KEY (FornecimentoID) REFERENCES fornecimento(FornecimentoID)
);

CREATE TABLE insumo ( 
	InsumoID INT AUTO_INCREMENT PRIMARY KEY,
    FornecedorID INT,
    FornecimentoID INT,
    EstoqueID INT,
    Tipo VARCHAR(30),
    Valor FLOAT,
    FOREIGN KEY (FornecedorID) REFERENCES fornecedor(FornecedorID),
    FOREIGN KEY (FornecimentoID) REFERENCES fornecimento(FornecimentoID),
    FOREIGN KEY (EstoqueID) REFERENCES estoque(EstoqueID)
);

CREATE TABLE funcionario ( 
	FuncionarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30),
    Endereco VARCHAR(50),
    Cpf VARCHAR(20),
    Cargo VARCHAR(20),
    PadariaID INT,
    FOREIGN KEY (PadariaID) REFERENCES padaria(PadariaID)
);

CREATE TABLE producao ( 
	ProducaoID INT AUTO_INCREMENT PRIMARY KEY,
    InsumoID INT,
    FuncionarioID INT,
    EstoqueID INT,
    Tipo VARCHAR(30),
    Data_Inicio DATETIME,
    Validade DATETIME,
    Nome VARCHAR(30),
    FOREIGN KEY (InsumoID) REFERENCES insumo(InsumoID),
    FOREIGN KEY (FuncionarioID) REFERENCES funcionario(FuncionarioID),
    FOREIGN KEY (EstoqueID) REFERENCES estoque(EstoqueID)
);

CREATE TABLE produto (
	ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    FuncionarioID INT,
    EstoqueID INT,
    FornecimentoID INT,
    ProducaoID INT,
    Nome VARCHAR(30),
    Preco DECIMAL(10,2),
    FOREIGN KEY (FuncionarioID) REFERENCES funcionario(FuncionarioID),
    FOREIGN KEY (EstoqueID) REFERENCES estoque(EstoqueID),
    FOREIGN KEY (FornecimentoID) REFERENCES fornecimento(FornecimentoID),
    FOREIGN KEY (ProducaoID) REFERENCES producao(ProducaoID)
);

CREATE TABLE cliente ( 
	ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    PadariaID INT,
    Nome VARCHAR(30),
    Cpf VARCHAR(20),
    Endereco VARCHAR(40),
    Telefone VARCHAR(30),
    FOREIGN KEY (PadariaID) REFERENCES padaria(PadariaID)
);

CREATE TABLE pedido (
	PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    ProdutoID INT,
    PadariaID INT,
    Data_Pedido DATETIME,
    Valor DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES cliente(ClienteID),
    FOREIGN KEY (ProdutoID) REFERENCES produto(ProdutoID),
    FOREIGN KEY (PadariaID) REFERENCES padaria(PadariaID)
);

INSERT INTO padaria (Nome, Email, Telefone, Endereco)
VALUES ('Pão da Vitória', 'padadvitoria@gmail.com', '(83) 3245-6789', 'Rua da Paz, 100');
INSERT INTO padaria (Nome, Email, Telefone, Endereco)
VALUES ('Delícias do Vale', 'deliciasdovale@hotmail.com', '(83) 3541-2398', 'Avenida Santos Dumont, 500');

INSERT INTO fornecedor (Nome, Endereco, Cnpj, Telefone, PadariaID)
VALUES ('Moinhos da Serra', 'Rua do trigo, 1000', '12.345.678/0001-10', '(83) 3211-9876', 1);
INSERT INTO fornecedor (Nome, Endereco, Cnpj, Telefone, PadariaID)
VALUES ('Laticínios do Campo', 'Rua da Vaca Feliz, 500', '87.654.321/0001-90', '(83) 3548-7852', 2);

INSERT INTO fornecimento (FornecedorID, Nome, Tipo, Data_Fornecimento)
VALUES (1, 'Farinha de Trigo', 'Mantamentos', '2024-05-10');
INSERT INTO fornecimento (FornecedorID, Nome, Tipo, Data_Fornecimento)
VALUES (2, 'Leite Pasteurizado', 'Laticínios', '2024-05-13');

INSERT INTO estoque (FornecimentoID, Quantidade, Data_Atualizacao)
VALUES (1, 100, '2024-05-10');
INSERT INTO estoque (FornecimentoID, Quantidade, Data_Atualizacao)
VALUES (2, 50, '2024-05-13');

INSERT INTO insumo (FornecedorID, FornecimentoID, Tipo, Valor)
VALUES (1, 1, 'Farinha de Trigo', 25.50);
INSERT INTO insumo (FornecedorID, FornecimentoID, Tipo, Valor)
VALUES (2, 2, 'Leite Pasteurizado', 5.75);

INSERT INTO funcionario (Nome, Endereco, Cpf, Cargo, PadariaID)
VALUES ('Joana Silva', 'Rua das Flores, 200', '000.111.222-33', 'パン職人 (Pan Shokunin - Baker)', 1);
INSERT INTO funcionario (Nome, Endereco, Cpf, Cargo, PadariaID)
VALUES ('Miguel Souza', 'Avenida Brasil, 900', '111.222.333-44', 'Atendente', 2);

INSERT INTO producao (InsumoID, FuncionarioID, EstoqueID, Tipo, Data_Inicio, Validade, Nome)
VALUES (1, 1, 1, 'Pão Francês', '2024-05-11', '2024-05-14', 'Baguete');

INSERT INTO produto (FuncionarioID, EstoqueID, FornecimentoID, ProducaoID, Nome, Preco, Quantidade)
VALUES (2, 3, NULL, 3, 'Pão Doce', 2.20, 12);




 














