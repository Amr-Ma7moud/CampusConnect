INSERT INTO students (student_id, faculty, major, level, picture, in_dorms) VALUES (?, ?, ?, ?, ?, ?)

INSERT INTO users (first_name, last_name, email, password, user_name, phone, role) VALUES (?, ?, ?, ?, ?, ?)

INSERT INTO admins (admin_id, role) VALUES (?, ?)

SELECT u.user_id, u.first_name, u.last_name, u.email, u.user_name, s.faculty, s.major, s.level, s.picture, s.in_dorms, s.type FROM users u JOIN students s ON u.user_id = s.student_id WHERE u.id = ?

SELECT u.user_id, u.first_name, u.last_name, u.email, u.user_name, a.role FROM users u JOIN admins a ON u.user_id = a.admin_id WHERE u.id = ?

SELECT * FROM users WHERE email = ?

UPDATE users SET is_active = ? WHERE user_id = ?

SELECT u.user_id, u.first_name, u.last_name, u.email, s.faculty, s.major, u.is_active FROM users u JOIN students s ON u.user_id = s.student_id WHERE u.first_name LIKE ? OR u.last_name LIKE ?

SELECT * FROM users WHERE role = 'student'