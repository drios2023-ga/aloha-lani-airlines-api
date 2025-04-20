drop user if exists webapp;
create user webapp with password 'BlueSushi123@';
grant connect on database enrollments to webapp;
grant usage on schema public to webapp;

grant select, insert, update, delete on all tables in schema "public" to webapp;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA "public" TO webapp;
--grant update on all tables in schema "public" to webapp;
--grant insert on all tables in schema "public" to webapp;
--grant delete on all tables in schema "public" to webapp;
--grant truncate on all tables in schema "public" to webapp;