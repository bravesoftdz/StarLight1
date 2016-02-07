-- Start of DDL Script for Package Body CREATOR.INVOICE_PKG
-- Generated 29.03.2015 21:54:04 from CREATOR@STAR_NEW

CREATE OR REPLACE 
PACKAGE BODY invoice_pkg
IS
cnt_ number;


--
--  ��������� �������� ���������� � ����� ����� �������
--
PROCEDURE INV_REG_INSERT
(
  IN_INV_DATE            IN DATE,
  IN_COMMENTS            IN VARCHAR2,
  IN_SUP_INV_DATE        IN DATE,
  IN_SUP_NUMBER          IN VARCHAR2,
  IN_ID_DEPARTMENTS      IN INTEGER,
  IN_INV_MINUS           in number,
  IN_S_ID                in number,
  in_INV_ID              in out integer
  , IN_FILE_             IN VARCHAR2
  , IN_OFFICE_ID         in number
  , IN_country_gtd       in number
)
as
    v_idd  number;
begin

  SELECT get_office_unique('INV_ID') INTO v_idd FROM DUAL;
  if (v_idd > 0) then
     INSERT INTO INVOICE_REGISTER (INV_ID,INV_DATE,SENDED_TO_WAREHOUSE,COMMENTS,ID_DEPARTMENTS,SUPPLIER_DATE,SUPPLIER_NUMBER,INV_MINUS,s_id_default,minus_inv_id,IN_FILE,id_office, country_gtd)
            VALUES(v_idd,TRUNC(IN_INV_DATE),0,IN_COMMENTS,IN_ID_DEPARTMENTS,TRUNC(IN_SUP_INV_DATE),IN_SUP_NUMBER,IN_INV_MINUS,IN_S_ID,in_INV_ID,IN_FILE_,IN_OFFICE_ID, IN_country_gtd);
     commit;
    end if;
  in_INV_ID := v_idd;

  EXCEPTION WHEN OTHERS THEN
      in_INV_ID := -1;
      LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.INV_REG_INSERT', '');
      RAISE_APPLICATION_ERROR (-20200, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end INV_REG_INSERT;



--
--  ��������� ������ ������ ������ �������
--
PROCEDURE INV_REG_INSERT_DATA
(
    INV_ID_             in number,
    ORDER_NUMBER_       in number,
    ORDER_MARKNAME_     in varchar2,
    PACKING_MARKS_      in varchar2,
    PACKING_CODE_       in varchar2,
    DESCRIPTION_        in varchar2,
    UNITS_              in number,
    SKU_                in varchar2,
    AMOUNT_IN_THE_PACK_ in number,
    HOL_COLOUR_         in varchar2,
    HOL_SUB_TYPE_       in varchar2,
    MARKS_CONTENT_      in varchar2,
    MARKS_NAMES_        in varchar2,
    SHORT_CODE_         in varchar2,
    SHORT_NAME_         in varchar2,
    BAR_CODE_           in varchar2,
    TRANSLATION_        in varchar2,
    AMOUNT_PER_UNIT_    in number,
    TOTAL_AMOUNT_       in number,
    REMARKS_            in varchar2,
    SPEC_LENGTH_        in number,
    SPEC_HEADS_         in varchar2,
    SPEC_HEADS_SHRUB_   in varchar2,
    SPEC_VD2_           in varchar2,
    SPEC_WIDTH_         in number,
    SPEC_HIGHT_         in number,
    TROLLEY_            in varchar2,
    TRUCK_              in varchar2,
    CLIENT_             in varchar2,
    VOLUME_             in number,
    VOLDRY_             in number,
    NOM_NEW_            in varchar2,
    NOM_START_          in varchar2,
    COUNTRY_            in varchar2,
    NOM_END_            in varchar2,
    NOM_ADD_            in varchar2,
    NOM_SPEC_           in varchar2,
    NOM_PACK_           in number,
    NOM_PACK_HOL_       in number
)
IS
  INVOICE_DATA_AS_IS_ID_ number;
  v_truck    varchar2(2);
  v_trolley  number;
  cc         number;
  pack_quantity number;
BEGIN
  pack_quantity := 0;
  select case when instr(TRUCK_, 'T1') > 0 or instr(TRUCK_, 'TR1') > 0 or instr(TRUCK_, 'TRUCK 1') > 0 or TRUCK_ = '1' then 1 else
         case when instr(TRUCK_, 'T2') > 0 or instr(TRUCK_, 'TR2') > 0 or instr(TRUCK_, 'TRUCK 2') > 0 or TRUCK_ = '2' then 2 else
         case when instr(TRUCK_, 'T3') > 0 or instr(TRUCK_, 'TR3') > 0 or instr(TRUCK_, 'TRUCK 3') > 0 or TRUCK_ = '3' then 3 else
         case when instr(TRUCK_, 'T4') > 0 or instr(TRUCK_, 'TR4') > 0 or instr(TRUCK_, 'TRUCK 4') > 0 or TRUCK_ = '4' then 4 else
         case when instr(TRUCK_, 'T5') > 0 or instr(TRUCK_, 'TR5') > 0 or instr(TRUCK_, 'TRUCK 5') > 0 or TRUCK_ = '5' then 5 else
         case when instr(TRUCK_, 'T6') > 0 or instr(TRUCK_, 'TR6') > 0 or instr(TRUCK_, 'TRUCK 6') > 0 or TRUCK_ = '6' then 6 else
         case when instr(TRUCK_, 'T7') > 0 or instr(TRUCK_, 'TR7') > 0 or instr(TRUCK_, 'TRUCK 7') > 0 or TRUCK_ = '7' then 7 else
         case when instr(TRUCK_, 'T8') > 0 or instr(TRUCK_, 'TR8') > 0 or instr(TRUCK_, 'TRUCK 8') > 0 or TRUCK_ = '8' then 8 else 0
         end end end end end end end end
  into v_truck from dual;

  pack_quantity := NOM_PACK_;
  -- ��������� ����� �������� �� ��������� ���.��������
  if NOM_PACK_ is null or NOM_PACK_ = 0 then
    begin
      select QUANTITY into pack_quantity from hol_subtype_def_pack where upper(HOL_SUBTYPE) = upper(HOL_SUB_TYPE_);
    EXCEPTION WHEN no_data_found THEN
      pack_quantity := 0;
    end;
  end if;

  -- ��������� ����� �������� �� ��������� ���.��������
  if pack_quantity is null or pack_quantity = 0 then
    begin
      select max(QUANT) into pack_quantity from def_type_quant d, flower_subtypes s where d.fst_id = s.fst_id and upper(s.hol_sub_type) like upper('%'||HOL_SUB_TYPE_||'%');
--      LOG_ERR('', 0,'pack_quantity=' || pack_quantity || ', ' || HOL_SUB_TYPE_, '');
    EXCEPTION WHEN no_data_found THEN
      pack_quantity := 0;
    end;
  end if;

  -- 2015-01-15 �� ���������� �.�., ���� � ������� ������ Xnn, �� ��� �������� ���� ����� �� ��������
  if REMARKS_ is not null and ( instr(REMARKS_,'X25')>0 or instr(REMARKS_,'X5')>0 or instr(REMARKS_,'X10')>0 or instr(REMARKS_,'X15')>0 or instr(REMARKS_,'X20')>0 or instr(REMARKS_,'X50')>0 ) then
    select case when instr(REMARKS_,'X5')>0 then 5
                when instr(REMARKS_,'X10')>0 then 10
                when instr(REMARKS_,'X15')>0 then 15
                when instr(REMARKS_,'X20')>0 then 20
                when instr(REMARKS_,'X25')>0 then 25
                when instr(REMARKS_,'X50')>0 then 50
                else 0 end into pack_quantity from dual;
  end if;

  v_trolley := 0;
  begin
      if (length(TROLLEY_) > 0) then
        -- 2013-01-10 ��� ������� �������� 103514.10.102-103 ���������� ������� �����, ������ ������ �����
        --v_trolley := to_number(substr(REPLACE(TROLLEY_,'-',''), instr(REPLACE(TROLLEY_,'-',''),'.', -1)+1, length(REPLACE(TROLLEY_,'-',''))));

        cc := instr(TROLLEY_,'-')-1;
        if cc = 0 then cc := length(TROLLEY_); end if;
        v_trolley := to_number( substr(TROLLEY_, instr(TROLLEY_,'.', -1)+1, cc-instr(TROLLEY_,'.', -1) ) );

      end if;
  EXCEPTION WHEN OTHERS THEN
      v_trolley := 0;
  end;

  SELECT get_office_unique('INVOICE_DATA_AS_IS_ID') INTO INVOICE_DATA_AS_IS_ID_ FROM DUAL;


  INSERT INTO INVOICE_DATA_AS_IS
  VALUES (
    INV_ID_, ORDER_NUMBER_, ORDER_MARKNAME_, PACKING_MARKS_, PACKING_CODE_, DESCRIPTION_,
    UNITS_, SKU_, AMOUNT_IN_THE_PACK_, INVOICE_DATA_AS_IS_ID_, HOL_COLOUR_,
    HOL_SUB_TYPE_, MARKS_CONTENT_, MARKS_NAMES_, SHORT_CODE_, SHORT_NAME_, null, BAR_CODE_,
    TRANSLATION_, AMOUNT_PER_UNIT_, TOTAL_AMOUNT_, REMARKS_,
    SPEC_LENGTH_, SPEC_HEADS_, SPEC_HEADS_SHRUB_, SPEC_VD2_, SPEC_WIDTH_, SPEC_HIGHT_, v_trolley, v_truck, CLIENT_, TROLLEY_
    , const_office, sysdate, VOLUME_, VOLDRY_, decode(NOM_NEW_, NULL, 0, 1), decode(NOM_START_, NULL, 0, 1), country_
    , decode(NOM_END_, NULL, 0, 1), decode(NOM_ADD_, NULL, 0, 1), decode(NOM_SPEC_, NULL, 0, 1), pack_quantity, NOM_PACK_HOL_
    );
  commit;

  EXCEPTION WHEN OTHERS THEN
      LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.INV_REG_INSERT_DATA', '');
      RAISE_APPLICATION_ERROR (-20201, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

END INV_REG_INSERT_DATA;


--
--  ��������� ������������ ��������� ��� ������������
--
PROCEDURE CHANGE_PERSONAL_SETTINGS
(
  IN_HIDE_MARKS IN NUMBER
)
AS
BEGIN

  SELECT COUNT(*) INTO cnt_ FROM PERSONAL_SETTINGS WHERE DB_USER=USER;
  IF cnt_ =0
    THEN INSERT INTO PERSONAL_SETTINGS (DB_USER,HIDE_MARKS) VALUES(USER,IN_HIDE_MARKS);
    ELSE UPDATE PERSONAL_SETTINGS SET HIDE_MARKS=IN_HIDE_MARKS WHERE DB_USER=USER;
  END IF;
  commit;

  EXCEPTION WHEN OTHERS THEN
      LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.CHANGE_PERSONAL_SETTINGS', '');
      RAISE_APPLICATION_ERROR (-20202, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

END CHANGE_PERSONAL_SETTINGS;


--
--  ������� ������
--
PROCEDURE delete_invoice
(
  INV_ID_ IN NUMBER
)
AS
BEGIN
  select a.inv_minus into cnt_ from INVOICE_REGISTER a WHERE a.INV_ID = INV_ID_;
  if (cnt_ = 1) then
      DELETE FROM CLAIMS b WHERE b.inv_id = INV_ID_ and b.id_office = const_office;
  end if;

  select count(*) into cnt_ from prepare_price_list_index a
  WHERE a.INV_ID = INV_ID_ and a.inv_id2 is null and a.inv_id3 is null and a.inv_id4 is null and a.finished = 0 and a.id_office = const_office;
  if (cnt_ = 1) then
      select a.ppli_id into cnt_ from prepare_price_list_index a
      WHERE a.INV_ID = INV_ID_ and a.inv_id2 is null and a.inv_id3 is null and a.inv_id4 is null and a.finished = 0 and a.id_office = const_office;

      DELETE FROM prepare_price_list b WHERE b.ppli_id = cnt_;
      DELETE FROM prepare_price_list_index b WHERE b.ppli_id = cnt_;
  end if;

  DELETE FROM INVOICE_REGISTER WHERE INV_ID = INV_ID_ and id_office = const_office;
  commit;

  EXCEPTION WHEN OTHERS THEN
      LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.delete_invoice', '');
      RAISE_APPLICATION_ERROR (-20203, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end delete_invoice;


--
-- �������������� �������
--
PROCEDURE INV_REG_UPDATE
(
  IN_INV_ID         IN OUT NUMBER,
  IN_INV_DATE       IN DATE,
  IN_COMMENTS       IN VARCHAR2,
  IN_SUP_INV_DATE   IN DATE,
  IN_SUP_NUMBER     IN VARCHAR2,
  IN_S_ID           in number,
  IN_ID_DEPARTMENTS IN INTEGER,
  IN_country_gtd    in integer
)
as
begin

    UPDATE INVOICE_REGISTER SET
      INV_DATE = TRUNC(IN_INV_DATE),
      COMMENTS = IN_COMMENTS,
      SUPPLIER_DATE = TRUNC(IN_SUP_INV_DATE),
      SUPPLIER_NUMBER = IN_SUP_NUMBER,
      s_id_default = IN_S_ID,
      date_change = sysdate,
      country_gtd = IN_country_gtd
    WHERE
      INV_ID = IN_INV_ID;
    commit;

  EXCEPTION
  WHEN OTHERS THEN
       IN_INV_ID := -1;
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.INV_REG_UPDATE', '');
       RAISE_APPLICATION_ERROR (-20204, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end INV_REG_UPDATE;


--
--  ��������� �������� �� ��������� ��� ������� �������
--
PROCEDURE SET_DEFAULT
(
    INV_ID_                 in number,
    DEF_COUNTRY_ID_         in number,
    DEF_SUPPLIER_ID_        in number
)
is
begin

  UPDATE INVOICE_REGISTER SET S_ID_DEFAULT = DEF_SUPPLIER_ID_, C_ID_DEFAULT = DEF_COUNTRY_ID_, date_change=sysdate
  WHERE INV_ID = INV_ID_;
  commit;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.SET_DEFAULT', '');
       RAISE_APPLICATION_ERROR (-20205, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end SET_DEFAULT;


--
--  ������� ����� �������
--
PROCEDURE get_inv_data_id
(
    INVOICE_DATA_AS_IS_ID     in number,
    cursor_                 out ref_cursor
)
is
begin

  open cursor_ for
    SELECT INVOICE_DATA_ID FROM INVOICE_DATA WHERE INVOICE_DATA_AS_IS_ID = INVOICE_DATA_AS_IS_ID AND STORNED_DATA = 0;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.get_inv_data_id', '');
       RAISE_APPLICATION_ERROR (-20206, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end get_inv_data_id;



--
--  ������� ������������
--
PROCEDURE get_nomenclature
(
    ID_DEPARTMENTS_   in number,
    v_office          in number,
    cursor_           out ref_cursor
)
is
begin

  open cursor_ for
       SELECT COMPILED_NAME, FULL_NAME, F_NAME, F_NAME_RU, F_SUB_TYPE, F_TYPE, NOM.N_ID, FN_ID, FT_ID, FST_ID, S_ID, C_ID,
              COL_ID, H_CODE, H_NAME, CODE, BAR_CODE, LEN, PACK, VBN, HOL_TYPE, WEIGHT, WEIGHTDRY, S_NAME_RU, COLOUR, COUNTRY,
              TYPE_SUBTYPE, F_NAME_RU || ' / ' || F_NAME F_NAMES, CUST_COEF, pl.PRICE, PRICE_DATE, DIAMETER, HT_ID,
              is_photo, photo, nom.remarks, nom.compiled_name_otdel as compiled_name_pot
--              , (nom.f_name_ru || '. ' || (case when nom.col_id in (0,1639,2768,2915) then null else nom.colour||'. ' end) || nom.RUS_MARKS) compiled_name_pot
              , s.QUANTITY
              , nom.compiled_name_otdel
              , nom.id_office
              , tnved, NOM_NEW, NOM_START, NOM_END
              , nom.hol_color, nom.NAME_CODE
              , u.nsi_name
         FROM NOMENCLATURE_MAT_VIEW NOM, PRICE_LIST PL, store_main s, nsi_units u
              WHERE nom.ID_DEPARTMENTS = ID_DEPARTMENTS_ and (nom.id_office in (1,v_office))
                    AND NOM.N_ID = PL.N_ID(+)
                    and nom.n_id = s.n_id(+) and s.store_type(+) = 1
                    and nom.vbn = u.nsi_units_id(+)
              order by compiled_name_otdel, QUANTITY
                    ;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.get_nomenclature', '');
       RAISE_APPLICATION_ERROR (-20207, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end get_nomenclature;



--
--  ������� ���������� �� ��������� ������
--
PROCEDURE get_fn_view
(
    ID_DEPARTMENTS_   in number,
    cursor_           out ref_cursor
)
is
begin

  open cursor_ for
       SELECT FN_ID, F_NAME_RU FROM FN_VIEW
       WHERE ID_DEPARTMENTS =ID_DEPARTMENTS_ and ID_OFFICE=const_office
       ORDER BY F_NAME_RU;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.get_fn_view', '');
       RAISE_APPLICATION_ERROR (-20208, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end get_fn_view;





--
--  ����� ������� �������� � ������������
--
PROCEDURE NEED_TRANSLATION_SPEC
(
    SPEC_CODE_  in varchar2,
    cursor_     out ref_cursor
)
is
begin

  open cursor_ for
    SELECT HS_ID, NEED_TRANSLATION NT, SPEC_NAME
    FROM HOL_SPECIFICATIONS
    WHERE SPEC_CODE = SPEC_CODE_;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.NEED_TRANSLATION_SPEC', '');
       RAISE_APPLICATION_ERROR (-20209, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

END NEED_TRANSLATION_SPEC;


--
--  ����� ���������� ������������
--
PROCEDURE GET_SPECIFICATION_CONTENT
(
    HS_ID_       in number,
    CONTENT_HOL_ in varchar2,
    cursor_      out ref_cursor
)
is
begin

  open cursor_ for
    SELECT sc_id, hs_id, content_hol, content_rus
    FROM SPECIFICATION_CONTENT
    WHERE HS_ID = HS_ID_ AND CONTENT_HOL = CONTENT_HOL_;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.GET_SPECIFICATION_CONTENT', '');
       RAISE_APPLICATION_ERROR (-20210, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

END GET_SPECIFICATION_CONTENT;




--
--  �������� ����� ������������ � ����������
--
PROCEDURE CheckSpecifications
(
    SPEC_CODE_  in varchar2,
    MARK_V_     in varchar2,
    text_str    out varchar2,
    cursor_     out ref_cursor
)
is
  HS_ID_       number;
  NT_          number;
  SPEC_NAME_   varchar2(50);

  sc_id_       number;
  content_hol_ varchar2(255);
  content_rus_ varchar2(255);

  cursor f_ is
    SELECT HS_ID, NEED_TRANSLATION NT, SPEC_NAME FROM HOL_SPECIFICATIONS WHERE SPEC_CODE = SPEC_CODE_;

  cursor c_ is
    SELECT sc_id, content_hol, content_rus FROM SPECIFICATION_CONTENT
      WHERE HS_ID = HS_ID_ AND CONTENT_HOL = MARK_V_;

begin
  text_str := '';

  -- ��������� ������� ��������
    open f_;
    fetch f_ into HS_ID_, NT_, SPEC_NAME_;
    close f_;

  -- ���� ��� ������ � ������������ ������� ��������
  if ( text_str = '' and NT_ > 0) then
    open c_;
    fetch c_ into sc_id_, content_hol_, content_rus_;
    close c_;
  end if;

end CheckSpecifications;



--
--  ������� �������
--
PROCEDURE get_inv_register
(
    ID_DEPARTMENTS_  in number,
    SHOW_SHORT_      in number,
    v_office         in number,
    cursor_          out ref_cursor
)
is
begin

  if (SHOW_SHORT_ = 1) then
    open cursor_ for
      select a.*, 0 as d_check,
         case when AS_IS_POS = 0 and (done_num > 0 or ready_pos > 0) then 100 else
              case when done_num = 0 then 0 else round( (done_num / AS_IS_POS) * 100, 2 )
              end end procent_d
      from (
        SELECT IRF.INV_ID, IRF.INV_ID as INV_ID_, IRF.INV_DATE, IRF.COMMENTS, IRF.INV_SUM, IRF.SENDED_TO_WAREHOUSE, IRF.WAREHOUSE_SENDED_DATE, IRF.IPP_ID,
               IRF.IPP_COMMENT, IRF.READY_POS, IRF.AS_IS_POS, IRF.S_ID_DEFAULT, IRF.C_ID_DEFAULT, IRF.SUPPLIER_DATE, IRF.SUPPLIER_NUMBER,
               IRF.TOTAL_SUM, IRF.AS_IS_UNITS, IRF.READY_UNITS, IRF.DONE_NUM, IRF.PAST_NUM, IRF.inv_minus, IRF.S_NAME_RU, is_minus, minus_inv_id
               , price, price_done, BRIEF, id_office
         FROM INVOICE_REGISTER_FULL IRF
          WHERE IRF.ID_DEPARTMENTS = ID_DEPARTMENTS_ and (irf.id_office = v_office or v_office = 0)
                and IRF.SENDED_TO_WAREHOUSE = 0
      ) a
      ORDER BY a.INV_DATE DESC;
  else
    open cursor_ for
      select a.*, 0 as d_check,
         case when AS_IS_POS = 0 and (done_num > 0 or ready_pos > 0) then 100 else
              case when done_num = 0 then 0 else round( (done_num / AS_IS_POS) * 100, 2 )
              end end procent_d
      from (
        SELECT IRF.INV_ID, IRF.INV_ID as INV_ID_, IRF.INV_DATE, IRF.COMMENTS, IRF.INV_SUM, IRF.SENDED_TO_WAREHOUSE, IRF.WAREHOUSE_SENDED_DATE, IRF.IPP_ID,
               IRF.IPP_COMMENT, IRF.READY_POS, IRF.AS_IS_POS, IRF.S_ID_DEFAULT, IRF.C_ID_DEFAULT, IRF.SUPPLIER_DATE, IRF.SUPPLIER_NUMBER,
               IRF.TOTAL_SUM, IRF.AS_IS_UNITS, IRF.READY_UNITS, IRF.DONE_NUM, IRF.PAST_NUM, IRF.inv_minus, IRF.S_NAME_RU, is_minus, minus_inv_id
               , price, price_done, BRIEF, id_office
         FROM INVOICE_REGISTER_FULL IRF
          WHERE IRF.ID_DEPARTMENTS = ID_DEPARTMENTS_ and (irf.id_office = v_office or v_office = 0)
                --and IRF.SENDED_TO_WAREHOUSE = (1 - SHOW_SHORT_)
      ) a
      ORDER BY a.INV_DATE DESC;
  end if;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.get_inv_register', '');
       RAISE_APPLICATION_ERROR (-20211, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end get_inv_register;



--
--  ������� �������
--
PROCEDURE get_inv_register_new
(
    ID_DEPARTMENTS_  in number,
    SHOW_SHORT_      in number,
    pARCHIVE         in number,
    v_office         in number,
    pNom             in varchar2,
    cursor_          out ref_cursor
)
is
begin

  open cursor_ for
    select a.*, 0 as d_check
          , a.inv_id as inv_id_
          , (AS_IS_POS - READY_POS) as past_num
          , case when AS_IS_POS = 0 then 100 else
                case when READY_POS = 0 then 0 else round( (READY_POS / AS_IS_POS) * 100, 2 )
                    end end procent_d
    from (
        select a.*
              , case when nvl(b.INV_ID,( nvl(b2.INV_ID2, ( nvl(b3.INV_ID3, b4.inv_id4) )) )) is null then 0 else 1 end price
              , case when b.INV_ID is not null and b.finished =1 then 1 else
                case when b2.INV_ID2 is not null and b2.finished =1 then 1 else
                case when b3.INV_ID3 is not null and b3.finished =1 then 1 else
                case when b4.INV_ID4 is not null and b4.finished =1 then 1 else
                0 end end end end price_done
              -- as_is
              , ( select count(1) from invoice_data_as_is z where z.inv_id = a.inv_id ) as AS_IS_POS
              , ( select count(1) from invoice_data_as_is z where z.inv_id = a.inv_id and z.recognised=1 ) as READY_POS
              , case when const_office=1 then ( select sum(z.total_amount) from invoice_data_as_is z where z.inv_id = a.inv_id ) else 0 end TOTAL_SUM_AS_IS
              -- to_be
              , ( select count(1) from invoice_data y where y.inv_id = a.inv_id ) as TO_BE_POS
              , ( select sum(y.TOTAL_SUM) from invoice_data y where y.inv_id = a.inv_id ) as TOTAL_SUM_TO_BE
              , case when minus_inv_id > 0 then ( select sum(c.units*c.price_per_unit - nvl(b.units,0)*nvl(b.price_per_unit,0)) as profit
                        from invoice_data c, invoice_data b where c.inv_id = a.inv_id and b.inv_id(+) = a.minus_inv_id and c.n_id = b.n_id(+)
                ) else 0 end TOTAL_SUM_FROM_MINUS
        from (
            SELECT /*+ INDEX_JOIN(S) */ IR.INV_ID, IR.INV_DATE, IR.COMMENTS, IR.INV_SUM, IR.SENDED_TO_WAREHOUSE,
                  IR.WAREHOUSE_SENDED_DATE, IR.SUPPLIER_DATE, IR.SUPPLIER_NUMBER, IR.IPP_ID,
                  IR.ID_DEPARTMENTS, IR.inv_minus, IR.in_file, case when IR.in_file is null then 0 else 1 end is_file,
                  case when IR.inv_minus = 0 then 0 else 1 end is_minus,
                  IR.COMMENTS || ' (' || TO_CHAR(IR.INV_DATE,'DD.MM.YYYY') || ')' INVOICE_TITLE,
                  IR.S_ID_DEFAULT, IR.C_ID_DEFAULT, IR.minus_inv_id
                  , s.s_name_ru
                  , ipp.IPP_COMMENT
                  , ir.id_office, o.brief
                  , e.office
                  , ir.status as iArchive
                  , ir.country_gtd
            FROM INVOICE_REGISTER IR, SUPPLIERS S, INVOICE_PRICE_PACK IPP, offices o, (select distinct office, id_doc, id_invoice from export_to_fillials) e
            WHERE ir.id_departments = ID_DEPARTMENTS_ and (ir.id_office = v_office or v_office = 0)
                  and (ir.SENDED_TO_WAREHOUSE = 0 or SHOW_SHORT_ = 0)
                  and ir.s_id_default = s.s_id
                  and ir.ipp_id = ipp.IPP_ID(+)
                  and ir.id_office = o.id_office
                  and ir.inv_id = e.ID_INVOICE(+)
                  and (ir.status <= pARCHIVE)
                  and (
                    pNom is null
                    or exists (select z.n_id from invoice_data z, nomenclature_mat_view nom
                                where z.inv_id = ir.inv_id
                                  and z.n_id=nom.n_id
                                  and (
                                    lower(nom.compiled_name_otdel) like '%'||lower(pNom)||'%'
                                    or nvl(nom.bar_code,nom.code) like '%'||pNom||'%'
                                    or lower(nom.h_code) like '%'||lower(pNom)||'%'
                                  )
                              )
                  )
        ) a
        , PREPARE_PRICE_LIST_INDEX b, PREPARE_PRICE_LIST_INDEX b2, PREPARE_PRICE_LIST_INDEX b3, PREPARE_PRICE_LIST_INDEX b4
        where a.inv_id = b.inv_id(+)
            and a.inv_id = b2.inv_id2(+)
            and a.inv_id = b3.inv_id3(+)
            and a.inv_id = b4.inv_id4(+)

    ) a
    order by inv_id desc
    ;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.get_inv_register_new', '');
       RAISE_APPLICATION_ERROR (-20212, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end get_inv_register_new;


--
--  ������� ��� � ������� �����
--
PROCEDURE get_inv_register_asis
(
    INV_ID_  in integer,
    cursor_  out ref_cursor
)
is
begin

  open cursor_ for
    SELECT a.*
      FROM INVOICE_DATA_AS_IS a
        WHERE a.INV_ID = INV_ID_
              AND (recognised is null or recognised = 0);

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.get_inv_register_asis', '');
       RAISE_APPLICATION_ERROR (-20212, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end get_inv_register_asis;



--
--  ������� ��� � ������� �����������
--
PROCEDURE get_inv_register_done
(
    INV_ID_  in integer,
    cursor_  out ref_cursor
)
is
begin

  open cursor_ for
    SELECT 0 as D_CHECK, ind.inv_id, ind.n_id, ind.units, ind.price_per_unit, ind.total_sum, ind.amount_in_the_pack, ind.invoice_data_id, ind.invoice_data_as_is_id, full_name,
        F_NAME, F_NAME_RU, len, colour, nom.country, s_name_ru, hol_marks as inv_marks,  rus_marks, diameter, FT_ID, f_type, FST_ID, f_sub_type,
        cust_coef, ind.gtd, nom.h_code, ind.sended_to_warehouse, nvl(nom.PACK,ind.amount_in_the_pack) as PACK, ind.STORNED_DATA,
        DECODE(ind.STORNED_DATA,0,'�� ������������','������������') STORNED_TEXT,
        nom.REMARKS, CODE, nom.BAR_CODE, is_photo, photo
        , count(nom.n_id) over(partition by nom.n_id, ind.STORNED_DATA) as nn
        , src.truck, src.trolley
        --, src.SRC_TROLLEY
        , case when nom.id_departments=61 then src.order_number||'.'||src.src_trolley else src.src_trolley end src_trolley
        , src.CLIENT
        , dense_rank() over(PARTITION by src.truck order by src.order_number, src.trolley, src.src_trolley) as trolley_calc
        , ind.units / decode(nvl(nom.PACK,ind.amount_in_the_pack),null,1,0,1,nvl(nom.PACK,ind.amount_in_the_pack)) as units_print
        , nom.compiled_name_otdel, nom.h_name, nom.NOPRINT, nom.NOTUSE
        , nom.fn_id, nom.c_id, nom.s_id, nom.col_id, nom.ht_id,nom.WEIGHT, nom.WEIGHTDRY, nom.VBN, nom.TNVED, nom.hol_type
        , ind.GTD_COUNTRY
        , c.country as gtd_country_name
--        , nom.DIAMETER, nom.CUST_COEF, nom.REMARKS
        , src.NOM_NEW, src.NOM_START, src.NOM_END, ind.NOM_ADD, ind.NOM_SPECIAL
        , id.inv_id as parent, nom.hol_color, nom.name_code
        , u.nsi_name
    FROM invoice_data ind, invoice_data_as_is src,
         nomenclature_mat_view nom, COUNTRIES c, invoice_data id, nsi_units u
    WHERE ind.inv_id = INV_ID_
          and ind.n_id = nom.n_id
          and ind.invoice_data_as_is_id  = src.invoice_data_as_is_id(+)
          and ind.GTD_COUNTRY = c.c_id(+)
          and ind.INVOICE_DATA_ID = id.PARENT_ID(+)
          and nom.vbn = u.nsi_units_id(+)
    order by n_id, STORNED_DATA, abs(units);

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.get_inv_register_done', '');
       RAISE_APPLICATION_ERROR (-20213, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end get_inv_register_done;




--
--  ���������� ������������ � ����� ������������
--
PROCEDURE ADD_SPEC_TO_NEW_NOM
(
    SPEC_CODE_  in varchar2,
    N_ID_       in number,
    HS_VAL_     in varchar2,
    ORD_        in number,
    text_str    out varchar2
)
is
  HS_ID_       number;

  cursor f_ is
    SELECT HS_ID FROM HOL_SPECIFICATIONS WHERE SPEC_CODE = SPEC_CODE_;

begin
  text_str := '';

  begin
  -- ��������� ������� ��������
    open f_;
    fetch f_ into HS_ID_;
    close f_;

  EXCEPTION
       WHEN NO_DATA_FOUND
       THEN
         text_str := '� ������� ��������� ��� ������������ ��������! �������� ����������!';
         raise;
       WHEN TOO_MANY_ROWS
       THEN
         text_str := '� ������� ��������� ������� ��������� ���������! �������� ����������!';
         raise;
  END;

  begin
      INSERT INTO NOM_SPECIFICATIONS (N_ID,HS_ID,HS_VAL,ORD,id_office,date_change) VALUES (N_ID_, HS_ID_, HS_VAL_, ORD_, const_office, sysdate);
      nomenclature2_pkg.sync_nomenclature_one(N_ID_);
      commit;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.ADD_SPEC_TO_NEW_NOM', '');
       RAISE_APPLICATION_ERROR (-20214, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
  end;

end ADD_SPEC_TO_NEW_NOM;




--
--  �������� ������ �������
--
PROCEDURE DEL_INV_SOURCE
(
    INVOICE_DATA_AS_IS_ID_  in number
)
IS
begin

  DELETE FROM INVOICE_DATA_AS_IS
  WHERE INVOICE_DATA_AS_IS_ID = INVOICE_DATA_AS_IS_ID_;
  commit;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.DEL_INV_SOURCE', '');
       RAISE_APPLICATION_ERROR (-20215, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end DEL_INV_SOURCE;



--
--  ������� ������������ � ������������
--
PROCEDURE get_spec_view
(
    N_ID_    in integer,
    cursor_  out ref_cursor
)
is
begin

  open cursor_ for
    SELECT N_ID, HS_ID, SC_ID, HS_VAL, ORD, SPEC_CODE, SPEC_NAME, SPEC_HOL_NAME,
            ADDITION, RUSSIAN_ADDITION, NEED_TRANSLATION, CONTENT_HOL, CONTENT_RUS
      FROM SPECIFICATION_VIEW
        WHERE N_ID = N_ID_;

  EXCEPTION
  WHEN OTHERS THEN
         LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.get_spec_view', '');
       RAISE_APPLICATION_ERROR (-20216, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end get_spec_view;



--
--  ���������� ������������ � ����� ������������
--
PROCEDURE ADD_SPEC_TO_NEW_NOM2
(
    HS_ID_      in number,
    N_ID_       in number,
    HS_VAL_     in varchar2,
    ORD_        in number,
    text_str    out varchar2
)
is

begin
  text_str := '';

  INSERT INTO NOM_SPECIFICATIONS (N_ID,HS_ID,HS_VAL,ORD,id_office,date_change) VALUES (N_ID_, HS_ID_, HS_VAL_, ORD_, const_office, sysdate);
  nomenclature2_pkg.sync_nomenclature_one(N_ID_);
  commit;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.ADD_SPEC_TO_NEW_NOM2', '');
       RAISE_APPLICATION_ERROR (-20217, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end ADD_SPEC_TO_NEW_NOM2;




--
--  ��������� ����� ��� ��������
--
PROCEDURE ADD_PRICE_PACK
(
  IPP_COMMENT_        IN VARCHAR2,
  in_id_              in out number
)
is
  NEW_IPP_ID INTEGER;

begin

  SELECT get_office_unique('IPP_ID') INTO NEW_IPP_ID FROM DUAL;
  if (NEW_IPP_ID > 0) then
     INSERT INTO INVOICE_PRICE_PACK VALUES (NEW_IPP_ID, sysdate, IPP_COMMENT_, const_office, sysdate);
     in_id_ := NEW_IPP_ID;
     commit;
    end if;

EXCEPTION WHEN OTHERS THEN
      in_id_ := -1;
      LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.ADD_PRICE_PACK', '');
      RAISE_APPLICATION_ERROR (-20218, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end ADD_PRICE_PACK;


--
--  ������� ����� ��� ��������
--
PROCEDURE DEL_PRICE_PACK
(
  IPP_ID_                    IN NUMBER
)
is
begin

  UPDATE INVOICE_REGISTER SET IPP_ID = NULL, date_change=sysdate WHERE IPP_ID = IPP_ID_;
  DELETE FROM INVOICE_PRICE_PACK WHERE IPP_ID = IPP_ID_;
  commit;

  EXCEPTION WHEN OTHERS THEN
      LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.DEL_PRICE_PACK', '');
      RAISE_APPLICATION_ERROR (-20219, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end DEL_PRICE_PACK;



--
--  ����������� �������� ��������
--
PROCEDURE SET_TO_INV_DONE
(
  GTD_                  IN varchar2,
  CUST_COEF_            IN NUMBER,
  SENDED_TO_WAREHOUSE_  IN NUMBER,
  c_def_                IN NUMBER,
  id_str_               in varchar2
)
is
begin

  if GTD_ is not null then
    execute immediate 'UPDATE INVOICE_DATA SET GTD=:p1, GTD_COUNTRY=:p2, date_change=sysdate WHERE INVOICE_DATA_ID IN ('||id_str_||')' using GTD_, c_def_;
  end if;

  if CUST_COEF_ <> 0 then
    execute immediate 'UPDATE NOMENCLATURE SET CUST_COEF = :p1, date_change=sysdate WHERE N_ID IN (SELECT DISTINCT N_ID FROM INVOICE_DATA WHERE INVOICE_DATA_ID IN ('||id_str_||'))' using CUST_COEF_;
    execute immediate 'UPDATE NOMENCLATURE_MAT_VIEW SET CUST_COEF = :p1 WHERE N_ID IN (SELECT DISTINCT N_ID FROM INVOICE_DATA WHERE INVOICE_DATA_ID IN ('||id_str_||'))' using CUST_COEF_;
  end if;

  if SENDED_TO_WAREHOUSE_ is not null and SENDED_TO_WAREHOUSE_ <> 0 then
    execute immediate 'UPDATE INVOICE_DATA SET SENDED_TO_WAREHOUSE = :p1, date_change=sysdate WHERE N_ID IN (SELECT DISTINCT N_ID FROM INVOICE_DATA WHERE INVOICE_DATA_ID IN ('||id_str_||'))' using SENDED_TO_WAREHOUSE_;
  end if;

  commit;

  EXCEPTION WHEN OTHERS THEN
      LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.SET_TO_INV_DONE', '');
      RAISE_APPLICATION_ERROR (-20220, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end SET_TO_INV_DONE;



--
--  ������� ������������ �� ID
--
PROCEDURE GET_NOMENCLATURE_ID
(
    ID_DEPARTMENTS_   in number,
    n_id_             in number,
    cursor_           out ref_cursor
)
is
begin

  if ( n_id_ <= 0 ) then
    open cursor_ for
       SELECT COMPILED_NAME, FULL_NAME, F_NAME, F_NAME_RU, F_SUB_TYPE, F_TYPE, NOM.N_ID, FN_ID, FT_ID, FST_ID, S_ID, C_ID,
              COL_ID, H_CODE, H_NAME, CODE, BAR_CODE, LEN, PACK, VBN, HOL_TYPE, WEIGHT, WEIGHTDRY, S_NAME_RU, COLOUR, COUNTRY,
              TYPE_SUBTYPE, F_NAME_RU || ' / ' || F_NAME F_NAMES, CUST_COEF, DIAMETER, HT_ID
              , is_photo, photo, remarks, nom.rus_marks
              , nom.compiled_name_otdel, 0 as units, id_office, tnved
              , NOM_NEW, NOM_START, NOM_END, nom.hol_color, nom.NAME_CODE
         FROM NOMENCLATURE_MAT_VIEW NOM
              WHERE ID_DEPARTMENTS = ID_DEPARTMENTS_ and (id_office in (1,const_office))
              order by compiled_name_otdel
              ;
  else
    open cursor_ for
       SELECT COMPILED_NAME, FULL_NAME, F_NAME, F_NAME_RU, F_SUB_TYPE, F_TYPE, NOM.N_ID, FN_ID, FT_ID, FST_ID, S_ID, C_ID,
              COL_ID, H_CODE, H_NAME, CODE, BAR_CODE, LEN, PACK, VBN, HOL_TYPE, WEIGHT, WEIGHTDRY, S_NAME_RU, COLOUR, COUNTRY,
              TYPE_SUBTYPE, F_NAME_RU || ' / ' || F_NAME F_NAMES, CUST_COEF, DIAMETER, HT_ID
              , is_photo, photo, remarks, nom.rus_marks
              , nom.compiled_name_otdel, 0 as units, id_office, tnved
              , NOM_NEW, NOM_START, NOM_END, nom.hol_color, nom.NAME_CODE
         FROM NOMENCLATURE_MAT_VIEW NOM
              WHERE ID_DEPARTMENTS = ID_DEPARTMENTS_ and nom.n_id = n_id_;
  end if;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.GET_NOMENCLATURE_ID', '');
       RAISE_APPLICATION_ERROR (-20221, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end GET_NOMENCLATURE_ID;



  /*��������� ���������� ������������� ������� �������*/
  PROCEDURE UPDATE_DATA
  (
      IN_INVOICE_DATA_ID       IN NUMBER,
      IN_N_ID                  IN NUMBER,
      IN_UNITS                 IN NUMBER,
      IN_PRICE_PER_UNIT        IN NUMBER,
      IN_TOTAL_SUM             IN NUMBER,
      IN_AMOUNT_IN_THE_PACK    IN NUMBER DEFAULT NULL,
      OUT_INVOICE_DATA_ID      OUT NUMBER,
      OUT_RES                  OUT NUMBER,
      OUT_TEXT                 OUT VARCHAR2
  )
  AS
  BEGIN
      OUT_RES := 0;
      OUT_TEXT := '����������� ������!';

      UPDATE INVOICE_DATA SET UNITS=IN_UNITS, PRICE_PER_UNIT=IN_PRICE_PER_UNIT, TOTAL_SUM=IN_TOTAL_SUM, date_change=sysdate
      WHERE INVOICE_DATA_ID = IN_INVOICE_DATA_ID;
      OUT_INVOICE_DATA_ID := IN_INVOICE_DATA_ID;
      commit;
        OUT_RES := 1;
        OUT_TEXT := '������ ������� ��������������.';

  EXCEPTION
        WHEN OTHERS THEN
             creator.LOG_ERR(SQLERRM, SQLCODE, 'INVOICE_PKG.UPDATE_DATA', '');
             RAISE_APPLICATION_ERROR (-20222, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

  END UPDATE_DATA;


--
--  �������� �����
--
PROCEDURE INV_DONE_MINUS
(
  in_INV_ID         in number
  , in_INV_PRIME    in number
  , OUT_RES         OUT NUMBER
  , OUT_TEXT        OUT VARCHAR2
)
as
    v_sended    number;
    v_ppli_id   number;
    v_finished  number;
    v_s_id      number;
    v_id_claim  number;

    EXCH_RATE   NUMBER;
    PCC         NUMBER;
    PC          NUMBER;
    UCC         NUMBER;
    OLD_PRICE_COUNT number;
    INT_OLD_PRICE   number;
    FIN_PR      number;
    CC          number;

    v_param1    number;
    v_var1      number;

    cursor f_ is
        SELECT a.n_id, a.units, a.price_per_unit, a.total_sum, a.amount_in_the_pack,
               a.invoice_data_id, a.sended_to_warehouse, a.gtd, a.storned_data, a.gtd_country,
               a.NOM_ADD, a.NOM_SPECIAL, a.TO_CLIENT, a.parent_id
        FROM invoice_data a
        where a.inv_id = in_INV_ID and a.storned_data = 0
        ;
    curr_f                   f_%rowtype;

begin
    v_id_claim := 0;

    /* �������� �� ������ �� ������������ ������ �� ����� */
    select a.sended_to_warehouse, a.s_id_default into v_sended, v_s_id
    from invoice_register a where a.inv_id = in_INV_PRIME;

    /* �������� ���� �� ���� � ��������� �� ��� �� ������������ ������ */
    select count(1) into cnt_ from PREPARE_PRICE_LIST_INDEX where INV_ID = in_INV_PRIME;
    if (cnt_ = 1) then
        select a.ppli_id, a.finished into v_ppli_id, v_finished
        from PREPARE_PRICE_LIST_INDEX a where a.INV_ID = in_INV_PRIME;
    else
        v_ppli_id  := 0;
        v_finished := 0;
    end if;

    /* 1-� ����. ��� �� ��� �� �������� �� �����. ������ ������������� � ������������� ������� */
    if (v_sended = 0 and v_ppli_id = 0 and v_finished = 0) then

        claims_pkg.claims_edit(v_id_claim,in_INV_ID,sysdate(),0,NULL,OUT_RES, OUT_TEXT);
        if (OUT_RES >= 0) then
            open f_;
            loop
               fetch f_ into curr_f;
               exit when f_%notfound;

               select count(1) into cnt_ from invoice_data b where b.inv_id = in_INV_PRIME and b.n_id = curr_f.n_id and b.storned_data = 0 and b.invoice_data_id = curr_f.parent_id;
               /* ���� ����, ��� ���������, ��� ��� ������ */
               if (cnt_ = 1) then
                   select b.invoice_data_id, b.units into cnt_, v_var1
                   from invoice_data b
                   where b.inv_id = in_INV_PRIME and b.n_id = curr_f.n_id and b.storned_data = 0 and b.invoice_data_id = curr_f.parent_id;
                   INVOICE_DATA_PACKAGE.UPDATE_DATA(cnt_, curr_f.n_id, curr_f.UNITS, curr_f.PRICE_PER_UNIT, curr_f.TOTAL_SUM, curr_f.AMOUNT_IN_THE_PACK, v_param1, OUT_RES, OUT_TEXT);

                   v_param1 := 0;
                   -- ID_CLIENTS = 7064  - 76 ������
                   claims_pkg.claims_edit_list(v_param1,curr_f.n_id,v_id_claim,2,v_s_id,7064,
                   (v_var1-curr_f.UNITS),
                   curr_f.PRICE_PER_UNIT,1,NULL,0,0,0,NULL,NULL,OUT_RES,OUT_TEXT);
               end if;

               /* ���� ��� ������ */
               if (cnt_ = 0) then
                   v_param1 := 0;
                   INVOICE_DATA_PACKAGE.INSERT_DATA(in_INV_PRIME,NULL,curr_f.n_id,curr_f.UNITS,curr_f.PRICE_PER_UNIT,curr_f.TOTAL_SUM,curr_f.AMOUNT_IN_THE_PACK,0,NULL,v_param1,curr_f.gtd_country, curr_f.NOM_ADD, curr_f.NOM_SPECIAL, curr_f.TO_CLIENT, curr_f.parent_id);

                   -- ID_CLIENTS = 7064  - 76 ������
                   v_param1 := 0;
                   claims_pkg.claims_edit_list(v_param1,curr_f.n_id,v_id_claim,2,v_s_id,7064,curr_f.UNITS,curr_f.PRICE_PER_UNIT,1,NULL,0,0,0,NULL,NULL,OUT_RES,OUT_TEXT);
               end if;


            end loop;
            close f_;
            update invoice_register a set a.inv_minus = 1, date_change=sysdate where a.inv_id = in_INV_ID;
            commit;
            OUT_RES := 1;
            OUT_TEXT := '������� � ������������ ������� ������������. ������ ����� ';
        end if;
    end if;
    /* *************************************************************************************** */


    /* 2-� ����. ���� ����, �� ��� �������� �� �����. ������ ������������� � ������������� ������� */
    if (v_sended = 0 and v_ppli_id > 0) then
        OUT_RES := -1;
        OUT_TEXT := '������ �������� ����� �� ����� �������� ���. ��������� ���� ������ ����� ��������� �� ����� � ��������� ��������!';
    end if;

    if (v_sended = 1 and v_ppli_id > 0) then

        claims_pkg.claims_edit(v_id_claim,in_INV_ID,sysdate(),0,NULL,OUT_RES, OUT_TEXT);
        if (OUT_RES >= 0) then
            open f_;
            loop
               fetch f_ into curr_f;
               exit when f_%notfound;

               select count(1) into cnt_ from invoice_data b where b.inv_id = in_INV_PRIME and b.n_id = curr_f.n_id and b.storned_data = 0;
               /* ���� ����, ��� ���������, ��� ��� ������ */
               if (cnt_ = 1) then
                   select b.invoice_data_id, b.units into cnt_, v_var1 from invoice_data b where b.inv_id = in_INV_PRIME and b.n_id = curr_f.n_id and b.storned_data = 0;
                   v_param1 := 0;
                   claims_pkg.claims_edit_list(v_param1,curr_f.n_id,v_id_claim,2,v_s_id,7064,
                   (v_var1-curr_f.UNITS),
                   curr_f.PRICE_PER_UNIT,1,NULL,0,0,0,NULL,NULL,OUT_RES,OUT_TEXT);
               end if;

               /* ���� ��� ������ */
               if (cnt_ = 0) then
                   v_param1 := 0;
                   -- ID_CLIENTS = 7064  - 76 ������
                   v_param1 := 0;
                   claims_pkg.claims_edit_list(v_param1,curr_f.n_id,v_id_claim,2,v_s_id,7064,curr_f.UNITS,curr_f.PRICE_PER_UNIT,1,NULL,0,0,0,NULL,NULL,OUT_RES,OUT_TEXT);
               end if;

            end loop;
            close f_;
            OUT_RES := 1;
            OUT_TEXT := '������� � ������������ ������� ������������. ������ ����� ';

            update invoice_register a set a.inv_minus = 3 where a.inv_id = in_INV_ID;
            commit;
        end if;


        commit;
        OUT_RES := 1;
        OUT_TEXT := '������ �����. ������ ������ ���������� ��������� � ���� � �� �����.';
    end if;
    /* *************************************************************************************** */


  EXCEPTION
        WHEN OTHERS THEN
             creator.LOG_ERR(SQLERRM, SQLCODE, 'INVOICE_PKG.INV_DONE_MINUS', '');
             RAISE_APPLICATION_ERROR (-20223, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);
end INV_DONE_MINUS;










--
--  ������ ������� �� �������
--
PROCEDURE print_invoice
(
    v_inv_id  in integer,
    cursor_   out ref_cursor
)
is
begin

  open cursor_ for
    select a.* from (
    SELECT nom.n_id, ind.units, F_NAME, F_NAME_RU, colour, country, s_name_ru, rus_marks, nom.h_code, nom.BAR_CODE,
           nvl(a.trolley,0) as trolley, nvl(a.truck,0) as truck, case when nom.id_departments=61 then a.order_number||'.'||a.src_trolley else a.src_trolley end src_trolley
           , dense_rank() over(PARTITION by a.truck order by a.order_number, a.trolley, a.src_trolley) as trolley_calc
           , nom.F_TYPE, nom.F_SUB_TYPE, nom.ID_DEPARTMENTS
    FROM invoice_data ind,
         nomenclature_mat_view nom,
         invoice_data_as_is a
    WHERE ind.inv_id = v_inv_id
          and ind.n_id = nom.n_id
          and ind.invoice_data_as_is_id = a.invoice_data_as_is_id(+)
          and ind.storned_data = 0
    ) a
    order by case when a.ID_DEPARTMENTS = 62 then 0 else trolley_calc end, src_trolley, F_NAME_RU
    ;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.print_invoice', '');
       RAISE_APPLICATION_ERROR (-20238, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end print_invoice;

--
--  ������� ������������� �������
--
PROCEDURE move_to_reserv
(
    v_n_id  in number,
    v_quant in number,
    v_from  in number,
    v_inv   in number
)
as
    p_price_list    number;
begin
  p_price_list := 0;
  if v_from = 0 then
    -- ������ �� ������
    select price into p_price_list from price_list where n_id = v_n_id;
  else
    -- ������ � �����
    select max(a.final_price) into p_price_list
    from prepare_price_list a, prepare_price_list_index b
    where b.inv_id = v_inv and a.ppli_id = b.ppli_id and a.n_id = v_n_id;
  end if;

  delete from STORE_DOC_DATA_TEMP where n_id = v_n_id;
  if (v_quant <> 0 and p_price_list <> 0) then
    INSERT INTO STORE_DOC_DATA_TEMP (ID_DOC_DATA, N_ID, QUANTITY, store_type, PRICE, PRICE_LIST)
    VALUES (STORE_DOC_DATA_TEMP_SET_ID.NEXTVAL, v_n_id, v_quant, 1, p_price_list, p_price_list)
    ;
  end if;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.move_to_reserv', '');
       RAISE_APPLICATION_ERROR (-20243, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end move_to_reserv;


--
--  �������� ����� ��������
--
PROCEDURE get_ipp_list
(
    V_OFFICE  in number,
    cursor_   in out ref_cursor
)
is
begin
  open cursor_ for
    select a.IPP_ID, a.IPP_COMMENT from (
        SELECT distinct a.IPP_ID, TO_CHAR(a.IPP_DATE,'DD.MM.YYYY') || ' / ' || IPP_COMMENT as IPP_COMMENT, IPP_DATE
        FROM INVOICE_PRICE_PACK a, invoice_register b
        where a.ipp_id = b.ipp_id(+) and b.INV_MINUS(+) = 0 and SENDED_TO_WAREHOUSE(+) = 0 and a.id_office = V_OFFICE
        ORDER by IPP_DATE desc
    ) a
  ;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.get_ipp_list', '');
       RAISE_APPLICATION_ERROR (-20244, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end get_ipp_list;


--
--  ������� ����� ��������
--
PROCEDURE SET_INV_TO_PACK
(
  V_IPP_ID      IN NUMBER
  , V_PARAM     in number
  , V_INV_ID    IN NUMBER
)
is
begin

  UPDATE INVOICE_REGISTER SET IPP_ID = decode(V_IPP_ID,0,null,V_IPP_ID), date_change=sysdate WHERE INV_ID = V_INV_ID;
--  commit;

  EXCEPTION WHEN OTHERS THEN
        LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.SET_INV_TO_PACK', '');
      RAISE_APPLICATION_ERROR (-20245, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end SET_INV_TO_PACK;




--
--  ��������� ������ ������ ������ ������� �� ��������� �������
--
PROCEDURE INV_REG_INSERT_DATA_TEMP
(
    ORDER_NUMBER_       in number,
    ORDER_MARKNAME_     in varchar2,
    PACKING_MARKS_      in varchar2,
    PACKING_CODE_       in varchar2,
    DESCRIPTION_        in varchar2,
    UNITS_              in number,
    SKU_                in varchar2,
    AMOUNT_IN_THE_PACK_ in number,
    HOL_COLOUR_         in varchar2,
    HOL_SUB_TYPE_       in varchar2,
    MARKS_CONTENT_      in varchar2,
    MARKS_NAMES_        in varchar2,
    SHORT_CODE_         in varchar2,
    SHORT_NAME_         in varchar2,
    BAR_CODE_           in varchar2,
    TRANSLATION_        in varchar2,
    AMOUNT_PER_UNIT_    in number,
    TOTAL_AMOUNT_       in number,
    REMARKS_            in varchar2,
    SPEC_LENGTH_        in number,
    SPEC_HEADS_         in varchar2,
    SPEC_HEADS_SHRUB_   in varchar2,
    SPEC_VD2_           in varchar2,
    SPEC_WIDTH_         in number,
    SPEC_HIGHT_         in number,
    TROLLEY_            in varchar2,
    TRUCK_              in varchar2,
    CLIENT_             in varchar2,
    VOLUME_             in number,
    VOLDRY_             in number,
    NOM_NEW_            in varchar2,
    NOM_START_          in varchar2,
    country_            in varchar2,
    NOM_END_            in varchar2,
    NOM_ADD_            in varchar2,
    NOM_SPEC_           in varchar2,
    NOM_PACK_           in number
)
IS
  INVOICE_DATA_AS_IS_ID_ number;
  v_truck    varchar2(2);
v_sql varchar2(4000);
  v_trolley  number;
  cc         number;
BEGIN
  select case when instr(TRUCK_, 'T1') > 0 or instr(TRUCK_, 'TR1') > 0 or instr(TRUCK_, 'TRUCK 1') > 0 or TRUCK_ = '1' then 1 else
         case when instr(TRUCK_, 'T2') > 0 or instr(TRUCK_, 'TR2') > 0 or instr(TRUCK_, 'TRUCK 2') > 0 or TRUCK_ = '2' then 2 else
         case when instr(TRUCK_, 'T3') > 0 or instr(TRUCK_, 'TR3') > 0 or instr(TRUCK_, 'TRUCK 3') > 0 or TRUCK_ = '3' then 3 else
         case when instr(TRUCK_, 'T4') > 0 or instr(TRUCK_, 'TR4') > 0 or instr(TRUCK_, 'TRUCK 4') > 0 or TRUCK_ = '4' then 4 else
         case when instr(TRUCK_, 'T5') > 0 or instr(TRUCK_, 'TR5') > 0 or instr(TRUCK_, 'TRUCK 5') > 0 or TRUCK_ = '5' then 5 else
         case when instr(TRUCK_, 'T6') > 0 or instr(TRUCK_, 'TR6') > 0 or instr(TRUCK_, 'TRUCK 6') > 0 or TRUCK_ = '6' then 6 else
         case when instr(TRUCK_, 'T7') > 0 or instr(TRUCK_, 'TR7') > 0 or instr(TRUCK_, 'TRUCK 7') > 0 or TRUCK_ = '7' then 7 else
         case when instr(TRUCK_, 'T8') > 0 or instr(TRUCK_, 'TR8') > 0 or instr(TRUCK_, 'TRUCK 8') > 0 or TRUCK_ = '8' then 8 else 0
         end end end end end end end end
  into v_truck from dual;

  v_trolley := 0;
  begin
    if (length(TROLLEY_) > 0) then
      cc := instr(TROLLEY_,'-')-1;
      if cc = 0 then cc := length(TROLLEY_); end if;
      v_trolley := to_number( substr(TROLLEY_, instr(TROLLEY_,'.', -1)+1, cc-instr(TROLLEY_,'.', -1) ) );
    end if;
  EXCEPTION WHEN OTHERS THEN
    v_trolley := 0;
  end;

v_sql := 'INSERT INTO creator.invoice_data_as_is_temp VALUES ('''||ORDER_NUMBER_||''', '''||ORDER_MARKNAME_||''', '''||PACKING_MARKS_||''', '''||PACKING_CODE_||''', '''||DESCRIPTION_||''', '''||UNITS_||''',';
v_sql := v_sql || ' '''||SKU_||''', '''||AMOUNT_IN_THE_PACK_||''', '''||HOL_COLOUR_||''', '''||HOL_SUB_TYPE_||''', '''||MARKS_CONTENT_||''', '''||MARKS_NAMES_||''', '''||SHORT_CODE_||''',';
v_sql := v_sql || ' '''||SHORT_NAME_||''', null, '''||BAR_CODE_||''', '''||TRANSLATION_||''', '''||AMOUNT_PER_UNIT_||''', '''||TOTAL_AMOUNT_||''', '''||REMARKS_||''', '''||SPEC_LENGTH_||''',';
v_sql := v_sql || ' '''||SPEC_HEADS_||''', '''||SPEC_HEADS_SHRUB_||''', '''||SPEC_VD2_||''', '''||SPEC_WIDTH_||''', '''||SPEC_HIGHT_||''', '''||v_trolley||''', '''||v_truck||''',';
v_sql := v_sql || ' '''||CLIENT_||''', '''||TROLLEY_||''', '''||VOLUME_||''', '''||VOLDRY_||''', decode('''||NOM_NEW_||''', NULL, 0, 1), decode('''||NOM_START_||''', NULL, 0, 1), '''||country_||''' );';

  INSERT INTO creator.invoice_data_as_is_temp
  VALUES (
    ORDER_NUMBER_, ORDER_MARKNAME_, PACKING_MARKS_, PACKING_CODE_, DESCRIPTION_, UNITS_, SKU_, AMOUNT_IN_THE_PACK_, HOL_COLOUR_,
    HOL_SUB_TYPE_, MARKS_CONTENT_, MARKS_NAMES_, SHORT_CODE_, SHORT_NAME_, null, BAR_CODE_, TRANSLATION_, AMOUNT_PER_UNIT_,
    TOTAL_AMOUNT_, REMARKS_, SPEC_LENGTH_, SPEC_HEADS_, SPEC_HEADS_SHRUB_, SPEC_VD2_, SPEC_WIDTH_, SPEC_HIGHT_, v_trolley, v_truck,
    CLIENT_, TROLLEY_, VOLUME_, VOLDRY_, decode(NOM_NEW_, NULL, 0, 1), decode(NOM_START_, NULL, 0, 1), country_,
    universal_id.nextval
    , decode(NOM_END_, NULL, 0, 1), decode(NOM_ADD_, NULL, 0, 1), decode(NOM_SPEC_, NULL, 0, 1), decode(NOM_PACK_, NULL, 0, NOM_PACK_)
    );

--  LOG_ERR(v_trolley, cc, 'invoice_pkg.INV_REG_INSERT_DATA_TEMP', v_sql);

  EXCEPTION WHEN OTHERS THEN
      LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.INV_REG_INSERT_DATA_TEMP', v_sql);
      RAISE_APPLICATION_ERROR (-20246, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

END INV_REG_INSERT_DATA_TEMP;



--
--  ������� ��� � ����� ������� �� ��������� �������
--
PROCEDURE get_src
(
  p_inv_id    in number,
  cursor_  out ref_cursor
)
is
begin

  open cursor_ for
/*
    SELECT a.*, n.n_id, n.COMPILED_NAME_OTDEL, n.code, n.h_code, n.remarks as nom_remarks
      , n.ID_OFFICE, FN_ID, FT_ID, FST_ID, C_ID, S_ID, COL_ID, LEN, PACK, HT_ID, DIAMETER
      , WEIGHT, WEIGHTDRY, CUST_COEF, VBN, H_NAME, TNVED, HOL_TYPE
      FROM invoice_data_as_is_temp a
      left outer join nomenclature_mat_view n on n.H_NAME = a.DESCRIPTION and ((n.remarks = a.REMARKS) or (n.remarks is null and a.REMARKS is null))
      ;
*/
    SELECT a.inv_id, a.order_number, a.order_markname, a.packing_marks,
       a.packing_code, a.description, a.units, -- a.sku,
       nvl(a.sku, a.short_code||'.'||a.hol_colour||'.'||nvl(a.spec_length,0)||'.'||a.nom_pack||'.'||a.SPEC_HEADS||'.'||a.SPEC_HEADS_SHRUB||'.'||a.SPEC_VD2||'.'||a.remarks) as sku,
       a.amount_in_the_pack, a.invoice_data_as_is_id, a.hol_colour,
       a.hol_sub_type, a.marks_content, a.marks_names, a.short_code,
       a.short_name, a.recognised, a.bar_code, a.translation,
       a.amount_per_unit, a.total_amount, a.remarks, a.spec_length,
       a.spec_heads, a.spec_heads_shrub, a.spec_vd2, a.spec_width,
       a.spec_hight, a.trolley, a.truck, a.client, a.src_trolley,
       a.id_office, a.date_change, a.volume, a.voldry, a.nom_new,
       a.nom_start, a.country_, a.nom_end, a.nom_add, a.nom_special,
       a.nom_pack, a.nom_pack_hol
       , n.n_id
       , nvl(n.COMPILED_NAME_OTDEL, nom.COMPILED_NAME_OTDEL) as COMPILED_NAME_OTDEL
       , nvl(n.code, nom.code) as code
       , nvl(n.h_code, nom.h_code) as h_code
       , nvl(n.remarks, nom.remarks) as nom_remarks
       , nvl(n.ID_OFFICE, nom.ID_OFFICE) as ID_OFFICE
       , nvl(n.FN_ID, nom.FN_ID) as FN_ID
       , nvl(n.FT_ID, nom.FT_ID) as FT_ID
       , nvl(n.FST_ID, nom.FST_ID) as FST_ID
       , nvl(n.C_ID, nom.C_ID) as C_ID
       , nvl(n.S_ID, nom.S_ID) as S_ID
       , nvl(n.COL_ID, nom.COL_ID) as COL_ID
       , nvl(n.LEN, nom.LEN) as LEN
       , nvl(n.PACK, nom.PACK) as PACK
       , nvl(n.HT_ID, nom.HT_ID) as HT_ID
       , nvl(n.DIAMETER, nom.DIAMETER) as DIAMETER
       , nvl(n.WEIGHT, nom.WEIGHT) as WEIGHT
       , nvl(n.WEIGHTDRY, nom.WEIGHTDRY) as WEIGHTDRY
       , nvl(n.CUST_COEF, nom.CUST_COEF) as CUST_COEF
       , nvl(n.VBN, nom.VBN) as VBN
       , nvl(n.H_NAME, nom.H_NAME) as H_NAME
       , nvl(n.TNVED, nom.TNVED) as TNVED
       , nvl(n.HOL_TYPE, nom.HOL_TYPE) as HOL_TYPE
       , nvl(n.IS_PHOTO, nom.IS_PHOTO) as IS_PHOTO
       , nvl(n.PHOTO, nom.PHOTO) as PHOTO
       , nom.n_id as n_id_desc
       , d.INVOICE_DATA_ID
       , kov.checked
      FROM invoice_data_as_is a
        left outer join invoice_data d on d.INVOICE_DATA_AS_IS_ID = a.INVOICE_DATA_AS_IS_ID
        left outer join invoice_data_as_is_map map on map.invoice_data_as_is_id = a.invoice_data_as_is_id
        left outer join nomenclature_mat_view n on n.n_id = map.n_id
        left outer join nomenclature_mat_view nom on nom.notuse = 0 and upper(nom.H_CODE) = upper(a.short_code||'.'||a.hol_colour||'.'||nvl(a.spec_length,0)||'.'||a.nom_pack||'.'||a.SPEC_HEADS||'.'||a.SPEC_HEADS_SHRUB||'.'||a.SPEC_VD2||'.'||a.remarks)
        left outer join import_flowers_kov kov on kov.nom_code = nom.code and kov.checked = 0
--        left outer join hol_subtype_def_pack dp on upper(src.hol_sub_type) = upper(dp.HOL_SUBTYPE(+))
--        left outer join nomenclature_mat_view nom on nom.H_NAME = a.DESCRIPTION and nom.remarks = a.remarks --and ((n.remarks = a.REMARKS) or (n.remarks is null and a.REMARKS is null))
      where a.inv_id = p_inv_id
      ;

  EXCEPTION
  WHEN OTHERS THEN
       LOG_ERR(SQLERRM, SQLCODE, 'invoice_pkg.get_src', '');
       RAISE_APPLICATION_ERROR (-20247, '������ �� ����������. ' || SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace);

end get_src;


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
            , case when (select min(z.UNITS) from invoice_data z where z.inv_id = a.inv_id ) < 0 and a.is_minus = 0 then 1 else 0 end lowq
            , a.COUNTRY_GTD, a.S_ID_DEFAULT, a.C_ID_DEFAULT, a.AS_IS_POS
      FROM invoice_register_full a
        WHERE a.id_departments = id_dep_
              and a.sended_to_warehouse = 0
              and a.inv_minus in (0,3)
              and a.price_done = 0
              and a.id_office = const_office
                ORDER BY inv_date desc;

EXCEPTION
  WHEN others THEN
       LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'invoice_pkg.select_invoices', '');
       RAISE_APPLICATION_ERROR (-20248, '������ �� ����������. ' || SQLERRM||chr(10)||dbms_utility.format_error_backtrace);

end select_invoices;


END; -- invoice_pkg
-- End of DDL Script for Package Body CREATOR.BOOKS
/

-- Grants for Package Body
GRANT EXECUTE ON invoice_pkg TO new_role
/
GRANT EXECUTE ON invoice_pkg TO eva
/


-- End of DDL Script for Package Body CREATOR.INVOICE_PKG

