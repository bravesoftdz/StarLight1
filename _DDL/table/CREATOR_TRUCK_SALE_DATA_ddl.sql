-- Start of DDL Script for Table CREATOR.TRUCK_SALE_INVOICES
-- Generated 18.11.2016 2:16:13 from CREATOR@STAR_NEW

CREATE TABLE truck_sale_data
(
  truck_sale_id     NUMBER(10,0) NOT NULL,
  n_id              NUMBER(10,0) NOT NULL,
  coef              number(10,6),
  price             number(10,2)
)
  TABLESPACE  starlight_t
/

-- Grants for Table
GRANT INSERT ON truck_sale_data TO new_role
/
GRANT SELECT ON truck_sale_data TO new_role
/
GRANT UPDATE ON truck_sale_data TO new_role
/

create public synonym truck_sale_data for creator.truck_sale_data
/



-- Indexes for TRUCK_SALE_INVOICES

CREATE INDEX ix_truck_sale_data_n_id ON truck_sale_data
  (
    n_id                          ASC
  )
  TABLESPACE  starlight_i
/

CREATE INDEX ix_truck_sale_data_id ON truck_sale_data
  (
    truck_sale_id                   ASC
  )
  TABLESPACE  starlight_i
/



-- Constraints for TRUCK_SALE_INVOICES




-- Comments for TRUCK_SALE_INVOICES

COMMENT ON TABLE truck_sale_data IS '������ ��� ������� � �����'
/
COMMENT ON COLUMN truck_sale_data.n_id IS 'FK ������������'
/
COMMENT ON COLUMN truck_sale_data.coef IS '������������ �������'
/
COMMENT ON COLUMN truck_sale_data.price IS '������������ ����'
/
COMMENT ON COLUMN truck_sale_data.truck_sale_id IS 'FK ������� � �����'
/

-- End of DDL Script for Table CREATOR.TRUCK_SALE_INVOICES

-- Foreign Key
ALTER TABLE truck_sale_data
ADD CONSTRAINT fk_truck_sale_data_id FOREIGN KEY (truck_sale_id)
REFERENCES truck_sale (truck_sale_id) ON DELETE CASCADE
/
-- End of DDL script for Foreign Key(s)
