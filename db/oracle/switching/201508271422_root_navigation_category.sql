create table wind_catalog (
	catalog_id		varchar2(40)	not null,
	root_nav_cat	varchar2(40)	not null
,constraint wind_catalog_p primary key (catalog_id)
,constraint wind_catalog_f foreign key (root_nav_cat) references dcs_category (category_id));

--//@UNDO

DROP TABLE wind_catalog;