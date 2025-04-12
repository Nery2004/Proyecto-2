CREATE TABLE Usuarios (
  id int PRIMARY KEY,
  nombre varchar(100) NOT NULL,
  correo varchar(100) NOT NULL,
  numero varchar(100) NOT NULL
);

CREATE TABLE Estados (
  id int PRIMARY KEY,
  estado varchar(100) NOT NULL
);

CREATE TABLE Lugares (
  id int PRIMARY KEY,
  lugar varchar(100) NOT NULL,
  direccion varchar(100) NOT NULL,
  capacidad int NOT NULL
);

CREATE TABLE Categorias (
  id int PRIMARY KEY,
  categoria varchar(100) NOT NULL,
  precio decimal(10,2) NOT NULL
);

CREATE TABLE Eventos (
  id int PRIMARY KEY,
  lugar_id int NOT NULL,
  evento varchar(100) NOT NULL,
  descripcion text NOT NULL,
  fecha_evento datetime
);

CREATE TABLE Asientos (
  id int PRIMARY KEY,
  lugar_id int NOT NULL,
  categoria_id int NOT NULL,
  ubicacion varchar(100)
);

CREATE TABLE Reservas (
  id int PRIMARY KEY,
  usuario_id int NOT NULL,
  evento_id int NOT NULL,
  estado_id int NOT NULL,
  precio_total decimal(10,2) NOT NULL,
  creado_en datetime NOT NULL,
  actualizado_en datetime NOT NULL
);

CREATE TABLE ReservaDetalle (
  id int PRIMARY KEY,
  reserva_id int NOT NULL,
  asiento_id int NOT NULL
);

ALTER TABLE Eventos ADD FOREIGN KEY (lugar_id) REFERENCES Lugares (id);

ALTER TABLE Asientos ADD FOREIGN KEY (lugar_id) REFERENCES Lugares (id);

ALTER TABLE Asientos ADD FOREIGN KEY (categoria_id) REFERENCES Categorias (id);

ALTER TABLE Reservas ADD FOREIGN KEY (usuario_id) REFERENCES Usuarios (id);

ALTER TABLE Reservas ADD FOREIGN KEY (evento_id) REFERENCES Eventos (id);

ALTER TABLE Reservas ADD FOREIGN KEY (estado_id) REFERENCES Estados (id);

ALTER TABLE ReservaDetalle ADD FOREIGN KEY (reserva_id) REFERENCES Reservas (id);

ALTER TABLE ReservaDetalle ADD FOREIGN KEY (asiento_id) REFERENCES Asientos (id);
