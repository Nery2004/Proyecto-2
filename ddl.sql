CREATE TABLE Usuarios (
  id int SERIAL PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  correo varchar(50) NOT NULL,
  numero varchar(50) NOT NULL
);

CREATE TABLE Estados (
  id int SERIAL PRIMARY KEY,
  estado varchar(50) NOT NULL
);

CREATE TABLE Lugares (
  id int SERIAL PRIMARY KEY,
  lugar varchar(50) NOT NULL,
  direccion varchar(100) NOT NULL,
  capacidad int NOT NULL
);

CREATE TABLE Categorias (
  id int SERIAL PRIMARY KEY,
  categoria varchar(50) NOT NULL,
  precio decimal(10,2) NOT NULL
);

CREATE TABLE Eventos (
  id int SERIAL PRIMARY KEY,
  lugar_id int NOT NULL,
  evento varchar(50) NOT NULL,
  descripcion text NOT NULL,
  fecha_evento timestamp NOT NULL default current_timestamp,
);

CREATE TABLE Asientos (
  id int SERIAL PRIMARY KEY,
  lugar_id int NOT NULL,
  categoria_id int NOT NULL,
  ubicacion varchar(100)
);

CREATE TABLE Reservas (
  id int SERIAL PRIMARY KEY,
  usuario_id int NOT NULL,
  evento_id int NOT NULL,
  estado_id int NOT NULL,
  precio_total decimal(10,2) NOT NULL,
  creado_en timestamp NOT NULL default current_timestamp,
  actualizado_en timestamp NOT NULL  default current_timestamp
);

CREATE TABLE ReservaDetalle (
  id int SERIAL PRIMARY KEY,
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
