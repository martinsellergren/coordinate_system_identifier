SELECT distinct
    coord_ref_sys_kind
FROM
    "epsg_coordinatereferencesystem";

SELECT distinct
    coord_sys_type
FROM
    "epsg_coordinatesystem"
LIMIT
    100;

select distinct
    format(
        'https://epsg.io/%s',
        rs.coord_ref_sys_code
    ),
    rs.coord_ref_sys_name,
    rs.coord_ref_sys_kind,
    cs.coord_sys_type
from
    epsg_coordinatereferencesystem rs
    join epsg_coordinatesystem cs on rs.coord_sys_code = cs.coord_sys_code
where
    coord_ref_sys_kind = 'projected';

--select st_astext (ST_FlipCoordinates (st_transform (st_point (20.548645, 69.059973, 4326), 3006)));