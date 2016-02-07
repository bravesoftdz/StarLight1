-- Start of DDL Script for Package Body CREATOR.STORE_PKG
-- Generated 10.12.2011 20:58:08 from CREATOR@STARREG

CREATE OR REPLACE 
PACKAGE store_pkg
IS

TYPE ref_cursor is REF CURSOR; -- ���� ����� ����������� ��� ������

--
-- ����� ������� ��������� ������������
--
PROCEDURE get_deps_on_user
(
   login_  in  varchar2,
   cursor_ in out ref_cursor
);


--
--  ��������� �������������������
--
procedure number_obnul
(
  av_seq in varchar2
);


--
-- ����� ��������� �������
--
PROCEDURE get_doc_view
(
   id_dep_      in number,
   DOC_NUMBER_  in varchar2,
   DOC_DATE1_   in date,
   DOC_DATE2_   in date,
   ID_DOC_TYPE_ in number,
   v_office     in number,
   cursor_      out ref_cursor
);


--
--  ���������� ������ �� ������� � �����
--
procedure data_from_inv
(
  inv_num IN NUMBER
);


--
--  ��������� � �����
--
procedure insert_in_store
(
  IID_DOC IN NUMBER
);


--
--  ��������� � �����
--
procedure insert_in_cash
(
  IID_DOC IN NUMBER
);


--
--  ��������� � �����������
--
procedure insert_in_buh
(
  IID_DOC IN NUMBER
);


--
--  ���������� �� ��������� ������� ������ �� �����
--
procedure doc_new
(
 SP_ID_CLIENT   IN NUMBER,
 SP_DOC_DATE    IN Date,
 SP_ID_DOC_TYPE IN NUMBER,
 SP_COMMENTS    IN VARCHAR,
 SP_OTDEL       IN VARCHAR,
 SP_INV_ID      IN NUMBER,
 SP_Order_ID    IN NUMBER,
 out_message    OUT VARCHAR,
 out_docid      OUT NUMBER
);


--
--  ������ / ��������
--
procedure set_price_part
(
  price_percent IN NUMBER
);


--
--  ������ / ��������� �������� ��� ��������������
--
procedure set_check_inv
(
  added_1_    IN NUMBER,
  added_      IN NUMBER,
  N_ID_       in number,
  QUANTITY_   in number,
  STORE_TYPE_ in number,
  PRICE_      in number
);


--
--  ��������� �� ��������� ������� ������
--
procedure ins_in_temp
(
  n_id_         IN NUMBER,
  store_type_   IN NUMBER
);


--
--  ��������� ��� ������������ �� ��������� �������
--
procedure NOM_TO_TEMP
(
  in_otdel IN NUMBER,
  param_   in number
);


--
--  ������ �������� ������
--
procedure report_move
(
  DDATE_BEGIN IN DATE,
  DDATE_END   IN DATE,
  rem_nulls   in NUMBER,
  v_office    in number
--  ,  gtd_        in varchar2
);


--
-- �������� ������
--
PROCEDURE get_store_view
(
   id_dep_      in number,
   store_       in number,
   button_      in number,
   v_office     in number,
   cursor_      out ref_cursor
);


--
-- ����� ��������� ������
--
PROCEDURE get_doc_view_client
(
   id_dep_      in number,
   DOC_NUMBER_  in varchar2,
   DOC_DATE1_   in date,
   DOC_DATE2_   in date,
   ID_DOC_TYPE_ in number,
   fio_         in varchar2,
   nick_        in varchar2,
   v_office     in number,
   cursor_      out ref_cursor
);


--
-- ����� ����� �� �������
--
PROCEDURE get_type_on_buttons
(
   id_dep_      in number,
   cursor_      out ref_cursor
);



--
-- �������� ������������
--
PROCEDURE get_data_view
(
   id_dep_      in number,
   store_       in number,
   id_doc_      in number,
   button_      in number,
   cursor_      out ref_cursor
);


--
-- �������� ������������
--
PROCEDURE get_noms_view
(
   store_       in number,
   id_dep_      in number,
   button_      in number,
   price_part   in number,
   quant_p_     in number,
   v_office     in number,
   cursor_      out ref_cursor
);


--
--  ���������� ����
--
PROCEDURE lom_add
(
  in_n_id IN NUMBER,
  in_QUANTITY IN NUMBER,
  in_DOC_DATE IN DATE,
  in_OTDEL IN VARCHAR
);


--
--  ������ ������� �������
--
procedure CHANGE_PRICE
(
  in_n_id IN NUMBER,
  in_Percent IN NUMBER,
  in_QUANTITY IN NUMBER,
  in_DOC_DATE IN DATE,
  in_OTDEL IN VARCHAR,
  in_OPERATOR_NAME IN VARCHAR
);


--
--  �������� �� ������ ������
--
procedure data_from_order
(
  oder_num IN NUMBER
);


--
--  ���� ���������
--
procedure doc_new_from_store_doc
(
  IID_DOC IN NUMBER,
  out_docid OUT NUMBER
);


--
-- �������� ������
--
procedure data_from_storedoc_minus
(
  store_doc IN NUMBER
);


--
--  ��������� ������������ � �������������� �� ����
--
procedure inventory_add_types
(
  ttypes IN VARCHAR,
  sub_ttypes IN VARCHAR
);


--
-- ����� ���������������� ��������
--
PROCEDURE select_invoices
(
   id_dep_      in number,
   cursor_      in out ref_cursor
);


--
-- ����� �������� �������
--
PROCEDURE select_store
(
   ID_DEPARTMENTS_  in number,
   STORE_TYPE_      in number,
   v_office         in number,
   cursor_          in out ref_cursor
);


--
-- ����� ���� ��������
--
PROCEDURE select_subtypes_all
(
   id_dep_  in number,
   cursor_  out ref_cursor
);


--
-- ����� �������� ��� ������
--
PROCEDURE select_subtypes_button
(
   id_dep_  in number,
   button_  in number,
   cursor_  out ref_cursor
);


--
-- ����� ��������
--
PROCEDURE select_clients
(
   cursor_  out ref_cursor
);


-- ��������� ������ ������ � ���������
--
PROCEDURE insert_fast_ucenka
(
  n_id_       in number,
  QUANTITY_   in number
);


--
-- ����� ������ ��� ������
--
PROCEDURE select_ucenka
(
   id_dep_     in number,
   price_part_ in number,
   cursor_     out ref_cursor
);


--
-- �������� ���������
--
PROCEDURE delete_doc
(
   ID_DOC_     in number
);


procedure doc_new_hst
(
 SP_ID_CLIENT   IN NUMBER,
 SP_DOC_DATE    IN Date,
 SP_ID_DOC_TYPE IN NUMBER,
 SP_COMMENTS    IN VARCHAR,
 SP_OTDEL       IN VARCHAR,
 out_message    OUT VARCHAR,
 out_docid      OUT NUMBER
);


--
-- ������� ����� ��� ������
--
PROCEDURE select_subtypes_sale
(
   id_dep_  in number,
   var_     in number,
   cursor_  out ref_cursor
);


--
--����� ����� ��� ������
--
PROCEDURE get_type_on_buttons_sale
(
   id_dep_      in number,
   var_         in number,
   cursor_      out ref_cursor
);


--
-- ������� ��������� ���������� �������� ��� ����� ���� � ����� �����-����� ��� �������, ��� ���� ������� ��� � ����� �������
--
procedure insert_in_store_reprice
(
  v_PPLI_ID IN NUMBER
);


--
-- �������� ������������ �������� ��� ������
--
PROCEDURE delete_personal_settings
(
   v_id      in number
);


--
-- �������������� ������������ �������� ��� ������
--
PROCEDURE edit_personal_settings
(
   v_id           in number,
   v_user         in varchar2,
   v_id_company   in number,
   v_date_begin   in date,
   v_date_end     in date,
   v_prikaz_n     in varchar2
);


--
-- ����� ������������ �������� ��� ������
--
PROCEDURE get_personal_settings
(
   v_date        in date,
   v_id_company  in number,
   cursor_       out ref_cursor
);

END;
/

-- Grants for Package
GRANT EXECUTE ON store_pkg TO new_role
/

CREATE OR REPLACE 
PACKAGE BODY store_pkg
IS

--
-- ����� ������� ��������� ������������
--
PROCEDURE get_deps_on_user
(
   login_  in  varchar2,
   cursor_ in out ref_cursor
)
IS

BEGIN

  open cursor_ for
             SELECT a.ID_DEPARTMENTS, a."NAME"
                    from books_departments a, EMPLOYEES_DEPARTMENTS b, CLIENTS c
                      where a.state=1 and a.ID_DEPARTMENTS = b.id_departments
                      and b.id_employees = c.id_clients and c.LOGIN = login_ order by a."NAME";

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.get_deps_on_user', '');
       RAISE_APPLICATION_ERROR (-20300, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

END get_deps_on_user;



--
--  ��������� �������������������
--
procedure number_obnul
(
  av_seq in varchar2
)
is
  sql_str varchar2(200);
  var1    number;
Begin

  sql_str := 'select '||av_seq||'.NEXTVAL from dual';
  EXECUTE IMMEDIATE sql_str into var1;

  sql_str := 'ALTER SEQUENCE '||av_seq||' INCREMENT BY '|| (0-var1+1);
  EXECUTE IMMEDIATE sql_str;

  sql_str := 'select '||av_seq||'.NEXTVAL from dual';
  EXECUTE IMMEDIATE sql_str into var1;

  sql_str := 'ALTER SEQUENCE '||av_seq||' INCREMENT BY 1';
  EXECUTE IMMEDIATE sql_str;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.number_obnul', sql_str);
       RAISE_APPLICATION_ERROR (-20301, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end number_obnul;




--
-- ����� ��������� �������
--
PROCEDURE get_doc_view
(
   id_dep_      in number,
   DOC_NUMBER_  in varchar2,
   DOC_DATE1_   in date,
   DOC_DATE2_   in date,
   ID_DOC_TYPE_ in number,
   v_office     in number,
   cursor_      out ref_cursor
)
IS

BEGIN

  open cursor_ for
    SELECT a.id_doc, a.doc_number, a.id_doc_type, a.id_departments,
       a.department_name, a.operator_name, a.doc_date, a.doc_date_real,
       a.id_client, a.nick, a.fio, a.quantity_all, a.price_all,
       a.sum_price_old, a.sum_price_new, a.sum_price_difference,
       a.comments, a.inv_id, a.order_id, a.supplier_date,
       a.supplier_number, a.suplier, a.s_name_ru, a.id_office, a.brief
        FROM store_doc_view2 a
          where a.id_departments = id_dep_ and (id_office = v_office or v_office = 0)
                and (a.DOC_NUMBER = DOC_NUMBER_ or DOC_NUMBER_ is null)
                and trunc(a.doc_date) between DOC_DATE1_ and DOC_DATE2_
                and a.ID_DOC_TYPE = ID_DOC_TYPE_
             ORDER BY DOC_DATE desc, DOC_DATE_real desc;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.number_obnul', '');
       RAISE_APPLICATION_ERROR (-20302, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end get_doc_view;



--
-- �������� ������
--
PROCEDURE get_store_view
(
   id_dep_      in number,
   store_       in number,
   button_      in number,
   v_office     in number,
   cursor_      out ref_cursor
)
IS

BEGIN

if id_dep_ = 62 then
  open cursor_ for
    select a.N_ID, a.full_name, a.F_TYPE, a.F_SUB_TYPE, a.CODE, a.H_CODE, a.LEN, a.PACK, a.COLOUR, a.COUNTRY, a.QUANTITY,
           a.PRICE, a.FT_ID, a.FST_ID, a.C_ID, a.COL_ID, a.S_ID, a.S_NAME_RU,
           (a.QUANTITY * a.PRICE) as QUANTITY_PRICE, TO_NUMBER(b.nbutton,9) as nbutton,
           a.reserv, a.spesification, a.hol_type, a.hol_sub_type
           , case when b.nbutton = 2 then '1: ���� ���������' else
           case when b.nbutton = 3 then '2: ���� �������' else
           case when b.nbutton = 4 then '3: ����������' else
           case when b.nbutton = 5 then '4: ������' else
           case when b.nbutton = 6 then '5: ��������' else
           case when b.nbutton = 7 then '6: �����' else
           case when b.nbutton = 8 then '7: ������ �����' else '8: '
           end end end end end end end but_name
           , compiled_name_otdel
           , a.id_office, a.brief
        FROM store_view a,
            (SELECT a.fst_id, a.nbutton, a.f_char FROM buttons_set a where id_dep = id_dep_) b
          where a.id_departments = id_dep_ and (a.id_office = v_office or v_office = 0)
                and a.STORE_TYPE = store_
                    and (a.fst_id = b.fst_id(+) and (b.nbutton = button_ or button_ = 0))
                    ORDER BY b.nbutton, /* a.f_sub_type ,*/ a.full_name;

else
  open cursor_ for
    select a.N_ID, a.full_name, a.F_TYPE, a.F_SUB_TYPE, a.CODE, a.H_CODE, a.LEN, a.PACK, a.COLOUR, a.COUNTRY, a.QUANTITY,
           a.PRICE, a.FT_ID, a.FST_ID, a.C_ID, a.COL_ID, a.S_ID, a.S_NAME_RU,
           (a.QUANTITY * a.PRICE) as QUANTITY_PRICE, TO_NUMBER(0,9) as nbutton,
           a.reserv, a.spesification, null as hol_type, null as hol_sub_type
           ,'���' but_name
           , compiled_name_otdel
           , a.id_office, a.brief
        FROM store_view a
          where a.id_departments = id_dep_ and (a.id_office = v_office or v_office = 0)
                and a.STORE_TYPE = store_
                  order by a.F_TYPE, a.f_sub_type, a.full_name;
end if;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.number_obnul', '');
       RAISE_APPLICATION_ERROR (-20303, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end get_store_view;




--
-- �������� ������������
--
PROCEDURE get_data_view
(
   id_dep_      in number,
   store_       in number,
   id_doc_      in number,
   button_      in number,
   cursor_      out ref_cursor
)
IS

BEGIN

if id_dep_ = 62 then
  open cursor_ for
    SELECT a.ID_DOC, a.N_ID, a.CODE, a.H_CODE, a.F_TYPE, a.F_SUB_TYPE, a.FULL_NAME, a.QUANTITY, a.QUANTITY_NOW, a.STORE_TYPE_NAME,
           a.STORE_TYPE, a.PRICE, a.PRICE_LIST, a.QUANTITY_PRICE, a.PRICE_PERCENT, a.GTD, a.S_NAME_RU,
           null as SPESIFICATION, a.fst_id
           , TO_NUMBER(b.nbutton,9) as nbutton, a.hol_type, a.hol_sub_type
           , case when b.nbutton = 2 then '1: ���� ���������' else
           case when b.nbutton = 3 then '2: ���� �������' else
           case when b.nbutton = 4 then '3: ����������' else
           case when b.nbutton = 5 then '4: ������' else
           case when b.nbutton = 6 then '5: ��������' else
           case when b.nbutton = 7 then '6: �����' else
           case when b.nbutton = 8 then '7: ������ �����' else '8: '
           end end end end end end end but_name
           , a.id_office, a.brief
      from store_docdata_view a,
           (SELECT a.fst_id, a.nbutton, a.f_char FROM buttons_set a where id_dep = id_dep_) b
        where a.ID_DOC = id_doc_
              and a.STORE_TYPE = store_
                and (a.fst_id = b.fst_id(+) and (b.nbutton = button_ or button_ = 0))
                    ORDER BY b.nbutton, /* a.f_sub_type ,*/ a.full_name;
else
  open cursor_ for
    SELECT a.ID_DOC, a.N_ID, a.CODE, a.H_CODE, a.F_TYPE, a.F_SUB_TYPE, a.FULL_NAME, a.QUANTITY, a.QUANTITY_NOW, a.STORE_TYPE_NAME,
           a.STORE_TYPE, a.PRICE, a.PRICE_LIST, a.QUANTITY_PRICE, a.PRICE_PERCENT, a.GTD,
           a.SPESIFICATION, a.fst_id
           , TO_NUMBER(0,9) as nbutton, null as hol_type, null as hol_sub_type, '���' but_name
           , a.id_office, a.brief
      from store_docdata_view a
        where a.ID_DOC = id_doc_
              and a.STORE_TYPE = store_
                    ORDER BY a.F_TYPE, a.f_sub_type, a.full_name;
end if;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.get_data_view', '');
       RAISE_APPLICATION_ERROR (-20304, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end get_data_view;



--
-- �������� ������������
--
PROCEDURE get_noms_view
(
   store_       in number,
   id_dep_      in number,
   button_      in number,
   price_part   in number,
   quant_p_     in number,
   v_office     in number,
   cursor_      out ref_cursor
)
IS

BEGIN

if id_dep_ = 62 then
  open cursor_ for
    select a.N_ID, a.CODE, a.H_CODE, a.F_TYPE, a.F_SUB_TYPE, a.FT_ID, a.FST_ID, a.full_name, a.QUANTITY_NOW, a.S_NAME_RU,
           a.store_type_name, a.STORE_TYPE, a.price_list, a.colour, a.country,
           case WHEN a.added = 0 or a.added is null THEN (a.price_list + round((a.price_list*price_part/100),2)) ELSE price END price,
           a.QUANTITY, a.added,
           case WHEN a.added = 0 or a.added is null THEN (a.price_list + round((a.price_list*price_part/100),2)) * QUANTITY ELSE QUANTITY_PRICE END QUANTITY_PRICE,
           a.id_departments,
           case WHEN a.added = 0 or a.added is null THEN price_part ELSE price_percent END price_percent,
           null as SPESIFICATION
           , TO_NUMBER(b.nbutton,9) as nbutton, a.hol_type, a.hol_sub_type
           , case when b.nbutton = 2 then '1: ���� ���������' else
           case when b.nbutton = 3 then '2: ���� �������' else
           case when b.nbutton = 4 then '3: ����������' else
           case when b.nbutton = 5 then '4: ������' else
           case when b.nbutton = 6 then '5: ��������' else
           case when b.nbutton = 7 then '6: �����' else
           case when b.nbutton = 8 then '7: ������ �����' else '8: '
           end end end end end end end but_name
           , null as GTD
           , a.COMPILED_NAME_OTDEL
           , a.id_office, a.brief
      from store_docdatatemp_view a
           , (SELECT a.fst_id, a.nbutton, a.f_char FROM buttons_set a where id_dep = id_dep_) b
        where STORE_TYPE = store_
              and ID_DEPARTMENTS = id_dep_  and (a.id_office = v_office or v_office = 0)
              and ((QUANTITY_NOW <> 0 and quant_p_ = 0) or (quant_p_ = 999 and QUANTITY_NOW=0))
                and (a.fst_id = b.fst_id(+) and (b.nbutton = button_ or button_ = 0))
                    ORDER BY b.nbutton, /* a.f_sub_type ,*/ a.full_name;

else
  open cursor_ for
    select a.N_ID, a.CODE, a.H_CODE, a.F_TYPE, a.F_SUB_TYPE, a.FT_ID, a.FST_ID, a.full_name, a.QUANTITY_NOW, a.S_NAME_RU,
           a.store_type_name, a.STORE_TYPE, a.price_list, a.colour, a.country,
           case WHEN a.added = 0 or a.added is null THEN (a.price_list + round((a.price_list*price_part/100),2)) ELSE price END price,
           a.QUANTITY, a.added,
           case WHEN a.added = 0 or a.added is null THEN (a.price_list + round((a.price_list*price_part/100),2)) * QUANTITY ELSE QUANTITY_PRICE END QUANTITY_PRICE,
           a.id_departments,
           case WHEN a.added = 0 or a.added is null THEN price_part ELSE price_percent END price_percent,
           a.SPESIFICATION
           , TO_NUMBER(0,9) as nbutton, null as hol_type, null as hol_sub_type, '���' but_name
           , null as GTD
           , a.COMPILED_NAME_OTDEL
           , a.id_office, a.brief
      from store_docdatatemp_view a
        where STORE_TYPE = store_
             and ID_DEPARTMENTS = id_dep_  and (a.id_office = v_office or v_office = 0)
              and ((QUANTITY_NOW <> 0 and quant_p_ = 0) or (quant_p_ = 999 and QUANTITY_NOW=0))
           order by a.F_TYPE, a.f_sub_type, a.full_name;
end if;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.get_noms_view', '');
       RAISE_APPLICATION_ERROR (-20305, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end get_noms_view;


--
--  ���������� ������ �� ������� � �����
--
procedure data_from_inv
(
  inv_num IN NUMBER
)
as
  v_is_minus    number;
  v_old_inv_id  number;
  v_ppli_id     number;
begin

  SELECT a.ppli_id into v_ppli_id
  FROM prepare_price_list_index a
  where a.inv_id = inv_num or a.inv_id2 = inv_num or a.inv_id3 = inv_num or a.inv_id4 = inv_num
  ;

  select a.inv_minus, a.minus_inv_id into v_is_minus, v_old_inv_id from INVOICE_REGISTER a where a.inv_id = inv_num;

  -- ���� ������� ������
  if (v_is_minus = 0) then

    DELETE FROM PRICE_LIST WHERE N_ID in
    (
      SELECT a.N_ID FROM PREPARE_PRICE_LIST a, prepare_price_list_index b
      WHERE a.PPLI_ID = b.ppli_id and (b.inv_id = inv_num or b.inv_id2 = inv_num or b.inv_id3 = inv_num or b.inv_id4 = inv_num)
    );

    insert into price_list (
      SELECT a.N_ID, sysdate, max(a.FINAL_PRICE) as FINAL_PRICE, const_office, sysdate
      FROM PREPARE_PRICE_LIST a, prepare_price_list_index b
      WHERE a.PPLI_ID = b.ppli_id and (b.inv_id = inv_num or b.inv_id2 = inv_num or b.inv_id3 = inv_num or b.inv_id4 = inv_num)
      group by a.N_ID
    );

    -- ��������� �� ��������� ������� ������ �� �������
    insert into STORE_DOC_DATA_TEMP (ID_DOC_DATA, N_ID, QUANTITY, store_type, GTD, PRICE, DOC_TYPE_ID)
    (
      SELECT STORE_DOC_DATA_TEMP_SET_ID.NEXTVAL, a.N_ID, a.units, 1, a.GTD, a.price, 1
        from
        (
          select a.N_ID, sum(a.units) as units, a.GTD, b.final_price as price
            FROM invoice_data a, nomenclature d, prepare_price_list b, suppliers c
              where a.INV_ID = inv_num
                    and a.N_ID = d.N_ID and a.N_ID = b.N_ID and b.ppli_id = v_ppli_id and b.invoice_data_id = a.invoice_data_id
                    and d.S_ID = c.S_ID and a.storned_data = 0
                    and ( a.SENDED_TO_WAREHOUSE=0 or a.SENDED_TO_WAREHOUSE is NULL )
                    and ((c.NEED_CUST=1 and a.GTD is not NULL) or (c.NEED_CUST=0))
                      group by a.GTD, a.N_ID, b.final_price
/* 2011_05_26 ������� ��-�� ���������� ������ � price_list ��� ����� �������
          select a.N_ID, sum(a.units) as units, a.GTD, b.price
            FROM invoice_data a, price_list b, suppliers c, nomenclature d
              where a.INV_ID = inv_num and a.N_ID = b.N_ID and d.N_ID = a.N_ID and c.S_ID = d.S_ID and a.storned_data = 0
                    and ( a.SENDED_TO_WAREHOUSE=0 or a.SENDED_TO_WAREHOUSE is NULL )
                    and ((c.NEED_CUST=1 and a.GTD is not NULL) or (c.NEED_CUST=0))
                      group by a.GTD, a.N_ID, b.price--, c.NEED_CUST, d.S_ID
*/
      ) a
    );

  -- ���� ��������� ������
  else

    -- ��������� �� ��������� ������� ������ �� �������
    insert into STORE_DOC_DATA_TEMP (ID_DOC_DATA, N_ID, QUANTITY, store_type, GTD, PRICE, DOC_TYPE_ID)
    (
      SELECT STORE_DOC_DATA_TEMP_SET_ID.NEXTVAL, a.N_ID, a.units, 1, a.GTD, a.price, 1
        from
        (
          select a.N_ID, a.GTD, b.price
          , (sum(a.units) - (select sum(z.units) from invoice_data z where z.inv_id = v_old_inv_id and z.n_id = a.n_id and nvl(z.gtd,0) = nvl(a.gtd,0))) as units
            FROM invoice_data a, price_list b, suppliers c, nomenclature d
              where a.INV_ID = inv_num and a.N_ID = b.N_ID and d.N_ID = a.N_ID and c.S_ID = d.S_ID and a.storned_data = 0
                    and ( a.SENDED_TO_WAREHOUSE=0 or a.SENDED_TO_WAREHOUSE is NULL )
                    and ((c.NEED_CUST=1 and a.GTD is not NULL) or (c.NEED_CUST=0))
                      group by a.GTD, a.N_ID, b.price
      ) a
    );

  end if;

    -- �������� ������ � ������� ��� ������������
    UPDATE invoice_data SET SENDED_TO_WAREHOUSE = 1, date_change=sysdate
    where INVOICE_DATA_ID in (
        select a.invoice_data_id
            FROM invoice_data a, price_list b, suppliers c, nomenclature d
              where a.INV_ID = inv_num and a.N_ID = b.N_ID and d.N_ID = a.N_ID and c.S_ID = d.S_ID and a.storned_data = 0
                    and ( a.SENDED_TO_WAREHOUSE=0 or a.SENDED_TO_WAREHOUSE is NULL )
                    and ((c.NEED_CUST=1 and a.GTD is not NULL) or (c.NEED_CUST=0))
    );

    -- �������� ������ ��� ������������
    UPDATE INVOICE_REGISTER SET SENDED_TO_WAREHOUSE = 1, WAREHOUSE_SENDED_DATE = SYSDATE, date_change=sysdate where INV_ID = inv_num;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.data_from_inv', '');
       RAISE_APPLICATION_ERROR (-20304, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end data_from_inv;
-----------------------------------------------------------------------------------------



--
--  ���������� �� ��������� ������� ������ �� �����
--
procedure doc_new
(
 SP_ID_CLIENT   IN NUMBER,
 SP_DOC_DATE    IN Date,
 SP_ID_DOC_TYPE IN NUMBER,
 SP_COMMENTS    IN VARCHAR,
 SP_OTDEL       IN VARCHAR,
 SP_INV_ID      IN NUMBER,
 SP_Order_ID    IN NUMBER,
 out_message    OUT VARCHAR,
 out_docid      OUT NUMBER
)
as
  IID_DOC           NUMBER;
  IID_DOC_BUH       NUMBER;
  DDOC_NUMBER       NUMBER;
  DDOC_SUM          NUMBER;
  SP_OPERATOR_NAME  VARCHAR(1024);
  QUANTITY_REAL     NUMBER;
  exist             NUMBER;

  CURSOR data_temp IS
    select N_ID, QUANTITY, QUANTITY_REAL, PRICE, PRICE_LIST, store_type, GTD
      from STORE_DOC_DATA_TEMP
        where QUANTITY is not NULL;

begin

  IF SP_ID_DOC_TYPE=5 THEN
    select count(N_ID) into exist
      from STORE_DOC_DATA_TEMP;
  end if;


  IF SP_ID_DOC_TYPE<>5 THEN
    select count(N_ID) into exist
      from STORE_DOC_DATA_TEMP
        where QUANTITY is not NULL
              and QUANTITY<>0
              and price<>0;
  end if;

  -- ���� ��������� ������ �� ��������
  IF exist=0 THEN out_message:='��� ������ ��� �� ����������� ����������!'; end if;

  -- ���� ���� ������, �� ��������� ������
  IF exist<>0 THEN

--    select user into SP_OPERATOR_NAME from dual;
    select a.fio into SP_OPERATOR_NAME from clients a where a.login = user;

    SELECT get_office_unique('STORE_DOC_SET_ID')
      INTO IID_DOC
        FROM DUAL;

    if SP_ID_DOC_TYPE=1 THEN --������
      SELECT STORE_DOC_1.NEXTVAL INTO DDOC_NUMBER FROM DUAL;
    END IF;

    if SP_ID_DOC_TYPE=2 THEN --��������
      SELECT STORE_DOC_2.NEXTVAL INTO DDOC_NUMBER FROM DUAL;
    END IF;

    if SP_ID_DOC_TYPE=3 THEN --������
      SELECT STORE_DOC_3.NEXTVAL INTO DDOC_NUMBER FROM DUAL;
    END IF;

    if SP_ID_DOC_TYPE=4 THEN --�������
      if (SP_ID_CLIENT is null or SP_ID_CLIENT = 0) then
         RAISE_APPLICATION_ERROR (-20305, '��������� �������������� ������. ������� ������ ��� �������' || chr(10) || '�������� �������� �������������');
      end if;

      if SP_OTDEL = 121 then
        SELECT STORE_DOC_4.NEXTVAL INTO DDOC_NUMBER FROM DUAL;
      end if;
      if SP_OTDEL = 61 then
        SELECT STORE_DOC_4_61.NEXTVAL INTO DDOC_NUMBER FROM DUAL;
      end if;
      if SP_OTDEL = 62 then
        SELECT STORE_DOC_4_62.NEXTVAL INTO DDOC_NUMBER FROM DUAL;
      end if;
    END IF;

    if SP_ID_DOC_TYPE=5 THEN --��������������
      SELECT STORE_DOC_5.NEXTVAL INTO DDOC_NUMBER FROM DUAL;
    END IF;

    if SP_ID_DOC_TYPE=6 THEN --�������������� ��������
      SELECT STORE_DOC_6.NEXTVAL INTO DDOC_NUMBER FROM DUAL;
    END IF;

    if SP_ID_DOC_TYPE=6 THEN
      insert into STORE_DOC (ID_DOC, ID_CLIENT, DOC_DATE, ID_DOC_TYPE, COMMENTS, OPERATOR_NAME, ID_DEPARTMENTS, INV_ID, Order_ID, DOC_NUMBER, DOC_DATE_REAL, id_office)
        values (IID_DOC, SP_ID_CLIENT, trunc(SP_DOC_DATE), SP_ID_DOC_TYPE, SP_COMMENTS, SP_OPERATOR_NAME, SP_OTDEL, SP_INV_ID, SP_Order_ID, DDOC_NUMBER, SP_DOC_DATE, const_office);
    else
      insert into STORE_DOC (ID_DOC, ID_CLIENT, DOC_DATE, ID_DOC_TYPE, COMMENTS, OPERATOR_NAME, ID_DEPARTMENTS, INV_ID, Order_ID, DOC_NUMBER, DOC_DATE_REAL, id_office)
        values (IID_DOC, SP_ID_CLIENT, trunc(SP_DOC_DATE), SP_ID_DOC_TYPE, SP_COMMENTS, SP_OPERATOR_NAME, SP_OTDEL, SP_INV_ID, SP_Order_ID, DDOC_NUMBER, sysdate, const_office);
    end if;

    out_docid := IID_DOC;

    --  ��������� � �����
    insert_in_store (IID_DOC);

    -- ���� �������, �� ��������� � �����
    IF SP_ID_DOC_TYPE=4 THEN
      insert_in_cash(IID_DOC);
    end if;

    -- ���� �������, �������� ��� ��������������, �� ��������� � �����������
    IF SP_ID_DOC_TYPE = 4 or SP_ID_DOC_TYPE = 2 or SP_ID_DOC_TYPE = 5 THEN
      insert_in_buh(IID_DOC);
    end if;

  end if;

  -- ������� ��� �� ��������� �������
  delete from STORE_DOC_DATA_TEMP;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.doc_new', '');
       RAISE_APPLICATION_ERROR (-20305, '������ �� ����������. ' || DBMS_UTILITY.format_error_backtrace || ' ' ||SQLERRM);

end doc_new;


--
--  ��������� � �����
--
procedure insert_in_store
(
  IID_DOC IN NUMBER
)
is
  QUANTITY_REAL   NUMBER;
  exist           NUMBER;
  SP_OTDEL        NUMBER;
  SP_ID_DOC_TYPE  NUMBER;
  SP_ID_CLIENT    NUMBER;
  SP_DOC_DATE     DATE;
  SP_OPERATOR_NAME VARCHAR(1024);
  SP_COMMENTS     VARCHAR(1024);
  IID_DOC_BUH     NUMBER;
  SP_INV_ID       NUMBER;
  sp_office       number;

  quantity_st     number;
  last_price_st   number;
  final_price_st  number;

tmp_str varchar2(1024);

  CURSOR data_temp IS
    select N_ID, QUANTITY, QUANTITY_REAL, PRICE, PRICE_LIST, store_type, GTD from STORE_DOC_DATA_TEMP
      where QUANTITY is not NULL;

begin

  select user into SP_OPERATOR_NAME from dual;

  select ID_DEPARTMENTS, ID_DOC_TYPE, ID_CLIENT, DOC_DATE, OPERATOR_NAME, COMMENTS, inv_id, id_office
    into SP_OTDEL, SP_ID_DOC_TYPE, SP_ID_CLIENT, SP_DOC_DATE, SP_OPERATOR_NAME, SP_COMMENTS, SP_INV_ID, sp_office
      from STORE_DOC
        where ID_DOC = IID_DOC;

  -- ������ �� ������� ��� �������
  FOR data_temp_cursor IN data_temp LOOP

    QUANTITY_REAL:=0;

    select count(STORE_MAIN.N_ID) into exist
      from STORE_MAIN
        WHERE N_ID = data_temp_cursor.N_ID
              and store_type = data_temp_cursor.store_type
              and ID_DEPARTMENTS = SP_OTDEL
              and id_office = sp_office
              ;

    if (exist is not Null and exist<>0) then
      SELECT STORE_MAIN.QUANTITY
        INTO QUANTITY_REAL
          FROM STORE_MAIN
             WHERE N_ID = data_temp_cursor.N_ID
                 and store_type = data_temp_cursor.store_type
                 and ID_DEPARTMENTS=SP_OTDEL
                 and id_office = sp_office
              ;
    end if;


-- ���� ����������, �� ������� ����
    if (SP_ID_DOC_TYPE = 6) and (exist is not Null and exist<>0) then
      if data_temp_cursor.store_type = 1 then
        update price_list z set z.price=data_temp_cursor.price, date_change=sysdate where z.n_id = data_temp_cursor.N_ID;
      else
        update STORE_MAIN z set z.price=data_temp_cursor.price, date_change=sysdate where z.n_id = data_temp_cursor.N_ID;
      end if;
    end if;


-- ���� ������ �� �������� �������� ���������� ��� �������������� ���������� ������
    if (SP_ID_DOC_TYPE = 1) and (exist is not Null and exist<>0) then

        begin
            tmp_str := 'select a.quantity from STORE_MAIN a where id_office='||sp_office||' and a.n_id='||data_temp_cursor.N_ID||' and a.store_type='||data_temp_cursor.store_type;

            select a.quantity into quantity_st --, price_st
                from STORE_MAIN a
                    where id_office=sp_office and a.n_id = data_temp_cursor.N_ID
            and a.store_type = data_temp_cursor.store_type;

            tmp_str := 'SELECT a.last_price, a.final_price FROM ppl_view a where id_office='||sp_office||' and a.n_id='||data_temp_cursor.N_ID||' and inv_id='||SP_INV_ID;

            SELECT max(a.last_price), max(a.final_price)
            into last_price_st, final_price_st
                  FROM ppl_view a
                        where id_office=sp_office and a.n_id = data_temp_cursor.N_ID and (inv_id = SP_INV_ID or inv_id2 = SP_INV_ID or inv_id3 = SP_INV_ID or inv_id4 = SP_INV_ID)
                        group by n_id
            ;

        EXCEPTION
          WHEN others THEN
               LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.insert_in_store p2', tmp_str);
               RAISE_APPLICATION_ERROR (-20306, 'Cai?in ia auiieieeny. p2. ' || SQLERRM || tmp_str);
        end;

        -- ���� ���� ���������� ������ �� ������ � ���� �������� � ����� �������, �� ������ ����������
        if (quantity_st > 0 and last_price_st <> final_price_st) then

            insert into STORE_DOC (ID_DOC, ID_CLIENT, DOC_DATE, ID_DOC_TYPE, COMMENTS, OPERATOR_NAME, INV_ID, DOC_DATE_REAL, ID_DEPARTMENTS, DOC_NUMBER, Order_ID, id_office)
              values (get_office_unique('STORE_DOC_SET_ID'), null, trunc(SYSDATE), 6, null, SP_OPERATOR_NAME, null, SYSDATE, SP_OTDEL, STORE_DOC_6.NEXTVAL, null, sp_office);

            insert into STORE_DOC_DATA (ID_DOC_DATA, ID_DOC, QUANTITY, N_ID, store_type, QUANTITY_REAL, GTD, PRICE_1, PRICE_NEW_1, PRICE, PRICE_LIST, id_office)
              values (
                get_office_unique('STORE_DOC_DATA_SET_ID'),
                get_office_unique_curr('STORE_DOC_SET_ID'),
                quantity_st,
                data_temp_cursor.N_ID,
                data_temp_cursor.store_type,
                quantity_st,
                null,
                last_price_st,
                final_price_st,
                final_price_st,
                last_price_st,
                sp_office
              );

        end if;
    end if;
--------------------------------------------------------------------------------


    if QUANTITY_REAL is NULL then QUANTITY_REAL := 0; end if;

    if ((data_temp_cursor.QUANTITY<>0) or (data_temp_cursor.QUANTITY=0 and SP_ID_DOC_TYPE=5))
    then

        insert into STORE_DOC_DATA (ID_DOC_DATA, ID_DOC, N_ID, QUANTITY, PRICE, PRICE_LIST, store_type, QUANTITY_REAL, GTD, id_office)
        values (
          get_office_unique('STORE_DOC_DATA_SET_ID'),
          IID_DOC,
          data_temp_cursor.N_ID,
          data_temp_cursor.QUANTITY,
          data_temp_cursor.PRICE,
          data_temp_cursor.PRICE_LIST,
          data_temp_cursor.store_type,
          case when SP_ID_DOC_TYPE = 6 then data_temp_cursor.QUANTITY else QUANTITY_REAL end,
          data_temp_cursor.GTD,
          sp_office
        );

        -- ���� ������ �� ��������� ��� ������
        IF SP_ID_DOC_TYPE = 1 THEN
           insert into STORE_GTD (ID_GTD, DDATE, N_ID, INPUT, GTD, id_office)
              values (get_office_unique('STORE_GTD_SET_ID'), SYSDATE, data_temp_cursor.n_id, data_temp_cursor.QUANTITY, data_temp_cursor.GTD, sp_office);
        end if;

    end if;

  END LOOP; --FOR data_temp_cursor IN data_temp LOOP

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.insert_in_store', '');
       RAISE_APPLICATION_ERROR (-20306, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end insert_in_store;
-----------------------------------------------------------------------------------------


--
-- ������� ��������� ���������� �������� ��� ����� ���� � ����� �����-����� ��� �������, ��� ���� ������� ��� � ����� �������
--
procedure insert_in_store_reprice
(
  v_PPLI_ID IN NUMBER
)
is
  SP_OPERATOR_NAME VARCHAR(1024);

  CURSOR data_temp IS
      SELECT a.N_ID, max(a.FINAL_PRICE) as FINAL_PRICE, sum(a.stock_amount) as stock_amount, max(c.price) as price, b.id_departments, sum(d.quantity) as quantity, b.id_office
      FROM PREPARE_PRICE_LIST a, prepare_price_list_index b, price_list c, store_main d
      WHERE a.PPLI_ID = b.ppli_id and b.inv_id = v_PPLI_ID and a.invoice_data_id is null and a.n_id = c.n_id and a.n_id = d.n_id and d.store_type = 1
      group by b.id_departments, a.N_ID, b.id_office
      ;

begin

  select user into SP_OPERATOR_NAME from dual;

  -- ������ �� ������� ��� �������
  FOR data_temp_cursor IN data_temp LOOP

--       RAISE_APPLICATION_ERROR (-20306, data_temp_cursor.quantity || ' price' || data_temp_cursor.price || ' final=' || data_temp_cursor.FINAL_PRICE);

        -- ���� ���� ���������� ������ �� ������ � ���� �������� � ����� �������, �� ������ ����������
        if (data_temp_cursor.quantity <> 0 and data_temp_cursor.price <> data_temp_cursor.FINAL_PRICE) then

            insert into STORE_DOC (ID_DOC, ID_CLIENT, DOC_DATE, ID_DOC_TYPE, COMMENTS, OPERATOR_NAME, INV_ID, DOC_DATE_REAL, ID_DEPARTMENTS, DOC_NUMBER, Order_ID, id_office)
              values (get_office_unique('STORE_DOC_SET_ID'), null, trunc(SYSDATE), 6, null, SP_OPERATOR_NAME, null, SYSDATE, data_temp_cursor.id_departments, STORE_DOC_6.NEXTVAL, null, data_temp_cursor.id_office );

            insert into STORE_DOC_DATA (ID_DOC_DATA, ID_DOC, QUANTITY, N_ID, store_type, QUANTITY_REAL, GTD, PRICE_1, PRICE_NEW_1, PRICE, PRICE_LIST, id_office)
              values (
                get_office_unique('STORE_DOC_DATA_SET_ID'),
                get_office_unique_curr('STORE_DOC_SET_ID'),
                data_temp_cursor.quantity,
                data_temp_cursor.N_ID,
                1,
                data_temp_cursor.quantity,
                null,
                data_temp_cursor.price,
                data_temp_cursor.FINAL_PRICE,
                data_temp_cursor.FINAL_PRICE,
                data_temp_cursor.price,
                data_temp_cursor.id_office
              );

        end if;

  END LOOP; --FOR data_temp_cursor IN data_temp LOOP

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.insert_in_store_reprice', '');
       RAISE_APPLICATION_ERROR (-20306, '������ �� ���������� ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end insert_in_store_reprice;
-----------------------------------------------------------------------------------------


--
--  ��������� � �����
--
procedure insert_in_cash
(
  IID_DOC IN NUMBER
)
is
  DDOC_NUMBER     NUMBER;
  DDOC_SUM        NUMBER;
  CASH_PAYDESK    NUMBER;
  CASH_OPERATION  NUMBER;
  SP_OTDEL        NUMBER;
  SP_ID_CLIENT    NUMBER;
  SP_DOC_DATE     DATE;
  sp_office       number;

begin

  select ID_DEPARTMENTS, DOC_NUMBER, DOC_DATE, ID_CLIENT, id_office
    into SP_OTDEL, DDOC_NUMBER, SP_DOC_DATE, SP_ID_CLIENT, sp_office
  from STORE_DOC
  where ID_DOC = IID_DOC;

  -- ���� ����
  IF SP_OTDEL = 62 THEN
    CASH_PAYDESK   := 1;
    CASH_OPERATION := 1;
  end if;

  -- ���� ������
  IF SP_OTDEL = 61 THEN
    CASH_PAYDESK   := 2;
    CASH_OPERATION := 32;
  end if;

  -- ���� ����������
  IF SP_OTDEL = 121 THEN
    CASH_PAYDESK   := 3;
    CASH_OPERATION := 4;
  end if;

  select SUM( QUANTITY*PRICE )
    into DDOC_SUM
      from STORE_DOC_DATA
        where ID_DOC = IID_DOC;

  insert into CASH_TMP
           (ID_CASH_TMP,                ID_CLIENTS,   PAYDESK,      OPERATION,      INVOICE,     SUMM,     DDATE_IN, R_PAYDESK, R_DDATE, id_office)
    values (get_office_unique('CASH_TMP_ID'), SP_ID_CLIENT, CASH_PAYDESK, CASH_OPERATION, DDOC_NUMBER, DDOC_SUM, SYSDATE,  0, SP_DOC_DATE, sp_office);

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.insert_in_cash', '');
       RAISE_APPLICATION_ERROR (-20307, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end insert_in_cash;
-----------------------------------------------------------------------------------------


--
--  ��������� � �����������
--
procedure insert_in_buh
(
  IID_DOC IN NUMBER
)
is
  SP_OTDEL         NUMBER;
  SP_ID_DOC_TYPE   NUMBER;
  SP_ID_CLIENT     NUMBER;
  SP_DOC_DATE      DATE;
  SP_OPERATOR_NAME VARCHAR(1024);
  SP_COMMENTS      VARCHAR(1024);
  IID_DOC_BUH      NUMBER;
  kol              NUMBER;
  kol1             NUMBER;
  Y                NUMBER;
  YY               NUMBER;
  exist            NUMBER;
  exist1           NUMBER;
  GTD_ID           NUMBER;
  GTD              VARCHAR2(1024);
  GTD_kol          NUMBER;
  min_date         DATE;
  max_date         DATE;
  SP_DOC_NUMBER    NUMBER;
  sp_office       number;

  CURSOR data_temp IS
    select N_ID, QUANTITY, QUANTITY_REAL, PRICE, PRICE_LIST, store_type
      from STORE_DOC_DATA
        where id_doc = IID_DOC;

begin

  exist1 := 0;
  exist  := 0;

  select ID_DEPARTMENTS, ID_DOC_TYPE, ID_CLIENT, DOC_DATE, OPERATOR_NAME, COMMENTS, DOC_NUMBER, id_office
    into SP_OTDEL, SP_ID_DOC_TYPE, SP_ID_CLIENT, SP_DOC_DATE, SP_OPERATOR_NAME, SP_COMMENTS, SP_DOC_NUMBER, sp_office
      from STORE_DOC
        where ID_DOC = IID_DOC;

  -- ������� -------------------------------------------------------------------
  IF SP_ID_DOC_TYPE = 4 THEN

     SELECT get_office_unique('BUH_DOC_SET_ID') INTO IID_DOC_BUH from DUAL;

     if SP_ID_DOC_TYPE=1 and (SP_DOC_NUMBER=0 or SP_DOC_NUMBER is null) THEN --�������� ���
        SELECT BUH_DOC_NUMBER_1.NEXTVAL
          INTO SP_DOC_NUMBER
            FROM DUAL;
     END IF;

     if SP_ID_DOC_TYPE=2 and (SP_DOC_NUMBER=0 or SP_DOC_NUMBER is null) THEN --����-�������
        SELECT BUH_DOC_NUMBER_2.NEXTVAL
          INTO SP_DOC_NUMBER
            FROM DUAL;
     END IF;

     if SP_ID_DOC_TYPE=3 and (SP_DOC_NUMBER=0 or SP_DOC_NUMBER is null) THEN --�������� ���������
        SELECT BUH_DOC_NUMBER_3.NEXTVAL
          INTO SP_DOC_NUMBER
            FROM DUAL;
     END IF;

     if SP_ID_DOC_TYPE=4 and (SP_DOC_NUMBER=0 or SP_DOC_NUMBER is null) THEN --�������
        SELECT BUH_DOC_NUMBER_4.NEXTVAL
          INTO SP_DOC_NUMBER
            FROM DUAL;
     END IF;

     if SP_ID_DOC_TYPE=5 and (SP_DOC_NUMBER=0 or SP_DOC_NUMBER is null) THEN --����������
        SELECT BUH_DOC_NUMBER_5.NEXTVAL
          INTO SP_DOC_NUMBER
            FROM DUAL;
     END IF;
     ---------------------------------------------------------------------------


     insert into BUH_DOC (ID_DOC,       STORE_DOC_ID, ID_DOC_TYPE, ID_CLIENT,    DOC_DATE,           OPERATOR_NAME,    COMMENTS,    ID_DEPARTMENTS, DOC_NUMBER, id_office)
                  values (IID_DOC_BUH,  IID_DOC,      4,           SP_ID_CLIENT, trunc(SP_DOC_DATE), SP_OPERATOR_NAME, SP_COMMENTS, SP_OTDEL,       SP_DOC_NUMBER, sp_office);

  end if;


  -- ������ �� ������ ----------------------------------------------------------
  FOR data_temp_cursor IN data_temp LOOP

    kol := data_temp_cursor.QUANTITY;

    --����������
    IF SP_ID_DOC_TYPE = 5 then
      kol := data_temp_cursor.QUANTITY - data_temp_cursor.QUANTITY_REAL;
    end if;



    -- �������� ���������� ���  ��� ���������� �� ������ ������� ������
    IF kol > 0 THEN
    LOOP
        EXIT WHEN kol = 0;

        select min(ddate) into MIN_DATE from STORE_GTD where INPUT > OUTPUT_STORE and n_id = data_temp_cursor.n_id and id_office = sp_office;

        select count(N_ID) into exist1
          from STORE_GTD
            where INPUT > OUTPUT_STORE
                  and n_id = data_temp_cursor.n_id
                  and ddate = MIN_DATE
                  and id_office = sp_office
                  ;

        -- ���� ������� ��� ��� ������ ������������
        IF exist1 <> 0 THEN
          begin
           select ID_GTD, GTD, (INPUT-OUTPUT_STORE) into GTD_ID, GTD, GTD_kol
              from STORE_GTD
                where INPUT > OUTPUT_STORE
                      and n_id = data_temp_cursor.n_id
                      and ddate = MIN_DATE
                      and id_office = sp_office
              ;
            EXCEPTION
              WHEN others THEN
                   RAISE_APPLICATION_ERROR (-20308, '������ ����� ������. InsertInCash n_id=' || data_temp_cursor.n_id);
           end;


          if GTD_kol >= kol THEN kol1 := kol;     kol := 0;           end if;
          if GTD_kol < kol  THEN kol1 := GTD_kol; kol := kol-GTD_kol; end if;

          --�������
          IF SP_ID_DOC_TYPE = 4 THEN
            insert into BUH_DOC_DATA (ID_DOC_DATA, ID_DOC, N_ID, QUANTITY, PRICE, GTD, id_office)
            values (
            get_office_unique('BUH_DOC_DATA_SET_ID'),
            IID_DOC_BUH,
            data_temp_cursor.N_ID,
            kol1,
            data_temp_cursor.PRICE,
            GTD,
            sp_office
            );
          end if;
          UPDATE STORE_GTD SET OUTPUT_STORE = OUTPUT_STORE+kol1, date_change=sysdate where ID_GTD = GTD_ID;

       end if;  -- IF exist1 <> 0 THEN

       -- ���� ��� ��� ��� ������������
       IF exist1 = 0 THEN

        -- ��� ���������� ��������� ��� ����� ���������
        select min(ddate) into MIN_DATE from STORE_GTD where /*INPUT = OUTPUT_STORE and*/ n_id = data_temp_cursor.n_id and id_office = sp_office;

        select GTD into GTD
          from STORE_GTD
            where /*INPUT > OUTPUT_STORE
                  and*/ n_id = data_temp_cursor.n_id
                  and ddate = MIN_DATE and id_office = sp_office;


          select count(ID_DOC_DATA) into Y
            from BUH_DOC_DATA
              where n_id = data_temp_cursor.n_id
                    and ID_DOC = IID_DOC_BUH;

           -- ���� ������� ID_DOC_DATA
           if (Y<>0) then
            select ID_DOC_DATA into YY
              from BUH_DOC_DATA
                where n_id = data_temp_cursor.n_id
                      and ID_DOC=IID_DOC_BUH and rownum=1;

            UPDATE BUH_DOC_DATA SET QUANTITY=QUANTITY+kol, date_change=sysdate where ID_DOC_DATA=YY;
           end if;

           -- ���� ��� ID_DOC_DATA
           if (Y=0) then
            insert into BUH_DOC_DATA (ID_DOC_DATA, ID_DOC, N_ID, QUANTITY, PRICE, GTD, id_office)
             values (
              get_office_unique('BUH_DOC_DATA_SET_ID'),
              IID_DOC_BUH,
              data_temp_cursor.N_ID,
              kol,
              data_temp_cursor.PRICE,
              GTD,
              sp_office
              );
           end if;

          kol:=0;
       end if;  -- IF exist1 = 0 THEN;

    END LOOP;
    end if; -- IF kol > 0 THEN


    -- ���� ���������� �������������
    IF kol<0 THEN
    LOOP
        EXIT WHEN kol=0;

        select count(ID_GTD) into exist1
          from STORE_GTD
            where OUTPUT_STORE <> 0
                  and n_id=data_temp_cursor.n_id and id_office = sp_office
                  and ddate = (
                    select max(ddate) from STORE_GTD
                      where OUTPUT_STORE <> 0 and n_id = data_temp_cursor.n_id and id_office = sp_office
                    )
                  ;

        -- ���� ����� ���
        IF exist1<>0 THEN

          select ID_GTD, GTD, (OUTPUT_STORE) into GTD_ID, GTD, GTD_kol
            from STORE_GTD
              where OUTPUT_STORE <> 0
                    and n_id = data_temp_cursor.n_id and id_office = sp_office
                    and ddate = (
                      select max(ddate) from STORE_GTD
                        where OUTPUT_STORE <> 0 and n_id = data_temp_cursor.n_id and id_office = sp_office
                      )
                    ;

          if GTD_kol >= ABS(kol) THEN
            kol1 := kol;
            kol := 0;
          end if;

          --if GTD_kol<ABS(kol) THEN kol1:=kol; kol:=ABS(kol)-GTD_kol; end if;
          if GTD_kol < ABS(kol) THEN
            kol1 := GTD_kol * (-1);
            kol := kol + GTD_kol;
          end if;


          IF SP_ID_DOC_TYPE=4 THEN
            insert into BUH_DOC_DATA (ID_DOC_DATA, ID_DOC, N_ID, QUANTITY, PRICE, GTD, id_office)
            values (
              get_office_unique('BUH_DOC_DATA_SET_ID'),
              IID_DOC_BUH,
              data_temp_cursor.N_ID,
              kol1,
              data_temp_cursor.PRICE,
              GTD,
              sp_office
          );
          end if;

          UPDATE STORE_GTD SET OUTPUT_STORE = OUTPUT_STORE-kol1, date_change=sysdate where ID_GTD = GTD_ID;

       end if; -- IF exist1<>0 THEN


       -- ���� �� ����� ������
       IF exist1=0 THEN

          select count(ID_DOC_DATA) into Y
          from BUH_DOC_DATA
          where n_id = data_temp_cursor.n_id
                and ID_DOC=IID_DOC_BUH
                ;

           -- ���� ���� ��������
           if (Y <> 0) then
            select ID_DOC_DATA into YY
              from BUH_DOC_DATA
                where n_id = data_temp_cursor.n_id
                      and ID_DOC = IID_DOC_BUH
                      ;

            UPDATE BUH_DOC_DATA SET QUANTITY = QUANTITY+kol, date_change=sysdate where ID_DOC_DATA = YY;
           end if;

           -- ��� ���������
           if (Y = 0) then

            insert into BUH_DOC_DATA (ID_DOC_DATA, ID_DOC, N_ID, QUANTITY, PRICE, GTD, id_office)
             values (
              get_office_unique('BUH_DOC_DATA_SET_ID'),
              IID_DOC_BUH,
              data_temp_cursor.N_ID,
              kol,
              data_temp_cursor.PRICE,
              '',
              sp_office
              );

           end if;

           kol := 0;

       end if; -- IF exist1=0 THEN

    END LOOP;

    end if; -- IF kol<0 THEN

  END LOOP; -- FOR data_temp_cursor IN data_temp LOOP

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.insert_in_buh', '');
       RAISE_APPLICATION_ERROR (-20308, '������ �� ����������. ' || DBMS_UTILITY.format_error_backtrace || ' ' ||SQLERRM);

end insert_in_buh;
-----------------------------------------------------------------------------------------






--
--  ���������� �� ��������� ������� ������ �� �����
--
procedure doc_new_hst
(
 SP_ID_CLIENT   IN NUMBER,
 SP_DOC_DATE    IN Date,
 SP_ID_DOC_TYPE IN NUMBER,
 SP_COMMENTS    IN VARCHAR,
 SP_OTDEL       IN VARCHAR,
 out_message    OUT VARCHAR,
 out_docid      OUT NUMBER
)
as
  IID_DOC           NUMBER;
  IID_DOC_BUH       NUMBER;
  DDOC_NUMBER       NUMBER;
  DDOC_SUM          NUMBER;
  SP_OPERATOR_NAME  VARCHAR(1024);
  QUANTITY_REAL     NUMBER;
  exist             NUMBER;

  CURSOR data_temp IS
    select N_ID, QUANTITY, QUANTITY_REAL, PRICE, PRICE_LIST, store_type, GTD
      from STORE_DOC_DATA_TEMP
        where QUANTITY is not NULL;

begin

  IF SP_ID_DOC_TYPE=5 THEN
    select count(N_ID) into exist
      from STORE_DOC_DATA_TEMP;
  end if;


  IF SP_ID_DOC_TYPE<>5 THEN
    select count(N_ID) into exist
      from STORE_DOC_DATA_TEMP
        where QUANTITY is not NULL
              and QUANTITY<>0
              and price<>0;
  end if;

  -- ���� ��������� ������ �� ��������
  IF exist=0 THEN out_message:='��� ������ ��� �� ����������� ����������!'; end if;

  -- ���� ���� ������, �� ��������� ������
  IF exist<>0 THEN

     select a.fio into SP_OPERATOR_NAME from clients a where a.login = user;
     SELECT get_office_unique('STORE_DOC_SET_ID') INTO IID_DOC FROM DUAL;

     if SP_ID_DOC_TYPE=1 THEN --������
        SELECT STORE_DOC_1.NEXTVAL INTO DDOC_NUMBER FROM DUAL;
     END IF;

     if SP_ID_DOC_TYPE=2 THEN --��������
        SELECT STORE_DOC_2.NEXTVAL INTO DDOC_NUMBER FROM DUAL;
     END IF;

     if SP_ID_DOC_TYPE=3 THEN --������
        SELECT STORE_DOC_3.NEXTVAL INTO DDOC_NUMBER FROM DUAL;
     END IF;

     if SP_ID_DOC_TYPE=4 THEN --�������
      SELECT STORE_DOC_4.NEXTVAL INTO DDOC_NUMBER FROM DUAL;
     END IF;

     if SP_ID_DOC_TYPE=5 THEN --��������������
        SELECT STORE_DOC_5.NEXTVAL INTO DDOC_NUMBER FROM DUAL;
     END IF;

     if SP_ID_DOC_TYPE=6 THEN --�������������� ��������
        SELECT STORE_DOC_6.NEXTVAL INTO DDOC_NUMBER FROM DUAL;
     END IF;

     if SP_ID_DOC_TYPE=6 THEN
        insert into STORE_DOC (ID_DOC, ID_CLIENT, DOC_DATE, ID_DOC_TYPE, COMMENTS, OPERATOR_NAME, ID_DEPARTMENTS, INV_ID, Order_ID, DOC_NUMBER, DOC_DATE_REAL, id_office)
          values (IID_DOC, SP_ID_CLIENT, trunc(SP_DOC_DATE), SP_ID_DOC_TYPE, SP_COMMENTS, SP_OPERATOR_NAME, SP_OTDEL, NULL, NULL, DDOC_NUMBER, SP_DOC_DATE, const_office);
     else
        insert into STORE_DOC (ID_DOC, ID_CLIENT, DOC_DATE, ID_DOC_TYPE, COMMENTS, OPERATOR_NAME, ID_DEPARTMENTS, INV_ID, Order_ID, DOC_NUMBER, DOC_DATE_REAL, id_office)
          values (IID_DOC, SP_ID_CLIENT, trunc(SP_DOC_DATE), SP_ID_DOC_TYPE, SP_COMMENTS, SP_OPERATOR_NAME, SP_OTDEL, NULL, NULL, DDOC_NUMBER, SP_DOC_DATE, const_office);
     end if;

     out_docid := IID_DOC;








     -- ������ �� ������� ��� �������
     FOR data_temp_cursor IN data_temp LOOP

        if QUANTITY_REAL is NULL then QUANTITY_REAL := 0; end if;

        if ((data_temp_cursor.QUANTITY<>0) or (data_temp_cursor.QUANTITY=0 and SP_ID_DOC_TYPE=5))
        then
            insert into STORE_DOC_DATA (ID_DOC_DATA, ID_DOC, N_ID, QUANTITY, PRICE, PRICE_LIST, store_type, QUANTITY_REAL, GTD, id_office)
                values (
                  get_office_unique('STORE_DOC_DATA_SET_ID'),
                  IID_DOC,
                  data_temp_cursor.N_ID,
                  data_temp_cursor.QUANTITY,
                  data_temp_cursor.PRICE,
                  data_temp_cursor.PRICE_LIST,
                  data_temp_cursor.store_type,
                  case when SP_ID_DOC_TYPE = 6 then data_temp_cursor.QUANTITY else QUANTITY_REAL end,
                  data_temp_cursor.GTD,
                  const_office
            );
        end if;

     END LOOP; --FOR data_temp_cursor IN data_temp LOOP

  end if;

  -- ������� ��� �� ��������� �������
  delete from STORE_DOC_DATA_TEMP;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.doc_new_hst', '');
       RAISE_APPLICATION_ERROR (-20330, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end doc_new_hst;




--
--  ������ / ��������
--
procedure set_price_part
(
  price_percent IN NUMBER
)
as

begin

    UPDATE STORE_DOC_DATA_TEMP
      set PRICE = price_list+round((price_list*price_percent/100),2)
    ;
    --commit;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.set_price_part', '');
       RAISE_APPLICATION_ERROR (-20309, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end;
-----------------------------------------------------------------------------------------



--
--  ������ / ��������� �������� ��� ��������������
--
procedure set_check_inv
(
  added_1_    IN NUMBER,
  added_      IN NUMBER,
  N_ID_       in number,
  QUANTITY_   in number,
  STORE_TYPE_ in number,
  PRICE_      in number
)
as

begin

  delete from STORE_DOC_DATA_TEMP where ID_DOC_DATA = added_;

  IF (added_1_ = 1) THEN
     INSERT INTO STORE_DOC_DATA_TEMP (ID_DOC_DATA, N_ID, QUANTITY, store_type, PRICE)
       VALUES (STORE_DOC_DATA_TEMP_SET_ID.NEXTVAL, N_ID_, QUANTITY_, STORE_TYPE_, PRICE_);
  end if;

--  commit;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.set_check_inv', '');
       RAISE_APPLICATION_ERROR (-20310, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end set_check_inv;


--
--  ��������� �� ��������� ������� ������
--
procedure ins_in_temp
(
  n_id_         IN NUMBER,
  store_type_   IN NUMBER
)
is
begin

  INSERT INTO STORE_DOC_DATA_TEMP (ID_DOC_DATA, N_ID, store_type) values (STORE_DOC_DATA_TEMP_SET_ID.NEXTVAL, n_id_, store_type_);

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.ins_in_temp', '');
       RAISE_APPLICATION_ERROR (-20311, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end ins_in_temp;



--
--  ��������� ��� ������������ �� ��������� �������
--
procedure NOM_TO_TEMP
(
  in_otdel IN NUMBER,
  param_   IN NUMBER
)
as
  exist NUMBER;
  IID_DOC NUMBER;
begin

  delete from STORE_DOC_DATA_TEMP;
  if (param_ = 1) then
    insert into STORE_DOC_DATA_TEMP (ID_DOC_DATA, N_ID, store_type)
      (select STORE_DOC_DATA_TEMP_SET_ID.NEXTVAL, n_id, 1 from nomenclature_mat_view where ID_DEPARTMENTS = in_otdel);
  end if;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.NOM_TO_TEMP', '');
       RAISE_APPLICATION_ERROR (-20312, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end NOM_TO_TEMP;
-----------------------------------------------------------------------------------------





--
--  ������ �������� ������
--
procedure report_move
(
  DDATE_BEGIN IN DATE,
  DDATE_END   IN DATE,
  rem_nulls   in NUMBER,
  v_office    in number
)
is
begin

  delete from STORE_REPORT_MOVE_TEMP;

  insert into STORE_REPORT_MOVE_TEMP (n_id, ostatok_q, ostatok_p, prihod_q, prihod_p, spis_q, spis_p, utsen_q, utsen_p,
                                      prod_q, prod_p, korr_q, korr_p, ostatok_end_q, ostatok_end_p, REPRICE_Q, REPRICE_p, store_q, store_p, p_add )
  (
    select  q_1.n_id,
            (q0_1 - q0_4 - q0_2 - q0_5) as ostatok_q,   (p0_1 - p0_4 - p0_2 - p0_5 - p0_3 + p0_6) as ostatok_p,
            q_1 prihod_q, p_1 prihod_p,
            q_2 spis_q,   p_2 spis_p,
            q_3 utsen_q,  p_3 utsen_p,
            q_4 prod_q,   p_4 prod_p,
            q_5 korr_q,   p_5 korr_p,
            ((q0_1 - q0_4 - q0_2 - q0_5) + q_1-q_4-q_2-q_5) as ostatok_end_q,  ((p0_1 - p0_4 - p0_2 - p0_5 - p0_3 + p0_6) + p_1-p_4-p_2-p_5-p_3+p_6) as ostatok_end_p,
            q_6 REPRICE_Q, p_6 REPRICE_p,
            c.store_q,
            c.store_p,
            p_add
    from
    (
select B2.n_id,
-- 1 ������ 2 �������� 3 ������ 4 ������� 5 �������������� 6 ����������
       sum(decode(ID_DOC_TYPE, 1, A1.q, 0)) q_1,
       sum(decode(ID_DOC_TYPE, 2, A1.q, 0)) q_2,
       sum(decode(ID_DOC_TYPE, 3, A1.q, 0)) q_3,
       sum(decode(ID_DOC_TYPE, 4, A1.q, 0)) q_4,
       sum(decode(ID_DOC_TYPE, 5, A1.q, 0)) q_5,
       sum(decode(ID_DOC_TYPE, 6, A1.q, 0)) q_6,

       sum(decode(ID_DOC_TYPE, 1, A1.p, 0)) p_1,
       sum(decode(ID_DOC_TYPE, 2, A1.p, 0)) p_2,
       sum(decode(ID_DOC_TYPE, 3, A1.p, 0)) p_3,
       sum(decode(ID_DOC_TYPE, 4, A1.p, 0)) p_4,
       sum(decode(ID_DOC_TYPE, 5, A1.p, 0)) p_5,
       sum(decode(ID_DOC_TYPE, 6, A1.p, 0)) p_6

       , sum(decode(ID_DOC_TYPE, 4, a1.addit, 0)) p_add

  from (
    -- �������� ���������� � ����� �� ���������� ������ �� ������ �� ������, �������������� �� N_ID � ���� ���������
    select CASE WHEN c.ID_DOC_TYPE = 5 THEN sum(A2.QUANTITY_REAL - A2.QUANTITY)
             ELSE sum(A2.QUANTITY) END q,
           CASE WHEN c.ID_DOC_TYPE = 5 THEN sum(A2.QUANTITY_REAL * A2.PRICE - A2.QUANTITY * A2.PRICE)
             else case WHEN c.ID_DOC_TYPE = 6 THEN sum(A2.QUANTITY * (A2.PRICE - A2.PRICE_LIST))
                else case WHEN c.ID_DOC_TYPE = 3 THEN sum(A2.QUANTITY * (A2.PRICE_LIST - A2.PRICE))
                  ELSE case when c.ID_DOC_TYPE = 4 then sum(A2.QUANTITY * A2.PRICE_list)
                    else sum(A2.QUANTITY * A2.PRICE) END end end end p,

           case WHEN (c.ID_DOC_TYPE = 4 and A2.PRICE <> A2.PRICE_list ) THEN sum(A2.QUANTITY * (A2.PRICE - A2.PRICE_LIST)) else 0 end addit,

               c.ID_DOC_TYPE,
               A2.N_ID
          FROM store_doc_data_temp B1,
               store_doc_data A2,
               store_doc c
         where B1.N_ID = A2.N_ID
           AND c.id_doc = A2.id_doc
           AND c.doc_date >= DDATE_BEGIN
           AND c.doc_date <= DDATE_END
           and (c.id_office = v_office or v_office = 0)
         group by c.ID_DOC_TYPE, A2.N_ID, A2.PRICE, A2.PRICE_list
         order by c.ID_DOC_TYPE) A1,
       STORE_DOC_DATA_TEMP B2
 where A1.n_id(+) = B2.n_id
 group by B2.n_id

) q_1,
(

select B2.n_id,
-- 1 ������ 2 �������� 3 ������ 4 ������� 5 �������������� 6 ����������
       sum(decode(ID_DOC_TYPE, 1, A1.q, 0)) q0_1,
       sum(decode(ID_DOC_TYPE, 2, A1.q, 0)) q0_2,
       sum(decode(ID_DOC_TYPE, 3, A1.q, 0)) q0_3,
       sum(decode(ID_DOC_TYPE, 4, A1.q, 0)) q0_4,
       sum(decode(ID_DOC_TYPE, 5, A1.q, 0)) q0_5,
       sum(decode(ID_DOC_TYPE, 6, A1.q, 0)) q0_6,

       sum(decode(ID_DOC_TYPE, 1, A1.p, 0)) p0_1,
       sum(decode(ID_DOC_TYPE, 2, A1.p, 0)) p0_2,
       sum(decode(ID_DOC_TYPE, 3, A1.p, 0)) p0_3,
       sum(decode(ID_DOC_TYPE, 4, A1.p, 0)) p0_4,
       sum(decode(ID_DOC_TYPE, 5, A1.p, 0)) p0_5,
       sum(decode(ID_DOC_TYPE, 6, A1.p, 0)) p0_6

       , sum(decode(ID_DOC_TYPE, 4, a1.addit, 0)) p0_add

  from (
    -- �������� ���������� � ����� �� ���������� ������ �� ������ ������� �� ������, �������������� �� N_ID � ���� ���������
    select CASE WHEN c.ID_DOC_TYPE = 5 THEN sum(A2.QUANTITY_REAL - A2.QUANTITY)
                                        ELSE sum(A2.QUANTITY) END q,
           CASE WHEN c.ID_DOC_TYPE = 5 THEN sum(A2.QUANTITY_REAL * A2.PRICE - A2.QUANTITY * A2.PRICE)
             else case WHEN c.ID_DOC_TYPE = 6 THEN sum(A2.QUANTITY * (A2.PRICE - A2.PRICE_LIST))
                else case WHEN c.ID_DOC_TYPE = 3 THEN sum(A2.QUANTITY * (A2.PRICE_LIST - A2.PRICE))
                  ELSE case when c.ID_DOC_TYPE = 4 then sum(A2.QUANTITY * A2.PRICE_list)
                    else sum(A2.QUANTITY * A2.PRICE) END end end end p,

           case WHEN (c.ID_DOC_TYPE = 4 and A2.PRICE <> A2.PRICE_list ) THEN sum(A2.QUANTITY * (A2.PRICE - A2.PRICE_LIST)) else 0 end addit,

               c.ID_DOC_TYPE,
               A2.N_ID
          FROM store_doc_data_temp B1,
               store_doc_data A2,
               store_doc c
         where B1.N_ID = A2.N_ID
           AND c.id_doc = A2.id_doc
           AND c.doc_date < DDATE_BEGIN
           and (c.id_office = v_office or v_office = 0)
         group by c.ID_DOC_TYPE, A2.N_ID, A2.PRICE, A2.PRICE_list
         order by c.ID_DOC_TYPE) A1,
       STORE_DOC_DATA_TEMP B2
 where A1.n_id(+) = B2.n_id
 group by B2.n_id


) q_2,
( select n_id, sum(quantity) as store_q, sum(quantity * price) as store_p from STORE_VIEW group by n_id ) c
where q_1.n_id=q_2.n_id
and q_1.n_id = c.n_id(+)
);

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.report_move', '');
       RAISE_APPLICATION_ERROR (-20313, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end report_move;



--
-- ����� ��������� ������
--
PROCEDURE get_doc_view_client
(
   id_dep_      in number,
   DOC_NUMBER_  in varchar2,
   DOC_DATE1_   in date,
   DOC_DATE2_   in date,
   ID_DOC_TYPE_ in number,
   fio_         in varchar2,
   nick_        in varchar2,
   v_office     in number,
   cursor_      out ref_cursor
)
IS

BEGIN

  open cursor_ for
    SELECT a.id_doc, a.doc_number, a.id_doc_type, a.id_departments,
       a.department_name, a.operator_name, a.doc_date, a.doc_date_real,
       a.id_client, a.nick, a.fio, a.quantity_all, a.price_all,
       a.sum_price_old, a.sum_price_new, a.sum_price_difference,
       a.comments, a.inv_id, a.order_id, a.supplier_date,
       a.supplier_number, a.suplier, a.id_office, a.brief
        FROM store_doc_view2 a
          where a.id_departments = id_dep_
                and (a.DOC_NUMBER = DOC_NUMBER_ or DOC_NUMBER_ is null)
                and trunc(a.doc_date) between trunc(DOC_DATE1_) and trunc(DOC_DATE2_)
                AND UPPER(Nick) LIKE '%'|| upper(nick_) ||'%'
                AND UPPER(FIO) LIKE '%'|| upper(fio_) ||'%'
                and a.ID_DOC_TYPE = ID_DOC_TYPE_
                and (a.id_office = v_office or v_office = 0)
             ORDER BY DOC_DATE desc, DOC_DATE_real desc;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.get_doc_view_client', '');
       RAISE_APPLICATION_ERROR (-20314, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end get_doc_view_client;



--
-- ����� ����� �� �������
--
PROCEDURE get_type_on_buttons
(
   id_dep_      in number,
   cursor_      out ref_cursor
)
IS
BEGIN

  open cursor_ for
    SELECT distinct a.nbutton, b.f_type, b.ft_id FROM buttons_set a, fst_view b
      where id_dep = id_dep_ and a.fst_id = b.fst_id and b.id_office = const_office
        order by nbutton;

end get_type_on_buttons;



--
--  ���������� ����
--
procedure lom_add
(
  in_n_id IN NUMBER,
  in_QUANTITY IN NUMBER,
  in_DOC_DATE IN DATE,
  in_OTDEL IN VARCHAR
)
as
exist NUMBER;
IID_DOC NUMBER;

begin

  select count(ID_DOC) into exist
    from STORE_DOC
      where DOC_DATE = trunc(in_DOC_DATE)
        and COMMENTS = '���'
        and ID_DEPARTMENTS = in_OTDEL
        and ID_DOC_TYPE = 2
        and id_office = const_office
        ;

  IF exist = 0 THEN
    insert into STORE_DOC (ID_DOC, DOC_DATE, ID_DOC_TYPE, COMMENTS, ID_DEPARTMENTS, id_office)
      values (get_office_unique('STORE_DOC_SET_ID'), trunc(in_DOC_DATE), 2, '���', in_OTDEL, const_office);

    SELECT STORE_DOC_SET_ID.currval INTO IID_DOC from DUAL;

    insert into STORE_DOC_DATA (ID_DOC_DATA, ID_DOC, N_ID, QUANTITY, store_type, id_office)
      values (get_office_unique('STORE_DOC_DATA_SET_ID'), IID_DOC, in_n_id, in_QUANTITY, 1, const_office);

  else
    select ID_DOC into IID_DOC
      from STORE_DOC
        where DOC_DATE = trunc(in_DOC_DATE)
          and COMMENTS = '���'
          and ID_DEPARTMENTS = in_OTDEL
          and ID_DOC_TYPE = 2
          and id_office = const_office
          ;

    insert into STORE_DOC_DATA (ID_DOC_DATA, ID_DOC, N_ID, QUANTITY, store_type, id_office)
      values (get_office_unique('STORE_DOC_DATA_SET_ID'), IID_DOC, in_n_id, in_QUANTITY, 1, const_office);

  end if;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.lom_add', '');
       RAISE_APPLICATION_ERROR (-20315, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end lom_add;



--
--  ������ ������� �������
--
procedure CHANGE_PRICE
(
  in_n_id IN NUMBER,
  in_Percent IN NUMBER,
  in_QUANTITY IN NUMBER,
  in_DOC_DATE IN DATE,
  in_OTDEL IN VARCHAR,
  in_OPERATOR_NAME IN VARCHAR
)
as
PRICE_NEW NUMBER;
PRICE_OLD NUMBER;
IID_DOC NUMBER;

begin

  select PRICE into PRICE_OLD
    from STORE_VIEW
      where N_ID = in_n_id and store_type = 1 and id_office = const_office;

  PRICE_NEW := PRICE_OLD-round(((in_Percent/100)*PRICE_OLD),2);

  insert into STORE_DOC (ID_DOC, DOC_DATE, ID_DOC_TYPE, ID_DEPARTMENTS, OPERATOR_NAME, id_office)
    values (get_office_unique('STORE_DOC_SET_ID'), trunc(in_DOC_DATE), 3, in_OTDEL, in_OPERATOR_NAME, const_office);

  SELECT get_office_unique_curr('STORE_DOC_SET_ID') INTO IID_DOC from DUAL;

  insert into STORE_DOC_DATA (ID_DOC_DATA, ID_DOC, N_ID, QUANTITY, PRICE, PRICE_list, store_type, id_office)
    values (get_office_unique('STORE_DOC_DATA_SET_ID'), IID_DOC, in_n_id, in_QUANTITY, PRICE_NEW, PRICE_OLD, 1, const_office);

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.CHANGE_PRICE', '');
       RAISE_APPLICATION_ERROR (-20316, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end CHANGE_PRICE;


--
--  �������� �� ������ ������
--
procedure data_from_order
(
  oder_num IN NUMBER
)
as
  CURSOR data_temp IS
    select n_id, QUANTITY, store_type, price
    from ORDERS_LIST
    where ID_ORDERS_CLIENTS = oder_num and active = 1;
begin

    insert into STORE_DOC_DATA_TEMP (ID_DOC_DATA, N_ID, QUANTITY, store_type, price, price_list)
    (
      select STORE_DOC_DATA_TEMP_SET_ID.NEXTVAL, a.n_id, a.QUANTITY, a.store_type, a.price, b.price
      from ORDERS_LIST a, store_view_null b
      where a.ID_ORDERS_CLIENTS = oder_num and a.active = 1
          and a.n_id = b.n_id and a.store_type = b.store_type
    );


  FOR data_temp_cursor IN data_temp LOOP

      update store_main a
      set a.reserv = a.reserv - data_temp_cursor.QUANTITY, date_change=sysdate
      where store_type = data_temp_cursor.store_type and
          n_id = data_temp_cursor.n_id and a.id_office = const_office;

  END LOOP;

  UPDATE ORDERS_CLIENTS SET STATUS = 10, date_change=sysdate where ID_ORDERS_CLIENTS = oder_num;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.data_from_order', '');
       RAISE_APPLICATION_ERROR (-20317, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end data_from_order;


--
--  ���� ���������
--
procedure doc_new_from_store_doc
(
  IID_DOC IN NUMBER,
  out_docid OUT NUMBER
)
as
 SP_ID_CLIENT   NUMBER;
 SP_DOC_DATE    Date;
 SP_ID_DOC_TYPE NUMBER;
 SP_COMMENTS    VARCHAR(1024);
 SP_OTDEL       VARCHAR(1024);
 SP_INV_ID      NUMBER;
 SP_Order_ID    NUMBER;
 SP_OPERATOR_NAME VARCHAR(1024);
 out_message    VARCHAR(1024);
 DDOC_NUMBER    NUMBER;
 sp_office      number;
begin

  -- �������� ������
  data_from_storedoc_minus(IID_DOC);

  select user into SP_OPERATOR_NAME from dual;

  select DOC_NUMBER, ID_DEPARTMENTS, ID_DOC_TYPE, ID_CLIENT, DOC_DATE, OPERATOR_NAME, COMMENTS, INV_ID, Order_ID, id_office
    into DDOC_NUMBER, SP_OTDEL, SP_ID_DOC_TYPE, SP_ID_CLIENT, SP_DOC_DATE, SP_OPERATOR_NAME, SP_COMMENTS, SP_INV_ID, SP_Order_ID, sp_office
  from STORE_DOC
    where ID_DOC = IID_DOC;

  doc_new ( SP_ID_CLIENT, trunc(sysdate), SP_ID_DOC_TYPE,
            '(��������� ��������� �� � ' || DDOC_NUMBER || ')',
            SP_OTDEL, SP_INV_ID, SP_Order_ID, out_message, out_docid
          );

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.doc_new_from_store_doc', '');
       RAISE_APPLICATION_ERROR (-20318, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end doc_new_from_store_doc;


--
-- �������� ������
--
procedure data_from_storedoc_minus
(
  store_doc IN NUMBER
)
as
  exist   NUMBER;
  IID_DOC NUMBER;

  CURSOR data_temp IS
    select N_ID, QUANTITY, QUANTITY_REAL, PRICE, PRICE_list, store_type, GTD
      from STORE_DOC_DATA
        where ID_DOC = store_doc;

begin
-- ������� ���� �������������� -------------------------------------------------
  delete from STORE_DOC_DATA_TEMP;

  FOR data_temp_cursor IN data_temp LOOP

    insert into STORE_DOC_DATA_TEMP (ID_DOC_DATA, N_ID, QUANTITY, QUANTITY_REAL, PRICE, PRICE_list, store_type, GTD)
    values (STORE_DOC_DATA_TEMP_SET_ID.NEXTVAL, data_temp_cursor.N_ID, (-1)*data_temp_cursor.QUANTITY, data_temp_cursor.QUANTITY_REAL,
            data_temp_cursor.PRICE, data_temp_cursor.PRICE_list, data_temp_cursor.store_type, data_temp_cursor.GTD );

  END LOOP;
--------------------------------------------------------------------------------
EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.data_from_storedoc_minus', '');
       RAISE_APPLICATION_ERROR (-20319, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end data_from_storedoc_minus;
-----------------------------------------------------------------------------------------



--
--  ��������� ������������ � �������������� �� ����
--
procedure inventory_add_types
(
  ttypes IN VARCHAR,
  sub_ttypes IN VARCHAR
)
as
exist NUMBER;
IID_DOC NUMBER;

CURSOR data_temp IS
  select
    NOMENCLATURE.N_ID,
    NOMENCLATURE.FST_ID,
    FLOWER_SUBTYPES.FT_ID
  from
    NOMENCLATURE,
    FLOWER_SUBTYPES
  where
    NOMENCLATURE.FST_ID=FLOWER_SUBTYPES.FST_ID
    and
    (
    NOMENCLATURE.FST_ID in (sub_ttypes) or FLOWER_SUBTYPES.FT_ID in (ttypes)
    )
    and NOMENCLATURE.id_office = const_office
    ;

begin

  FOR data_temp_cursor IN data_temp LOOP

    insert into STORE_DOC_DATA_TEMP (ID_DOC_DATA, N_ID, store_type, PRICE)
    values (STORE_DOC_DATA_TEMP_SET_ID.NEXTVAL, data_temp_cursor.n_id, 1, 2);

  END LOOP;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.inventory_add_types', '');
       RAISE_APPLICATION_ERROR (-20320, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end inventory_add_types;
-----------------------------------------------------------------------------------------


--
-- ����� ������ ��� �������� ������
--
PROCEDURE select_for_tovar
(
   cursor_      out ref_cursor
)
IS
BEGIN

  open cursor_ for
    select a.COLOUR, a.RUS_MARKS as spesification, a.great_name, a.N_ID,
       CASE WHEN a.BAR_CODE is not null THEN a.BAR_CODE ELSE to_char(a.CODE) END CODE,
             a.H_CODE, a.S_NAME_RU, a.F_SUB_TYPE, a.F_TYPE, b.ostatok_end_q, b.ostatok_end_p,
             b.ostatok_q, b.ostatok_p, b.prihod_q, b.prihod_p, b.spis_q, b.spis_p, b.utsen_q,
             b.utsen_p, b.prod_q, b.prod_p, b.korr_q, b.korr_p, b.REPRICE_Q, b.REPRICE_P
             , a.id_office, c.brief
      from  NOMENCLATURE_MAT_VIEW a, STORE_REPORT_MOVE_TEMP b, offices c
        where a.N_ID = b.n_id and a.id_office = c.id_office;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.select_for_tovar', '');
       RAISE_APPLICATION_ERROR (-20321, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end select_for_tovar;


--
-- ����� ���������������� ��������
--
PROCEDURE select_invoices
(
   id_dep_      in number,
   cursor_      in out ref_cursor
)
IS
BEGIN

  open cursor_ for
    SELECT a.inv_id, inv_date, comments, inv_sum, ipp_id, a.comments as ipp_comment
            , a.id_departments, a.SUPPLIER_DATE, a.SUPPLIER_NUMBER, a.TOTAL_SUM, a.is_minus, a.s_name_ru
      FROM invoice_register_full a--, PREPARE_PRICE_LIST_INDEX b
        WHERE a.id_departments = id_dep_
              --and a.inv_id = b.inv_id
              and a.sended_to_warehouse = 0
              and a.inv_minus in (0,3)
              and a.price_done = 1
              and a.id_office = const_office
              --and b.finished = 1
                ORDER BY inv_date desc;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.select_invoices', '');
       RAISE_APPLICATION_ERROR (-20322, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end select_invoices;


--
-- ����� �������� �������
--
PROCEDURE select_store
(
   ID_DEPARTMENTS_  in number,
   STORE_TYPE_      in number,
   v_office         in number,
   cursor_          in out ref_cursor
)
IS
BEGIN

  if (STORE_TYPE_ = 0) then
    open cursor_ for
      SELECT a.N_ID, full_name, F_TYPE, F_SUB_TYPE, CODE, H_CODE, LEN, PACK, COLOUR, COUNTRY, sum(QUANTITY) as quantity,
             sum(PRICE) as price, a.FT_ID, a.FST_ID, C_ID, COL_ID, S_ID, sum(QUANTITY*PRICE) as QUANTITY_PRICE,
             reserv, spesification, s_name_ru, is_photo, photo, our_code, COMPILED_NAME_OTDEL, a.id_office, a.brief
        FROM store_view a
            , (SELECT a.fst_id, a.nbutton, a.f_char FROM buttons_set a where id_dep = ID_DEPARTMENTS_) b
        WHERE a.ID_DEPARTMENTS = ID_DEPARTMENTS_
                and a.fst_id = b.fst_id(+)
                and (a.id_office = v_office or v_office = 0)
        group by b.nbutton, N_ID, full_name, F_TYPE, F_SUB_TYPE, CODE, H_CODE, LEN, PACK, COLOUR, COUNTRY, FT_ID, a.FST_ID, C_ID, COL_ID, S_ID, reserv,
            spesification, s_name_ru, is_photo, photo, our_code, COMPILED_NAME_OTDEL, a.id_office, a.brief
        ORDER BY b.nbutton, a.compiled_name_otdel
        ;
  else
    open cursor_ for
      SELECT a.N_ID, full_name, F_TYPE, F_SUB_TYPE, CODE, H_CODE, LEN, PACK, COLOUR, COUNTRY, QUANTITY,
             PRICE, a.FT_ID, a.FST_ID, C_ID, COL_ID, S_ID, (QUANTITY*PRICE) as QUANTITY_PRICE,
             reserv, spesification, s_name_ru , is_photo, photo, our_code, COMPILED_NAME_OTDEL, a.id_office, a.brief
        FROM store_view a
            , (SELECT a.fst_id, a.nbutton, a.f_char FROM buttons_set a where id_dep = ID_DEPARTMENTS_) b
        WHERE a.ID_DEPARTMENTS = ID_DEPARTMENTS_
                and a.fst_id = b.fst_id(+)
                and STORE_TYPE = STORE_TYPE_
                and (a.id_office = v_office or v_office = 0)
        ORDER BY b.nbutton, a.compiled_name_otdel
        ;
  end if;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.select_store', '');
       RAISE_APPLICATION_ERROR (-20323, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end select_store;


--
-- ����� ���� ��������
--
PROCEDURE select_subtypes_all
(
   id_dep_  in number,
   cursor_  out ref_cursor
)
IS
BEGIN

  open cursor_ for
    SELECT rownum as nn, a.fst_id, a.f_sub_type, a.hol_sub_type, a.ft_id, a.f_type,
           a.ht_id, a.hol_type, a.id_departments,
           decode(b.nbutton,2,'F2',3,'F3',4,'F4',5,'F5',6,'F6',7,'F7',8,'F8','') nbutton
      FROM fst_view a, buttons_set b
         WHERE a.id_departments = id_dep_
              and a.id_departments = b.id_dep(+)
              and a.fst_id = b.fst_id(+)
           ORDER BY a.f_sub_type;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.select_subtypes_all', '');
       RAISE_APPLICATION_ERROR (-20324, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end select_subtypes_all;


--
-- ����� �������� ��� ������
--
PROCEDURE select_subtypes_button
(
   id_dep_  in number,
   button_  in number,
   cursor_  out ref_cursor
)
IS
BEGIN

  open cursor_ for
    SELECT rownum as nn, a.fst_id, a.f_sub_type, a.hol_sub_type, a.ft_id, a.f_type,
           a.ht_id, a.hol_type, a.id_departments, b.f_char, b.id_dep, b.nbutton
      FROM buttons_set b, fst_view a
        WHERE b.id_dep = id_dep_
              and b.nbutton = button_
              and b.id_dep = a.id_departments
              and b.fst_id = a.fst_id
          ORDER BY a.f_sub_type;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.select_subtypes_button', '');
       RAISE_APPLICATION_ERROR (-20325, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end select_subtypes_button;


--
-- ����� ��������
--
PROCEDURE select_clients
(
   cursor_  out ref_cursor
)
IS
BEGIN

  open cursor_ for
    SELECT CCODE, ID_CLIENTS, fio, nick, BLOCK1, BLOCK2
      FROM clients_view2
      where id_office = const_office
        order by fio;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.select_clients', '');
       RAISE_APPLICATION_ERROR (-20326, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end select_clients;





-- ��������� ������ ������ � ���������
--
PROCEDURE insert_fast_ucenka
(
  n_id_       in number,
  QUANTITY_   in number
)
IS
BEGIN

  INSERT INTO STORE_DOC_DATA_TEMP (ID_DOC_DATA, N_ID, QUANTITY, store_type)
    VALUES (STORE_DOC_DATA_TEMP_SET_ID.NEXTVAL, n_id_, QUANTITY_, 2);

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.insert_fast_ucenka', '');
       RAISE_APPLICATION_ERROR (-20327, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end insert_fast_ucenka;




--
-- ����� ������ ��� ������
--
PROCEDURE select_ucenka
(
   id_dep_     in number,
   price_part_ in number,
   cursor_     out ref_cursor
)
IS
BEGIN

  open cursor_ for
    select N_ID, CODE, H_CODE, F_TYPE, F_SUB_TYPE, FT_ID, FST_ID, FULL_NAME, QUANTITY_NOW, STORE_TYPE_NAME, STORE_TYPE, PRICE_LIST,
    case
      WHEN added=0 or added is null THEN (price_list+round((price_list*price_part_ /100),2))
      ELSE price
    END price,
    QUANTITY, ADDED,
    case
      WHEN added=0 or added is null THEN (price_list+round((price_list*price_part_ /100),2))*QUANTITY
      ELSE QUANTITY_PRICE
    END QUANTITY_PRICE,
    sum_price_difference, ID_DEPARTMENTS,
    case
      WHEN added=0 or added is null THEN price_part_
      ELSE price_percent
    END price_percent,
    SPESIFICATION

    from store_docdatatemp_view
    where STORE_TYPE=1
          and ID_DEPARTMENTS = id_dep_
          and id_office = const_office;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.select_ucenka', '');
       RAISE_APPLICATION_ERROR (-20328, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end select_ucenka;



--
-- �������� ���������
--
PROCEDURE delete_doc
(
   ID_DOC_     in number
)
IS
BEGIN

  delete from store_doc_data b where b.id_doc = ID_DOC_;
  delete from store_doc a where a.id_doc = ID_DOC_;
  commit;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.delete_doc', '');
       RAISE_APPLICATION_ERROR (-20329, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end delete_doc;





--
-- ������� ����� ��� ������
--
PROCEDURE select_subtypes_sale
(
   id_dep_  in number,
   var_     in number,  -- 0 ����, 1-�������
   cursor_  out ref_cursor
)
IS
BEGIN

if var_ = 0 then
  open cursor_ for
    SELECT a.ft_id, a.f_type, a.id_departments, b.nbutton
      FROM ft_view a, buttons_set_sale b
         WHERE a.id_departments = id_dep_
              and a.id_departments = b.id_dep(+)
              and a.ft_id = b.ft_id(+)
           ORDER BY nbutton, a.f_type
  ;
else
  open cursor_ for
    SELECT a.fst_id, a.f_sub_type, a.id_departments, b.nbutton
      FROM fst_view a, buttons_set_sale b
         WHERE a.id_departments = id_dep_
              and a.id_departments = b.id_dep(+)
              and a.fst_id = b.ft_id(+)
           ORDER BY nbutton, a.f_sub_type
  ;
end if;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'store_pkg.select_subtypes_all', '');
       RAISE_APPLICATION_ERROR (-20330, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end select_subtypes_sale;


--
-- ����� ����� ��� ������
--
PROCEDURE get_type_on_buttons_sale
(
   id_dep_      in number,
   var_         in number,   -- 1 ����, 2-�������
   cursor_      out ref_cursor
)
IS
BEGIN

if var_ = 1 then
  open cursor_ for
    SELECT distinct a.nbutton, b.f_type, b.ft_id
    FROM ft_view b, buttons_set_sale a
      where b.ID_DEPARTMENTS = id_dep_ and b.ft_id = a.ft_id(+)
        order by nbutton, f_type
  ;
else
  open cursor_ for
    SELECT distinct a.nbutton, b.f_sub_type as f_type, b.fst_id as ft_id
    FROM fst_view b, buttons_set_sale a
      where b.ID_DEPARTMENTS = id_dep_ and b.fst_id = a.ft_id(+)
        order by nbutton, f_sub_type
  ;
end if;

end get_type_on_buttons_sale;




--
-- ����� ������������ �������� ��� ������
--
PROCEDURE get_personal_settings
(
   v_date        in date,
   v_id_company  in number,
   cursor_       out ref_cursor
)
IS
BEGIN
  open cursor_ for
    select a.id, a.user_name, a.id_company, a.date_begin, a.date_end, a.prikaz_n
    from buh_user_settings a
    where a.user_name = user and a.id_company=v_id_company and trunc(a.date_begin) <= trunc(v_date) and ( trunc(v_date) <= trunc(date_end) or date_end is null)
    ;
END get_personal_settings;


--
-- �������������� ������������ �������� ��� ������
--
PROCEDURE edit_personal_settings
(
   v_id           in number,
   v_user         in varchar2,
   v_id_company   in number,
   v_date_begin   in date,
   v_date_end     in date,
   v_prikaz_n     in varchar2
)
IS
BEGIN
  if (v_id = 0) then
    insert into buh_user_settings values(get_office_unique('universal_id'), v_user, v_id_company, v_date_begin, v_date_end, v_prikaz_n);
  else
    update buh_user_settings set date_begin=v_date_begin, date_end=v_date_end, prikaz_n=v_prikaz_n where id=v_id;
  end if;
  commit;
END edit_personal_settings;


--
-- �������� ������������ �������� ��� ������
--
PROCEDURE delete_personal_settings
(
   v_id      in number
)
IS
BEGIN
  delete from buh_user_settings where id=v_id;
  commit;
END delete_personal_settings;



END;
/

create or replace public synonym store_pkg for creator.store_pkg
/
-- End of DDL Script for Package Body CREATOR.STORE_PKG

