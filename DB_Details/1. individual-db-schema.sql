--
-- Name: provider; Type: TABLE; Schema: public
--

CREATE TABLE provider (
	provider_id VARCHAR(2) PRIMARY KEY,
	provider_name VARCHAR(20) NOT NULL,
	status SMALLINT CHECK(status>0),
	city VARCHAR(20) NOT NULL
);


--
-- Name: details; Type: TABLE; Schema: public
--

CREATE TABLE details (
	detail_id VARCHAR(2) PRIMARY KEY,
	detail_name VARCHAR(20) NOT NULL,
	detail_color VARCHAR(20) NOT NULL,
	detail_size SMALLINT CHECK(detail_size>0),
	city VARCHAR(20) NOT NULL
);


--
-- Name: project; Type: TABLE; Schema: public
--

CREATE TABLE project (
	project_id VARCHAR(3) PRIMARY KEY,
	project_name VARCHAR(4) NOT NULL,
	city VARCHAR(20) NOT NULL
);


--
-- Name: number_of_supplied_details_for_the_project; Type: TABLE; Schema: public
--

CREATE TABLE number_of_supplied_details_for_the_project (
	provider_id VARCHAR(2) REFERENCES provider(provider_id),
	detail_id VARCHAR(2) REFERENCES details(detail_id),
	project_id VARCHAR(3) REFERENCES project(project_id),
	detail_sum SMALLINT CHECK(detail_sum>0),
	PRIMARY KEY (provider_id, detail_id, project_id)
);