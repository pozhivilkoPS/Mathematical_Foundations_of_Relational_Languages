--
-- Data for Name: lecturer; Type: TABLE DATA; Schema: public
--

INSERT INTO lecturer VALUES	('221Л', 'Фролов', 'Доцент', 'ЭВМ', 'АСОИ, ЭВМ', 487);
INSERT INTO lecturer VALUES	('222Л', 'Костин', 'Доцент', 'ЭВМ', 'ЭВМ', 543);
INSERT INTO lecturer VALUES	('225Л', 'Бойко', 'Профессор', 'АСУ', 'АСОИ, ЭВМ', 112);
INSERT INTO lecturer VALUES	('430Л', 'Глазов', 'Ассистент', 'ТФ', 'СД', 421);
INSERT INTO lecturer VALUES	('110Л', 'Петров', 'Ассистент', 'Экономика', 'Международная экономика', 324);


--
-- Data for Name: subject; Type: TABLE DATA; Schema: public
--

INSERT INTO subject VALUES ('12П', 'Мини ЭВМ', 36, 'ЭВМ', 1);
INSERT INTO subject VALUES ('14П', 'ПЭВМ', 72, 'ЭВМ', 2);
INSERT INTO subject VALUES ('17П', 'СУБД ПК', 48, 'АСОИ', 4);
INSERT INTO subject VALUES ('18П', 'ВКСС', 52, 'АСОИ', 6);
INSERT INTO subject VALUES ('34П', 'Физика', 30, 'СД', 6);
INSERT INTO subject VALUES ('22П', 'Аудит', 24, 'Бухучет', 3);


--
-- Data for Name: student_group; Type: TABLE DATA; Schema: public
--

INSERT INTO student_group VALUES ('8Г', 'Э-12', 18, 'ЭВМ', 'Иванова');
INSERT INTO student_group VALUES ('7Г', 'Э-15', 22, 'ЭВМ', 'Сеткин');
INSERT INTO student_group VALUES ('4Г', 'АС-9', 24, 'АСОИ', 'Балабанов');
INSERT INTO student_group VALUES ('3Г', 'АС-8', 20, 'АСОИ', 'Чижов');
INSERT INTO student_group VALUES ('17Г', 'С-14', 29, 'СД', 'Амросов');
INSERT INTO student_group VALUES ('12Г', 'М-6', 16, 'Международная экономика', 'Трубин');
INSERT INTO student_group VALUES ('10Г', 'Б-4', 21, 'Бухучет', 'Зязюткин');


--
-- Data for Name: lecturer_teaches_subjects_in_groups; Type: TABLE DATA; Schema: public
--

INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('8Г', '12П', '222Л', 112);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('8Г', '14П', '221Л', 220);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('8Г', '17П', '222Л', 112);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('7Г', '14П', '221Л', 220);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('7Г', '17П', '222Л', 241);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('7Г', '18П', '225Л', 210);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('4Г', '12П', '222Л', 112);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('4Г', '18П', '225Л', 210);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('3Г', '12П', '222Л', 112);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('3Г', '17П', '221Л', 241);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('3Г', '18П', '225Л', 210);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('17Г', '12П', '222Л', 112);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('17Г', '22П', '110Л', 220);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('17Г', '34П', '430Л', 118);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('12Г', '12П', '222Л', 112);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('12Г', '22П', '110Л', 210);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('10Г', '12П', '222Л', 210);
INSERT INTO lecturer_teaches_subjects_in_groups VALUES ('10Г', '22П', '110Л', 210);

