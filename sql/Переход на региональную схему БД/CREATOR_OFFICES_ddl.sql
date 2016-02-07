-- Start of DDL Script for Table CREATOR.OFFICES
-- Generated 10.12.2011 1:07:24 from CREATOR@STARREG


CREATE TABLE offices
    (id_office                      NUMBER(4,0) ,
    office_name                    VARCHAR2(50 BYTE),
    brief                          VARCHAR2(10 BYTE))
/


-- Constraints for OFFICES

ALTER TABLE offices
ADD CONSTRAINT pk_office PRIMARY KEY (id_office)
/


-- Comments for OFFICES

COMMENT ON TABLE offices IS '����� ��������'
/

create or replace public synonym offices for creator.offices
/

INSERT INTO offices 
VALUES(1,'�������� (������)','���');
INSERT INTO offices 
VALUES(3,'������','���');
INSERT INTO offices 
VALUES(2,'������','���');


-- End of DDL Script for Table CREATOR.OFFICES

