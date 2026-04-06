CREATE DATABASE consertodolele;

CREATE TABLE pecascomputador(
    id_pecas INT PRIMARY KEY AUTO_INCREMENT,
    nomepeca VARCHAR(55) NOT NULL,
    quantidade INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    fornecedor VARCHAR(55) NOT NULL,
    telefone INT NOT NULL,
    ruafornecedor VARCHAR(255) NOT NULL,
    cepfornecedor CHAR(9) NOT NULL
);

INSERT INTO pecascomputador(
    nomepeca,
    quantidade,
    valor,
    fornecedor,
    telefone,
    ruafornecedor,
    cepfornecedor
)
VALUES(
    'Memória RAM 8GB',
    15,
    220.00,
    'TechMemory',
    11988776655,
    'Rua da Tecnologia, 100',
    '01010-000'
),
(
    'HD 1TB',
    25,
    310.00,
    'Armazém Digital',
    11997654321,
    'Av. Central, 450',
    '02020-000'
),
(
    'SSD 480GB',
    40, 
    380.00,
    'FastStorage',
    11999887766,
    'Rua Velocidade, 88',
    '03030-000'
),
(
    'Placa Mãe ASUS',
    10, 
    750.00, 
    'InfoPlacas',
    11991234567,
    'Av. das Peças, 900',
    '04040-000'
),
(
    'Fonte 500W',
    30, 
    260.00, 
    'PowerTech',
    11993456789,
    'Rua Energia, 77',
    '05050-000'
),
(
    'Processador i5',
    8,
    1250.00,
    'CPU Brasil',
    11994561234,
    'Av. Intel, 123',
    '06060-000'
),
(
    'Placa de Vídeo GTX1660',
    5,
    1800.00,
    'GamerStore',
    11995678901,
    'Rua Gamer, 321',
    '07070-000'
),
(
    'Teclado Mecânico',
    50, 
    350.00,
    'Periféricos SP',
    11996789012,
    'Av. dos Acessórios, 55',
    '08080-000'
),
(
    'Mouse Óptico',
    60, 
    120.00,
    'Periféricos SP',
    11996789012,
    'Av. dos Acessórios, 55',
    '08080-000'
),
(
    'Cooler para CPU',
    22, 
    190.00, 
    'RefrigTech',
    11997890123,
    'Rua do Resfriamento, 9',
    '09090-000'
);

SELECT *
FROM pecascomputador;

SELECT fornecedor, telefone
FROM pecascomputador;

SELECT *
FROM pecascomputador
WHERE quantidade>20;

SELECT *
FROM pecascomputador
WHERE quantidade > 10
AND valor >320.00;

SELECT *
FROM pecascomputador
WHERE nomepeca = 'Mouse Óptico'
OR fornecedor = 'Periféricos SP';

SELECT *
FROM pecascomputador
WHERE fornecedor LIKE '%Tech%';

SELECT *
FROM pecascomputador
ORDER BY valor ASC;

SELECT *
FROM pecascomputador
ORDER BY valor DESC;

SELECT *
FROM pecascomputador
ORDER BY valor DESC
LIMIT 4;

CREATE TABLE pedidocliente(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefone INT NOT NULL,
    id_produto INT NOT NULL,
    FOREIGN KEY (id_produto)
        REFERENCES pecascomputador(id_pecas)
)

INSERT INTO pedidocliente(
    nome,
    sobrenome,
    email,
    telefone,
    id_produto
)
VALUES
(
    'Ana', 
    'Silva',
    'ana.silva@email.com',
    11988887777,
    3
),
(
    'Carlos',
    'Souza',
    'carlos.souza@email.com',
    11999998888,
    6
),
(
    'Mariana',
    'Oliveira',
    'mariana.oliveira@email.com',
    11977776666,
    1
),
(
    'João',
    'Pereira',
    'joao.pereira@email.com',
    11966665555,
    10
),
(
    'Fernanda',
    'Costa',
    'fernanda.costa@email.com',
    11955554444,
    8
);

SELECT 
    c.email,
    p.nomepeca,
    p.quantidade
FROM pedidocliente c
INNER JOIN pecascomputador p
ON c.id_produto = p.id_peca 
WHERE 1 = 1
ORDER BY c.email;


CREATE USER 'usuario123'@'localhost'
IDENTIFIED BY 'Senha987';

GRANT SELECT 
ON pecascomputador.*
TO 'usuario123'@'localhost';

REVOKE SELECT
ON pecascomputador.*
FROM 'usuario123'@'localhost';

DROP USER 'usuario123'@'localhost';


