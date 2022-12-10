CREATE TABLE Otdel
(
    ID_Otdel SERIAL NOT NULL PRIMARY KEY,
    Nazv_Otdel VARCHAR(40),
    FIO_Rukovoditel VARCHAR(30),
    Kolichestvo_Sotr SMALLINT
);

CREATE TABLE Sotrudnik
(
    ID_Sotrudnik SERIAL NOT NULL PRIMARY KEY,
	ID_Otdel INT,
    FIO VARCHAR(30),
    BirthDay DATE,
    Date_work DATE,
    Dolzhnost VARCHAR(20),
    Uroven_sotr VARCHAR(6),
    Uroven_zarpl INT,
    Prava BOOLEAN,
    FOREIGN KEY(ID_Otdel) REFERENCES Otdel(ID_Otdel)
);

CREATE TABLE Osenka_kvartal
(
    ID_sotrudnik INT NOT NULL,
	FOREIGN KEY(ID_sotrudnik) REFERENCES Sotrudnik(ID_sotrudnik),
    Kvartal SERIAL NOT NULL,
    Osenka_Sotrudnik CHAR,
	PRIMARY KEY(ID_sotrudnik, Kvartal)
);


INSERT INTO public.otdel (
id_otdel, nazv_otdel, fio_rukovoditel, kolichestvo_sotr) VALUES (
'1'::integer, 'Информационные технологии'::character varying, 'Суворов Павел ПЕтрович'::character varying, '20'::smallint)
 returning id_otdel;
INSERT INTO public.otdel (
id_otdel, nazv_otdel, fio_rukovoditel, kolichestvo_sotr) VALUES (
'2'::integer, 'Бухгалтерия'::character varying, 'Иванова Анна Андреевна'::character varying, '5'::smallint)
 returning id_otdel;

INSERT INTO public.sotrudnik (
id_sotrudnik, id_otdel, fio, birthday, date_work, dolzhnost, uroven_sotr, uroven_zarpl, prava) VALUES (
'1'::integer, '1'::integer, 'Васильев Владири Викторович'::character varying, '15.02.2000'::date, '01.09.2020'::date, 'Программист'::character varying, 'jun'::character varying, '50000'::integer, true::boolean)
 returning id_sotrudnik;
INSERT INTO public.sotrudnik (
id_sotrudnik, id_otdel, fio, birthday, date_work, dolzhnost, uroven_sotr, uroven_zarpl, prava) VALUES (
'2'::integer, '1'::integer, 'Бадмаев Батор Владимирович'::character varying, '14.03.1977'::date, '01.05.1999'::date, 'Аналитик'::character varying, 'lead'::character varying, '300000'::integer, true::boolean)
 returning id_sotrudnik;
INSERT INTO public.sotrudnik (
id_sotrudnik, id_otdel, fio, birthday, date_work, dolzhnost, uroven_sotr, uroven_zarpl, prava) VALUES (
'3'::integer, '1'::integer, 'Андреева Валентина Сергеевна'::character varying, '14.09.1980'::date, '10.10.2015'::date, 'Тестер'::character varying, 'senior'::character varying, '200000'::integer, false::boolean)
 returning id_sotrudnik;
INSERT INTO public.sotrudnik (
id_sotrudnik, id_otdel, fio, birthday, date_work, dolzhnost, uroven_zarpl) VALUES (
'4'::integer, '2'::integer, 'Горохова Анна Андреевна'::character varying, '25.05.1989'::date, '15.10.2010'::date, 'Главный бухгалтер'::character varying, '150000'::integer)
 returning id_sotrudnik;
INSERT INTO public.sotrudnik (
id_sotrudnik, id_otdel, fio, birthday, date_work, dolzhnost, uroven_zarpl) VALUES (
'5'::integer, '2'::integer, 'Бураева Галина Павловна'::character varying, '14.05.2000'::date, '01.09.2020'::date, 'Бухгалтер-расчетчик'::character varying, '45000'::integer)
 returning id_sotrudnik;

INSERT INTO public.osenka_kvartal (
id_sotrudnik, kvartal, osenka_sotrudnik) VALUES (
'1'::integer, '1'::integer, 'A')
 returning id_sotrudnik,kvartal;
INSERT INTO public.osenka_kvartal (
id_sotrudnik, kvartal, osenka_sotrudnik) VALUES (
'1'::integer, '2'::integer, 'B')
 returning id_sotrudnik,kvartal;
INSERT INTO public.osenka_kvartal (
id_sotrudnik, kvartal, osenka_sotrudnik) VALUES (
'1'::integer, '3'::integer, 'B')
 returning id_sotrudnik,kvartal;
INSERT INTO public.osenka_kvartal (
id_sotrudnik, kvartal, osenka_sotrudnik) VALUES (
'1'::integer, '4'::integer, 'B')
 returning id_sotrudnik,kvartal;
INSERT INTO public.osenka_kvartal (
id_sotrudnik, kvartal, osenka_sotrudnik) VALUES (
'2'::integer, '2'::integer, 'C')
 returning id_sotrudnik,kvartal;
INSERT INTO public.osenka_kvartal (
id_sotrudnik, kvartal, osenka_sotrudnik) VALUES (
'2'::integer, '4'::integer, 'E')
 returning id_sotrudnik,kvartal;
INSERT INTO public.osenka_kvartal (
id_sotrudnik, kvartal, osenka_sotrudnik) VALUES (
'3'::integer, '1'::integer, 'D')
 returning id_sotrudnik,kvartal;
INSERT INTO public.osenka_kvartal (
id_sotrudnik, kvartal, osenka_sotrudnik) VALUES (
'3'::integer, '2'::integer, 'D')
 returning id_sotrudnik,kvartal;
INSERT INTO public.osenka_kvartal (
id_sotrudnik, kvartal, osenka_sotrudnik) VALUES (
'3'::integer, '3'::integer, 'E')
 returning id_sotrudnik,kvartal;
INSERT INTO public.osenka_kvartal (
id_sotrudnik, kvartal, osenka_sotrudnik) VALUES (
'3'::integer, '4'::integer, 'E')
 returning id_sotrudnik,kvartal;

INSERT INTO public.otdel (
id_otdel, nazv_otdel, fio_rukovoditel, kolichestvo_sotr) VALUES (
'3'::integer, 'Интеллектуальный анализ данных.'::character varying, 'Кочетов Алексей Федорович'::character varying, '7'::smallint)
 returning id_otdel;

INSERT INTO public.sotrudnik (
id_sotrudnik, id_otdel, fio, birthday, date_work, dolzhnost, uroven_sotr, uroven_zarpl) VALUES (
'6'::integer, '3'::integer, 'Суворов Александр Николаевич'::character varying, '27.02.1994'::date, '13.07.2016'::date, 'Инженер данных'::character varying, 'middle'::character varying, '180000'::integer)
 returning id_sotrudnik;
INSERT INTO public.sotrudnik (
id_sotrudnik, id_otdel, fio, birthday, date_work, dolzhnost, uroven_sotr, uroven_zarpl) VALUES (
'7'::integer, '3'::integer, 'Дырхеев Константин Пввлович'::character varying, '01.05.1970'::date, '01.07.2010'::date, 'Аналитик данных'::character varying, 'senior'::character varying, '250000'::integer)
 returning id_sotrudnik;


SELECT ID_Sotrudnik, FIO, DATE_PART('year', '2022-11-01'::date) - DATE_PART('year', date_work::date) FROM sotrudnik;

SELECT ID_Sotrudnik, FIO, DATE_PART('year', '2022-11-01'::date) - DATE_PART('year', date_work::date) FROM sotrudnik LIMIT 3;

SELECT ID_Sotrudnik FROM sotrudnik WHERE prava is TRUE;

SELECT DISTINCT ID_Sotrudnik FROM osenka_kvartal WHERE (osenka_sotrudnik = 'D' OR osenka_sotrudnik = 'E');

SELECT MAX(uroven_zarpl) FROM sotrudnik;
