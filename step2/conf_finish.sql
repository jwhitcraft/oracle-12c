-- Setup Oracle Text Context
connect / as sysdba
create spfile from pfile;
startup
spool text
@?/ctx/admin/catctx Ctxsys2013 SYSAUX TEMP NOLOCK
grant execute on dbms_lob to ctxsys;
grant ctxapp to ctxsys;
connect ctxsys/Ctxsys2013
@?/ctx/admin/defaults/dr0defin
connect / as sysdba
spool off

-- Setting Enterprise Manager Express HTTP ports.
exec dbms_xdb_config.sethttpsport(5500);
exec dbms_xdb_config.sethttpport(8080);

-- Shutdown.
shutdown immediate;

exit;
