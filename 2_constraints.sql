ALTER TABLE MEMBER
ADD CONSTRAINT check_age_category_valid
CHECK (age_category IN ('M9', 'M11', 'M13', 'M15', 'M17', 'Senior', 'Veteran'));

ALTER TABLE MEMBER
ADD CONSTRAINT check_main_weapon_valid
CHECK (main_weapon IN ('Foil', 'Epee', 'Sabre') OR main_weapon IS NULL);

ALTER TABLE MEMBER
ADD CONSTRAINT check_role_valid
CHECK (role IN ('President', 'Secretary', 'Treasurer', 'Master of Arms', 'Fencer') OR role IS NULL);

ALTER TABLE MEMBER
ADD CONSTRAINT check_membership_fee_positive
CHECK (membership_fee >= 0);

ALTER TABLE MEMBER
ADD CONSTRAINT check_medical_cert_date_not_future
CHECK (medical_cert_date <= CURRENT_DATE OR medical_cert_date IS NULL);

ALTER TABLE MEMBER
ADD CONSTRAINT check_minor_guardian
CHECK (
    (TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) < 18 AND guardian_name IS NOT NULL AND guardian_name != '')
    OR 
    (TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) >= 18)
);

ALTER TABLE MEMBER
ADD CONSTRAINT check_membership_date_not_future
CHECK (membership_date <= CURRENT_DATE);

ALTER TABLE MEMBER
ADD CONSTRAINT check_email_format
CHECK (
    email IS NULL OR 
    email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
);

ALTER TABLE MASTER
ADD CONSTRAINT check_master_specialization_valid
CHECK (specialization IN ('Foil', 'Epee', 'Sabre') OR specialization IS NULL);

ALTER TABLE MASTER
ADD CONSTRAINT check_hire_date_not_future
CHECK (hire_date <= CURRENT_DATE);

ALTER TABLE EQUIPMENT
ADD CONSTRAINT check_equipment_condition_valid
CHECK (equipment_condition IN ('New', 'Good', 'To repair', 'Damaged'));

ALTER TABLE EQUIPMENT
ADD CONSTRAINT check_equipment_type_valid
CHECK (equipment_type IN ('Mask', 'Jacket', 'Epee', 'Foil', 'Sabre', 'Uniform', 'Lame', 'Bodywire', 'Glove'));

ALTER TABLE EQUIPMENT
ADD CONSTRAINT check_deposit_amount_positive
CHECK (deposit_amount >= 0);

ALTER TABLE EQUIPMENT
ADD CONSTRAINT check_purchase_date_not_future
CHECK (purchase_date <= CURRENT_DATE);

ALTER TABLE TRAINING_SESSION
ADD CONSTRAINT check_session_day_valid
CHECK (session_day IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'));

ALTER TABLE TRAINING_SESSION
ADD CONSTRAINT check_session_weapon_valid
CHECK (weapon_taught IN ('Foil', 'Epee', 'Sabre'));

ALTER TABLE TRAINING_SESSION
ADD CONSTRAINT check_session_times_valid
CHECK (end_time > start_time);

ALTER TABLE TRAINING_SESSION
ADD CONSTRAINT unique_session_room_day_time 
UNIQUE (session_day, room, start_time);

CREATE INDEX idx_member_last_name ON MEMBER(last_name);
CREATE INDEX idx_member_age_category ON MEMBER(age_category);
CREATE INDEX idx_equipment_member ON EQUIPMENT(member_id);
CREATE INDEX idx_training_session_day ON TRAINING_SESSION(session_day);
CREATE INDEX idx_competition_member ON COMPETITION(member_id);
CREATE INDEX idx_competition_date ON COMPETITION(competition_date);
CREATE INDEX idx_member_master ON MEMBER(master_id);
CREATE INDEX idx_member_training_member ON MEMBER_TRAINING(member_id);
CREATE INDEX idx_member_training_session ON MEMBER_TRAINING(session_id);






