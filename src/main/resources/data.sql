/* Creamos solo al usuario yeffer con password '12345' */
INSERT INTO users (username, password, state) VALUES ('yeffer','$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMebJLKecAy.',true);

/* Le asignamos roles de administrador y usuario */
INSERT INTO role_users (user_id, name) VALUES (1,'ROLE_ADMIN');
INSERT INTO role_users (user_id, name) VALUES (1,'ROLE_USER');
