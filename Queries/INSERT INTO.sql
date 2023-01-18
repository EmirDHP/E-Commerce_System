SELECT * FROM USUARIO;
INSERT INTO USUARIO (Nombres,Apellidos,Correo,Clave) 
VALUES ('test nombre', 'test apellido', 'test@example.com','ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae');

INSERT INTO USUARIO (Nombres,Apellidos,Correo,Clave) 
VALUES ('test 02', 'user 02', 'user02@example.com','ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae');

UPDATE USUARIO SET Activo = 0 WHERE IdUsuario = 2;

SELECT * FROM CATEGORIA;
INSERT INTO CATEGORIA (Descripcion) VALUES
('Tecnologia'),
('Muebles'),
('Dormitorio'),
('Deportes');

SELECT * FROM MARCA;
INSERT INTO MARCA (Descripcion) VALUES
('SONYTE'),
('HPTE'),
('LGTE'),
('HYUNDAITE'),
('CANONTE'),
('ROBERTA ALLENTE');

SELECT * FROM DEPARTAMENTO;
INSERT INTO DEPARTAMENTO (IdDepartamento, Descripcion) VALUES
('01','Arequipa'),
('02','Ica'),
('03','Lima');

SELECT * FROM PROVINCIA;
INSERT INTO PROVINCIA (IdProvincia, Descripcion, IdDepartamento) VALUES
('0101','Arequipa', '01'),
('0102','Camana', '01'),
-- ICA - PROVINCIAS --
('0201','Ica', '02'),
('0202','Chincha', '02'),
-- ICA - PROVINCIAS --
('0301','Lima', '03'),
('0302','Barranca', '03');

SELECT * FROM DISTRITO;
INSERT INTO DISTRITO (IdDistrito, Descripcion, IdProvincia, IdDepartamento) VALUES
('010101', 'Nieva', '0101', '01'),
('010102', 'El Cenepa', '0101', '01'),
('010201', 'Camana', '0102', '01'),
('010102', 'Jose Maria Quimper', '0102', '01'),
-- ICA - PROVINCIAS --
('020101', 'Ica', '0201', '02'),
('020102', 'La Tinguina', '0201', '02'),
('020201', 'Chincha Alta', '0202', '02'),
('020202', 'Alto Laran', '0202', '02'),
-- ICA - PROVINCIAS --
('030101', 'Nieva', '0301', '03'),
('030102', 'Ancon', '0301', '03'),
('030201', 'Barranca', '0302', '03'),
('030202', 'Paramonga', '0302', '03');