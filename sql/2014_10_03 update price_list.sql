ALTER TABLE PRICE_LIST 
 ADD (
  SPEC_PRICE number(1,0) 
 )
/
COMMENT ON COLUMN PRICE_LIST.SPEC_PRICE IS '���� �����������'
/

ALTER TABLE PRICE_LIST 
 ADD (
  BEST_PRICE number(1,0) 
 )
/
COMMENT ON COLUMN PRICE_LIST.BEST_PRICE IS '������ ����'
/

ALTER TABLE PRICE_LIST 
 ADD (
  DISCOUNT number(15,2) 
 )
/
COMMENT ON COLUMN PRICE_LIST.DISCOUNT IS '������'
/


ALTER TABLE PRICE_LIST_ALL
 ADD (
  SPEC_PRICE number(1,0) 
 )
/
COMMENT ON COLUMN PRICE_LIST_ALL.SPEC_PRICE IS '���� �����������'
/

ALTER TABLE PRICE_LIST_ALL 
 ADD (
  BEST_PRICE number(1,0) 
 )
/
COMMENT ON COLUMN PRICE_LIST_ALL.BEST_PRICE IS '������ ����'
/

ALTER TABLE PRICE_LIST_ALL 
 ADD (
  DISCOUNT number(15,2) 
 )
/
COMMENT ON COLUMN PRICE_LIST_ALL.DISCOUNT IS '������'
/
