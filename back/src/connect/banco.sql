DROP DATABASE IF EXISTS StockCar;
CREATE DATABASE IF NOT EXISTS StockCar;
USE StockCar;

CREATE TABLE clientes(
    cliente_id int(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    cpf varchar(11) NOT NULL UNIQUE,
    email varchar(255) NOT NULL UNIQUE,
    endereco varchar(255) NOT NULL,
    data_nascimento date NOT NULL,
    data_cadastro date NOT NULL   
);

CREATE TABLE telefone (
    telefone_id int(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cliente_id int(10) NOT NULL,
    numero varchar(20) NOT NULL,
    tipo_enum('residencial', 'comercial', 'celular') NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE carros (
    carros_id int(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    marca_veiculo VARCHAR(252) NOT NULL,
    modelo_veiculo VARCHAR(252) NOT NULL,
    ano_veiculo date NOT NULL,
    fabricacao_veiuclo date NOT NULL,
    cliente_id int(10) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);


INSERT INTO clientes (nome, cpf, email, endereco, data_nascimento, data_cadastro) 
VALUES 
    ('João Silva', '12345678901', 'joao.silva@email.com', 'Rua A, 123', '1985-03-12', '2024-01-15'),
    ('Maria Oliveira', '98765432100', 'maria.oliveira@email.com', 'Avenida B, 456', '1990-07-22', '2024-02-01'),
    ('Carlos Pereira', '11223344556', 'carlos.pereira@email.com', 'Rua C, 789', '1983-11-30', '2024-03-10');


INSERT INTO telefone (cliente_id, numero, tipo) 
VALUES 
   
    (1, '1134567890', 'residencial'),
    (2, '21987654321', 'celular'),
    (3, '31987654321', 'comercial');


INSERT INTO carros (marca_veiculo, modelo_veiculo, ano_veiculo, fabricacao_veiuclo, cliente_id)
VALUES 
    ('Ford', 'Fusion', '2018-01-01', '2017-10-10', 1),
    ('Chevrolet', 'Onix', '2020-01-01', '2019-12-01', 2),
    ('Volkswagen', 'Golf', '2021-01-01', '2020-11-15', 3);
