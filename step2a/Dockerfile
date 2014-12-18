FROM 6a7076968569
MAINTAINER Jon Whitcraft <jwhitcraft@sugarcrm.com>

ENV ORACLE_BASE /u01/app/oracle
ENV ORACLE_SID ORCL
ENV ORACLE_HOME $ORACLE_BASE/product/12.1.0/dbhome_1
ENV PATH $ORACLE_HOME/bin:$PATH

ADD createctx.sql $ORACLE_HOME/config/scripts/createctx.sql
ADD create-ctx /tmp/create-ctx
