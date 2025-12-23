SELECT e.event_id, c.name AS club_name, c.logo AS club_logo_url, c.cover AS club_cover_url, e.type, e.title, e.description, e.event_start_date AS start_time, e.event_end_date AS end_time, CONCAT(r.building_name, ' - Room ', r.room_number) AS location, COUNT(ser.student_id) AS regestrations, e.max_capacity AS max_regestrations FROM events e LEFT JOIN clubs c ON e.club_id = c.club_id LEFT JOIN rooms r ON e.room_id = r.room_id LEFT JOIN std_register_event ser ON e.event_id = ser.event_id WHERE e.event_id = ? GROUP BY e.event_id, c.name, c.logo, c.cover, e.type, e.title, e.description, e.event_start_date, e.event_end_date, r.building_name, r.room_number, e.max_capacity

SELECT s.student_id, CONCAT(u.first_name, ' ', u.last_name) AS name, u.email, s.major FROM std_register_event sre INNER JOIN students s ON sre.student_id = s.student_id INNER JOIN users u ON s.student_id = u.user_id WHERE sre.event_id = ? AND u.role = 'student' AND u.is_active = TRUE

SELECT 1 FROM events WHERE event_id = ?

SELECT s.student_id, CONCAT(u.first_name, ' ', u.last_name) AS name, u.email, s.major FROM std_attend_event sae INNER JOIN students s ON sae.student_id = s.student_id INNER JOIN users u ON s.student_id = u.user_id WHERE sae.event_id = ? AND u.role = 'student' AND u.is_active = TRUE

SELECT e.event_id, e.type, e.title, e.description, e.event_start_date AS start_time, e.event_end_date AS end_time, e.status, e.max_capacity AS max_regestrations FROM events e INNER JOIN clubs c ON e.club_id = c.club_id INNER JOIN club_manager cm ON c.club_id = cm.club_id WHERE cm.student_id = ? ORDER BY e.event_start_date DESC

SELECT e.event_id, c.name AS club_name, c.logo AS club_logo_url, c.cover AS club_cover_url, e.title, e.description, e.event_start_date AS start_time, e.event_end_date AS end_time, CONCAT(r.building_name, ' - Room ', r.room_number) AS location, COUNT(ser.student_id) AS regestrations, e.max_capacity AS max_regestrations FROM events e INNER JOIN clubs c ON e.club_id = c.club_id LEFT JOIN rooms r ON e.room_id = r.room_id LEFT JOIN std_register_event ser ON e.event_id = ser.event_id WHERE e.club_id = ? AND e.type = ? AND e.status = 'scheduled' AND c.status = 'active' GROUP BY e.event_id, c.name, c.logo, c.cover, e.title, e.description, e.event_start_date, e.event_end_date, r.building_name, r.room_number, e.max_capacity ORDER BY e.event_start_date ASC

DELETE FROM events WHERE event_id = ?

INSERT INTO events (type, title, description, event_start_date, event_end_date, club_id, room_id, max_capacity) VALUES (?, ?, ?, ?, ?, ?, ?)

SELECT 1 FROM std_register_event WHERE event_id = ? AND student_id = ?

SELECT COUNT(*) as count FROM std_register_event WHERE event_id = ?

SELECT status, event_start_date, event_end_date FROM events WHERE event_id = ?

SELECT max_capacity FROM events WHERE event_id = ?

INSERT INTO std_register_event (event_id, student_id, registration_date) VALUES (?, ?, NOW())

DELETE FROM std_register_event WHERE event_id = ? AND student_id = ?

SELECT 1 FROM std_attend_event WHERE event_id = ? AND student_id = ?

INSERT INTO std_attend_event (event_id, student_id, attend_date) VALUES (?, ?, NOW())

INSERT INTO std_report_event ( student_id, event_id, reason, details) VALUES (?, ?, ?, ?)

SELECT * FROM std_report_event

SELECT * FROM events WHERE status == 'scheduled'

SELECT DATE_FORMAT(e.event_start_date, '%b') AS month, SUM(CASE WHEN e.type = 'event' THEN 1 ELSE 0 END) AS events, SUM(CASE WHEN e.type = 'session' THEN 1 ELSE 0 END) AS sessions FROM std_attend_event sa JOIN events e ON sa.event_id = e.event_id WHERE e.event_start_date >= DATE_SUB(NOW(), INTERVAL 12 MONTH) GROUP BY DATE_FORMAT(e.event_start_date, '%Y-%m'), month ORDER BY DATE_FORMAT(e.event_start_date, '%Y-%m')

SELECT e.event_id, e.type, e.title, e.description, e.event_start_date, e.event_end_date, e.max_capacity, c.name, c.logo FROM events e JOIN ON e.club_id = c.club_id WHERE e.status = 'pending'

UPDATE events SET room_id = ? WHERE event_id = ? VALUES (?, ?)

UPDATE events SET status = ? WHERE event_id = ? VALUES (?, ?)