-- Start of DDL Script for Table CREATOR.ERR_LOGS
-- Generated 09.07.2016 2:15:59 from CREATOR@STAR_NEW

CREATE TABLE sync_nomenclature_log
    (id                             VARCHAR2(40 BYTE),
    error_message                  VARCHAR2(4000 BYTE),
    error_code                     VARCHAR2(100 BYTE),
    run_time                     DATE,
    run_user                    VARCHAR2(100 BYTE),
    sql_str                        VARCHAR2(4000 BYTE))
  TABLESPACE  starlight_t
/





-- Comments for ERR_LOGS

COMMENT ON TABLE sync_nomenclature_log IS '��� ������ ������������� ������������'
/
COMMENT ON COLUMN sync_nomenclature_log.error_code IS '��� ������'
/
COMMENT ON COLUMN sync_nomenclature_log.error_message IS '��������� ������'
/
COMMENT ON COLUMN sync_nomenclature_log.run_time IS '���� �������'
/
COMMENT ON COLUMN sync_nomenclature_log.id IS 'pk'
/
COMMENT ON COLUMN sync_nomenclature_log.run_user IS '��� ��������'
/
COMMENT ON COLUMN sync_nomenclature_log.sql_str IS '������ �������'
/

create public synonym sync_nomenclature_log for creator.sync_nomenclature_log
/
grant select, insert, update, delete on sync_nomenclature_log to new_role
/

-- End of DDL Script for Table CREATOR.ERR_LOGS

