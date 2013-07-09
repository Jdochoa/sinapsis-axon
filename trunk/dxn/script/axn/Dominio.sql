/*--------------------------------------------*/
/*----------------AXN_SYS--------------------*/
/*--------------------------------------------*/
CREATE DOMAIN AXN_LOGICO
	AS Char(1) DEFAULT 'U' NOT NULL CHECK (value in('T','F','U')) COLLATE ISO8859_1;
CREATE DOMAIN AXN_ENTERO
	AS Bigint DEFAULT 0 NOT NULL;
CREATE DOMAIN AXN_NUMERO
	AS Double precision DEFAULT 0 NOT NULL;
CREATE DOMAIN AXN_SEXO
	AS Char(1) DEFAULT 'N' NOT NULL CHECK(VALUE IN ('N', 'M', 'F')) 
	COLLATE ISO8859_1;
	
/*--------------------------------------------*/
/*----------------AXN_DATA--------------------*/
/*--------------------------------------------*/
CREATE DOMAIN AXN_IDENTIFICADOR
	AS Bigint not null;
CREATE DOMAIN AXN_USUARIO
	AS Varchar(50) DEFAULT current_user
	COLLATE ISO8859_1;	
CREATE DOMAIN AXN_FECHAHORA
	AS Timestamp DEFAULT 'now' not null;
/*--------------------------------------------*/
/*----------------AXN_CATALOGO----------------*/
/*--------------------------------------------*/
CREATE DOMAIN AXN_CODIGO
	AS Varchar(30) DEFAULT '' NOT NULL  CHECK(Value similar to '[[:UPPER:]|[:DIGIT:]|(|)]+')
	COLLATE ISO8859_1;
CREATE DOMAIN AXN_DESCRIPCION
	AS Varchar(200) DEFAULT NULL 
	COLLATE ES_ES;
/*--------------------------------------------*/
/*----------------AXN_DOCUMENTO---------------*/
/*--------------------------------------------*/
CREATE DOMAIN AXN_SERIE
	AS Varchar(20) DEFAULT '' NOT NULL CHECK(Value IN(similar to '[[:UPPER:]|[:DIGIT:]]+[[:UPPER:]|[:DIGIT:]|$-]*' escape '$','')
	COLLATE ISO8859_1;
CREATE DOMAIN AXN_CORRELATIVO
	AS Bigint  DEFAULT 0 NOT NULL CHECK (Value > 0);
CREATE DOMAIN AXN_FECHA
	AS Timestamp DEFAULT 'today' NOT NULL check (Value <= 'Today');
CREATE DOMAIN AXN_VALOR
	AS Double precision DEFAULT 0 NOT NULL check (Value >= 0);

/*--------------------------------------------*/
/*----------------AXN_TRN---------------------*/
/*--------------------------------------------*/
CREATE DOMAIN AXN_FORMAAFECTA
	AS char(1) DEFAULT '' NOT NULL check(Value in ('','+','-'));
/*--------------------------------------------*/
/*----------------AXN_MDL---------------------*/
/*--------------------------------------------*/
CREATE DOMAIN AXN_MODULO
	AS Char(3) DEFAULT 'CNF' NOT NULL CHECK(Value in ('CNF', 'TRN', 'PRD', 'CLI', 'PRO', 'INV', 'CXC', 'CXP', 'FCT', 'CMP', 'CTA', 'IVA','BCO','SRV','EST','ORG','INT' ))
	COLLATE ISO8859_1;

	
