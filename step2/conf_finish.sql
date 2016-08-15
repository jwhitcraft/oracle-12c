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

-- make sure the database datafile can auto extend
alter database datafile '/u01/app/oracle/oradata/ORCL/datafile/o1_mf_system_b1j6hp8b_.dbf' AUTOEXTEND ON;

-- make the default password unlimited life time
alter profile default limit password_life_time unlimited;
alter user system identified by manager;

-- Setting Enterprise Manager Express HTTP ports.
exec dbms_xdb_config.sethttpsport(5500);
exec dbms_xdb_config.sethttpport(8080);

-- Shutdown.
shutdown immediate;

exit;
