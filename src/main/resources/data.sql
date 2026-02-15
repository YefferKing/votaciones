/* --- USUARIOS ADMINISTRADORES --- */
-- Usuario: yeffer (clave: 12345)
INSERT INTO users (username, password, state)
SELECT 'yeffer',
    '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMebJLKecAy.',
    true
WHERE NOT EXISTS (
        SELECT 1
        FROM users
        WHERE username = 'yeffer'
    );
-- Usuario: admin (clave: 12345)
INSERT INTO users (username, password, state)
SELECT 'admin',
    '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMebJLKecAy.',
    true
WHERE NOT EXISTS (
        SELECT 1
        FROM users
        WHERE username = 'admin'
    );
/* --- USUARIOS TIPO MESA --- */
-- Mesas (clave: 12345)
INSERT INTO users (username, password, state)
SELECT 'MESA1',
    '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMebJLKecAy.',
    true
WHERE NOT EXISTS (
        SELECT 1
        FROM users
        WHERE username = 'MESA1'
    );
INSERT INTO users (username, password, state)
SELECT 'MESA2',
    '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMebJLKecAy.',
    true
WHERE NOT EXISTS (
        SELECT 1
        FROM users
        WHERE username = 'MESA2'
    );
INSERT INTO users (username, password, state)
SELECT 'MESA3',
    '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMebJLKecAy.',
    true
WHERE NOT EXISTS (
        SELECT 1
        FROM users
        WHERE username = 'MESA3'
    );
/* --- ASIGNACIÓN DE ROLES --- */
-- Asignar ROLE_ADMIN a yeffer y admin
INSERT INTO role_users (user_id, name)
SELECT id,
    'ROLE_ADMIN'
FROM users
WHERE username IN ('yeffer', 'admin')
    AND NOT EXISTS (
        SELECT 1
        FROM role_users ru
        WHERE ru.user_id = users.id
            AND ru.name = 'ROLE_ADMIN'
    );
-- Asignar ROLE_USER a las mesas (MESA1, MESA2, MESA3)
INSERT INTO role_users (user_id, name)
SELECT id,
    'ROLE_USER'
FROM users
WHERE username IN ('MESA1', 'MESA2', 'MESA3')
    AND NOT EXISTS (
        SELECT 1
        FROM role_users ru
        WHERE ru.user_id = users.id
            AND ru.name = 'ROLE_USER'
    );