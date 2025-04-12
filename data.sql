INSERT INTO Estados (id, estado) VALUES
(1, 'Pendiente'),
(2, 'Aprobado'),
(3, 'Cancelado');

INSERT INTO Categorias (id, categoria, precio) VALUES
(1, 'VIP', 150.00),
(2, 'Platino', 100.00),
(3, 'General', 50.00);

INSERT INTO Usuarios (id, nombre, correo, numero) VALUES
(1, 'Juan Perez', 'juan@example.com', '1234567890'),
(2, 'Maria Gomez', 'maria@example.com', '0987654321'),
(3, 'Carlos Silva', 'carlos@example.com', '1122334455'),
(4, 'Ana Lopez', 'ana@example.com', '5566778899');

INSERT INTO Lugares (id, lugar, direccion, capacidad) VALUES
(1, 'Teatro Central', 'Av. Principal 123', 500),
(2, 'Estadio Olimpico', 'Calle Deportiva 456', 1000),
(3, 'Sala de Conciertos', 'Boulevard Musical 789', 300);

INSERT INTO Eventos (id, lugar_id, evento, descripcion, fecha_evento) VALUES
(1, 1, 'Concierto Rock', 'Concierto de rock con banda local', '2025-05-10 20:00:00'),
(2, 2, 'Partido Amistoso', 'Partido de fútbol amistoso', '2025-06-15 18:00:00'),
(3, 3, 'Recital de Piano', 'Piezas clásicas y contemporáneas', '2025-07-01 19:30:00'),
(4, 1, 'Presentación de Danza', 'Compañía de danza contemporánea', '2025-06-01 18:00:00');

INSERT INTO Asientos (id, lugar_id, categoria_id, ubicacion) VALUES
(1, 1, 1, 'F1:1'),
(2, 1, 1, 'F1:2'),
(3, 1, 2, 'F2:1'),
(4, 1, 2, 'F2:2'),
(5, 1, 3, 'F3:1'),
(6, 1, 3, 'F3:2'),
(7, 1, 3, 'F3:3'),
(8, 1, 3, 'F3:4'),
(9, 2, 1, 'F1:1'),
(10, 2, 1, 'F1:2'),
(11, 2, 2, 'F2:1'),
(12, 2, 2, 'F2:2'),
(13, 2, 3, 'F3:1'),
(14, 2, 3, 'F3:2'),
(15, 2, 3, 'F3:3'),
(16, 2, 3, 'F3:4'),
(17, 3, 1, 'F1:1'),
(18, 3, 1, 'F1:2'),
(19, 3, 2, 'F2:1'),
(20, 3, 2, 'F2:2'),
(21, 3, 3, 'F3:1'),
(22, 3, 3, 'F3:2'),
(23, 3, 3, 'F3:3'),
(24, 3, 3, 'F3:4'),
(25, 1, 1, 'F4:1'),
(26, 1, 1, 'F4:2'),
(27, 1, 1, 'F4:3'),
(28, 1, 1, 'F4:4'),
(29, 1, 2, 'F5:1'),
(30, 1, 2, 'F5:2'),
(31, 1, 2, 'F5:3'),
(32, 1, 2, 'F5:4'),
(33, 1, 3, 'F6:1'),
(34, 1, 3, 'F6:2'),
(35, 1, 3, 'F6:3'),
(36, 1, 3, 'F6:4'),
(37, 1, 1, 'F7:1'),
(38, 1, 1, 'F7:2'),
(39, 1, 1, 'F7:3'),
(40, 1, 1, 'F7:4'),
(41, 1, 2, 'F8:1'),
(42, 1, 2, 'F8:2'),
(43, 1, 2, 'F8:3'),
(44, 1, 2, 'F8:4'),
(45, 2, 1, 'F4:1'),
(46, 2, 1, 'F4:2'),
(47, 2, 1, 'F4:3'),
(48, 2, 1, 'F4:4'),
(49, 2, 2, 'F5:1'),
(50, 2, 2, 'F5:2'),
(51, 2, 2, 'F5:3'),
(52, 2, 2, 'F5:4'),
(53, 2, 3, 'F6:1'),
(54, 2, 3, 'F6:2'),
(55, 2, 3, 'F6:3'),
(56, 2, 3, 'F6:4'),
(57, 2, 1, 'F7:1'),
(58, 2, 1, 'F7:2'),
(59, 2, 1, 'F7:3'),
(60, 2, 1, 'F7:4'),
(61, 2, 2, 'F8:1'),
(62, 2, 2, 'F8:2'),
(63, 2, 2, 'F8:3'),
(64, 2, 2, 'F8:4'),
(65, 3, 1, 'F4:1'),
(66, 3, 1, 'F4:2'),
(67, 3, 1, 'F4:3'),
(68, 3, 1, 'F4:4'),
(69, 3, 2, 'F5:1'),
(70, 3, 2, 'F5:2'),
(71, 3, 2, 'F5:3'),
(72, 3, 2, 'F5:4'),
(73, 3, 3, 'F6:1'),
(74, 3, 3, 'F6:2'),
(75, 3, 3, 'F6:3'),
(76, 3, 3, 'F6:4'),
(77, 3, 1, 'F7:1'),
(78, 3, 1, 'F7:2'),
(79, 3, 1, 'F7:3'),
(80, 3, 1, 'F7:4'),
(81, 3, 2, 'F8:1'),
(82, 3, 2, 'F8:2'),
(83, 3, 2, 'F8:3'),
(84, 3, 2, 'F8:4');

INSERT INTO Reservas (id, usuario_id, evento_id, estado_id, precio_total, creado_en, actualizado_en) VALUES
(1, 1, 1, 1, 300.00, '2025-05-01 10:00:00', '2025-05-01 10:00:00'),
(2, 2, 1, 2, 100.00, '2025-05-02 11:00:00', '2025-05-02 11:30:00'),
(3, 1, 2, 1, 150.00, '2025-05-05 09:00:00', '2025-05-05 09:15:00'),
(4, 3, 3, 2, 200.00, '2025-05-06 14:00:00', '2025-05-06 14:05:00'),
(5, 4, 4, 1, 400.00, '2025-05-07 16:00:00', '2025-05-07 16:00:00'),
(6, 2, 4, 1, 200.00, '2025-05-08 10:00:00', '2025-05-08 10:00:00'),
(7, 4, 1, 2, 150.00, '2025-05-08 12:00:00', '2025-05-08 12:30:00');

INSERT INTO ReservaDetalle (id, reserva_id, asiento_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 9),
(5, 3, 10),
(6, 4, 17),
(7, 4, 18),
(8, 5, 7),
(9, 5, 8),
(10, 1, 5),
(11, 1, 6),
(12, 2, 4),
(13, 3, 11),
(14, 3, 12),
(15, 4, 19),
(16, 4, 20),
(17, 5, 25),
(18, 5, 26),
(19, 6, 27),
(20, 6, 28),
(21, 7, 29),
(22, 7, 30);