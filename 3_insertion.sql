INSERT INTO MASTER (license_number, last_name, first_name, birth_date, email, phone, specialization, hire_date)
VALUES 
('FFE-M-1001', 'Dupont', 'Jean', '1985-03-15', 'jean.dupont@ironmask.fr', '0612345678', 'Foil', '2020-01-15'),
('FFE-M-1002', 'Martin', 'Sophie', '1988-07-22', 'sophie.martin@ironmask.fr', '0623456789', 'Epee', '2019-09-01'),
('FFE-M-1003', 'Lefevre', 'Pierre', '1982-11-10', 'pierre.lefevre@ironmask.fr', '0634567890', 'Sabre', '2021-03-20'),
('FFE-M-1004', 'Bernard', 'Claire', '1990-05-30', 'claire.bernard@ironmask.fr', '0645678901', 'Foil', '2022-01-10'),
('FFE-M-1005', 'Petit', 'Thomas', '1986-09-18', 'thomas.petit@ironmask.fr', '0656789012', 'Epee', '2021-11-05');

INSERT INTO MEMBER (license_number, last_name, first_name, birth_date, age_category, address, email, phone, guardian_name, medical_cert_date, main_weapon, role, level_ranking, membership_date, membership_fee, license_type, social_security_number, master_id)
VALUES 
('FFE-100001', 'Dubois', 'Michel', '1995-04-12', 'Senior', '15 Rue de Paris, 75001 Paris', 'michel.dubois@email.com', '0712345678', NULL, '2026-01-10', 'Foil', 'Fencer', 'Regional', '2026-01-15', 250.00, 'Practitioner', '1950478123456', 1),
('FFE-100002', 'Leroy', 'Lucas', '2012-08-23', 'M13', '8 Avenue des Sports, 75015 Paris', 'lucas.leroy@email.com', '0723456789', 'Marie Leroy', '2026-01-05', 'Epee', 'Fencer', 'Beginner', '2026-01-20', 180.00, 'Practitioner', '2120898765432', 2),
('FFE-100003', 'Moreau', 'Philippe', '1965-11-30', 'Veteran', '25 Rue du Stade, 92100 Boulogne', 'philippe.moreau@email.com', '0734567890', NULL, '2026-01-12', 'Sabre', 'President', 'National', '2026-01-15', 220.00, 'Practitioner', '1650987654321', 3),
('FFE-100004', 'Fournier', 'Julie', '1998-02-17', 'Senior', '12 Rue des Fleurs, 75014 Paris', 'julie.fournier@email.com', '0745678901', NULL, '2026-01-18', 'Foil', 'Secretary', 'Regional', '2026-01-22', 250.00, 'Practitioner', '1980543210987', 4),
('FFE-100005', 'Lambert', 'Chloe', '2010-05-05', 'M15', '5 Rue de la Paix, 75002 Paris', 'chloe.lambert@email.com', '0756789012', 'Sophie Lambert', '2026-01-08', 'Epee', 'Fencer', 'Intermediate', '2026-01-18', 180.00, 'Practitioner', '2101234567890', 2),
('FFE-100006', 'Girard', 'Antoine', '1992-09-14', 'Senior', '18 Boulevard Haussmann, 75009 Paris', 'antoine.girard@email.com', '0767890123', NULL, '2026-01-25', 'Sabre', 'Treasurer', 'National', '2026-01-28', 250.00, 'Practitioner', '1920876543210', NULL),
('FFE-100007', 'Roux', 'Nathan', '2013-12-10', 'M11', '7 Rue Lafayette, 75010 Paris', 'nathan.roux@email.com', '0778901234', 'David Roux', '2026-01-20', 'Foil', 'Fencer', 'Beginner', '2026-02-01', 180.00, 'Practitioner', '2130765432109', 1),
('FFE-100008', 'Bonnet', 'Sarah', '1994-07-19', 'Senior', '3 Rue Victor Hugo, 92400 Courbevoie', 'sarah.bonnet@email.com', '0789012345', NULL, '2026-01-22', 'Epee', 'Fencer', 'Intermediate', '2026-02-05', 250.00, 'Pass', '1940654321098', 5),
('FFE-100009', 'Faure', 'Robert', '1960-03-25', 'Veteran', '10 Rue de la République, 69001 Lyon', 'robert.faure@email.com', '0790123456', NULL, '2026-01-15', 'Foil', 'Fencer', 'Regional', '2026-01-30', 220.00, 'Practitioner', '1600987654321', 4),
('FFE-100010', 'Blanc', 'Emma', '2011-06-08', 'M13', '22 Rue des Écoles, 75005 Paris', 'emma.blanc@email.com', '0701234567', 'Catherine Blanc', '2026-01-28', 'Sabre', 'Fencer', 'Beginner', '2026-02-10', 180.00, 'Practitioner', '2110876543210', 3);

INSERT INTO TRAINING_SESSION (session_day, start_time, end_time, room, weapon_taught, master_id)
VALUES 
('Monday', '17:00:00', '18:30:00', 'Salle 1 - Foil', 'Foil', 1),
('Monday', '18:30:00', '20:00:00', 'Salle 1 - Foil', 'Foil', 4),
('Tuesday', '17:00:00', '18:30:00', 'Salle 2 - Epee', 'Epee', 2),
('Tuesday', '18:30:00', '20:00:00', 'Salle 2 - Epee', 'Epee', 5),
('Wednesday', '14:00:00', '15:30:00', 'Salle 3 - Sabre', 'Sabre', 3),
('Wednesday', '15:30:00', '17:00:00', 'Salle 3 - Sabre', 'Sabre', 3),
('Thursday', '17:00:00', '18:30:00', 'Salle 1 - Foil', 'Foil', 1),
('Thursday', '18:30:00', '20:00:00', 'Salle 2 - Epee', 'Epee', 5),
('Friday', '17:00:00', '18:30:00', 'Salle 3 - Sabre', 'Sabre', 3),
('Friday', '18:30:00', '20:00:00', 'Salle 1 - Foil', 'Foil', 4),
('Saturday', '09:00:00', '10:30:00', 'Salle 2 - Epee', 'Epee', 2),
('Saturday', '10:30:00', '12:00:00', 'Salle 2 - Epee', 'Epee', 2);

INSERT INTO MEMBER_TRAINING (member_id, session_id)
VALUES 
(1, 1), (1, 7), (2, 3), (3, 5), (3, 10), (4, 2), (5, 3), (5, 11), (6, 6), (7, 1), (8, 4), (8, 8), (9, 7), (10, 9);

INSERT INTO EQUIPMENT (inventory_number, equipment_type, purchase_date, equipment_condition, deposit_amount, member_id)
VALUES 
('EP-001', 'Epee', '2024-01-15', 'Good', 50.00, 2),
('EP-002', 'Epee', '2024-01-15', 'Good', 50.00, 5),
('EP-003', 'Epee', '2024-01-15', 'To repair', 0.00, NULL),
('EP-004', 'Epee', '2024-06-20', 'New', 50.00, 8),
('EP-005', 'Epee', '2024-06-20', 'Good', 0.00, NULL),
('FO-001', 'Foil', '2024-02-10', 'Good', 40.00, 1),
('FO-002', 'Foil', '2024-02-10', 'Good', 40.00, 4),
('FO-003', 'Foil', '2024-02-10', 'Damaged', 0.00, NULL),
('FO-004', 'Foil', '2025-01-05', 'New', 40.00, 7),
('FO-005', 'Foil', '2025-01-05', 'New', 40.00, 9),
('SA-001', 'Sabre', '2024-03-05', 'Good', 45.00, 3),
('SA-002', 'Sabre', '2024-03-05', 'Good', 45.00, 6),
('SA-003', 'Sabre', '2024-03-05', 'To repair', 0.00, NULL),
('SA-004', 'Sabre', '2025-02-12', 'New', 45.00, 10),
('SA-005', 'Sabre', '2025-02-12', 'New', 0.00, NULL),
('MS-001', 'Mask', '2023-09-15', 'Good', 30.00, 1),
('MS-002', 'Mask', '2023-09-15', 'Good', 30.00, 2),
('MS-003', 'Mask', '2023-09-15', 'To repair', 0.00, NULL),
('MS-004', 'Mask', '2024-11-20', 'New', 30.00, 4),
('MS-005', 'Mask', '2024-11-20', 'New', 0.00, NULL),
('JK-001', 'Jacket', '2023-09-15', 'Good', 35.00, 3),
('JK-002', 'Jacket', '2023-09-15', 'Good', 35.00, 5),
('JK-003', 'Jacket', '2023-09-15', 'Damaged', 0.00, NULL),
('JK-004', 'Jacket', '2024-10-10', 'New', 35.00, 7),
('JK-005', 'Jacket', '2024-10-10', 'New', 0.00, NULL);

INSERT INTO COMPETITION (competition_date, result, member_id)
VALUES 
('2025-03-15', '1st', 3),
('2025-03-15', '3rd', 6),
('2025-03-15', 'Participant', 1),
('2025-03-15', '2nd', 4),
('2025-06-20', '2nd', 3),
('2025-06-20', 'Participant', 6),
('2025-06-20', 'Participant', 8),
('2025-06-20', '1st', 4),
('2025-09-10', '1st', 2),
('2025-09-10', '2nd', 5),
('2025-09-10', '3rd', 7),
('2025-09-10', 'Participant', 10),
('2026-01-25', '1st', 3),
('2026-01-25', 'Participant', 1),
('2026-01-25', '3rd', 8),
('2026-01-25', '2nd', 9);