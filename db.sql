CREATE DATABASE petshop_db;
USE petshop_db;

CREATE TABLE cliente(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    telefone INT(11) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE pet(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especie ENUM('canino', 'felinos', 'pássaro', 'marinhos', 'roedores', 'répteis', 'anfíbios') NOT NULL,
    porte ENUM('mini','pequeno', 'médio', 'grande', 'gigante') NOT NULL,
    nascimento DATE NOT NULL,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE serviço(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    preço DECIMAL(10,2) NOT NULL CHECK (preco >= 0),
    duracao_min DATETIME UNSIGNED NOT NULL
);

CREATE TABLE agendamento(
	id INT AUTO_INCREMENT PRIMARY KEY,
    observacoes VARCHAR(100) NOT NULL,
    status ENUM('agendado', 'concluido', 'cancelado') NOT NULL,
    data_hora DATETIME NOT NULL,
    
    pet_id INT,
    FOREIGN KEY (pet_id) REFERENCES pet(id),
    servico_id INT,
    FOREIGN KEY (servico_id) REFERENCES servico(id)
);