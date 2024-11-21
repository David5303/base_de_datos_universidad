CREATE DATABASE universidad;
USE universidad;

CREATE TABLE estudiantes(
id_estudiante INT PRIMARY KEY  AUTO_INCREMENT,
nombre VARCHAR (100) NOT NULL, -- NOT NNULL= no puede ser nulo
apellido VARCHAR (100) NOT NULL, 
fecha_de_nacimiento DATE,
correo VARCHAR (100) UNIQUE NOT NULL, -- UNIQUE quiere decir unico 
telefono INT
);

CREATE TABLE cursos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    creditos INT NOT NULL
    );
CREATE TABLE profesores (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL,
    especialidad VARCHAR(100)
);

CREATE TABLE estudiantes_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT NOT NULL,
    curso_id INT NOT NULL,
    fecha_registro DATE,
     FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE
);

INSERT INTO estudiantes (nombre, apellido, correo, fecha_de_nacimiento)
VALUES('Juan', 'Pérez', 'juan.perez@universidad.com', '2000-05-15'),
('Ana', 'López', 'ana.lopez@universidad.com', '1999-12-20'),
('Carlos', 'Gómez', 'carlos.gomez@universidad.com', '2001-08-25');

INSERT INTO cursos (nombre, descripcion, creditos)
VALUES("Matemáticas Básicas", "Curso introductorio de matemáticas.", 4),
("Programación en Python", "Aprender los fundamentos de la programación en Python.", 3),
("Historia Universal", "Recorrido por los eventos más importantes de la historia.", 2);

INSERT INTO profesores (nombre, apellido, correo, especialidad)
VALUES('Marta', 'Rodríguez', 'marta.rodriguez@universidad.com', 'Matemáticas'),
('Luis', 'Martínez', 'luis.martinez@universidad.com', 'Programación'),
('Sofía', 'Hernández', 'sofia.hernandez@universidad.com', 'Historia');

INSERT INTO estudiantes_cursos (estudiante_id, curso_id, fecha_de_nacimineto)
VALUES(1, 1), -- Juan inscrito en Matemáticas Básicas
(1, 2), -- Juan inscrito en Programación en Python
(2, 2), -- Ana inscrita en Programación en Python
(3, 3); -- Carlos inscrito en Historia Universal


