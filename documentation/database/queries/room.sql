INSERT INTO rooms ( building_name, room_number, capacity, start_time, end_time, is_available, type) VALUES (?, ?, ?, ?, ?, ?, ?)

INSERT INTO room_has_resources (room_id, resource_id) VALUES (?, ?)

SELECT * FROM rooms WHERE room_number = ? AND building_name = ?

SELECT room_id FROM rooms

SELECT * FROM std_reserve_room

INSERT INTO std_reserve_room ( student_id, room_id, start_time, end_time, purpose, status) VALUES (?, ?, ?, ?, ?, ?)

UPDATE std_reserve_room SET status = 'cancelled' WHERE student_id = ? AND room_id = ? AND start_time = ?

SELECT * FROM std_reserve_room WHERE student_id = ? AND room_id = ? AND start_time = ?

INSERT INTO std_report_room ( student_id, room_id, reason, details) VALUES (?, ?, ?, ?)

SELECT * FROM std_report_room