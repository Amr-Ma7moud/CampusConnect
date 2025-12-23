INSERT INTO clubs (name, description, email, status) VALUES (?, ?, ?)

INSERT INTO club_manager (student_id, club_id, role_title) VALUES (?, ?, ?)

SELECT * FROM clubs WHERE email = ?

SELECT * FROM clubs WHERE club_id = ?

SELECT cm.student_id, u.first_name, u.last_name, cm.role_title FROM club_manager cm JOIN users u ON cm.student_id = u.user_id WHERE cm.club_id = ?

UPDATE clubs SET name = ? WHERE club_id = ?

UPDATE clubs SET description = ? WHERE club_id = ?

UPDATE clubs SET logo = ? WHERE club_id = ?

UPDATE clubs SET cover = ? WHERE club_id = ?

INSERT INTO std_follow_club (club_id, student_id) VALUES (?, ?)

DELETE FROM std_follow_club WHERE club_id = ? AND student_id = ?

SELECT student_id FROM std_follow_club WHERE club_id = ?

SELECT * FROM clubs

SELECT club_id FROM club_manager WHERE student_id = ?

INSERT INTO std_report_club ( student_id, club_id, reason, details) VALUES (?, ?, ?, ?)

SELECT * FROM std_report_club