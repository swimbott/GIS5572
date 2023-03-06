

-- Create a feature class
CREATE TABLE postgis_table (
    id integer,
    name text
);

-- Add points to a feature class
CREATE TABLE postgis_stadiums (
    name VARCHAR(20),
	id integer,
    geom geometry(Point,4326)
);

-- Add line to a feature class
CREATE TABLE postgis_stadium_lines (
  name VARCHAR(20),
  geom GEOMETRY(LINESTRING, 4326)
);

INSERT INTO postgis_stadium_lines (name, geom) VALUES 
    ('fiserv_lambeau', ST_GeomFromText('LINESTRING(-87.917923 43.045231, -88.0573 44.5008)', 4326));
	
-- Add polygons to a feature class
CREATE TABLE postgis_stadium_polys (
  id serial primary key,
  name varchar(20),
  geom geometry(Polygon)
);

INSERT INTO postgis_stadium_polys (name, geom) VALUES 
  ('stadium Polygon', ST_GeomFromText('POLYGON((-87.917923 43.045231, -88.0573 44.5008, -89.4077 43.0687, -87.9616 43.0348, -87.917923 43.045231))', 4326));

--View each row in an attribute table for a feature class
SELECT * FROM postgis_stadium_polys;

--View each geometry object in a feature class
SELECT COUNT(*), COUNT(name) FROM postgis_stadium_polys;

-- Export to shapefile
-- in a command prompt # run: pgsql2shp -f output_shapefile.shp -h database_host -u bott0137 lab0 postgis_stadium_polys ->   # postgres

-- Export to geodatabase
-- in a command prompt -> # run: ogr2ogr -f "FileGDB" geodatabase.gdb PG:"host=database_host user=bott0137 dbname=lab0 password=postgres" -nln postgis_stadium_polys -nlt POLYGON input_table_name

	
	