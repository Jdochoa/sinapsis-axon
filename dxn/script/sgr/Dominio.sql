CREATE DOMAIN SRG_PASSWORD AS varchar(30) NOT NULL CHECK(CHAR_LENGTH(Value) >= 8);
