-- ----------------------------------------------------------------------------
-- SCENARIO
-- As the club president, I need to extract information to:
-- 1. Track member registrations and demographics
-- 2. Monitor training attendance
-- 3. Manage equipment inventory
-- 4. Analyze competition results
-- 5. Generate financial reports
-- --------------------------------------------------------------------



-- 1.1 List all senior members with their contact information
SELECT last_name, first_name, email, phone
FROM MEMBER
WHERE age_category = 'Senior'
ORDER BY last_name;

-- 1.2 Find all equipment that needs repair
SELECT inventory_number, equipment_type, equipment_condition
FROM EQUIPMENT
WHERE equipment_condition LIKE '%repair%';

-- 1.3 List members who joined in 2025
SELECT last_name, first_name, membership_date
FROM MEMBER
WHERE membership_date BETWEEN '2025-01-01' AND '2025-12-31'
ORDER BY membership_date;

-- 1.4 Find members who practice Foil or Epee
SELECT last_name, first_name, main_weapon
FROM MEMBER
WHERE main_weapon IN ('Foil', 'Epee')
ORDER BY main_weapon, last_name;

-- 1.5 Get unique age categories
SELECT DISTINCT age_category
FROM MEMBER
ORDER BY age_category;



-- 2.1 Count members by age category
SELECT age_category, COUNT(*) as member_count
FROM MEMBER
GROUP BY age_category
ORDER BY member_count DESC;

-- 2.2 Calculate total and average membership fees
SELECT 
    SUM(membership_fee) as total_fees,
    AVG(membership_fee) as average_fee,
    MIN(membership_fee) as minimum_fee,
    MAX(membership_fee) as maximum_fee
FROM MEMBER;

-- 2.3 Count equipment by type and condition
SELECT equipment_type, equipment_condition, COUNT(*) as equipment_count
FROM EQUIPMENT
GROUP BY equipment_type, equipment_condition
ORDER BY equipment_type, equipment_condition;

-- 2.4 Find masters with more than 3 students
SELECT 
    m.last_name, 
    m.first_name,
    COUNT(mem.id_member) as student_count
FROM MASTER m
LEFT JOIN MEMBER mem ON m.id_master = mem.master_id
GROUP BY m.id_master, m.last_name, m.first_name
HAVING COUNT(mem.id_member) > 3;

-- 2.5 Calculate average deposit amount by equipment type
SELECT 
    equipment_type,
    AVG(deposit_amount) as avg_deposit,
    SUM(deposit_amount) as total_deposits
FROM EQUIPMENT
WHERE deposit_amount > 0
GROUP BY equipment_type;



-- 3.1 List members with their master's name
SELECT 
    mem.last_name as member_last_name,
    mem.first_name as member_first_name,
    mast.last_name as master_last_name,
    mast.first_name as master_first_name
FROM MEMBER mem
INNER JOIN MASTER mast ON mem.master_id = mast.id_master
ORDER BY mast.last_name, mem.last_name;

-- 3.2 List all masters and their students
SELECT 
    mast.last_name as master_name,
    COUNT(mem.id_member) as student_count
FROM MASTER mast
LEFT JOIN MEMBER mem ON mast.id_master = mem.master_id
GROUP BY mast.id_master, mast.last_name
ORDER BY student_count DESC;

-- 3.3 Find equipment currently borrowed by members
SELECT 
    e.inventory_number,
    e.equipment_type,
    mem.last_name as borrower_name,
    e.deposit_amount
FROM EQUIPMENT e
INNER JOIN MEMBER mem ON e.member_id = mem.id_member
WHERE e.member_id IS NOT NULL;

-- 3.4 List training sessions with master name and weapon
SELECT 
    ts.session_day,
    ts.start_time,
    ts.end_time,
    ts.room,
    ts.weapon_taught,
    mast.last_name as master_name
FROM TRAINING_SESSION ts
INNER JOIN MASTER mast ON ts.master_id = mast.id_master
ORDER BY 
    CASE ts.session_day
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        ELSE 7
    END,
    ts.start_time;

-- 3.5 Find all members attending sessions with their masters
SELECT 
    mem.last_name as member_name,
    ts.session_day,
    ts.start_time,
    ts.weapon_taught,
    mast.last_name as master_name
FROM MEMBER mem
INNER JOIN MEMBER_TRAINING mt ON mem.id_member = mt.member_id
INNER JOIN TRAINING_SESSION ts ON mt.session_id = ts.id_session
INNER JOIN MASTER mast ON ts.master_id = mast.id_master
ORDER BY ts.session_day, ts.start_time, mem.last_name;



-- 4.1 Find members who have never borrowed equipment
SELECT last_name, first_name
FROM MEMBER
WHERE id_member NOT IN (
    SELECT DISTINCT member_id
    FROM EQUIPMENT
    WHERE member_id IS NOT NULL
);

-- 4.2 Find masters who teach sessions with more than 5 students
SELECT last_name, first_name
FROM MASTER
WHERE id_master = ANY (
    SELECT master_id
    FROM TRAINING_SESSION ts
    WHERE (
        SELECT COUNT(*)
        FROM MEMBER_TRAINING mt
        WHERE mt.session_id = ts.id_session
    ) > 5
);

-- 4.3 Find members who have competed and won
SELECT last_name, first_name
FROM MEMBER m
WHERE EXISTS (
    SELECT 1
    FROM COMPETITION c
    WHERE c.member_id = m.id_member
    AND c.result LIKE '%1st%' OR c.result LIKE '%2nd%' OR c.result LIKE '%3rd%'
);

-- 4.4 Find members who have higher fees than the average
SELECT last_name, first_name, membership_fee
FROM MEMBER
WHERE membership_fee > (
    SELECT AVG(membership_fee)
    FROM MEMBER
)
ORDER BY membership_fee DESC;

-- 4.5 Find the most popular training session
SELECT 
    ts.session_day,
    ts.start_time,
    ts.weapon_taught,
    COUNT(mt.member_id) as attendance
FROM TRAINING_SESSION ts
LEFT JOIN MEMBER_TRAINING mt ON ts.id_session = mt.session_id
GROUP BY ts.id_session, ts.session_day, ts.start_time, ts.weapon_taught
HAVING COUNT(mt.member_id) >= ALL (
    SELECT COUNT(mt2.member_id)
    FROM TRAINING_SESSION ts2
    LEFT JOIN MEMBER_TRAINING mt2 ON ts2.id_session = mt2.session_id
    GROUP BY ts2.id_session
);

-- ---------------------------
-- BONUS: 
--  ----------------------------

-- 5.1 Member statistics by weapon and age category
SELECT 
    main_weapon,
    age_category,
    COUNT(*) as member_count,
    AVG(TIMESTAMPDIFF(YEAR, birth_date, CURDATE())) as avg_age
FROM MEMBER
WHERE main_weapon IS NOT NULL
GROUP BY main_weapon, age_category
ORDER BY main_weapon, age_category;

-- 5.2 Equipment usage report
SELECT 
    e.equipment_type,
    COUNT(DISTINCT e.id_equipment) as total_units,
    COUNT(DISTINCT CASE WHEN e.member_id IS NOT NULL THEN e.id_equipment END) as borrowed_units,
    COUNT(DISTINCT CASE WHEN e.equipment_condition = 'To repair' THEN e.id_equipment END) as needs_repair
FROM EQUIPMENT e
GROUP BY e.equipment_type;

-- 5.3 Member progression in competitions
SELECT 
    m.last_name,
    m.first_name,
    COUNT(c.id_competition) as competitions_entered,
    COUNT(CASE WHEN c.result LIKE '%1st%' THEN 1 END) as first_places,
    COUNT(CASE WHEN c.result LIKE '%2nd%' THEN 1 END) as second_places,
    COUNT(CASE WHEN c.result LIKE '%3rd%' THEN 1 END) as third_places
FROM MEMBER m
LEFT JOIN COMPETITION c ON m.id_member = c.member_id
GROUP BY m.id_member, m.last_name, m.first_name
HAVING COUNT(c.id_competition) > 0
ORDER BY first_places DESC;