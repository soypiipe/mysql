INSERT INTO authors(name, nationality) VALUES('Gabriel Garcia Marquez', 'COL');

INSERT INTO authors(name, nationality) VALUES('Juan Rulfo', 'MEX');

INSERT INTO authors (name, nationality) VALUES('Juan Gabriel Vasquez', 'COL');

#Insersion multiple

INSERT INTO authors (name, nationality) VALUES ('Julio Cortazar', 'ARG'),
    ('Isabel Allende', 'CHI'),
    ('Octavio Paz', 'MEX'),
    ('Mario Mendoza', 'COL');



INSERT INTO books (title, author_id) VALUES ('El laberinto de la soledad', (SELECT author_id FROM authors WHERE name = 'Octavio Paz'));

INSERT INTO books(title, author_id, `year`) VALUES('Vuelta al laberinto de la soledad', (SELECT author_id FROM authors WHERE name = 'Octavio Paz' LIMIT 1), 1960); 