CREATE SCHEMA ironmask;
USE ironmask;

DROP TABLE IF EXISTS MEMBER_TRAINING;

DROP TABLE IF EXISTS COMPETITION;
DROP TABLE IF EXISTS EQUIPMENT;
DROP TABLE IF EXISTS TRAINING_SESSION;
DROP TABLE IF EXISTS MEMBER;


DROP TABLE IF EXISTS MASTER;


CREATE TABLE MASTER (
    id_master INT AUTO_INCREMENT PRIMARY KEY,
    license_number VARCHAR(15) UNIQUE NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    email VARCHAR(80),
    phone VARCHAR(15),
    specialization VARCHAR(30),
    hire_date DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE MEMBER (
    id_member INT AUTO_INCREMENT PRIMARY KEY,
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
    master_id INT,
    
    CONSTRAINT fk_member_master FOREIGN KEY (master_id) 
        REFERENCES MASTER(id_master)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE EQUIPMENT (
    id_equipment INT AUTO_INCREMENT PRIMARY KEY,
    inventory_number VARCHAR(10) UNIQUE NOT NULL,
    equipment_type VARCHAR(30) NOT NULL,
    purchase_date DATE NOT NULL,
    equipment_condition VARCHAR(15) NOT NULL,
    deposit_amount DECIMAL(5,2) DEFAULT 0,
    member_id INT,
    
    CONSTRAINT fk_equipment_member FOREIGN KEY (member_id) 
        REFERENCES MEMBER(id_member)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE COMPETITION (
    id_competition INT AUTO_INCREMENT PRIMARY KEY,
    competition_date DATE NOT NULL,
    result VARCHAR(20),
    member_id INT NOT NULL,
    
    CONSTRAINT fk_competition_member FOREIGN KEY (member_id) 
        REFERENCES MEMBER(id_member)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE TRAINING_SESSION (
    id_session INT AUTO_INCREMENT PRIMARY KEY,
    session_day VARCHAR(8) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    room VARCHAR(30) NOT NULL,
    weapon_taught VARCHAR(15) NOT NULL,
    master_id INT NOT NULL,
    
    CONSTRAINT fk_session_master FOREIGN KEY (master_id) 
        REFERENCES MASTER(id_master)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE MEMBER_TRAINING (
    member_id INT NOT NULL,
    session_id INT NOT NULL,
    
    PRIMARY KEY (member_id, session_id),
    
    CONSTRAINT fk_membertraining_member FOREIGN KEY (member_id) 
        REFERENCES MEMBER(id_member)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    
    CONSTRAINT fk_membertraining_session FOREIGN KEY (session_id) 
        REFERENCES TRAINING_SESSION(id_session)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;







