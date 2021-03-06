CREATE TABLE SYS_SYS0_SYSTEM
(
  ID AXN_IDENTIFICADOR NOT NULL,
  CREATEDBY AXN_USUARIO DEFAULT current_user,
  CREATEDAT AXN_FECHAHORA DEFAULT 'now',
  MODIFIEDBY AXN_USUARIO DEFAULT current_user,
  MODIFIEDAT AXN_FECHAHORA DEFAULT 'now',
  CODIGO SYS_GUID DEFAULT '' NOT NULL,
  DESCRIPCION AXN_DESCRIPCION DEFAULT '' NOT NULL,
  DEFECTO AXN_LOGICO DEFAULT 'F' NOT NULL,
  ESTATUS AXN_CTLSTATUS DEFAULT 'A' NOT NULL,
  CONSTRAINT PK_SYS_SYS0_SYSTEM PRIMARY KEY (ID)
);
GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON SYS_SYS0_SYSTEM TO  SYSDBA WITH GRANT OPTION;
 

 
