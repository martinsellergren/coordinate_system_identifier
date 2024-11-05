create
or replace function transxy (y float, x float, srid int) returns text language sql
begin atomic
select
    st_astext (
        ST_FlipCoordinates (
            st_transform (st_point (x, y, 4326), srid)
        )
    );

end;

create
or replace function transyx (y float, x float, srid int) returns text language sql
begin atomic
select
    st_astext (
        ST_FlipCoordinates (
            st_transform (st_point (x, y, 4326), srid)
        )
    );

end;
