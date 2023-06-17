INSERT INTO users(id, name, password, email, archive, role, bucket_id)
VALUES (1, 'admin', 'pass', 'yandex@yandex.ru', false, 'ADMIN', NULL);

ALTER SEQUENCE user_seq RESTART WITH 2;