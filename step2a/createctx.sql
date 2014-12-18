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


### TEMP
STARTUP MOUNT;
ALTER SYSTEM ENABLE RESTRICTED SESSION;
ALTER SYSTEM SET JOB_QUEUE_PROCESSES=0;
ALTER SYSTEM SET AQ_TM_PROCESSES=0;
ALTER DATABASE OPEN;
ALTER DATABASE CHARACTER SET INTERNAL_USE AL32UTF8;
ALTER DATABASE CHARACTER SET AL32UTF8;

select value from nls_database_parameters where parameter='NLS_CHARACTERSET';

SHUTDOWN IMMEDIATE; -- or SHUTDOWN NORMAL;
STARTUP;
