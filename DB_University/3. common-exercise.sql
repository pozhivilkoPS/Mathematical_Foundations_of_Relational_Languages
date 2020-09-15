--
-- Exercise 1
--

--
-- 1. Получить полную информацию обо всех преподавателях.
--

SELECT * FROM lecturer;


--
-- 2. Получить полную информацию обо всех студенческих группах на 
-- специальности ЭВМ.
--

SELECT * FROM student_group sg
WHERE UPPER(sg.specialty)='ЭВМ';


--
-- 3. Получить личный номер преподавателя и номера аудиторий, в которых 
-- они преподают предмет с кодовым номером 18П.
--

SELECT DISTINCT ltsg.personal_id,
	ltsg.auditorium_number
FROM lecturer_teaches_subjects_in_groups ltsg 
WHERE UPPER(ltsg.subject_id)='18П';


--
-- 4. Получить номера предметов и названия предметов, которые ведет 
-- преподаватель Костин.
--

SELECT DISTINCT s.subject_id,
	s.subject_name
FROM lecturer_teaches_subjects_in_groups ltsg
JOIN subject s ON s.subject_id=ltsg.subject_id
WHERE ltsg.personal_id=(
	SELECT l.personal_id
	FROM lecturer l
	WHERE UPPER(l.surname)='КОСТИН'
);


--
-- 5. Получить номер группы, в которой ведутся предметы 
-- преподавателем Фроловым.
--

SELECT DISTINCT ltsg.group_id
FROM lecturer_teaches_subjects_in_groups ltsg 
WHERE ltsg.personal_id=(
	SELECT l.personal_id
	FROM lecturer l
	WHERE UPPER(l.surname)='ФРОЛОВ'
);


--
-- 6. Получить информацию о предметах, которые ведутся на специальности АСОИ.
--

SELECT * FROM subject s
WHERE UPPER(s.specialty)='АСОИ';


--
-- 7. Получить информацию о преподавателях, которые ведут предметы на специальности АСОИ.
--

SELECT * FROM lecturer l
WHERE UPPER(l.specialty) LIKE '%АСОИ%';


--
-- 8. Получить фамилии преподавателей, которые ведут предметы в 210 аудитории.
--

SELECT DISTINCT l.surname
FROM lecturer l 
JOIN lecturer_teaches_subjects_in_groups ltsg 
	ON l.personal_id=ltsg.personal_id
WHERE ltsg.auditorium_number=210;


--
-- 9. Получить названия предметов и названия групп, которые ведут занятия в 
-- аудиториях с 100 по 200.
--

SELECT DISTINCT s.subject_name,
	sg.group_name
FROM lecturer_teaches_subjects_in_groups ltsg
JOIN subject s 
	ON s.subject_id=ltsg.subject_id
JOIN student_group sg
	ON 	sg.group_id=ltsg.group_id
WHERE ltsg.auditorium_number BETWEEN 100 AND 200;


--
-- 10. Получить пары номеров групп с одной специальности.
--

SELECT sg1.group_id AS FirstGroup,
	sg2.group_id AS SecondGroup 
FROM student_group sg1, student_group sg2 
WHERE sg1.specialty=sg2.specialty 
	AND sg1.group_id<sg2.group_id;

	
--
-- 11. Получить общее количество студентов, обучающихся на специальности ЭВМ.
--

SELECT SUM(sg.number_of_people) AS electronic_computer_students_count
FROM student_group sg
WHERE UPPER(sg.specialty)='ЭВМ';


--
-- 12. Получить номера преподавателей, обучающих студентов по специальности ЭВМ.
--

SELECT DISTINCT l.personal_id
FROM lecturer l
JOIN lecturer_teaches_subjects_in_groups ltsg 
	ON l.personal_id=ltsg.personal_id
JOIN student_group sg 
	ON ltsg.group_id=sg.group_id
WHERE UPPER(sg.specialty)='ЭВМ';


--
-- 13. Получить номера предметов, изучаемых всеми студенческими группами.
--

SELECT ltsg.subject_id
FROM lecturer_teaches_subjects_in_groups ltsg 
GROUP BY ltsg.subject_id
HAVING COUNT(ltsg.group_id)=(SELECT COUNT (*) FROM subject);


--
-- 14. Получить фамилии преподавателей, преподающих те же предметы, 
-- что и преподаватель преподающий предмет с номером 14П.
--

SELECT DISTINCT l.surname 
FROM lecturer l
JOIN lecturer_teaches_subjects_in_groups ltsg 
	ON l.personal_id=ltsg.personal_id
WHERE ltsg.subject_id IN (
	SELECT DISTINCT ltsg.subject_id
	FROM lecturer_teaches_subjects_in_groups ltsg 
	WHERE ltsg.personal_id IN (
		SELECT DISTINCT ltsg.personal_id
		FROM lecturer_teaches_subjects_in_groups ltsg 
		WHERE UPPER(ltsg.subject_id)='14П'
	)
);


--
-- 15. Получить информацию о предметах, которые не ведет преподаватель 
-- с личным номером 221П.
--

SELECT DISTINCT s.* 
FROM subject s
WHERE s.subject_id NOT IN (
	SELECT DISTINCT ltsg.subject_id
	FROM lecturer_teaches_subjects_in_groups ltsg 
	WHERE UPPER(ltsg.personal_id)='221Л'
);


--
-- 16. Получить информацию о предметах, которые не изучаются в группе М-6.
--

SELECT DISTINCT s.* 
FROM subject s
JOIN lecturer_teaches_subjects_in_groups ltsg 
	ON ltsg.subject_id=s.subject_id
JOIN student_group sg 
	ON sg.group_id=ltsg.group_id
WHERE ltsg.subject_id NOT IN (
	SELECT DISTINCT ltsg.subject_id
	FROM lecturer_teaches_subjects_in_groups ltsg
	JOIN student_group sg 
		ON ltsg.group_id=sg.group_id
	WHERE UPPER(sg.group_name)='М-6'
);


--
-- 17. Получить информацию о доцентах, преподающих в группах 3Г и 8Г.
--

SELECT DISTINCT l.* 
FROM lecturer l 
JOIN lecturer_teaches_subjects_in_groups ltsg 
	ON ltsg.personal_id=l.personal_id
WHERE UPPER(l.position)='ДОЦЕНТ'
	AND ltsg.group_id IN ('3Г', '8Г'); 
	
	
--
-- 18. Получить номера предметов, номера преподавателей, 
-- номера групп, в которых ведут занятия преподаватели с 
-- кафедры ЭВМ, имеющих специальность АСОИ.
--

SELECT DISTINCT ltsg.subject_id,
	ltsg.personal_id,
	ltsg.group_id
FROM lecturer_teaches_subjects_in_groups ltsg
JOIN lecturer l
	ON l.personal_id=ltsg.personal_id
WHERE l.personal_id IN (
	SELECT l.personal_id
	FROM lecturer l 
	WHERE UPPER(l.department)='ЭВМ'
	AND UPPER(l.specialty) LIKE '%АСОИ%'
);


--
-- 19. Получить номера групп с такой же специальностью, что и 
-- специальность преподавателей.
--

SELECT DISTINCT sg.group_id
FROM student_group sg
WHERE sg.specialty IN (
	SELECT DISTINCT l.specialty
	FROM lecturer l
);


--
-- 20. Получить номера преподавателей с кафедры ЭВМ, 
-- преподающих предметы по специальности, совпадающей 
-- со специальностью студенческой группы.
--

SELECT DISTINCT ltsg.personal_id
FROM lecturer_teaches_subjects_in_groups ltsg
JOIN lecturer l 
	ON l.personal_id=ltsg.personal_id
JOIN subject s 
	ON s.subject_id=ltsg.subject_id
JOIN student_group sg 
	ON sg.group_id=ltsg.group_id
WHERE s.specialty=sg.specialty
AND UPPER(l.department)='ЭВМ';


--
-- 21. Получить специальности студенческой группы, на которых 
-- работают преподаватели кафедры АСУ.
--

SELECT DISTINCT sg.specialty
FROM student_group sg
JOIN lecturer_teaches_subjects_in_groups ltsg 
	ON ltsg.group_id=sg.group_id
JOIN lecturer l 
	ON l.personal_id=ltsg.personal_id
WHERE UPPER(l.department)='АСУ';


--
-- 22. Получить номера предметов, изучаемых группой АС-8.
--

SELECT DISTINCT ltsg.subject_id
FROM lecturer_teaches_subjects_in_groups ltsg 
JOIN student_group sg 
	ON sg.group_id=ltsg.group_id
WHERE UPPER(sg.group_name)='АС-8';


--
-- 23. Получить номера студенческих групп, которые изучают 
-- те же предметы, что и студенческая группа АС-8.
--

SELECT DISTINCT ltsg.group_id
FROM lecturer_teaches_subjects_in_groups ltsg
WHERE ltsg.subject_id IN (
	SELECT DISTINCT ltsg.subject_id
	FROM lecturer_teaches_subjects_in_groups ltsg
	JOIN student_group sg 
		ON ltsg.group_id=sg.group_id
	WHERE UPPER(sg.group_name)='АС-8'
);


--
-- 24. Получить номера студенческих групп, которые не изучают 
-- предметы, преподаваемых в студенческой группе АС-8.
--

SELECT DISTINCT sg.group_id
FROM student_group sg
WHERE NOT sg.group_id IN (
	SELECT DISTINCT ltsg.group_id
	FROM lecturer_teaches_subjects_in_groups ltsg
	WHERE ltsg.subject_id IN (
		SELECT DISTINCT ltsg.subject_id
		FROM lecturer_teaches_subjects_in_groups ltsg
		JOIN student_group sg 
			ON ltsg.group_id=sg.group_id
		WHERE UPPER(sg.group_name)='АС-8'
	)
);


--
-- 25. Получить номера студенческих групп, которые не изучают 
-- предметы, преподаваемых преподавателем 430Л.
--

SELECT DISTINCT ltsg.group_id
FROM lecturer_teaches_subjects_in_groups ltsg
WHERE ltsg.group_id NOT IN (
	SELECT DISTINCT ltsg.group_id
	FROM lecturer_teaches_subjects_in_groups ltsg
	WHERE ltsg.subject_id IN (
		SELECT DISTINCT ltsg.subject_id
		FROM lecturer_teaches_subjects_in_groups ltsg 
		WHERE UPPER(ltsg.personal_id)='430Л'
	)
);


--
-- 26. Получить номера преподавателей, работающих с группой Э-15, 
-- но не преподающих предмет 12П.
--

SELECT DISTINCT ltsg.personal_id
FROM lecturer_teaches_subjects_in_groups ltsg
JOIN student_group sg
	ON sg.group_id=ltsg.group_id
WHERE UPPER(sg.group_name)='Э-15' 
	AND ltsg.personal_id NOT IN (
		SELECT DISTINCT ltsg.personal_id
		FROM lecturer_teaches_subjects_in_groups ltsg
		WHERE UPPER(ltsg.subject_id)='12П'
);