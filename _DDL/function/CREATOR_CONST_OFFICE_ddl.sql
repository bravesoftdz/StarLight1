-- Start of DDL Script for Function CREATOR.CONST_OFFICE
-- Generated 18.01.2017 1:18:05 from CREATOR@STAR_REG

CREATE OR REPLACE 
FUNCTION const_office
  RETURN  number IS
--
-- ��� ������� ����� ����� ��������� ��� ���.
-- 1 - �������� ������
-- 2 - ������
-- 3 - ������
-- 5 - ���������
-- 6 - ���
-- 8 - ������������
--
-- ������������ �� ���� �������� ���������� � ������� ������
-- ---------   ------  -------------------------------------------
BEGIN
    RETURN 1;
END;
/

-- Grants for Function
GRANT EXECUTE ON const_office TO new_role
/


-- End of DDL Script for Function CREATOR.CONST_OFFICE

