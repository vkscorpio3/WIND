create table wind_catalog (
	catalog_id		varchar2(40)	not null,
	asset_version   number(19, 0)   not null,
	root_nav_cat	varchar2(40)	not null,
constraint wind_catalog_p primary key (catalog_id,asset_version));

--//@UNDO

DROP TABLE wind_catalog;