INSERT INTO posts (content, image_url, club_id) VALUES (?, ?, ?)

INSERT INTO posts_for_event (post_id, event_id) VALUES (?, ?)

SELECT * FROM posts WHERE post_id = ?

UPDATE posts SET content = ? WHERE post_id = ?

INSERT INTO std_comment_post (student_id, post_id, comment) VALUES (?, ?, ?)

SELECT * FROM std_comment_post WHERE post_id = ?

INSERT INTO std_like_post (student_id, post_id) VALUES (?, ?)

DELETE FROM std_like_post WHERE student_id = ? AND post_id = ?

SELECT student_id FROM std_like_post WHERE post_id = ?

SELECT * FROM posts ORDER BY created_at DESC LIMIT ?

SELECT event_id FROM posts_for_event WHERE post_id = ?

SELECT p.post_id, p.content, p.image_url, p.created_at, p.club_id FROM posts p JOIN posts_for_event pe ON p.post_id = pe.post_id WHERE pe.event_id = ? ORDER BY p.created_at DESC