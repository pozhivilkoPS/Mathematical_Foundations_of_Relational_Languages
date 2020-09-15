--
-- Exercise 2
-- Variant 4
--

--
-- 29. Получить номера проектов, полностью обеспечиваемых поставщиком П1.
--

SELECT DISTINCT p.project_id
FROM project p
WHERE NOT p.project_id IN (
	SELECT DISTINCT nsdp.project_id
	FROM number_of_supplied_details_for_the_project nsdp
	WHERE nsdp.provider_id IN (
		SELECT provider.provider_id
		FROM provider
		WHERE UPPER(provider.provider_id)!='П1'
	)
);


--
-- 14. Получить все такие пары номеров деталей, которые обе поставляются 
-- одновременно одним поставщиком.
--

SELECT DISTINCT nsdp1.detail_id, nsdp2.detail_id
FROM number_of_supplied_details_for_the_project nsdp1,
	number_of_supplied_details_for_the_project nsdp2
WHERE nsdp1.provider_id=nsdp2.provider_id
	AND nsdp1.detail_id>nsdp2.detail_id;


--
-- 22. Получить номера проектов, использующих по крайней мере одну деталь, 
-- имеющуюся у поставщика П1.
--

SELECT DISTINCT nsdp.project_id
FROM number_of_supplied_details_for_the_project nsdp
WHERE nsdp.detail_id IN (
	SELECT nsdp.detail_id
	FROM number_of_supplied_details_for_the_project nsdp
	WHERE UPPER(nsdp.provider_id)='П1'
);


--
-- 11. Получить все пары названий городов, для которых поставщик из первого 
-- города обеспечивает проект во втором городе.
--

SELECT DISTINCT provider.city, project.city 
FROM number_of_supplied_details_for_the_project nsdp
JOIN provider 
	ON provider.provider_id=nsdp.provider_id
JOIN project 
	ON project.project_id=nsdp.project_id;


--
-- 2. Получить полную информацию обо всех проектах в Лондоне.
--

SELECT * FROM project p
WHERE UPPER(p.city)='ЛОНДОН';


--
-- 4. Получить все отправки, где количество находится в диапазоне 
-- от 300 до 750 включительно.
--

SELECT * FROM number_of_supplied_details_for_the_project nsdp
WHERE nsdp.detail_sum between 300 and 750;


--
-- 8. Получить все такие тройки "номера поставщиков-номера деталей-номера 
-- проектов", для которых никакие из двух выводимых поставщиков, деталей 
-- и проектов не размещены в одном городе.
--

SELECT nsdp.provider_id,
	nsdp.detail_id,
	nsdp.project_id
FROM number_of_supplied_details_for_the_project nsdp
JOIN provider 
	ON provider.provider_id=nsdp.provider_id
JOIN details d
	ON d.detail_id=nsdp.detail_id
JOIN project 
	ON project.project_id=nsdp.project_id
WHERE provider.city!=d.city
	AND d.city!=project.city
	AND project.city!=provider.city;


--
-- 33. Получить все города, в которых расположен по крайней мере один 
-- поставщик, одна деталь или один проект.
--

SELECT provider.city FROM provider
UNION
SELECT details.city FROM details
UNION 
SELECT project.city FROM project;


--
-- 13. Получить номера проектов, обеспечиваемых по крайней мере одним 
-- поставщиком не из того же города.
--

SELECT DISTINCT project.project_id 
FROM number_of_supplied_details_for_the_project nsdp
JOIN provider
	ON nsdp.provider_id=provider.provider_id
JOIN project
	ON project.project_id=nsdp.project_id
WHERE project.city!=provider.city;


--
-- 27. Получить пары номеров групп с одной специальности.
--

SELECT DISTINCT nsdp.provider_id
FROM number_of_supplied_details_for_the_project nsdp
WHERE UPPER(nsdp.detail_id)='Д1'
GROUP BY nsdp.provider_id
HAVING SUM(nsdp.detail_sum) > (
	SELECT AVG(nsdp1.detail_sum)
	FROM number_of_supplied_details_for_the_project nsdp1
	WHERE UPPER(nsdp1.detail_id)='Д1' 
		AND nsdp1.provider_id=nsdp.provider_id
	GROUP BY nsdp1.provider_id
);
