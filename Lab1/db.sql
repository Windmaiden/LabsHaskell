CREATE TABLE source
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(20) NOT NULL
);

CREATE TABLE author
(
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    sourceId INT REFERENCES source (id)
);

CREATE TABLE text_info
(
    id       SERIAL PRIMARY KEY,
    type     VARCHAR(20) NOT NULL,
    text     VARCHAR(500) NOT NULL,
    sourceId INT REFERENCES source (id)
);


CREATE TABLE source_terms
(
     id        SERIAL PRIMARY KEY,
     terms VARCHAR(100) NOT NULL,
     purpose VARCHAR(20)                            NOT NULL,
     sourceId INT REFERENCES source (id)

);

INSERT INTO source (title)
VALUES ('Work -  of OM'),
        ('Report -  of MI'),
        ('Article -  of MMS');

INSERT INTO author (name, surname, sourceID)
VALUES  ('Tatyana', 'Chudik', 1),
        ('Kolya', 'Paraduke', 1),
        ('Vitaly', 'Borisov', 2);


INSERT INTO text_info (type, text, sourceID)
VALUES ('Biography', 'text ... biography', 1),
        ('achievements', 'text ... achievements', 2);

INSERT INTO source_terms (terms, purpose, sourceid)
VALUES ('Work theme', 'blah blah blah', 1),
        ('purpose of work', 'blah blah blah', 2);
