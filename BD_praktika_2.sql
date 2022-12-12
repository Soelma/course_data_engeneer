CREATE TYPE grade_type AS ENUM ('jun', 'middle', 'senior', 'lead');
CREATE TYPE score_type AS ENUM ('A', 'B', 'C', 'D', 'E');

CREATE TABLE IF NOT EXISTS Otdel
(
    id_otdel INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nazv_otdel VARCHAR(100) NOT NULL,
    fio_rukovoditel VARCHAR(50),
    kolichestvo_sotr SMALLINT
);

CREATE TABLE IF NOT EXISTS Sotrudnik
(
    id_sotrudnik INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fio VARCHAR(50) NOT NULL,
    birthday DATE NOT NULL,
    date_work DATE NOT NULL,
    dolzhnost VARCHAR(20),
    uroven_sotr grade_type NOT NULL,
    uroven_zarpl INT,
    prava BOOLEAN, 
    id_otdel INT,
    CONSTRAINT department_fk    
	FOREIGN KEY(id_otdel) 
	REFERENCES otdel(id_otdel)
	ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Osenka_kvartal
(
    id_sotrudnik INT,
    kvartal SERIAL NOT NULL,
    osenka_sotrudnik score_type,
    CONSTRAINT sotrudnik_fk
	FOREIGN KEY(id_sotrudnik) 
	REFERENCES sotrudnik(id_sotrudnik)
	ON DELETE CASCADE,
    PRIMARY KEY(id_sotrudnik, kvartal)
);


INSERT INTO otdel (nazv_otdel, fio_rukovoditel, kolichestvo_sotr) 
VALUES 
('Информационные технологии', 'Суворов Павел Петрович', 20),
('Бухгалтерия', 'Иванова Анна Андреевна', 5),
('Интеллектуальный анализ данных', 'Кочетов Алексей Федорович', 7);

INSERT INTO sotrudnik (id_otdel, fio, birthday, date_work, dolzhnost, uroven_sotr, uroven_zarpl, prava)
VALUES 
(1, 'Васильев Владирир Викторович', '15.02.2000', '01.09.2020', 'Программист', 'jun', 50000, true),
(1, 'Бадмаев Батор Владимирович', '14.03.1977', '01.05.1999', 'Аналитик', 'lead', 300000, true),
(1, 'Андреева Валентина Сергеевна', '14.09.1980', '10.10.2015', 'Тестер', 'senior', 200000, false),
(2, 'Горохова Анна Андреевна', '25.05.1989', '15.10.2010', 'Главный бухгалтер', 'lead', 150000, false),
(2, 'Бураева Галина Павловна', '14.05.2000', '01.09.2020', 'Бухгалтер-расчетчик', 'senior', 45000, true),
(3, 'Суворов Александр Николаевич', '27.02.1994', '13.07.2016', 'Инженер данных', 'middle', 180000, false),
(3, 'Дырхеев Константин Пввлович', '01.05.1970', '01.07.2010', 'Аналитик данных', 'senior', 250000, true);
 
INSERT INTO osenka_kvartal (id_sotrudnik, kvartal, osenka_sotrudnik) 
VALUES 
(1, 1, 'A'),
(1, 2, 'B'),
(1, 3, 'B'),
(1, 4, 'B'),
(2, 2, 'C'),
(2, 4, 'E'),
(3, 1, 'D'),
(3, 2, 'D'),
(3, 3, 'E'),
(3, 4, 'E');

SELECT fio, uroven_zarpl FROM sotrudnik
WHERE uroven_zarpl = (SELECT MAX(uroven_zarpl) FROM sotrudnik);

SELECT fio FROM sotrudnik ORDER BY fio;

SELECT uroven_sotr, avg(DATE_PART('year', '2022-11-01'::date) - DATE_PART('year', date_work::date)) FROM sotrudnik
GROUP BY uroven_sotr;

SELECT 
	sotrudnik.fio, 
	otdel.nazv_otdel 
FROM  
	sotrudnik
INNER JOIN otdel ON sotrudnik.id_otdel = otdel.id_otdel;

SELECT 
	o.nazv_otdel, 
	s.fio, s.uroven_zarpl 
FROM sotrudnik s, otdel o,
(SELECT id_otdel AS DeptId, MAX(uroven_zarpl) AS Salary
FROM sotrudnik s
GROUP BY id_otdel) m
WHERE m.Salary = s.uroven_zarpl
AND m.DeptId = s.id_otdel
AND s.id_otdel = o.id_otdel;