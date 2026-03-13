CREATE SCHEMA ironmask;
USE ironmask;

DROP TABLE IF EXISTS MEMBER_TRAINING CASCADE;
DROP TABLE IF EXISTS COMPETITION CASCADE;
DROP TABLE IF EXISTS EQUIPMENT CASCADE;
DROP TABLE IF EXISTS TRAINING_SESSION CASCADE;
DROP TABLE IF EXISTS MEMBER CASCADE;


CREATE TABLE MASTER (
    id_master SERIAL PRIMARY KEY,
    license_number VARCHAR(15) UNIQUE NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    email VARCHAR(80),
    phone VARCHAR(15),
    specialization VARCHAR(30),
    hire_date DATE NOT NULL
);


CREATE TABLE MEMBER (
    id_member SERIAL PRIMARY KEY,
    license_number VARCHAR(15) UNIQUE NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    age_category VARCHAR(10) NOT NULL,
    address VARCHAR(150),
    email VARCHAR(80),
    phone VARCHAR(15),
    guardian_name VARCHAR(100),
    medical_cert_date DATE,
    main_weapon VARCHAR(15),
    role VARCHAR(30),
    level_ranking VARCHAR(30),
    membership_date DATE NOT NULL,
    membership_fee DECIMAL(5,2) NOT NULL,
    license_type VARCHAR(20),
    social_security_number VARCHAR(15),
    master_id INTEGER,
    
    -- Foreign key constraint
    FOREIGN KEY (master_id) REFERENCES MASTER(id_master)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


CREATE TABLE EQUIPMENT (
    id_equipment SERIAL PRIMARY KEY,
    inventory_number VARCHAR(10) UNIQUE NOT NULL,
    equipment_type VARCHAR(30) NOT NULL,
    purchase_date DATE NOT NULL,
    equipement_condition VARCHAR(15) NOT NULL,
    deposit_amount DECIMAL(5,2) DEFAULT 0,
    member_id INTEGER,
    
    -- Foreign key constraint
    FOREIGN KEY (member_id) REFERENCES MEMBER(id_member)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


CREATE TABLE COMPETITION (
    id_competition SERIAL PRIMARY KEY,
    competition_date DATE NOT NULL,
    result VARCHAR(20),
    member_id INTEGER NOT NULL,
    
    -- Foreign key constraint
    FOREIGN KEY (member_id) REFERENCES MEMBER(id_member)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE TRAINING_SESSION (
    id_session SERIAL PRIMARY KEY,
    session_day VARCHAR(8) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    room VARCHAR(30) NOT NULL,
    weapon_taught VARCHAR(15) NOT NULL,
    master_id INTEGER NOT NULL,
    
    FOREIGN KEY (master_id) REFERENCES MASTER(id_master)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE MEMBER_TRAINING (
    member_id INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    
    PRIMARY KEY (member_id, session_id),
    
    FOREIGN KEY (member_id) REFERENCES MEMBER(id_member)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (session_id) REFERENCES TRAINING_SESSION(id_session)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);





