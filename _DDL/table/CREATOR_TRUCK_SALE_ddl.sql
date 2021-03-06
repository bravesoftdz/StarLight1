-- Start of DDL Script for Table CREATOR.TRUCK_SALE
-- Generated 22.11.2016 0:20:51 from CREATOR@STAR_NEW

CREATE TABLE truck_sale
    (truck_sale_id                  NUMBER(10,0) ,
    start_date                     DATE,
    stop_date                      DATE,
    comments                       VARCHAR2(1024 BYTE),
    price_coef                     NUMBER(15,6),
    id_office                      NUMBER(4,0) DEFAULT 1,
    date_create                    DATE DEFAULT sysdate,
    date_change                    DATE,
    user_create                    VARCHAR2(20 BYTE),
    user_change                    VARCHAR2(20 BYTE),
    status                         VARCHAR2(20 BYTE) DEFAULT '�����',
    course                         NUMBER(10,6))
  TABLESPACE  starlight_t
/

-- Grants for Table
GRANT INSERT ON truck_sale TO new_role
/
GRANT SELECT ON truck_sale TO new_role
/
GRANT UPDATE ON truck_sale TO new_role
/

create public synonym truck_sale for creator.truck_sale
/



-- Indexes for TRUCK_SALE

CREATE INDEX ix_start_date ON truck_sale
  (
    start_date                      ASC
  )
  TABLESPACE  starlight_i
/

CREATE INDEX ix_stop_date ON truck_sale
  (
    stop_date                       ASC
  )
  TABLESPACE  starlight_i
/



-- Constraints for TRUCK_SALE

ALTER TABLE truck_sale
ADD CONSTRAINT pk_truck_sale PRIMARY KEY (truck_sale_id)
USING INDEX
  TABLESPACE  starlight_t
/


-- Triggers for TRUCK_SALE

CREATE OR REPLACE TRIGGER tr_d_truck_sale
 AFTER
  DELETE
 ON truck_sale
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN insert into user_logs values(
    SEQ_LOGS.nextval
    , sysdate
    , 'truck_sale'
    , 'delete'
    , 'start_date='||:OLD.start_date||chr(10)||'stop_date='||:OLD.stop_date||chr(10)||'price_coef='||:OLD.price_coef||chr(10)||'status='||:OLD.status
    , ''
    , user
    , :OLD.truck_sale_id
    );
 END;
/

CREATE OR REPLACE TRIGGER tr_u_truck_sale
 AFTER
  UPDATE
 ON truck_sale
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN insert into user_logs values(
    SEQ_LOGS.nextval
    , sysdate
    , 'truck_sale'
    , 'update'
    , 'start_date='||:OLD.start_date||chr(10)||'stop_date='||:OLD.stop_date||chr(10)||'price_coef='||:OLD.price_coef||chr(10)||'status='||:OLD.status
    , 'start_date='||:NEW.start_date||chr(10)||'stop_date='||:NEW.stop_date||chr(10)||'price_coef='||:NEW.price_coef||chr(10)||'status='||:NEW.status
    , user
    , :NEW.truck_sale_id
    );
 END;
/

CREATE OR REPLACE TRIGGER tr_i_truck_sale
 AFTER
  INSERT
 ON truck_sale
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN insert into user_logs values(
    SEQ_LOGS.nextval
    , sysdate
    , 'truck_sale'
    , 'insert'
    , ''
    , 'start_date='||:NEW.start_date||chr(10)||'stop_date='||:NEW.stop_date||chr(10)||'price_coef='||:NEW.price_coef||chr(10)||'status='||:NEW.status
    , user
    , :NEW.truck_sale_id
    );
 END;
/


-- Comments for TRUCK_SALE

COMMENT ON TABLE truck_sale IS '�������� ������� ������ ������ � �����'
/
COMMENT ON COLUMN truck_sale.comments IS '�����������'
/
COMMENT ON COLUMN truck_sale.course IS '���� ������'
/
COMMENT ON COLUMN truck_sale.price_coef IS '����������� �������'
/
COMMENT ON COLUMN truck_sale.start_date IS '���� ������ ������ �� �����'
/
COMMENT ON COLUMN truck_sale.status IS '������ ������ ������'
/
COMMENT ON COLUMN truck_sale.stop_date IS '���� ��������� ������ �� �����'
/
COMMENT ON COLUMN truck_sale.truck_sale_id IS 'PK'
/

-- End of DDL Script for Table CREATOR.TRUCK_SALE

