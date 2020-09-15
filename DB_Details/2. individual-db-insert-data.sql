--
-- Data for Name: provider; Type: TABLE DATA; Schema: public
--

INSERT INTO provider VALUES	('П1', 'Петров', 20, 'Москва');
INSERT INTO provider VALUES	('П2', 'Синицын', 10, 'Таллинн');
INSERT INTO provider VALUES	('П3', 'Федоров', 30, 'Таллинн');
INSERT INTO provider VALUES	('П4', 'Чаянов', 20, 'Минск');
INSERT INTO provider VALUES	('П5', 'Крюков', 30, 'Киев');


--
-- Data for Name: details; Type: TABLE DATA; Schema: public
--

INSERT INTO details VALUES ('Д1', 'Болт', 'Красный', 12, 'Москва');
INSERT INTO details VALUES ('Д2', 'Гайка', 'Зеленая', 17, 'Минск');
INSERT INTO details VALUES ('Д3', 'Диск', 'Черный', 17, 'Вильнюс');
INSERT INTO details VALUES ('Д4', 'Диск', 'Черный', 14, 'Москва');
INSERT INTO details VALUES ('Д5', 'Корпус', 'Красный', 12, 'Минск');
INSERT INTO details VALUES ('Д6', 'Крышки', 'Красный', 19, 'Москва');


--
-- Data for Name: project; Type: TABLE DATA; Schema: public
--

INSERT INTO project VALUES ('ПР1', 'ИПР1', 'Минск');
INSERT INTO project VALUES ('ПР2', 'ИПР2', 'Таллинн');
INSERT INTO project VALUES ('ПР3', 'ИПР3', 'Псков');
INSERT INTO project VALUES ('ПР4', 'ИПР4', 'Псков');
INSERT INTO project VALUES ('ПР5', 'ИПР5', 'Москва');
INSERT INTO project VALUES ('ПР6', 'ИПР6', 'Саратов');
INSERT INTO project VALUES ('ПР7', 'ИПР7', 'Москва');


--
-- Data for Name: number_of_supplied_details_for_the_project; Type: TABLE DATA; Schema: public
--

INSERT INTO number_of_supplied_details_for_the_project VALUES ('П1', 'Д1', 'ПР1', 200);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П1', 'Д1', 'ПР2', 700);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П2', 'Д3', 'ПР1', 400);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П2', 'Д2', 'ПР2', 200);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П2', 'Д3', 'ПР3', 200);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П2', 'Д3', 'ПР4', 500);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П2', 'Д3', 'ПР5', 600);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П2', 'Д3', 'ПР6', 400);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П2', 'Д3', 'ПР7', 800);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П2', 'Д5', 'ПР2', 100);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П3', 'Д3', 'ПР1', 200);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П3', 'Д4', 'ПР2', 500);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П4', 'Д6', 'ПР3', 300);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П4', 'Д6', 'ПР7', 300);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П5', 'Д2', 'ПР2', 200);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П5', 'Д2', 'ПР4', 100);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П5', 'Д5', 'ПР5', 500);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П5', 'Д5', 'ПР7', 100);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П5', 'Д6', 'ПР2', 200);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П5', 'Д1', 'ПР2', 100);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П5', 'Д3', 'ПР4', 200);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П5', 'Д4', 'ПР4', 800);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П5', 'Д5', 'ПР4', 400);
INSERT INTO number_of_supplied_details_for_the_project VALUES ('П5', 'Д6', 'ПР4', 500);




