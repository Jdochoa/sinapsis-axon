SET TERM ^ ;
CREATE PROCEDURE AXN_GEN_ID (
    GENERADOR Varchar(50),
    VALOR Integer )
RETURNS (
    ID AXN_IDENTIFICADOR )
AS
declare variable strSQL varchar(100);
BEGIN
   execute statement  'select GEN_ID('||GENERADOR||' , 1) from rdb$database ' into :id;
  suspend;
END^
SET TERM ; ^

GRANT EXECUTE
 ON PROCEDURE AXN_GEN_ID TO  SYSDBA;

