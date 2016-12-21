-- Start of DDL Script for Package Body CREATOR.PRICE_PKG
-- Generated 21-���-2016 16:53:53 from CREATOR@STAR2

CREATE OR REPLACE 
PACKAGE price_pkg
IS

CNT   NUMBER;
sql_str varchar2(2000);
TYPE ref_cursor is REF CURSOR; -- ���� ����� ����������� ��� ������


PROCEDURE CREATE_PPL_INDEX
(
   in_ppl_comment               IN       VARCHAR2,
   in_prime_coast_coeffitient   IN       FLOAT,
   in_profit_coeffitient        IN       FLOAT,
   in_exchange_rate             IN       FLOAT,
   in_use_cust_coef             IN       NUMBER,
   in_id_departments            IN       NUMBER,
   out_ppli_id                  OUT      NUMBER,
   out_success                  OUT      NUMBER,
   mess_                        OUT      varchar2
);


--  ������� �����
--
PROCEDURE del_price
(
   PPLI_ID_      IN       NUMBER,
   mess_         in oUT   varchar2
);


--
-- ��������� ��������� ������ � ��������������� ����� - ����.
--
PROCEDURE LOAD_INVOICE
(
  IN_INV_ID  IN NUMBER,
  IN_PPLI_ID IN NUMBER,
  IN_IPP_ID  in number
);


--
-- ��������� ���� � ��������������� ����� - ����.
--
PROCEDURE LOAD_STOCK (
  IN_PPLI_ID        IN NUMBER,
  IN_ID_DEPARTMENTS IN NUMBER,
  IN_FT             IN NUMBER,
  IN_FST            IN NUMBER,
  IN_ID_STORE_TYPE  IN NUMBER
);


--
-- ��������� ���� � ��������������� ����� - ����.
--
PROCEDURE LOAD_STOCK2 (
  IN_PPLI_ID        IN NUMBER,
  IN_ID_DEPARTMENTS IN NUMBER,
  IN_FT             IN varchar2,
  IN_FST            IN varchar2,
  IN_SUP            IN varchar2,
  IN_ID_STORE_TYPE  IN NUMBER
);


--
-- �������� ��������� �����-�����
--
PROCEDURE change_params (
  PPL_COMMENT_              IN varchar2,
  PRIME_COAST_COEFFICIENT_  IN NUMBER,
  PROFIT_COEFFITIENT_       IN NUMBER,
  EXCHANGE_RATE_            IN NUMBER,
  USE_CUST_COEF_            IN NUMBER,
  PPLI_ID_                  IN NUMBER
);


--
-- �������� �� ������� ������ ��� �� ���� � ��-�� ������.
--
FUNCTION  TEST_PRICE_INDEX
(
  IN_PPLI_ID IN NUMBER
)
RETURN NUMBER;

--
-- ������� ��������� �������������� ����, ���������� 1 ��� 0 � ����������� �� ����������
--
PROCEDURE  SAVE_PRICES
(
  IN_PPLI_ID IN NUMBER,
  OUT_RES    IN OUT VARCHAR2
);


--
-- ��������� ���� �� ������������
--
PROCEDURE SET_PRICE
(
  IN_N_ID       IN NUMBER,
  IN_PRICE      IN FLOAT,
  IN_best_price IN NUMBER,
  IN_spec_price IN NUMBER
);


--
-- �������� ���� � �����. � ����������� �����������
--
PROCEDURE UPDATE_PPL
(
  IN_PPLI_ID IN NUMBER
);



--
--  ����������
--
PROCEDURE get_stat
(
   ID_           IN       NUMBER,
   id_dep_       in       number,
   date1_        in       date,
   date2_        in       date,
   v_office      in       number,
   cursor_       in out   ref_cursor
);


--
--  ������� ������ �� ����-�����
--
PROCEDURE get_ppl
(
   PPLI_ID_      IN       NUMBER,
   cursor_       in out   ref_cursor
);


--
--  ���� ������� �����������
--
PROCEDURE get_price_stat
(
   id_dep_       IN       NUMBER,
   cursor_       in out   ref_cursor
);


--
--  ������� �����-����
--
PROCEDURE get_price
(
   ID_DEPT       IN       NUMBER,
   vid_          in       number,
   v_office_     in       number,
   cursor_       in out   ref_cursor
);


--
-- ����� ���-�� �������� �� ������
--
PROCEDURE COUNT_STICKERS;


--
-- ����� ���-�� �������� �� �������
--
PROCEDURE COUNT_INVOICE_STICKERS
(
  IN_INV_ID IN NUMBER
);


--
-- ������� ���������� ��������
--
PROCEDURE DELETE_STICKERS;


--
-- ����� ���-�� �������� �� ������
--
PROCEDURE set_STICKERS
(
  IN_N_ID IN NUMBER,
  param_  in number
);


--
-- �������������� � ������ ������
--
PROCEDURE PRINT_PREPARE_ADD
(
 IN_N_ID in NUMBER
);

--
-- �������������� � ������ ������
--
PROCEDURE PRINT_PREPARE_ADD2
(
 IN_N_ID in NUMBER,
 IN_INVOICE_DATA_ID in NUMBER,
 in_allow_print_all in number
);


--
-- �������������� ����������
--
PROCEDURE PRINT_PREPARE
(
 IN_N_ID       in NUMBER
 , IN_STICKERS in NUMBER
);


--
--  ������� ������ �������������� � ���� ��������
--
PROCEDURE get_not_loaded_inv
(
   ID_DEPT_      IN       NUMBER,
   cursor_       in out   ref_cursor
);


--
--  ������� ������ ���������������
--
PROCEDURE get_prices
(
   ID_DEPT_      IN       NUMBER,
   v_office      in       number,
   cursor_       in out   ref_cursor
);

--
--  ������� ������ ��������������� ����
--
PROCEDURE get_prices_all
(
   ID_DEPT_      IN       NUMBER,
   v_office      in       number,
   v_dBegin      in       date,
   v_dEnd        in       date,
   cursor_       in out   ref_cursor
);


--
--  ������� ������ ������������ � ���� ��������
--
PROCEDURE get_loaded_inv
(
   ID_DEPT_      IN       NUMBER,
   cursor_       in out   ref_cursor
);


--
--  ������� ������ ���������������
--
PROCEDURE get_nacenka
(
   ID_DEPT_      IN       NUMBER,
   v_office      in       number,
   cursor_       in out   ref_cursor
);


--
--  ������� ������ �����/��������
--
PROCEDURE get_fst_view
(
   ID_DEPT_      IN       NUMBER,
   cursor_       in out   ref_cursor
);


--
--  �������������� ���� � �����
--
PROCEDURE sync_ppli
(
   in_ppli_id      IN       NUMBER,
   use_sended      IN       NUMBER
);

--
-- �������� ��������� ������ � ��������������� ����� - ����.
--
PROCEDURE update_INVOICE
(
  IN_PPLI_ID IN NUMBER
);



--
--  �������������� ���� �� ������ �� � ������
--
PROCEDURE sync_price_list
(
   in_ppli_id   IN       NUMBER,
   v_code       IN       varchar2,
   v_price      IN       NUMBER,
   v_gtd        IN       varchar2
);


--
--  ������� ������ ���������� � ��������� � �������
--
PROCEDURE get_ppl_list
(
   v_PPLI_ID     IN       NUMBER,
   v_PPLI_ID_old IN       NUMBER,
   cursor_       in out   ref_cursor
);


--
--  ������� ������ �������� ���������� �������
--
PROCEDURE get_client_list
(
   v_PPLI_ID     IN       NUMBER,
   v_N_ID        in       number,
   cursor_       in out   ref_cursor
);


--
--  ��������/������ ���� ����
--
PROCEDURE set_special_price
(
   v_PPLI_ID     IN       NUMBER,
   v_N_ID        in       number,
   v_PPLCP_ID    in       number,
   v_SPEC_PRICE  in       number,
   v_QUANTITY    in       number,
   v_ID_CLIENTS  in       number
);


--
-- ��������� ������
--
PROCEDURE get_sales
(
    v_id_dep  in number,
    cursor_   out ref_cursor
);


--
-- ��������� ��������� ������ � ��������������� ����� - ����.
--
PROCEDURE insert_auto_discount
(
  IN_PPLI_ID  IN NUMBER
);


--
--  ��������� ����������� ��� �������� ������� ��� ����� ���������� ����
--
procedure set_ppli_old
(
   v_PPLI_ID     IN       NUMBER,
   v_PPLI_ID_old IN       NUMBER
);


--
--  ��������� �������� � ������
--
PROCEDURE clear_price_settings
(
   in_ppli_id      IN       NUMBER
);


--
--  ������������� ��� � ������� �����-������
--
procedure sync_with_curr_pricelist
(
   v_PPLI_ID     IN       NUMBER,
   v_PPLI_ID_old IN       NUMBER
);




--
-- ��������� ����.����������� �� ������
--
PROCEDURE get_spec_orders
(
    v_id_dep  in number,
    v_d_b     in date,
    v_d_e     in date,
    cursor_   out ref_cursor
);


--
-- ���������� ����.����������� �� ������
--
PROCEDURE add_spec_orders
(
    v_n_id    in number,
    v_d_b     in date,
    v_d_e     in date,
    v_price   in number,
    v_res     in out number
);


END;
/

-- Grants for Package
GRANT EXECUTE ON price_pkg TO new_role
/

CREATE OR REPLACE 
PACKAGE BODY price_pkg
IS

PROCEDURE CREATE_PPL_INDEX
(
   in_ppl_comment               IN       VARCHAR2,
   in_prime_coast_coeffitient   IN       FLOAT,
   in_profit_coeffitient        IN       FLOAT,
   in_exchange_rate             IN       FLOAT,
   in_use_cust_coef             IN       NUMBER,
   in_id_departments            IN       NUMBER,
   out_ppli_id                  OUT      NUMBER,
   out_success                  OUT      NUMBER,
   mess_                        OUT      varchar2
)
IS
   new_id   NUMBER (15);
BEGIN

   SELECT get_office_unique('ppli_id') INTO new_id FROM DUAL;
   out_ppli_id := new_id;

BEGIN
   INSERT INTO prepare_price_list_index
               (ppli_id, ppl_comment, ppl_date,
                prime_coast_coefficient, profit_coeffitient,
                exchange_rate, finished,use_cust_coef,
                id_departments, id_office)
        VALUES (new_id, in_ppl_comment, TRUNC (CURRENT_DATE),
                in_prime_coast_coeffitient, in_profit_coeffitient,
                in_exchange_rate, 0, in_use_cust_coef,
                in_id_departments, const_office);
   commit;
   out_success := 1;
EXCEPTION
   WHEN OTHERS
   THEN
      out_success := 0;
      mess_ := SQLERRM;
      LOG_ERR(SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.CREATE_PPL_INDEX', '');
END;
END;


--
--  ������� �����
--
PROCEDURE del_price
(
   PPLI_ID_      IN       NUMBER,
   mess_         in oUT   varchar2
)
IS
BEGIN

  DELETE FROM PREPARE_PRICE_LIST WHERE PPLI_ID = PPLI_ID_;
  DELETE FROM PREPARE_PRICE_LIST_INDEX WHERE PPLI_ID = PPLI_ID_;
  commit;
EXCEPTION
   WHEN OTHERS THEN
      mess_ := SQLERRM;
      LOG_ERR(SQLERRM || ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.CREATE_PPL_INDEX', '');
END;


--
-- ��������� ��������� ������ � ��������������� ����� - ����.
--
PROCEDURE LOAD_INVOICE
(
  IN_INV_ID  IN NUMBER,
  IN_PPLI_ID IN NUMBER,
  IN_IPP_ID  IN NUMBER
)
as

    cursor invo_cur(cur_inv_id NUMBER, cur_dep number) is
      select a.N_ID, a.INVOICE_DATA_ID, a.UNITS, a.PRICE_PER_UNIT, a.PRICE_PER_UNIT*a.UNITS as TOTAL_SUM, a.SENDED_TO_WAREHOUSE, a.quantity, a.ID_EMPLOYEES, a.spec_price
      from (
        select a.N_ID, a.INVOICE_DATA_ID, a.UNITS
          , case when s.sale is null then a.PRICE_PER_UNIT else a.PRICE_PER_UNIT - a.PRICE_PER_UNIT / 100 * s.sale end PRICE_PER_UNIT
          , a.TOTAL_SUM, a.SENDED_TO_WAREHOUSE, nvl(b.quantity,0) as quantity, a.to_client, s.ID_EMPLOYEES
          , case when to_number(to_char(sysdate, 'D')) < 5 then pl.spec_price else null end spec_price
        from  invoice_data a
            left outer join store_main b on nvl(b.id_office,const_office) = const_office and b.n_id = a.n_id and b.store_type=1
            left outer join tmp_inv_clients cl on cl.client =  a.to_client
            left outer join price_list pl on pl.n_id = a.n_id
            left outer join CLIENTS_SALES s on s.ID_DEPARTMENTS = cur_dep and s.SALE_STATUS = 1 and s.PERSENTS in (2,3) and s.ID_EMPLOYEES = cl.id_clients --distribution_pkg.convert_client( a.to_client )
        WHERE ( (a.INV_ID = cur_inv_id) or (IN_IPP_ID > 0 and a.INV_ID in (select inv_id from invoice_register c where c.ipp_id = IN_IPP_ID)) )
          AND a.STORNED_DATA = 0
      ) a
      ;
/*
        select a.N_ID, a.INVOICE_DATA_ID, a.UNITS, a.PRICE_PER_UNIT, a.TOTAL_SUM, a.SENDED_TO_WAREHOUSE, nvl(b.quantity,0) as quantity
        from  invoice_data a
            left outer join store_main b on nvl(b.id_office,const_office) = const_office and b.n_id = a.n_id and b.store_type=1
        WHERE ( (a.INV_ID = cur_inv_id) or (IN_IPP_ID > 0 and a.INV_ID in (select inv_id from invoice_register c where c.ipp_id = IN_IPP_ID)) )
            AND a.STORNED_DATA = 0
        ;
*/
    invo_row invo_cur%rowtype;

    cursor inv_cur is
       select rownum as nn, c.inv_id  from invoice_register c where c.ipp_id = IN_IPP_ID
       ;
    inv_row inv_cur%rowtype;

    NEXT_PPL_ID NUMBER;
    EXCH_RATE NUMBER;
    PCC NUMBER;
    PC NUMBER;
    UCC NUMBER;
    INT_OLD_PRICE FLOAT;
    OLD_PRICE_COUNT INTEGER;
    FIN_PR FLOAT;
    CC FLOAT;

    v_old_inv_id number;
    v_is_minus   number;
    v_ID_DEPARTMENTS number;
    vBestPrice       number;

begin
  delete from tmp_inv_clients;
  insert into tmp_inv_clients (
    select distribution_pkg.convert_client( to_client ), to_client from (
      select distinct to_client
      from invoice_data
      WHERE ( (INV_ID = IN_INV_ID) or (IN_IPP_ID > 0 and INV_ID in (select inv_id from invoice_register c where c.ipp_id = IN_IPP_ID)) )  AND STORNED_DATA = 0 and to_client is not null
    )
  );

   /* ������ ������ ������ ��� ��������� ������ ������� */
   delete from PREPARE_PRICE_LIST where ppli_id = IN_PPLI_ID;

   /* ��������, ���� ��������� ������ �� �������� ���������� ��������� */
   select a.inv_minus, a.minus_inv_id, ID_DEPARTMENTS into v_is_minus, v_old_inv_id, v_ID_DEPARTMENTS from INVOICE_REGISTER a where a.inv_id = IN_INV_ID;
   if v_is_minus = 3 then
      --select count(*) into cnt from PREPARE_PRICE_LIST_INDEX b where b.inv_id = v_old_inv_id;
      select count(1) into cnt
        from PREPARE_PRICE_LIST_INDEX p, invoice_register r
        where  v_old_inv_id = r.inv_id
          and ( r.inv_id in (p.inv_id, p.inv_id2, p.inv_id3, p.inv_id4) or r.ipp_id = p.pack_id );

      if cnt > 0 then
        UPDATE PREPARE_PRICE_LIST_INDEX a set (a.EXCHANGE_RATE,a.PROFIT_COEFFITIENT,a.PRIME_COAST_COEFFICIENT,a.USE_CUST_COEF, date_change) =
          (
            --select b.EXCHANGE_RATE,b.PROFIT_COEFFITIENT,b.PRIME_COAST_COEFFICIENT,b.USE_CUST_COEF, sysdate from PREPARE_PRICE_LIST_INDEX b where b.inv_id = v_old_inv_id
            select distinct p.EXCHANGE_RATE, p.PROFIT_COEFFITIENT, p.PRIME_COAST_COEFFICIENT, p.USE_CUST_COEF, sysdate
              from PREPARE_PRICE_LIST_INDEX p, invoice_register r
              where  v_old_inv_id = r.inv_id
                and ( r.inv_id in (p.inv_id, p.inv_id2, p.inv_id3, p.inv_id4) or r.ipp_id = p.pack_id )
          )
        where a.PPLI_ID = IN_PPLI_ID;
      end if;
   end if;
   /* */


    SELECT EXCHANGE_RATE,PROFIT_COEFFITIENT,PRIME_COAST_COEFFICIENT,USE_CUST_COEF INTO EXCH_RATE,PC,PCC,UCC FROM PREPARE_PRICE_LIST_INDEX WHERE PPLI_ID = IN_PPLI_ID;
    open invo_cur(IN_INV_ID, v_ID_DEPARTMENTS);
    LOOP
        FETCH invo_cur INTO invo_row;
        EXIT WHEN invo_cur%NOTFOUND;

        SELECT get_office_unique('PPL_ID') INTO NEXT_PPL_ID FROM DUAL;

        SELECT COUNT(*) INTO OLD_PRICE_COUNT FROM PRICE_LIST WHERE N_ID = invo_row.N_ID and id_office = const_office;
        IF OLD_PRICE_COUNT > 1 then
            LOG_ERR(' ����������� ��������� ��� �� ���� ����� N_ID=' || invo_row.N_ID, 0, 'LOAD_INVOICE', 'count='||OLD_PRICE_COUNT);
        end if;
        IF OLD_PRICE_COUNT > 0 then
            SELECT max(PRICE) INTO INT_OLD_PRICE FROM PRICE_LIST WHERE N_ID = invo_row.N_ID and id_office = const_office;
        else
            INT_OLD_PRICE := 0;
        end if;
        SELECT CUST_COEF INTO CC FROM NOMENCLATURE WHERE N_ID=invo_row.N_ID;
        IF UCC = 0
          THEN FIN_PR := round((EXCH_RATE*invo_row.PRICE_PER_UNIT*PCC*PC),2);
          ELSE FIN_PR := round((EXCH_RATE*invo_row.PRICE_PER_UNIT*PCC*PC*CC),2);
        END IF;
        if v_is_minus = 3 then
            begin
                select z.FINAL_PRICE into FIN_PR from PREPARE_PRICE_LIST z where z.ppli_id = v_old_inv_id and z.n_id = v_old_inv_id;
            exception when NO_DATA_FOUND then
                FIN_PR := INT_OLD_PRICE;
            end;
        end if;

        select count(*) into CNT from PREPARE_PRICE_LIST where PPLI_ID = IN_PPLI_ID and N_ID = invo_row.N_ID and HOL_PRICE = invo_row.PRICE_PER_UNIT;
        --select count(*) into vBestPrice from nomenclature n where n.n_id = invo_row.N_ID and n.remarks like '"!"';
        --select count(*) into CNT from PREPARE_PRICE_LIST a, invoice_data b where PPLI_ID = IN_PPLI_ID and a.N_ID = invo_row.N_ID and HOL_PRICE = invo_row.PRICE_PER_UNIT and a.invoice_data_id = b.invoice_data_id and b.to_client = invo_row.to_client;
        if CNT = 0 then
            INSERT INTO PREPARE_PRICE_LIST(
              PPLI_ID,
              PPL_ID,
              INVOICE_AMOUNT,
              N_ID,
              HOL_PRICE,
              RUBLE_PRICE,
              STOCK_AMOUNT,
              LEFT_AMOUNT,
              GIVEN_AMOUNT,
              PRICE_PCC,
              PRICE_PCC_PC,
              FINAL_PRICE,
              LAST_PRICE,
              INVOICE_DATA_ID,
              id_office,
              BEST_PRICE,
              SPEC_PRICE,
              PROFIT_COEFFITIENT
            )
            VALUES(
              IN_PPLI_ID,
              NEXT_PPL_ID,
              invo_row.UNITS,
              invo_row.N_ID,
              invo_row.PRICE_PER_UNIT,
              round((EXCH_RATE*invo_row.PRICE_PER_UNIT),2),
              invo_row.quantity,
              invo_row.UNITS,
              0,
              round((EXCH_RATE*invo_row.PRICE_PER_UNIT*PCC),2),
              round((EXCH_RATE*invo_row.PRICE_PER_UNIT*PCC*PC),2),
              FIN_PR,
              INT_OLD_PRICE,
              invo_row.INVOICE_DATA_ID,
              const_office,
              null, --decode(vBestPrice,0,null,vBestPrice),
              invo_row.spec_price,
              PC
            );
        else
--          select PPL_ID into CNT from PREPARE_PRICE_LIST a, invoice_data b  where PPLI_ID = IN_PPLI_ID and a.N_ID = invo_row.N_ID and HOL_PRICE = invo_row.PRICE_PER_UNIT and a.invoice_data_id = b.invoice_data_id and b.to_client = invo_row.to_client;
          select PPL_ID into CNT from PREPARE_PRICE_LIST a where PPLI_ID = IN_PPLI_ID and a.N_ID = invo_row.N_ID and HOL_PRICE = invo_row.PRICE_PER_UNIT;
          update PREPARE_PRICE_LIST set
            INVOICE_AMOUNT= INVOICE_AMOUNT+invo_row.UNITS,
            LEFT_AMOUNT = LEFT_AMOUNT+invo_row.UNITS
          where PPL_ID = CNT;
        end if;
    END LOOP;
    close invo_cur;

    if IN_IPP_ID = 0 then
        UPDATE prepare_price_list_index SET inv_id = IN_INV_ID, date_change=sysdate WHERE PPLI_ID = IN_PPLI_ID;
    else
        open inv_cur;
        LOOP
            FETCH inv_cur INTO inv_row;
            EXIT WHEN inv_cur%NOTFOUND;
            if (inv_row.nn = 1) then UPDATE prepare_price_list_index SET inv_id = inv_row.inv_id, date_change=sysdate WHERE PPLI_ID = IN_PPLI_ID; end if;
            if (inv_row.nn = 2) then UPDATE prepare_price_list_index SET inv_id2 = inv_row.inv_id, date_change=sysdate WHERE PPLI_ID = IN_PPLI_ID; end if;
            if (inv_row.nn = 3) then UPDATE prepare_price_list_index SET inv_id3 = inv_row.inv_id, date_change=sysdate WHERE PPLI_ID = IN_PPLI_ID; end if;
            if (inv_row.nn = 4) then UPDATE prepare_price_list_index SET inv_id4 = inv_row.inv_id, date_change=sysdate WHERE PPLI_ID = IN_PPLI_ID; end if;
        end loop;
        close inv_cur;
        update prepare_price_list_index SET PACK_ID = IN_IPP_ID, date_change=sysdate WHERE PPLI_ID = IN_PPLI_ID;
    end if;
    cnt := TEST_PRICE_INDEX(IN_PPLI_ID);
    commit;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.LOAD_INVOICE', '');
      RAISE_APPLICATION_ERROR (-20400, '������ �� ����������. ' || SQLERRM);

end LOAD_INVOICE;



--
-- ��������� ��������� ������ � ��������������� ����� - ����.
--
PROCEDURE insert_auto_discount
(
  IN_PPLI_ID  IN NUMBER
) as
    p_Order      number;
    v_ID_DEPARTMENTS number;
begin

  select count(d.id_orders), max(p.id_departments) into CNT, v_ID_DEPARTMENTS
    from distributions_invoices i, distributions_index d, PREPARE_PRICE_LIST_INDEX p, invoice_register r
    where i.dist_ind_id = d.dist_ind_id and p.ppli_id = IN_PPLI_ID
      and i.inv_id = r.inv_id
      and ( i.inv_id in (p.inv_id, p.inv_id2, p.inv_id3, p.inv_id4) or r.ipp_id = p.pack_id );
/*
  select count(d.id_orders) into CNT
    from distributions_invoices i, distributions_index d, PREPARE_PRICE_LIST_INDEX p
    where i.dist_ind_id = d.dist_ind_id and p.ppli_id = IN_PPLI_ID and (i.inv_id = p.inv_id or i.inv_id = p.inv_id2 or i.inv_id = p.inv_id3 or i.inv_id = p.inv_id4);
*/

  if CNT > 0 then
/*
    select d.id_orders, d.id_departments into p_Order, v_ID_DEPARTMENTS
      from distributions_invoices i, distributions_index d, PREPARE_PRICE_LIST_INDEX p
      where i.dist_ind_id = d.dist_ind_id and p.ppli_id = IN_PPLI_ID and (i.inv_id = p.inv_id or i.inv_id = p.inv_id2 or i.inv_id = p.inv_id3 or i.inv_id = p.inv_id4)
        and rownum = 1
    ;
*/
    insert into ppl_client_price
      select get_office_unique('seq_PPLCP_ID'), a.n_id, c.id_clients, sum(a.QUANTITY) as QUANTITY
        , max( (case when l.final_price > 0 then l.final_price else l.last_price end) - ((case when l.final_price > 0 then l.final_price else l.last_price end) / 100 * s.sale) ) as res
        , IN_PPLI_ID, null, a.INVOICE_DATA_ID
      from distributions a
        inner join invoice_data d on d.invoice_data_id = a.invoice_data_id
        inner join clients c on c.id_clients = distribution_pkg.convert_client( d.to_client )
        inner join CLIENTS_SALES s on s.ID_EMPLOYEES = c.id_clients and s.persents = 2 and s.ID_DEPARTMENTS = v_ID_DEPARTMENTS
        inner join PREPARE_PRICE_LIST l on l.ppli_id = IN_PPLI_ID and l.n_id = a.n_id
      where a.dist_ind_id in (
          select distinct d.dist_ind_id from distributions_invoices i, distributions_index d, PREPARE_PRICE_LIST_INDEX p, invoice_register r
            where i.dist_ind_id = d.dist_ind_id and p.ppli_id = IN_PPLI_ID and i.inv_id = r.inv_id
              and ( i.inv_id in (p.inv_id, p.inv_id2, p.inv_id3, p.inv_id4) or r.ipp_id = p.pack_id )
          )
         and a.quantity <> 0
      group by c.id_clients, a.n_id, a.INVOICE_DATA_ID
    ;
/* 2015-07-01 �� ������ ������� ���� ��� ����������� ��������.
    insert into ppl_client_price
      select get_office_unique('seq_PPLCP_ID'), a.n_id, b.id_clients, sum(a.QUANTITY) as QUANTITY
        , max( (case when l.final_price > 0 then l.final_price else l.last_price end) - ((case when l.final_price > 0 then l.final_price else l.last_price end) / 100 * s.sale) ) as res
        , IN_PPLI_ID, null
        , l.INVOICE_DATA_ID
        FROM orders_list a
          inner join orders_clients b on b.id_orders in
            (
              select distinct d.id_orders
                from distributions_invoices i, distributions_index d, PREPARE_PRICE_LIST_INDEX p
                where i.dist_ind_id = d.dist_ind_id and p.ppli_id = IN_PPLI_ID and (i.inv_id = p.inv_id or i.inv_id = p.inv_id2 or i.inv_id = p.inv_id3 or i.inv_id = p.inv_id4)
            )
            and b.id_orders_clients = a.id_orders_clients and b.active = 1
          inner join clients d on d.id_clients = b.id_clients
          inner join CLIENTS_SALES s on s.ID_EMPLOYEES = b.id_clients and s.persents = 2 and s.ID_DEPARTMENTS in
            (
              select distinct d.id_departments
                from distributions_invoices i, distributions_index d, PREPARE_PRICE_LIST_INDEX p
                where i.dist_ind_id = d.dist_ind_id and p.ppli_id = IN_PPLI_ID and (i.inv_id = p.inv_id or i.inv_id = p.inv_id2 or i.inv_id = p.inv_id3 or i.inv_id = p.inv_id4)
            )
            and s.SALE_STATUS = 1 and s.PERSENTS in (2,3)
          inner join PREPARE_PRICE_LIST l on l.ppli_id = IN_PPLI_ID and l.n_id = a.n_id
          inner join invoice_data inv on inv.INVOICE_DATA_ID = l.INVOICE_DATA_ID and distribution_pkg.convert_client( inv.to_client ) = d.id_clients
        WHERE a.active = 1
          and a.quantity <> 0
        group by b.id_clients, a.n_id, l.INVOICE_DATA_ID
    ;
*/
  else
    p_Order := 0;
    v_ID_DEPARTMENTS := 0;
  end if;


EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.insert_auto_discount', '');
      RAISE_APPLICATION_ERROR (-20400, '������ �� ����������. ' || SQLERRM);

end insert_auto_discount;


--
-- �������� ��������� ������ � ��������������� ����� - ����.
--
PROCEDURE update_INVOICE
(
  IN_PPLI_ID IN NUMBER
)
as
    EXCH_RATE NUMBER;
    PCC NUMBER;
    PC NUMBER;
    UCC NUMBER;

begin
  SELECT EXCHANGE_RATE,PROFIT_COEFFITIENT,PRIME_COAST_COEFFICIENT,USE_CUST_COEF
  INTO EXCH_RATE,PC,PCC,UCC
  FROM PREPARE_PRICE_LIST_INDEX WHERE PPLI_ID = IN_PPLI_ID;

/* 2015-11-28 �.�., ��������� ���� ������ ����������� ������� � �������
  delete from PREPARE_PRICE_LIST a
  where a.ppli_id = IN_PPLI_ID and a.invoice_data_id is not null
    and a.invoice_data_id not in (select b.invoice_data_id from invoice_data b where b.STORNED_DATA=0 and b.INV_ID in
      (
        select r.inv_id from prepare_price_list_index i, invoice_register r
        where i.ppli_id = a.ppli_id
          and (r.inv_id in (i.inv_id, i.inv_id2, i.inv_id3, i.inv_id4) or r.ipp_id = i.pack_id)
      )
    )
  ;
*/
/* 2015-12-15 �.�., ��������� ���� ����������� � ��������� ������� */
  delete from PREPARE_PRICE_LIST a
  where a.ppli_id = IN_PPLI_ID and a.invoice_data_id is not null
    and a.invoice_data_id in (select b.invoice_data_id from invoice_data b where b.STORNED_DATA=1 and b.INV_ID in
      (
        select r.inv_id from prepare_price_list_index i, invoice_register r
        where i.ppli_id = a.ppli_id
          and (r.inv_id in (i.inv_id, i.inv_id2, i.inv_id3, i.inv_id4) or r.ipp_id = i.pack_id)
      )
    )
  ;


  insert into PREPARE_PRICE_LIST a (PPLI_ID, PPL_ID, INVOICE_AMOUNT, N_ID, HOL_PRICE, RUBLE_PRICE, STOCK_AMOUNT, LEFT_AMOUNT, GIVEN_AMOUNT, PRICE_PCC, PRICE_PCC_PC, FINAL_PRICE, LAST_PRICE, INVOICE_DATA_ID, id_office, PROFIT_COEFFITIENT)
  (

    select IN_PPLI_ID, get_office_unique('PPL_ID'), a.UNITS, a.N_ID, a.PRICE_PER_UNIT, round((EXCH_RATE * a.PRICE_PER_UNIT),2)
        , nvl(b.quantity, 0), a.UNITS, 0, round((EXCH_RATE * a.PRICE_PER_UNIT * PCC),2)
        , round((EXCH_RATE * a.PRICE_PER_UNIT * PCC * PC),2)
        , case when e.CUST_COEF = 0 then round((EXCH_RATE*a.PRICE_PER_UNIT*PCC*PC),2) else round((EXCH_RATE*a.PRICE_PER_UNIT*PCC*PC*e.CUST_COEF),2) end
        , nvl(d.PRICE, 0), a.INVOICE_DATA_ID, const_office, PC
    from store_main b, PRICE_LIST d, NOMENCLATURE e, (
       select sum(a.UNITS) as UNITS, a.N_ID, a.PRICE_PER_UNIT, max(a.INVOICE_DATA_ID) as INVOICE_DATA_ID
        from invoice_data a
        where a.STORNED_DATA = 0
          and a.to_client is null  -- ������� ������� �� ������������, �.�. ���� � ������ ��� ������
          and a.INV_ID in
          (
            select r.inv_id from prepare_price_list_index i, invoice_register r
            where i.ppli_id = IN_PPLI_ID
              and (r.inv_id in (i.inv_id, i.inv_id2, i.inv_id3, i.inv_id4) or r.ipp_id = i.pack_id)
          )
          and not exists (
            select 1 from PREPARE_PRICE_LIST z where z.ppli_id = IN_PPLI_ID and ((z.invoice_data_id = a.invoice_data_id) or (z.n_id = a.n_id and z.hol_price = a.price_per_unit))
          )
        group by a.N_ID, a.PRICE_PER_UNIT
       ) a
     where a.n_id = b.n_id(+) and a.n_id = e.n_id and a.n_id = d.n_id(+)


/*
    select IN_PPLI_ID, get_office_unique('PPL_ID'), a.UNITS, a.N_ID, a.PRICE_PER_UNIT, round((EXCH_RATE * a.PRICE_PER_UNIT),2)
        , nvl(b.quantity, 0), a.UNITS, 0, round((EXCH_RATE * a.PRICE_PER_UNIT * PCC),2)
        , round((EXCH_RATE * a.PRICE_PER_UNIT * PCC * PC),2)
        , case when e.CUST_COEF = 0 then round((EXCH_RATE*a.PRICE_PER_UNIT*PCC*PC),2) else round((EXCH_RATE*a.PRICE_PER_UNIT*PCC*PC*e.CUST_COEF),2) end
        , nvl(d.PRICE, 0), a.INVOICE_DATA_ID, const_office
    from invoice_data a, store_main b, PREPARE_PRICE_LIST c, PRICE_LIST d, NOMENCLATURE e
    where a.STORNED_DATA=0 and a.INV_ID in
        (
            select inv_id from prepare_price_list_index c where c.ppli_id = IN_PPLI_ID
            union all
            select inv_id2 from prepare_price_list_index c where c.ppli_id = IN_PPLI_ID
            union all
            select inv_id3 from prepare_price_list_index c where c.ppli_id = IN_PPLI_ID
            union all
            select inv_id4 from prepare_price_list_index c where c.ppli_id = IN_PPLI_ID
        )
        and a.n_id = b.n_id(+) and a.n_id = e.n_id and a.n_id = d.n_id(+)
        and a.invoice_data_id = c.INVOICE_DATA_ID(+) and c.INVOICE_DATA_ID is null
*/
  );
  commit;

end;


--
-- ��������� ���� � ��������������� ����� - ����.
--
PROCEDURE LOAD_STOCK (
  IN_PPLI_ID        IN NUMBER,
  IN_ID_DEPARTMENTS IN NUMBER,
  IN_FT             IN NUMBER,
  IN_FST            IN NUMBER,
  IN_ID_STORE_TYPE  IN NUMBER
)
as
  cursor store_cur is
      select a.N_ID, a.QUANTITY, case when to_number(to_char(sysdate, 'D')) = 6 then null else l.spec_price end spec_price, case when to_number(to_char(sysdate, 'D')) = 6 then null else l.best_price end best_price
        from store_main a, NOMENCLATURE_MAT_VIEW b, price_list l
          WHERE a.QUANTITY > 0 and a.id_office = const_office AND a.N_ID = b.n_id
                and b.ID_DEPARTMENTS = IN_ID_DEPARTMENTS
                and (b.ft_id = IN_FT or IN_FT = 0)
                and (b.fst_id = IN_FST or IN_FST = 0)
                and a.store_type = IN_ID_STORE_TYPE
                and a.n_id not in (select p.n_id from PREPARE_PRICE_LIST p where PPLI_ID=IN_PPLI_ID )
                and b.ft_id not in (10000163,160)
                and a.n_id = l.n_id
                ;

    store_row store_cur%rowtype;
    NEXT_PPL_ID NUMBER;
    INT_OLD_PRICE FLOAT;
    OLD_PRICE_COUNT INTEGER;

begin
    open store_cur;
    LOOP
        FETCH store_cur INTO store_row;
        EXIT WHEN store_cur%NOTFOUND;

        SELECT get_office_unique('PPL_ID') INTO NEXT_PPL_ID FROM DUAL;

        SELECT COUNT(*) INTO OLD_PRICE_COUNT FROM PRICE_LIST WHERE N_ID = store_row.N_ID;
        IF OLD_PRICE_COUNT = 1 then
            SELECT PRICE INTO INT_OLD_PRICE FROM PRICE_LIST WHERE N_ID = store_row.N_ID;
        else
            INT_OLD_PRICE := 0;
        end if;
        INSERT INTO PREPARE_PRICE_LIST(
          PPLI_ID,
          PPL_ID,
          INVOICE_AMOUNT,
          N_ID,
          HOL_PRICE,
          RUBLE_PRICE,
          STOCK_AMOUNT,
          LEFT_AMOUNT,
          GIVEN_AMOUNT,
          PRICE_PCC,
          PRICE_PCC_PC,
          FINAL_PRICE,
          LAST_PRICE,
          id_office,
          spec_price,
          best_price)
        VALUES(
          IN_PPLI_ID,
          NEXT_PPL_ID,
          0,
          store_row.N_ID,
          0,
          0,
          store_row.QUANTITY,
          store_row.QUANTITY,
          0,
          0,
          0,
          INT_OLD_PRICE,
          INT_OLD_PRICE,
          const_office,
          store_row.spec_price,
          NULL);
    END LOOP;
    commit;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.LOAD_STOCK', '');
      RAISE_APPLICATION_ERROR (-20401, '������ �� ����������. ' || SQLERRM);

end LOAD_STOCK;



--
-- ��������� ���� � ��������������� ����� - ����.
--
PROCEDURE LOAD_STOCK2 (
  IN_PPLI_ID        IN NUMBER,
  IN_ID_DEPARTMENTS IN NUMBER,
  IN_FT             IN varchar2,
  IN_FST            IN varchar2,
  IN_SUP            IN varchar2,
  IN_ID_STORE_TYPE  IN NUMBER
)
as
  cursor store_cur is
      select a.N_ID, a.QUANTITY, case when to_number(to_char(sysdate, 'D')) = 6 then null else l.spec_price end spec_price, case when to_number(to_char(sysdate, 'D')) = 6 then null else l.best_price end best_price
        from store_main a, NOMENCLATURE_MAT_VIEW b, price_list l
          WHERE a.QUANTITY > 0 and a.id_office = const_office AND a.N_ID = b.n_id
                and b.ID_DEPARTMENTS = IN_ID_DEPARTMENTS
--                and (b.ft_id = IN_FT or IN_FT = 0)
--                and (b.fst_id = IN_FST or IN_FST = 0)
                and ( b.ft_id in ( select * from table(cast(get_list_elements(IN_FT) as number_list_type)) ) or IN_FT is null )
                and ( b.s_id in ( select * from table(cast(get_list_elements(IN_SUP) as number_list_type)) ) or IN_SUP is null )
                and a.store_type = IN_ID_STORE_TYPE
                and a.n_id not in (select p.n_id from PREPARE_PRICE_LIST p where PPLI_ID=IN_PPLI_ID )
                and b.ft_id not in (10000163,160)
                and a.n_id = l.n_id
                ;

    store_row store_cur%rowtype;
    NEXT_PPL_ID NUMBER;
    INT_OLD_PRICE FLOAT;
    OLD_PRICE_COUNT INTEGER;

begin
    open store_cur;
    LOOP
        FETCH store_cur INTO store_row;
        EXIT WHEN store_cur%NOTFOUND;

        SELECT get_office_unique('PPL_ID') INTO NEXT_PPL_ID FROM DUAL;

        SELECT COUNT(*) INTO OLD_PRICE_COUNT FROM PRICE_LIST WHERE N_ID = store_row.N_ID;
        IF OLD_PRICE_COUNT = 1 then
            SELECT PRICE INTO INT_OLD_PRICE FROM PRICE_LIST WHERE N_ID = store_row.N_ID;
        else
            INT_OLD_PRICE := 0;
        end if;
        INSERT INTO PREPARE_PRICE_LIST(
          PPLI_ID,
          PPL_ID,
          INVOICE_AMOUNT,
          N_ID,
          HOL_PRICE,
          RUBLE_PRICE,
          STOCK_AMOUNT,
          LEFT_AMOUNT,
          GIVEN_AMOUNT,
          PRICE_PCC,
          PRICE_PCC_PC,
          FINAL_PRICE,
          LAST_PRICE,
          id_office,
          spec_price,
          best_price)
        VALUES(
          IN_PPLI_ID,
          NEXT_PPL_ID,
          0,
          store_row.N_ID,
          0,
          0,
          store_row.QUANTITY,
          store_row.QUANTITY,
          0,
          0,
          0,
          INT_OLD_PRICE,
          INT_OLD_PRICE,
          const_office,
          store_row.spec_price,
          null);
    END LOOP;
    commit;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.LOAD_STOCK2', '');
      RAISE_APPLICATION_ERROR (-20401, '������ �� ����������. ' || SQLERRM);

end LOAD_STOCK2;



--
-- �������� ��������� �����-�����
--
PROCEDURE change_params (
  PPL_COMMENT_              IN varchar2,
  PRIME_COAST_COEFFICIENT_  IN NUMBER,
  PROFIT_COEFFITIENT_       IN NUMBER,
  EXCHANGE_RATE_            IN NUMBER,
  USE_CUST_COEF_            IN NUMBER,
  PPLI_ID_                  IN NUMBER
)
as
begin

  UPDATE PREPARE_PRICE_LIST_INDEX SET
    PPL_COMMENT = PPL_COMMENT_,
    PRIME_COAST_COEFFICIENT = PRIME_COAST_COEFFICIENT_,
    PROFIT_COEFFITIENT = PROFIT_COEFFITIENT_,
    EXCHANGE_RATE = EXCHANGE_RATE_,
    USE_CUST_COEF = USE_CUST_COEF_,
    date_change = sysdate
      WHERE PPLI_ID = PPLI_ID_;

  commit;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.change_params', '');
      RAISE_APPLICATION_ERROR (-20402, '������ �� ����������. ' || SQLERRM);

end change_params;



--
-- �������� �� ������� ������ ��� �� ���� � ��-�� ������.
--
FUNCTION  TEST_PRICE_INDEX
(
  IN_PPLI_ID IN NUMBER
)
RETURN NUMBER
AS
BEGIN

    SELECT COUNT (*) INTO CNT
    FROM
      PREPARE_PRICE_LIST PPL1,
      PREPARE_PRICE_LIST PPL2,
      invoice_data d1,
      invoice_data d2
    WHERE
      PPL1.PPLI_ID = IN_PPLI_ID AND
      PPL2.PPLI_ID = IN_PPLI_ID AND
      PPL1.N_ID = PPL2.N_ID AND
      ppl1.invoice_data_id = d1.invoice_data_id and ppl2.invoice_data_id = d2.invoice_data_id and
      --d1.to_client is null and d2.to_client is null and
      PPL1.FINAL_PRICE <> PPL2.FINAL_PRICE
      and not exists (select 1 from ppl_client_price ppl where d1.invoice_data_id = ppl.invoice_data_id )
      ;
    UPDATE PREPARE_PRICE_LIST SET COL = NULL WHERE PPLI_ID = IN_PPLI_ID;

    IF CNT = 0
    THEN
      RETURN 1;
    ELSE
      /*�������� ������� � ���. ���������� ������������, �� ������ ���� ������*/
      UPDATE PREPARE_PRICE_LIST PPL SET "COL" = 6871293
      WHERE
        PPLI_ID = IN_PPLI_ID AND
        N_ID IN (SELECT N_ID FROM PREPARE_PRICE_LIST
                  WHERE PPL_ID <> PPL.PPL_ID AND
                        FINAL_PRICE <> PPL.FINAL_PRICE AND
                        N_ID = PPL.N_ID AND
                        PPLI_ID = PPL.PPLI_ID)
        and not exists (select 1 from ppl_client_price d1 where d1.invoice_data_id = ppl.invoice_data_id )
        --and not exists (select 1 from invoice_data d1 where d1.invoice_data_id = ppl.invoice_data_id and d1.to_client is not null)
      ;
      COMMIT;
      RETURN 0;
    END IF;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.TEST_PRICE_INDEX', '');
      RAISE_APPLICATION_ERROR (-20403, '������ �� ����������. ' || SQLERRM);

END TEST_PRICE_INDEX;




--
-- ������� ��������� �������������� ����, ���������� 1 ��� 0 � ����������� �� ����������
--
PROCEDURE  SAVE_PRICES
(
  IN_PPLI_ID IN NUMBER,
  OUT_RES    IN OUT VARCHAR2
)
IS
    cursor prices (CUR_ppli_id NUMBER) is
    SELECT N_ID, FINAL_PRICE, best_price, spec_price FROM PREPARE_PRICE_LIST WHERE PPLI_ID = CUR_ppli_id;

    prices_row prices%rowtype;
begin

    IF TEST_PRICE_INDEX(IN_PPLI_ID) = 0 THEN
      OUT_RES := '� �����-����� ���� ������ ���� �� ���������� �������! ������ ��� ����������!';
    else
      open prices(IN_PPLI_ID);
      LOOP
          FETCH prices INTO prices_row;
          EXIT WHEN prices%NOTFOUND;
          SET_PRICE(prices_row.N_ID, prices_row.FINAL_PRICE, prices_row.best_price, prices_row.spec_price);
      END LOOP;

      UPDATE PREPARE_PRICE_LIST_INDEX
        SET FINISHED = 1, date_change = sysdate
          WHERE PPLI_ID = IN_PPLI_ID;

      COMMIT;
      OUT_RES := '�������� ������ �������!';
    END IF;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.SAVE_PRICES', '');
      RAISE_APPLICATION_ERROR (-20404, '������ �� ����������. ' || SQLERRM);

end SAVE_PRICES;



--
-- ��������� ���� �� ������������
--
PROCEDURE SET_PRICE
(
  IN_N_ID       IN NUMBER,
  IN_PRICE      IN FLOAT,
  IN_best_price IN NUMBER,
  IN_spec_price IN NUMBER
)
as
  quantity_st       number;
    last_price_st       number;
    store_type_st     number;
    SP_OTDEL                number;
    SP_OPERATOR_NAME varchar2(50);
begin

    INSERT INTO PRICE_LIST_ALL(N_ID, PRICE, PRICE_DATE, id_office, best_price, spec_price) VALUES (IN_N_ID, ROUND(IN_PRICE,2), SYSDATE, const_office, IN_best_price, IN_spec_price);

end SET_PRICE;



--
-- �������� ���� � �����. � ����������� �����������
--
PROCEDURE UPDATE_PPL
(
  IN_PPLI_ID IN NUMBER
)
as
  PCC FLOAT;
  PC  FLOAT;
  ER  FLOAT;
  UCC NUMBER;
begin

  SELECT PRIME_COAST_COEFFICIENT,PROFIT_COEFFITIENT,EXCHANGE_RATE,USE_CUST_COEF
    INTO PCC,PC,ER,UCC
    FROM PREPARE_PRICE_LIST_INDEX
    WHERE PPLI_ID = IN_PPLI_ID;

  IF UCC = 1 THEN
    UPDATE PREPARE_PRICE_LIST
      SET
        RUBLE_PRICE = round(HOL_PRICE*ER,2),
        PRICE_PCC = round(HOL_PRICE*ER*PCC,2),
        PRICE_PCC_PC = round(HOL_PRICE*ER*PCC*PC,2),
        FINAL_PRICE = round(HOL_PRICE*ER*PCC*PC*(SELECT CUST_COEF FROM NOMENCLATURE WHERE N_ID=PREPARE_PRICE_LIST.N_ID),2),
        date_change = sysdate
      WHERE
          (PPLI_ID = IN_PPLI_ID)
      AND (INVOICE_AMOUNT > 0);
  ELSE
    UPDATE PREPARE_PRICE_LIST
      SET
        RUBLE_PRICE = round(HOL_PRICE*ER,2),
        PRICE_PCC = round(HOL_PRICE*ER*PCC,2),
        PRICE_PCC_PC = round(HOL_PRICE*ER*PCC*PC,2),
        FINAL_PRICE = round(HOL_PRICE*ER*PCC*PC,2),
        date_change = sysdate
      WHERE
          (PPLI_ID = IN_PPLI_ID)
      AND (INVOICE_AMOUNT > 0);
  END IF;
  commit;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.UPDATE_PPL', '');
      RAISE_APPLICATION_ERROR (-20405, '������ �� ����������. ' || SQLERRM);

end UPDATE_PPL;


--
--  ����������
--
PROCEDURE get_stat
(
   ID_           IN       NUMBER,
   id_dep_       in       number,
   date1_        in       date,
   date2_        in       date,
   v_office      in       number,
   cursor_       in out   ref_cursor
)
IS
BEGIN

  open cursor_ for
    select a.*, inv_profit + reprice_profit as PROFIT from (
    select
    -- ��������
    (
    SELECT sum(a.price_all)
        FROM store_doc_view2 a
          where a.id_departments = id_dep_ and id_office = v_office
                and trunc(a.doc_date) between date1_ and date2_
                and a.ID_DOC_TYPE = 2
    ) spis_sim,
    -- ������
    (
    SELECT sum(a.price_all)
        FROM store_doc_view2 a
          where a.id_departments = id_dep_ and id_office = v_office
                and trunc(a.doc_date) between date1_ and date2_
                and a.ID_DOC_TYPE = 3
    ) uc_sum

    ,(
        SELECT sum( stok_total_profit) from ( select distinct n_id, stok_total_profit FROM ppl_view  WHERE PPLI_ID = ID_ )
    ) reprice_profit

    ,(
        select mpc || ' / ' || round(pc,3) as profit_coef from (
          select max(main_profit_coef) as mpc, avg(a.PROFIT_COEFFITIENT) as pc
          FROM ppl_view a
          WHERE a.PPLI_ID = ID_ and a.invoice_data_id is not null
        ) a
    ) profit_coef

    , b.*
    from
    (
/*
      SELECT SUM(hol_sum) HOL_PAY, SUM(RUBLE_SUM) RUB_SUM
        , SUM(inv_total_sum) total_sum
        --, SUM(total_profit) PROFIT
        , sum(pcc_sum) pcc_sum
        --, sum(stok_total_profit) as reprice_profit
        , sum(inv_total_profit) as inv_profit
        FROM PPL_VIEW WHERE PPLI_ID = ID_
*/

      select sum(HOL_PAY) as HOL_PAY, sum(RUB_SUM) as RUB_SUM, sum(total_sum) as total_sum, sum(pcc_sum) as pcc_sum, sum(inv_profit) as inv_profit
      from (
        SELECT
          hol_price * (invoice_amount - nvl(c.total_client_quantity,0)) as HOL_PAY
          , ruble_price * (invoice_amount - nvl(c.total_client_quantity,0)) as RUB_SUM
          , final_price * (invoice_amount - nvl(c.total_client_quantity,0)) as total_sum
          , price_pcc * (invoice_amount - nvl(c.total_client_quantity,0)) as pcc_sum
          , (final_price - price_pcc * curr_cust_coef) * (invoice_amount - nvl(c.total_client_quantity,0)) as inv_profit
        FROM ppl_view a
        left outer join (select b.n_id, sum(b.quantity) as total_client_quantity from ppl_client_price b where b.PPLI_ID = ID_ group by b.n_id) c on c.n_id = a.n_id
          WHERE a.PPLI_ID = ID_

        union all

        SELECT
          (hol_price * b.quantity) as HOL_PAY
          , (ruble_price * b.quantity) as RUB_SUM
          , (b.spec_price * b.quantity) as total_sum
          , (price_pcc * b.quantity) as pcc_sum
          , (b.spec_price - price_pcc * curr_cust_coef) * b.quantity as inv_profit
        FROM ppl_view a
        inner join ppl_client_price b on b.PPLI_ID = a.PPLI_ID and b.n_id = a.n_id
          WHERE a.PPLI_ID = ID_
      ) z

    ) b ) a;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.UPDATE_PPL', '');
      RAISE_APPLICATION_ERROR (-20406, '������ �� ����������. ' || SQLERRM);

end get_stat;



--
--  ������� ������ �� ����-�����
--
PROCEDURE get_ppl
(
   PPLI_ID_      IN       NUMBER,
   cursor_       in out   ref_cursor
)
IS
BEGIN

  open cursor_ for
SELECT ppli_id, ppl_id, coming_date, invoice_amount, stock_amount
       , left_amount, given_amount, hol_price, ruble_price, last_price
       , price_pcc, price_pcc_pc, n_id, final_price
       , compiled_name_otdel as compiled_name
       , total_sum, total_profit, cust_coef, h_code, nvl(COL,0) as col
  FROM ppl_view
  WHERE
    PPLI_ID = PPLI_ID_;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.get_ppl', '');
      RAISE_APPLICATION_ERROR (-20407, '������ �� ����������. ' || SQLERRM);

end get_ppl;




--
--  ���� ������� �����������
--
PROCEDURE get_price_stat
(
   id_dep_       IN       NUMBER,
   cursor_       in out   ref_cursor
)
IS
BEGIN

  open cursor_ for
    select a.inv_id, a.inv_date, a.comments, a.inv_sum, a.ipp_id, a.ipp_comment, a.id_departments, a.dept_name, a.inv_minus, a.minus_inv_id, a.is_minus, a.id_office, a.brief
    from invoice_register_full a
    where a.inv_id in (
        select a.inv_id
        from invoice_register a where a.ID_DEPARTMENTS = id_dep_ and a.inv_minus in (0,3) and id_office = const_office
        minus
        select b.inv_id from prepare_price_list_index b where b.ID_DEPARTMENTS = id_dep_ and id_office = const_office
      )
      and (select count(*) from INVOICE_DATA_AS_IS b where b.inv_id = a.inv_id) = 0
    ORDER BY a.inv_date desc;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.get_price_stat', '');
      RAISE_APPLICATION_ERROR (-20408, '������ �� ����������. ' || SQLERRM);

end get_price_stat;




--
--  ������� �����-����
--
PROCEDURE get_price
(
   ID_DEPT       IN       NUMBER,
   vid_          in       number,
   v_office_     in       number,
   cursor_       in out   ref_cursor
)
IS
BEGIN
  if vid_ = 1 then
    open cursor_ for
      select 0 as d_checked, N_ID, PRICE, trunc(PRICE_DATE) as PRICE_DATE, COMPILED_NAME, FT_ID, F_TYPE, FST_ID, F_SUB_TYPE,
           LEN, S_ID, S_NAME_RU, COL_ID, COLOUR, to_char(CODE) as code, to_char(nvl(BAR_CODE,code)) as bar_code, C_ID,COUNTRY, ID_DEPARTMENTS,
           DEPT, FN_ID, F_NAME_RU, QUANTITY, PACK, H_CODE, STICKERS, great_name, GREAT_NAME_F, IS_PHOTO, PHOTO, compiled_name_pot
           , spec_price, best_price
           , case when IS_PHOTO=1 then const_picture_path||ID_DEPT||'/tm/'||PHOTO else '' end pics
           , case when id_departments=62 then
             case when hol_type = 'RO' then 1 else
             case when hol_type = 'EC' then 2 else
             case when hol_type = 'CH' then 3 else
             case when hol_type = 'GR' then 4 else
             case when hol_type = 'CA' then 5 else
             case when hol_type = 'LI' then 6 else
             case when hol_type = 'OT' then 7 else
             case when hol_type = 'none' then 8 else null
             end end end end end end end end
           else 0 end ord
           , id_office, brief
      from PRICE_LIST_VIEW
        WHERE ID_DEPARTMENTS = ID_DEPT and id_office = v_office_
          ORDER BY F_TYPE, F_SUB_TYPE, H_CODE;
  else
    open cursor_ for
      select 0 as d_checked, N_ID, PRICE, trunc(PRICE_DATE) as PRICE_DATE, COMPILED_NAME, FT_ID, F_TYPE, FST_ID, F_SUB_TYPE,
           LEN, S_ID, S_NAME_RU, COL_ID, COLOUR, to_char(CODE) as code, to_char(nvl(BAR_CODE,code)) as bar_code, C_ID,COUNTRY, ID_DEPARTMENTS,
           DEPT, FN_ID, F_NAME_RU, QUANTITY, PACK, H_CODE, STICKERS, great_name, GREAT_NAME_F, IS_PHOTO, PHOTO,  compiled_name_pot
           , spec_price, best_price
           , case when IS_PHOTO=1 then const_picture_path||ID_DEPT||'/tm/'||PHOTO else '' end pics
           , case when id_departments=62 then
             case when hol_type = 'RO' then 1 else
             case when hol_type = 'EC' then 2 else
             case when hol_type = 'CH' then 3 else
             case when hol_type = 'GR' then 4 else
             case when hol_type = 'CA' then 5 else
             case when hol_type = 'LI' then 6 else
             case when hol_type = 'OT' then 7 else
             case when hol_type = 'none' then 8 else null
             end end end end end end end end
           else 0 end ord
           , id_office, brief
      from PRICE_LIST_VIEW
        WHERE ID_DEPARTMENTS = ID_DEPT and id_office = v_office_
          ORDER BY ord, F_TYPE, F_SUB_TYPE, compiled_name_pot;
  end if;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.get_price', '');
      RAISE_APPLICATION_ERROR (-20409, '������ �� ����������. ' || SQLERRM);

end get_price;


--
-- ����� ���-�� �������� �� ������
--
PROCEDURE COUNT_STICKERS
IS
BEGIN
  DELETE FROM STICKERS_TO_PRINT;
  INSERT INTO STICKERS_TO_PRINT (
    SELECT distinct N_ID, TRUNC(NVL(QUANTITY,0)/(CASE WHEN PACK IS NULL THEN 1 WHEN PACK = 0 THEN 1 ELSE PACK END)) STICKERS, null
    FROM PRICE_LIST_VIEW where id_office = const_office
  );
  commit;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.COUNT_STICKERS', '');
      RAISE_APPLICATION_ERROR (-20410, '������ �� ����������. ' || SQLERRM);

END COUNT_STICKERS;


--
-- ����� ���-�� �������� �� �������
--
PROCEDURE COUNT_INVOICE_STICKERS
(
  IN_INV_ID IN NUMBER
)
IS
BEGIN
  DELETE FROM STICKERS_TO_PRINT;
  INSERT INTO STICKERS_TO_PRINT
    (SELECT N_ID, TRUNC(NVL(SUM(UNITS),0)/(CASE WHEN PACK IS NULL THEN 1 WHEN PACK = 0 THEN 1 ELSE PACK END)) STICKERS, null
     FROM INVOICE_DATA_FULL
     WHERE INV_ID = IN_INV_ID
     GROUP BY N_ID,PACK);
  INSERT INTO STICKERS_TO_PRINT (
    SELECT distinct N_ID, 0 STICKERS, null FROM PRICE_LIST_VIEW a WHERE id_office = const_office and NOT exists (SELECT 1 FROM STICKERS_TO_PRINT b where a.n_id = b.n_id) --and id_office=const_office
  );
  commit;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.COUNT_INVOICE_STICKERS', '');
      RAISE_APPLICATION_ERROR (-20411, '������ �� ����������. ' || SQLERRM);

END COUNT_INVOICE_STICKERS;


--
-- ������� ���������� ��������
--
PROCEDURE DELETE_STICKERS
IS
BEGIN
  DELETE FROM STICKERS_TO_PRINT;
  commit;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.DELETE_STICKERS', '');
      RAISE_APPLICATION_ERROR (-20412, '������ �� ����������. ' || SQLERRM);

END DELETE_STICKERS;




--
-- ����� ���-�� �������� �� ������
--
PROCEDURE set_STICKERS
(
  IN_N_ID IN NUMBER,
  param_  in number
)
IS
BEGIN
--   UPDATE STICKERS_TO_PRINT SET d_checked = param_ where n_id = in_n_id;
NULL;
EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.set_STICKERS', '');
      RAISE_APPLICATION_ERROR (-20413, '������ �� ����������. ' || SQLERRM);

END set_STICKERS;


--
-- �������������� � ������ ������
--
PROCEDURE PRINT_PREPARE_ADD
(
 IN_N_ID in NUMBER
)
AS
  ST_TO_P NUMBER;
  CNT     NUMBER;
  CURSOR sel_pp_cur (C_N_ID NUMBER) is
    SELECT  NOM.N_ID N_ID, COMPILED_NAME TITLE, PRICE, CODE, nom.H_CODE,
      DECODE(nom.colour,'   ',NULL,' ',NULL,NULL,NULL, '��. ' || nom.colour) colour,
      nom.f_name_ru, nom.country, nom.rus_marks, BAR_CODE,

      --� ������ � � ������� ��� ���������� �������� ������ ������������ ������ �-��� ����� ���������.
      --���������: ������ + ������ = ��� �-���, ���������� - ��� ������� - �-��� ����������, ���� ��� ��� - ��� �-���
      --nvl(nom.BAR_CODE,nom.CODE) as PRINT_CODE,
      case when ID_DEPARTMENTS = 121 then nvl(nom.BAR_CODE,to_char(nom.CODE)) else to_char(nom.CODE) end PRINT_CODE,

      PL.PRICE * DECODE(nom.PACK,NULL,1,0,1,PACK) PACK_PRICE
      , decode(nom.PACK,null,1,0,1,nom.PACK) as PACK
      --, nom.compiled_name_otdel
    FROM
      nomenclature_mat_view NOM,
      PRICE_LIST PL
    WHERE NOM.N_ID = C_N_ID
          and nom.NOPRINT <> 1
          AND NOM.N_ID = PL.N_ID(+);

  sel_pp_row sel_pp_cur%rowtype;

begin
  sql_str := '';
  SELECT COUNT(*) INTO CNT FROM STICKERS_TO_PRINT WHERE N_ID = IN_N_ID;

  IF CNT = 0 THEN GOTO LAST_STEP; END IF;

  SELECT STICKERS INTO ST_TO_P FROM STICKERS_TO_PRINT WHERE N_ID = IN_N_ID;

  OPEN sel_pp_cur(IN_N_ID);
    FETCH sel_pp_cur INTO sel_pp_row;

    CNT := 0;
    LOOP
      EXIT WHEN CNT = ST_TO_P;

        if sel_pp_row.N_ID is not null then
          sql_str := 'INSERT INTO PREPARE_PRINT (N_ID,TITLE,PRICE,CODE,H_CODE,COLOUR,F_NAME_RU,COUNTRY,RUS_MARKS,BAR_CODE,PRINT_CODE,PACK_PRICE,PACKQ)
          VALUES('||sel_pp_row.N_ID||','||sel_pp_row.TITLE||','||sel_pp_row.PRICE||','||sel_pp_row.CODE||','||sel_pp_row.H_CODE||','||sel_pp_row.COLOUR||','||sel_pp_row.F_NAME_RU||','||sel_pp_row.COUNTRY||','||sel_pp_row.RUS_MARKS||','||sel_pp_row.BAR_CODE||','||sel_pp_row.PRINT_CODE||','||sel_pp_row.PACK_PRICE||','||sel_pp_row.PACK||')';
          INSERT INTO PREPARE_PRINT
            (N_ID, TITLE, PRICE, CODE, H_CODE, COLOUR, F_NAME_RU, COUNTRY, RUS_MARKS, BAR_CODE, PRINT_CODE, PACK_PRICE, PACKQ)
          VALUES (
            sel_pp_row.N_ID,
            sel_pp_row.TITLE,
            sel_pp_row.PRICE,
            sel_pp_row.CODE,
            sel_pp_row.H_CODE,
            sel_pp_row.COLOUR,
            sel_pp_row.F_NAME_RU,
            sel_pp_row.COUNTRY,
            sel_pp_row.RUS_MARKS,
            sel_pp_row.BAR_CODE,
            sel_pp_row.PRINT_CODE,
            sel_pp_row.PACK_PRICE,
            sel_pp_row.PACK
          );
        end if;
        CNT := CNT + 1;

      END LOOP;

  CLOSE sel_pp_cur;

  <<LAST_STEP>>
  NULL;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.PRINT_PREPARE_ADD', sql_str);
      RAISE_APPLICATION_ERROR (-20414, '������ �� ����������. ' || SQLERRM);

end PRINT_PREPARE_ADD;




--
-- �������������� � ������ ������
--
PROCEDURE PRINT_PREPARE_ADD2
(
 IN_N_ID in NUMBER,
 IN_INVOICE_DATA_ID in NUMBER,
 in_allow_print_all in number
)
AS
  ST_TO_P NUMBER;
  CNT     NUMBER;

begin
  SELECT COUNT(*) INTO CNT FROM STICKERS_TO_PRINT WHERE N_ID = IN_N_ID and INVOICE_DATA = IN_INVOICE_DATA_ID;
  IF CNT = 0 THEN GOTO LAST_STEP; END IF;
  SELECT STICKERS INTO ST_TO_P FROM STICKERS_TO_PRINT WHERE N_ID = IN_N_ID and INVOICE_DATA = IN_INVOICE_DATA_ID;


  INSERT INTO PREPARE_PRINT
  (N_ID, TITLE, PRICE, CODE, H_CODE, COLOUR, F_NAME_RU, COUNTRY, RUS_MARKS, BAR_CODE, PRINT_CODE, PACK_PRICE, INVOICE_ID, PACKQ)
  (
    SELECT
      NOM.N_ID N_ID,
      COMPILED_NAME TITLE,
      PRICE,
      CODE,
      nom.H_CODE,
      DECODE(nom.colour,'   ',NULL,' ',NULL,NULL,NULL, '��. ' || nom.colour) colour,
--      nom.COMPILED_NAME_OTDEL,
      nom.f_name_ru,
      nom.country,
      nom.rus_marks,
      BAR_CODE,
--      DECODE(nom.BAR_CODE,NULL,nom.CODE,nom.BAR_CODE) PRINT_CODE,

      --� ������ � � ������� ��� ���������� �������� ������ ������������ ������ �-��� ����� ���������.
      --���������: ������ + ������ = ��� �-���, ���������� - ��� ������� - �-��� ����������, ���� ��� ��� - ��� �-���
      --case when nom.id_departments = 62 then DECODE(nom.BAR_CODE,NULL,nom.CODE,nom.BAR_CODE) else nom.CODE end PRINT_CODE,
      case when ID_DEPARTMENTS = 121 then nvl(nom.BAR_CODE,to_char(nom.CODE)) else to_char(nom.CODE) end PRINT_CODE,

      PL.PRICE * DECODE(nom.PACK,NULL,1,0,1,PACK) PACK_PRICE
      , IN_INVOICE_DATA_ID
      , decode(nom.PACK,null,1,0,1,nom.PACK) as PACK
    FROM
      nomenclature_mat_view NOM,
      PRICE_LIST PL,
      (select level-1 as lv from dual connect by level <= ST_TO_P ) d
    WHERE NOM.N_ID = IN_N_ID
          AND NOM.N_ID = PL.N_ID(+)
          and (
            nom.NOPRINT <> 1 or in_allow_print_all = 1
          )
  );


  <<LAST_STEP>>
  NULL;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.PRINT_PREPARE_ADD2', '');
      RAISE_APPLICATION_ERROR (-20414, '������ �� ����������. ' || SQLERRM);

end PRINT_PREPARE_ADD2;



--
-- �������������� ����������
--
PROCEDURE PRINT_PREPARE
(
 IN_N_ID       in NUMBER
 , IN_STICKERS in NUMBER
)
AS
begin
  delete from STICKERS_TO_PRINT where n_id = IN_N_ID;
  if IN_STICKERS > 0 then
    insert into STICKERS_TO_PRINT values (IN_N_ID, IN_STICKERS, null);
  end if;
  commit;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.PRINT_PREPARE', '');
      RAISE_APPLICATION_ERROR (-20415, '������ �� ����������. ' || SQLERRM);

end;




--
--  ������� ������ �������������� � ���� ��������
--
PROCEDURE get_not_loaded_inv
(
   ID_DEPT_      IN       NUMBER,
   cursor_       in out   ref_cursor
)
IS
BEGIN

  open cursor_ for
    select a.inv_id, a.inv_date, a.comments, a.inv_sum, a.ipp_id, a.ipp_comment, a.total_sum
            , a.id_departments, a.dept_name, a.inv_minus, a.minus_inv_id, a.is_minus, a.s_name_ru
            , a.past_num
    from invoice_register_full a
    where a.SENDED_TO_WAREHOUSE = 0 and a.ID_DEPARTMENTS = ID_DEPT_ and a.inv_minus in (0,3) and id_office = const_office
      and a.inv_date > sysdate-60
/*
      inner join (
        select a.inv_id from invoice_register a where a.ID_DEPARTMENTS = ID_DEPT_ and a.inv_minus in (0,3) and id_office = const_office
        minus
        select b.inv_id from prepare_price_list_index b where b.ID_DEPARTMENTS = ID_DEPT_  and id_office = const_office
      ) b on b.inv_id = a.inv_id
*/
    ORDER BY a.inv_date desc;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.get_not_loaded_inv', '');
      RAISE_APPLICATION_ERROR (-20416, '������ �� ����������. ' || SQLERRM);

end get_not_loaded_inv;



--
--  ������� ������ ������������ � ���� ��������
--
PROCEDURE get_loaded_inv
(
   ID_DEPT_      IN       NUMBER,
   cursor_       in out   ref_cursor
)
IS
BEGIN

  open cursor_ for
    select a.inv_id, a.inv_date, a.comments, a.inv_sum, a.ipp_id, a.ipp_comment, a.total_sum
            , a.id_departments, a.dept_name, a.inv_minus, a.minus_inv_id, a.is_minus, a.s_name_ru
    from invoice_register_full a
        WHERE a.id_departments = ID_DEPT_  and id_office = const_office
              and a.inv_minus in (0,3)
              and a.price_done = 1
                ORDER BY inv_date desc;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.get_not_loaded_inv', '');
      RAISE_APPLICATION_ERROR (-20416, '������ �� ����������. ' || SQLERRM);

end get_loaded_inv;


--
--  ������� ������ ���������������
--
PROCEDURE get_prices
(
   ID_DEPT_      IN       NUMBER,
   v_office      in       number,
   cursor_       in out   ref_cursor
)
IS
BEGIN

  open cursor_ for
    select /*+ FIRST_ROWS */
        a.PPLI_ID, a.PPL_COMMENT, a.PPL_DATE, a.PRIME_COAST_COEFFICIENT, a.PROFIT_COEFFITIENT, a.EXCHANGE_RATE,
        a.FINISHED, a.USE_CUST_COEF, a.ID_DEPARTMENTS,
        a.inv_id, a.inv_id2, a.inv_id3, a.inv_id4, a.PACK_ID
        , case when a.pack_id is null then a.inv_id || decode(a.inv_id2,null,'',', '||a.inv_id2) || decode(a.inv_id3,null,'',', '||a.inv_id3) || decode(a.inv_id4,null,'',', '||a.inv_id4)
        else (select WM_CONCAT( z.inv_id) from invoice_register z where z.ipp_id = a.pack_id ) end all_inv
        , b.INV_DATE, b.SENDED_TO_WAREHOUSE, case when b.minus_inv_id is null or b.minus_inv_id = 0 then 0 else 1 end is_minus, b.comments
        , c.S_NAME_RU
        , a.ppli_id_old
        , round((select  avg(z.PROFIT_COEFFITIENT) as pc FROM prepare_price_list z
          WHERE z.PPLI_ID = a.PPLI_ID and z.invoice_data_id is not null
        ),4) as pc
    from PREPARE_PRICE_LIST_INDEX a, INVOICE_REGISTER b, suppliers c
    where  a.ID_DEPARTMENTS = ID_DEPT_ and a.id_office = v_office
        and a.inv_id = b.inv_id(+)
        and a.PPL_DATE > sysdate - 120
        and b.S_ID_DEFAULT = c.s_id(+)
    ORDER BY a.FINISHED, a.PPL_DATE DESC;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.get_prices', '');
      RAISE_APPLICATION_ERROR (-20417, '������ �� ����������. ' || SQLERRM);

end get_prices;


--
--  ������� ������ ��������������� ����
--
PROCEDURE get_prices_all
(
   ID_DEPT_      IN       NUMBER,
   v_office      in       number,
   v_dBegin      in       date,
   v_dEnd        in       date,
   cursor_       in out   ref_cursor
)
IS
BEGIN

  open cursor_ for
    select a.PPLI_ID, a.PPL_COMMENT, a.PPL_DATE, a.PRIME_COAST_COEFFICIENT, a.PROFIT_COEFFITIENT, a.EXCHANGE_RATE,
        a.FINISHED, a.USE_CUST_COEF, a.ID_DEPARTMENTS,
        a.inv_id, a.inv_id2, a.inv_id3, a.inv_id4, a.PACK_ID
        , a.inv_id || decode(a.inv_id2,null,'',', '||a.inv_id2) || decode(a.inv_id3,null,'',', '||a.inv_id3) || decode(a.inv_id4,null,'',', '||a.inv_id4) all_inv
        , b.INV_DATE, b.SENDED_TO_WAREHOUSE, case when b.minus_inv_id is null or b.minus_inv_id = 0 then 0 else 1 end is_minus, b.comments
        , c.S_NAME_RU
    from PREPARE_PRICE_LIST_INDEX a, INVOICE_REGISTER b, suppliers c
    where  a.ID_DEPARTMENTS = ID_DEPT_ and a.id_office = v_office
        and a.inv_id = b.inv_id(+)
        and a.PPL_DATE between v_dBegin and v_dEnd
        and b.S_ID_DEFAULT = c.s_id(+)
    ORDER BY a.PPL_DATE DESC;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.get_prices_all', '');
      RAISE_APPLICATION_ERROR (-20417, '������ �� ����������. ' || SQLERRM);

end get_prices_all;


--
--  ������� ������ ���������������
--
PROCEDURE get_nacenka
(
   ID_DEPT_      IN       NUMBER,
   v_office      in       number,
   cursor_       in out   ref_cursor
)
IS
BEGIN

  open cursor_ for
    select a.*
           , case when price_pcc = 0 then 0 else 100*round(price/price_pcc, 2) - 100 end procent
    from (
        select d.name as store_name, b.STORE_TYPE, b.ID_DEPARTMENTS, a.great_name as full_name, a.F_NAME, a.F_NAME_RU, a.F_TYPE, a.F_SUB_TYPE
            , CASE WHEN a.BAR_CODE is not null THEN a.BAR_CODE ELSE to_char(a.CODE) END CODE
            , a.H_CODE, a.LEN, a.PACK, a.COLOUR, a.COL_ID, a.FT_ID, a.FST_ID, a.FN_ID, a.S_ID, a.C_ID, a.H_NAME
            , a.S_NAME_RU, a.COUNTRY, b.QUANTITY, b.N_ID, b.reserv
            , CASE WHEN b.STORE_TYPE=1 THEN c.PRICE ELSE b.PRICE END price
            , a.RUS_MARKS as spesification
            , get_price_pcc(b.N_ID) as price_pcc
            , a.COMPILED_NAME_OTDEL
        from NOMENCLATURE_MAT_VIEW a, STORE_MAIN b, PRICE_LIST c, store_type d
        where a.ID_DEPARTMENTS = ID_DEPT_
              and a.N_ID = b.N_ID and b.id_office = v_office
              and a.N_ID = c.N_ID
              and b.store_type = d.id_store_type
    ) a
    ;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.get_nacenka', '');
      RAISE_APPLICATION_ERROR (-20418, '������ �� ����������. ' || SQLERRM);

end get_nacenka;


--
--  ������� ������ �����/��������
--
PROCEDURE get_fst_view
(
   ID_DEPT_      IN       NUMBER,
   cursor_       in out   ref_cursor
)
IS
BEGIN

  open cursor_ for
    select * from (
        select 0 as ft_id, 0 as fst_id, '���' as f_sub_type, null as f_type from dual
        union all
        select a.ft_id, 0 as fst_id, a.f_type as f_sub_type, a.f_type from flower_types a where a.id_departments = ID_DEPT_ and id_office = const_office
        union all
        select b.ft_id, b.fst_id, '    '||b.f_sub_type as f_sub_type, a.f_type from flower_types a, flower_subtypes b where a.id_departments = ID_DEPT_ and a.ft_id = b.ft_id and a.id_office = const_office
    )
    order by f_type nulls first, fst_id, f_sub_type
    ;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.get_fst_view', '');
      RAISE_APPLICATION_ERROR (-20419, '������ �� ����������. ' || SQLERRM);

end get_fst_view;


--
--  �������������� ���� � �����
--
PROCEDURE sync_ppli
(
   in_ppli_id      IN       NUMBER,
   use_sended      IN       NUMBER
)
IS
BEGIN
  -- ������ ������, ��� ��� ��� �������� �� ������ �� ������������� �����
  delete from PREPARE_PRICE_LIST a
    where a.ppli_id = IN_PPLI_ID
        and ppl_id in (select ppl_id from ppl_view v where v.ppli_id = IN_PPLI_ID and v.quantity = 0 and v.INVOICE_DATA_ID is null);
        --and ppl_id in (select ppl_id from ppl_view v where v.ppli_id = IN_PPLI_ID and v.stock_amount = 0 and v.INVOICE_DATA_ID is null);

  -- ������� ���������� �������
  --update PREPARE_PRICE_LIST a set a.stock_amount = (select distinct stock_amount from ppl_view v where v.ppli_id = IN_PPLI_ID and v.n_id = a.n_id), date_change = sysdate
  --  where a.ppli_id = IN_PPLI_ID;
  update PREPARE_PRICE_LIST a set a.stock_amount = (
    select nvl((select quantity from store_main v where v.n_id = a.n_id and v.store_type = 1),0) -
          nvl((select sum(d.UNITS) from invoice_data d, invoice_register r, prepare_price_list_index i where d.inv_id = r.inv_id and d.sended_to_warehouse = 1
                and (i.inv_id = r.inv_id or i.pack_id = r.ipp_id) and i.ppli_id = IN_PPLI_ID and n_id = a.n_id),0)
    from dual
  ), date_change = sysdate
    where a.ppli_id = IN_PPLI_ID;

  commit;
EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.sync_ppli', '');
      RAISE_APPLICATION_ERROR (-20420, '������ �� ����������. ' || SQLERRM);

end sync_ppli;


--
--  �������������� ���� �� ������ �� � ������
--
PROCEDURE sync_price_list
(
   in_ppli_id   IN       NUMBER,
   v_code       IN       varchar2,
   v_price      IN       NUMBER,
   v_gtd        IN       varchar2
)
IS
  p_n_id   number;
  p_inv_id number;
  sql_str  varchar2(100);
BEGIN
  p_n_id   := 0;
  p_inv_id := 0;
  sql_str  := '';
  select count(*) into CNT from nomenclature a where a.bar_code = v_code;
  if CNT > 0 then
     sql_str := 'select n_id from nomenclature a where a.bar_code ='|| v_code;
     select n_id into p_n_id from nomenclature a where a.bar_code = v_code;
  end if;

  if p_n_id > 0 then
     update PREPARE_PRICE_LIST l set l.final_price = v_price where l.n_id = p_n_id and l.ppli_id = IN_PPLI_ID;
/*
     select count(*) into CNT from prepare_price_list_index i, invoice_data d where i.ppli_id = IN_PPLI_ID
         and (i.inv_id = d.inv_id or i.inv_id2 = d.inv_id or i.inv_id3 = d.inv_id or i.inv_id4 = d.inv_id) and d.n_id = p_n_id;
     if CNT > 0 then
        update invoice_data d set d.gtd = v_gtd where d.n_id = p_n_id and d.inv_id in (
          select inv_id from prepare_price_list_index where ppli_id = IN_PPLI_ID
          union all
          select inv_id2 from prepare_price_list_index where ppli_id = IN_PPLI_ID
          union all
          select inv_id3 from prepare_price_list_index where ppli_id = IN_PPLI_ID
          union all
          select inv_id4 from prepare_price_list_index where ppli_id = IN_PPLI_ID
        );
     end if;
*/
  end if;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.sync_price_list', sql_str);
      RAISE_APPLICATION_ERROR (-20421, '������ �� ����������. ' || SQLERRM);

end sync_price_list;


--
--  ��������� ����������� ��� �������� ������� ��� ����� ���������� ����
--
procedure set_ppli_old
(
   v_PPLI_ID     IN       NUMBER,
   v_PPLI_ID_old IN       NUMBER
)
is
begin
  update PREPARE_PRICE_LIST_INDEX set ppli_id_old = v_PPLI_ID_old where PPLI_ID = v_PPLI_ID;
  commit;
EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.set_ppli_old', '');
      RAISE_APPLICATION_ERROR (-20421, '������ �� ����������. ' || SQLERRM);

end set_ppli_old;

--
--  ������� ������ ���������� � ��������� � �������
--
PROCEDURE get_ppl_list
(
   v_PPLI_ID     IN       NUMBER,
   v_PPLI_ID_old IN       NUMBER,
   cursor_       in out   ref_cursor
)
IS
  v_DIST_IND_ID number;
BEGIN
  begin
    select max(d.DIST_IND_ID) into v_DIST_IND_ID
    from distributions_invoices d, PREPARE_PRICE_LIST_INDEX p
      where p.ppli_id = v_PPLI_ID and (d.INV_ID = p.inv_id or d.INV_ID = p.inv_id2 or d.INV_ID = p.inv_id3 or d.INV_ID = p.inv_id4)
    ;
  exception when NO_DATA_FOUND then
    v_DIST_IND_ID := 0;
  end;


  delete from tmp_exp_doc;
  insert into tmp_exp_doc (
    select distinct d.DIST_IND_ID from distributions_invoices d, PREPARE_PRICE_LIST_INDEX p
    where p.ppli_id = v_PPLI_ID and (d.inv_id in (p.inv_id, p.inv_id2, p.inv_id3, p.inv_id4) or d.inv_id in (select z.inv_id from invoice_register z where z.ipp_id = p.PACK_ID ))
   );


  open cursor_ for
select z.*,
 case when DISTRIBUTED_NUMBER > 0 then
   round(last_price * 1.1, 1) || ' / ' || round(last_price * 0.9, 1)
 else '' end stat_last_price
from (
    select a.ppli_id, a.ppl_id, a.coming_date, a.invoice_amount
       , case when DISTRIBUTED_NUMBER_forOrder > nvl(pd.total_quantity,0)-nvl(pd.left_quantity,0)-nvl(d.DISTRIBUTED_NUMBER_to_zhirar,0) then DISTRIBUTED_NUMBER_forOrder else nvl(pd.total_quantity,0) - nvl(pd.left_quantity,0) - nvl(d.DISTRIBUTED_NUMBER_to_zhirar,0) end as DISTRIBUTED_NUMBER
       , case when DISTRIBUTED_NUMBER_forOrder is null and pd.total_quantity is null and pd.left_quantity is null and DISTRIBUTED_NUMBER_to_zhirar is null then a.invoice_amount else
           case when DISTRIBUTED_NUMBER_forOrder > nvl(pd.total_quantity,0)-nvl(pd.left_quantity,0)-nvl(d.DISTRIBUTED_NUMBER_to_zhirar,0) then
             case when (nvl(pd.total_quantity,0) - DISTRIBUTED_NUMBER_forOrder) < 0 then 0 else (nvl(pd.total_quantity,0) - DISTRIBUTED_NUMBER_forOrder) end
           else nvl(pd.left_quantity,0) +  nvl(d.DISTRIBUTED_NUMBER_to_zhirar,0) end end obshak
       , case when a.stock_amount < 0 then 0 else a.stock_amount end stock_amount, a.left_amount, a.given_amount, a.hol_price, a.ruble_price
       , case
          when v_PPLI_ID_old = 0 then a.last_price
          else
            case
              when z.final_price is null then case when nvl(stock_amount,0) = 0 then null else a.final_price end
              else z.final_price
            end
          end last_price


       , case when a.INVOICE_DATA_ID is null then floor( a.final_price / a.last_price )
         else floor( a.final_price / decode(a.PRICE_PCC_PC,0,1,a.PRICE_PCC_PC))
         end extra_gross


       , a.price_pcc, a.price_pcc_pc, a.n_id
       , a.final_price
       , a.inv_total_sum, a.stok_total_sum, a.inv_total_profit, a.came_type, a.nid_rownum, a.f_sub_type
       , a.compiled_name_otdel, a.total_sum, a.cust_coef, a.h_code, a.col, a.rus_marks, a.INVOICE_DATA_ID, a.compiled_name_pot, a.f_type
       , decode(a.hol_type,'RO','1 ���� ���������', 'EC','2 ���� �������', 'CH','3 ����������', 'GR','4 ������', 'CA','5 ����������', 'LI','6 �����', 'OT','7 ������', '' ) as hol_type
       , case when nid_rownum=1 then a.stok_total_profit else 0 end stok_total_profit
       , case when nid_rownum=1 then a.inv_total_profit+a.stok_total_profit else a.inv_total_profit end total_profit
       , a.country, a.colour, to_char(nvl(a.bar_code,a.code)) as bar_code
       , a.ft_id, a.fst_id, a.col_id, a.len, a.type_subtype, a.spec_price, a.best_price, a.discount
       , a.inv_id, a.inv_id2, a.inv_id3, a.inv_id4
       , case when a.inv_total_profit > 0 then 1 else 0 end as loss_profit
       , case when trunc(a.RUBLE_PRICE) = trunc(a.FINAL_PRICE) and const_office = 1 then 1 else 0 end as eq_price
       , a.id_clients, client_price
       , c.nick
       , nvl(spec,0) as SPEC
       , inv.TO_CLIENT
       --, decode(d.TO_CLIENT,'URIS',1,0) as paint_super
       , decode(c.nick,'M URLO',1,0) as paint_super
       , v_PPLI_ID_old as PPLI_ID_old
       , case when a.INVOICE_DATA_ID is null then null else PROFIT_COEFFITIENT end PROFIT_COEFFITIENT
       , NOM_NEW
       , mdl.mdl_price
       , a.has_price
       , w.w_quantity, w.w_price

    from (
        SELECT a.ppli_id, ppl_id, coming_date, invoice_amount, case when STOCK_AMOUNT < 0 then 0 else stock_amount end STOCK_AMOUNT, left_amount, given_amount, hol_price, ruble_price, last_price
          , price_pcc, price_pcc_pc, a.n_id, final_price, inv_total_sum, stok_total_sum
          , (final_price - price_pcc * curr_cust_coef) * invoice_amount as inv_total_profit
          , stok_total_profit
          , compiled_name_otdel, total_sum, cust_coef, h_code, nvl(COL,0) as col
          , rus_marks, INVOICE_DATA_ID, compiled_name_pot, f_type, hol_type, f_sub_type
          , case when INVOICE_DATA_ID is null then '�����' else '�������' end came_type
          , row_number() over(partition by a.n_id order by ppl_id) as nid_rownum
          , country, colour, bar_code, code, ft_id, fst_id, col_id, len, type_subtype, a.spec_price, best_price, discount
          , inv_id, inv_id2, inv_id3, inv_id4
          , null id_clients, null client_price, null as client_quantity, null as total_client_quantity
          , instr(remarks,'"!"') as spec
          , a.PROFIT_COEFFITIENT, a.NOM_NEW,
          decode(c.n_id,null,0,1) as has_price
        FROM ppl_view a
          left outer join (select b.n_id from ppl_client_price b where b.PPLI_ID = v_PPLI_ID and SPEC_PRICE is not null group by b.n_id) c on c.n_id = a.n_id
          WHERE a.PPLI_ID = v_PPLI_ID

/*
        SELECT a.ppli_id, ppl_id, coming_date, invoice_amount, case when STOCK_AMOUNT < 0 then 0 else stock_amount end STOCK_AMOUNT, left_amount, given_amount, hol_price, ruble_price, last_price
          , price_pcc, price_pcc_pc, a.n_id, final_price, inv_total_sum, stok_total_sum
          , (final_price - price_pcc * curr_cust_coef) * (invoice_amount - nvl(c.total_client_quantity,0)) as inv_total_profit
          , stok_total_profit
          , compiled_name_otdel, (total_sum - nvl(final_price*c.total_client_quantity,0)) as total_sum, cust_coef, h_code, nvl(COL,0) as col
          , rus_marks, INVOICE_DATA_ID, compiled_name_pot, f_type, hol_type, f_sub_type
          , case when INVOICE_DATA_ID is null then '�����' else '�������' end came_type
          , row_number() over(partition by a.n_id order by ppl_id) as nid_rownum
          , country, colour, bar_code, code, ft_id, fst_id, col_id, len, type_subtype, a.spec_price, best_price, discount
          , inv_id, inv_id2, inv_id3, inv_id4
          , null id_clients, null client_price, null as client_quantity, c.total_client_quantity
          , instr(remarks,'"!"') as spec
          , a.PROFIT_COEFFITIENT, a.NOM_NEW
        FROM ppl_view a
        left outer join (select b.n_id, sum(b.quantity) as total_client_quantity from ppl_client_price b where b.PPLI_ID = v_PPLI_ID group by b.n_id) c on c.n_id = a.n_id
          WHERE a.PPLI_ID = v_PPLI_ID
           and not exists (select 1 from ppl_client_price b where b.PPLI_ID = a.PPLI_ID and b.n_id = a.n_id and b.INVOICE_DATA_ID = a.INVOICE_DATA_ID)

        union all

        SELECT a.ppli_id, ppl_id, coming_date, invoice_amount, 0 as stock_amount, left_amount, given_amount, hol_price, ruble_price, last_price
          , price_pcc, price_pcc_pc, a.n_id, b.spec_price as final_price, inv_total_sum, stok_total_sum
          , (b.spec_price - price_pcc * curr_cust_coef) * b.quantity as inv_total_profit
          , 0 as stok_total_profit
          , compiled_name_otdel, nvl(b.spec_price*b.quantity, total_sum) as total_sum
          , cust_coef, h_code, nvl(COL,0) as col
          , rus_marks, a.INVOICE_DATA_ID, compiled_name_pot, f_type, hol_type, f_sub_type
          , case when a.INVOICE_DATA_ID is null then '�����' else '�������' end came_type
          , row_number() over(partition by a.n_id order by ppl_id) as nid_rownum
          , country, colour, bar_code, code, ft_id, fst_id, col_id, len, type_subtype, a.spec_price, best_price, discount
          , inv_id, inv_id2, inv_id3, inv_id4
          , b.id_clients, b.spec_price as client_price, null as client_quantity, null as total_client_quantity
          , instr(remarks,'"!"') as spec
          , a.PROFIT_COEFFITIENT, a.NOM_NEW
        FROM ppl_view a
        inner join ppl_client_price b on b.PPLI_ID = a.PPLI_ID and b.n_id = a.n_id and b.INVOICE_DATA_ID = a.INVOICE_DATA_ID
          WHERE a.PPLI_ID = v_PPLI_ID
*/
    ) a

    left outer join
      (
        select sum(left_quantity) as left_quantity, sum(total_quantity) as total_quantity, n_id
        from prepare_distribution pd, PREPARE_PRICE_LIST_INDEX p, tmp_exp_doc d
        where p.ppli_id = v_PPLI_ID and pd.DIST_IND_ID = d.id_doc
          and pd.id_store_main is null
          group by pd.n_id
      ) pd on pd.n_id = a.n_id

    left outer join
      (
        select c.d_n_id, nvl(SUM(c.DQ),0) as DISTRIBUTED_NUMBER_to_zhirar
        from DISTRIBUTION_VIEW c, PREPARE_PRICE_LIST_INDEX p, tmp_exp_doc d
          where p.ppli_id = v_PPLI_ID and c.DIST_IND_ID = d.id_doc
           and c.id_clients in (const_dir,const_main) and c.INVOICE_DATA_ID is not null and c.id_store_main is null
          group by c.d_n_id
        union all
        select c.n_id as d_n_id, sum(c.units) as DISTRIBUTED_NUMBER_to_zhirar
        from invoice_data c, PREPARE_PRICE_LIST_INDEX p, invoice_register z
          where p.ppli_id = v_PPLI_ID
            and (z.inv_id = p.inv_id or z.ipp_id = p.PACK_ID)
            and c.inv_id = z.inv_id
            --and (c.inv_id in (p.inv_id, p.inv_id2, p.inv_id3, p.inv_id4) or c.inv_id in (select z.inv_id from invoice_register z where z.ipp_id = p.PACK_ID ) )
            and c.to_client = 'MAIN'
          group by c.n_id

      ) d on d.d_n_id = a.n_id

    left outer join
      (
        select c.d_n_id, nvl(SUM(c.DQ),0) as DISTRIBUTED_NUMBER_forOrder
        from DISTRIBUTION_VIEW c, PREPARE_PRICE_LIST_INDEX p, tmp_exp_doc d
          where p.ppli_id = v_PPLI_ID and c.DIST_IND_ID = d.id_doc
           and c.INVOICE_DATA_ID is not null and c.id_store_main is null
          group by c.d_n_id
      ) for_order on for_order.d_n_id = a.n_id

    left outer join
      (
        select z.n_id, max(nvl(p.SPEC_PRICE, z.final_price)) as final_price
          from PREPARE_PRICE_LIST z
            left outer join invoice_data d on d.INVOICE_DATA_ID = z.INVOICE_DATA_ID
            left outer join ppl_client_price p on p.ppli_id = v_PPLI_ID_old and p.INVOICE_DATA_ID = z.INVOICE_DATA_ID
          where z.ppli_id = v_PPLI_ID_old and z.ppli_id <> v_PPLI_ID --and d.TO_CLIENT is null
          group by z.n_id
      ) z on z.n_id = a.n_id

    left outer join clients c on c.id_clients = a.id_clients
    left outer join invoice_data inv on inv.INVOICE_DATA_ID = a.INVOICE_DATA_ID

    left outer join
      (
        select z.n_id, round(p1/decode(p2,0,1,p2),2) as mdl_price from (
          SELECT a.n_id, max(a.price_pcc_pc), sum(a.invoice_amount * a.price_pcc_pc) as p1, sum(a.invoice_amount) as p2
            FROM prepare_price_list a
          where  PPLI_ID = v_PPLI_ID and a.invoice_data_id is not null
          group by n_id
        ) z
      ) mdl on mdl.n_id = a.n_id


          left outer join
      (
        select w.n_id as w_n_id, sum(w.quantity) as w_quantity, max(w.price) as w_price
        from distributions_webshop w
          where w.dist_ind_id in (
            select distinct d.DIST_IND_ID
              from distributions_invoices d, PREPARE_PRICE_LIST_INDEX p, invoice_register r
              where p.ppli_id = v_PPLI_ID and (d.INV_ID = p.inv_id or p.PACK_ID = r.ipp_id) and d.inv_id = r.inv_id
          )
        group by n_id
      ) w on w.w_n_id = a.n_id

) z
    order by compiled_name_pot, len, RUS_MARKS, BAR_CODE;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.get_ppl_list', v_PPLI_ID);
      RAISE_APPLICATION_ERROR (-20422, '������ �� ����������. ' || SQLERRM);

end get_ppl_list;



--
--  ������� ������ �������� ���������� �������
--
PROCEDURE get_client_list
(
   v_PPLI_ID     IN       NUMBER,
   v_N_ID        in       number,
   cursor_       in out   ref_cursor
)
IS
  p_Order number;
BEGIN

  open cursor_ for
    SELECT distinct a.n_id, a.quantity, s.nick, s.fio, p.PPLI_ID, i.DIST_IND_ID, pl.SPEC_PRICE, pl.PPLCP_ID, s.ID_CLIENTS, a.PREP_DIST_ID, pd.left_quantity, a.id_orders_list
--      , (select sum(left_quantity) from prepare_distribution pd where pd.DIST_IND_ID = a.DIST_IND_ID and pd.n_id = a.n_id ) left_quantity
    FROM distributions a
      inner join distributions_invoices i on i.DIST_IND_ID = a.DIST_IND_ID
      inner join invoice_register r on r.inv_id = i.inv_id
      inner join PREPARE_PRICE_LIST_INDEX p on p.PPLI_ID = v_PPLI_ID and (p.PACK_ID = r.IPP_ID or p.inv_id = r.inv_id)
      inner join orders_list l on l.id_orders_list = a.id_orders_list
      inner join orders_clients c on c.ID_ORDERS_CLIENTS = l.ID_ORDERS_CLIENTS
      inner join clients s on s.id_clients = c.id_clients
      left outer join PPL_CLIENT_PRICE pl on pl.ppli_id = v_PPLI_ID and pl.n_id = a.N_ID and pl.ID_CLIENTS = s.id_clients
      inner join prepare_distribution pd on pd.DIST_IND_ID = a.DIST_IND_ID and pd.PREP_DIST_ID = a.PREP_DIST_ID
    where a.N_ID = v_N_ID
    ;

/*
  select count(d.id_orders) into CNT
    from distributions_invoices i, distributions_index d, PREPARE_PRICE_LIST_INDEX p
    where i.dist_ind_id = d.dist_ind_id and p.ppli_id = v_PPLI_ID and (i.inv_id = p.inv_id or i.inv_id = p.inv_id2 or i.inv_id = p.inv_id3 or i.inv_id = p.inv_id4)
  ;

  if CNT > 0 then
    open cursor_ for
      select a.*, v_PPLI_ID as p_v_PPLI_ID, v_N_ID as p_v_N_ID
      from (
      select d.nick || ' ' ||b.alpha as nick, sum(a.quantity) as quantity, d.nick as src_nick, b.alpha as src_alpha, b.ID_ORDERS_CLIENTS, b.id_clients, b.pack_, p.SPEC_PRICE, p.PPLCP_ID
      FROM orders_list a
        inner join orders_clients b on b.id_orders in
            (
              select distinct d.id_orders
                from distributions_invoices i, distributions_index d, PREPARE_PRICE_LIST_INDEX p
                where i.dist_ind_id = d.dist_ind_id and p.ppli_id = v_PPLI_ID and (i.inv_id = p.inv_id or i.inv_id = p.inv_id2 or i.inv_id = p.inv_id3 or i.inv_id = p.inv_id4)
            )
         and b.id_orders_clients = a.id_orders_clients and b.active = 1
        inner join clients d on d.id_clients = b.id_clients
        left outer join PPL_CLIENT_PRICE p on p.ppli_id = v_PPLI_ID and p.n_id = a.N_ID and p.ID_CLIENTS = d.id_clients
      WHERE a.N_ID = v_N_ID
        and a.active = 1
        and a.quantity <> 0
      group by d.nick, b.alpha, b.ID_ORDERS_CLIENTS, b.id_clients, b.pack_, a.zatirka, b.id_orders, p.SPEC_PRICE, p.PPLCP_ID
      order by d.nick || ' ' ||b.alpha
      ) a
    ;

  else
    p_Order := 0;
  end if;
*/
EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.get_client_list', v_PPLI_ID);
      RAISE_APPLICATION_ERROR (-20423, '������ �� ����������. ' || SQLERRM);

end get_client_list;



--
--  ��������/������ ���� ����
--
PROCEDURE set_special_price
(
   v_PPLI_ID     IN       NUMBER,
   v_N_ID        in       number,
   v_PPLCP_ID    in       number,
   v_SPEC_PRICE  in       number,
   v_QUANTITY    in       number,
   v_ID_CLIENTS  in       number
)
is
begin
--      LOG_ERR('v_PPLI_ID=' ||v_PPLI_ID||' v_N_ID='||v_N_ID||' v_PPLCP_ID='||v_PPLCP_ID||' v_SPEC_PRICE='||v_SPEC_PRICE||' v_QUANTITY='||v_QUANTITY||' v_ID_CLIENTS='||v_ID_CLIENTS, 0, 'price_pkg.set_special_price', 0);

  if v_PPLCP_ID > 0 THEN
    if v_SPEC_PRICE is null or v_SPEC_PRICE = 0 then
      delete from PPL_CLIENT_PRICE where PPLCP_ID = v_PPLCP_ID;
    else
      update PPL_CLIENT_PRICE set SPEC_PRICE = v_SPEC_PRICE where PPLCP_ID = v_PPLCP_ID;
    end if;
  else
    insert into PPL_CLIENT_PRICE values(seq_PPLCP_ID.nextval, v_N_ID, v_ID_CLIENTS, v_QUANTITY, v_SPEC_PRICE, v_PPLI_ID, null, null);
  end if;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.set_special_price', v_PPLI_ID);
      RAISE_APPLICATION_ERROR (-20424, '������ �� ����������. ' || SQLERRM);

end set_special_price;



--
-- ��������� ������
--
PROCEDURE get_sales
(
    v_id_dep  in number,
    cursor_   out ref_cursor
)
IS
begin

  open cursor_ for
    SELECT a.id, a.id_employees, a.sale, a.sale_status, a.date1, a.ID_DEPARTMENTS,
         a.date2, a.notime, decode(a.PERSENTS,2,'������ ����������',3,'������ ��������',a.PERSENTS) as PERSENTS_name, c.nick, c.id_clients_groups
    FROM clients_sales a, clients c
    where a.ID_DEPARTMENTS = v_id_dep and c.id_clients = a.id_employees
      and a.PERSENTS in (2,3)
    ;

EXCEPTION
  WHEN others THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.get_sales', v_id_dep);
      RAISE_APPLICATION_ERROR (-20425, '������ �� ����������. ' || SQLERRM);

end get_sales;


--
--  ��������� �������� � ������
--
PROCEDURE clear_price_settings
(
   in_ppli_id      IN       NUMBER
)
IS
BEGIN

  -- ������� ���������� �������
  update PREPARE_PRICE_LIST a set a.spec_price = null, a.best_price = null, date_change = sysdate
    where a.ppli_id = IN_PPLI_ID;

  commit;
EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.clear_price_settings', '');
      RAISE_APPLICATION_ERROR (-20426, '������ �� ����������. ' || SQLERRM);

end clear_price_settings;


--
--  ������������� ��� � ������� �����-������
--
procedure sync_with_curr_pricelist
(
   v_PPLI_ID     IN       NUMBER,
   v_PPLI_ID_old IN       NUMBER
)
is
begin
  --update PREPARE_PRICE_LIST_INDEX set ppli_id_old = v_PPLI_ID_old where PPLI_ID = v_PPLI_ID;
  if v_PPLI_ID_old = 0 then
    update PREPARE_PRICE_LIST a set a.LAST_PRICE = (select nvl(m.PRICE,0) from price_list m where m.n_id = a.n_id), date_change = sysdate
    where a.ppli_id = v_PPLI_ID;
  else
    update PREPARE_PRICE_LIST a set a.LAST_PRICE = (select max(nvl(m.FINAL_PRICE,0)) from PREPARE_PRICE_LIST m where m.ppli_id=v_PPLI_ID_old and m.n_id = a.n_id), date_change = sysdate
    where a.ppli_id = v_PPLI_ID;
  end if;

EXCEPTION
   WHEN OTHERS
   THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.sync_with_curr_pricelist', '');
      RAISE_APPLICATION_ERROR (-20427, '������ �� ����������. ' || SQLERRM);

end sync_with_curr_pricelist;



--
-- ��������� ����.����������� �� ������
--
PROCEDURE get_spec_orders
(
    v_id_dep  in number,
    v_d_b     in date,
    v_d_e     in date,
    cursor_   out ref_cursor
)
IS
begin

  open cursor_ for
    SELECT a.SPEC_ORDERS_ID, a.n_id, a.start_date, a.end_date, a.is_active, a.price,
       a.cur_price, a.price_date,
       n.COMPILED_NAME_OTDEL, F_TYPE, F_SUB_TYPE, REMARKS, RUS_MARKS, COLOUR, COUNTRY
    FROM spec_orders_view a
    inner join nomenclature_mat_view n on n.n_id = a.n_id
    where n.ID_DEPARTMENTS = v_id_dep and a.start_date >= v_d_b and a.end_date <= v_d_e
    order by F_TYPE, F_SUB_TYPE, COMPILED_NAME_OTDEL
    ;

EXCEPTION
  WHEN others THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.get_spec_orders', v_id_dep);
      RAISE_APPLICATION_ERROR (-20428, '������ �� ����������. ' || SQLERRM);

end get_spec_orders;



--
-- ���������� ����.����������� �� ������
--
PROCEDURE add_spec_orders
(
    v_n_id    in number,
    v_d_b     in date,
    v_d_e     in date,
    v_price   in number,
    v_res     in out number
)
is
begin
  select count(*) into cnt from spec_orders where n_id = v_n_id and
  (
    start_date between v_d_b and v_d_e
    or
    end_date between v_d_b and v_d_e
  );
  if cnt > 0 then v_res := 1;
  else
    insert into spec_orders values(v_n_id, v_d_b, v_d_e, 1, v_price, universal_id.nextval);
    commit;
  end if;

EXCEPTION
  WHEN others THEN
      LOG_ERR(SQLERRM|| ' ' || DBMS_UTILITY.format_error_backtrace, SQLCODE, 'price_pkg.add_spec_orders', v_n_id);
      RAISE_APPLICATION_ERROR (-20429, '������ �� ����������. ' || SQLERRM);
end add_spec_orders;

END;
/


-- End of DDL Script for Package Body CREATOR.PRICE_PKG

