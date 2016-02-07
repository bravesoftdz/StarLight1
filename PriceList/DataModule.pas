unit DataModule;

interface

uses
  SysUtils, Classes, DB, DBAccess, Ora, MemDS, OraSmart, PI_Library_reg;

type
  TDM = class(TDataModule)
    STAR_DB: TOraSession;
    PPL_Index: TOraQuery;
    PPL_IndexPPLI_ID: TFloatField;
    PPL_IndexPPL_COMMENT: TStringField;
    PPL_IndexPPL_DATE: TDateTimeField;
    PPL_IndexPRIME_COAST_COEFFICIENT: TFloatField;
    PPL_IndexPROFIT_COEFFITIENT: TFloatField;
    PPL_IndexEXCHANGE_RATE: TFloatField;
    PPL_IndexFINISHED: TIntegerField;
    PPL_Index_DS: TOraDataSource;
    CreatePPLIndex: TOraStoredProc;
    PPL_DS: TOraDataSource;
    LoadInvoice: TOraStoredProc;
    ForceQ: TOraQuery;
    LoadStock: TOraStoredProc;
    UpdatePPL: TOraStoredProc;
    PriceList: TOraQuery;
    PriceList_DS: TOraDataSource;
    PPL: TOraQuery;
    StoreProc: TOraStoredProc;
    SelPriceList: TOraQuery;
    PPL_IndexUSE_CUST_COEF: TIntegerField;
    SelQ: TOraQuery;
    InvoReg: TOraQuery;
    InvoRegINV_ID: TFloatField;
    InvoRegINV_DATE: TDateTimeField;
    InvoRegCOMMENTS: TStringField;
    InvoRegINV_SUM: TFloatField;
    InvoRegIPP_ID: TFloatField;
    InvoRegIPP_COMMENT: TStringField;
    InvoRegID_DEPARTMENTS: TFloatField;
    InvoReg_DS: TOraDataSource;
    SelPrntPreview: TOraQuery;
    SavePrice: TOraStoredProc;
    SelFST_PriceList: TOraQuery;
    SelFST_PriceListFST_ID: TFloatField;
    SelFST_PriceListF_SUB_TYPE: TStringField;
    SelFST_PriceList_DS: TOraDataSource;
    SelFT_PriceList: TOraQuery;
    SelFT_PriceListFT_ID: TFloatField;
    SelFT_PriceListF_TYPE: TStringField;
    PPL_IndexID_DEPARTMENTS: TFloatField;
    PPL_IndexINV_ID: TFloatField;
    PPL_IndexINV_DATE: TDateTimeField;
    PPL_IndexSENDED_TO_WAREHOUSE: TIntegerField;
    OraDataSource1: TOraDataSource;
    SelFT_PriceList_DS: TOraDataSource;
    InvoRegDEPT_NAME: TStringField;
    InvoRegINV_MINUS: TIntegerField;
    InvoRegMINUS_INV_ID: TFloatField;
    InvoRegIS_MINUS: TFloatField;
    InvoRegS_NAME_RU: TStringField;
    InvoRegTOTAL_SUM: TFloatField;
    PPL_IndexS_NAME_RU: TStringField;
    InvoPriceReg: TOraQuery;
    InvoPriceReg_DS: TOraDataSource;
    InvoPriceRegINV_ID: TFloatField;
    InvoPriceRegINV_DATE: TDateTimeField;
    InvoPriceRegCOMMENTS: TStringField;
    InvoPriceRegINV_SUM: TFloatField;
    InvoPriceRegIPP_ID: TFloatField;
    InvoPriceRegIPP_COMMENT: TStringField;
    InvoPriceRegTOTAL_SUM: TFloatField;
    InvoPriceRegID_DEPARTMENTS: TFloatField;
    InvoPriceRegDEPT_NAME: TStringField;
    InvoPriceRegINV_MINUS: TIntegerField;
    InvoPriceRegMINUS_INV_ID: TFloatField;
    InvoPriceRegIS_MINUS: TFloatField;
    InvoPriceRegS_NAME_RU: TStringField;
    cds_ppl_price: TOraQuery;
    ds_ppl_price: TOraDataSource;
    ds_SelPrntPreview: TOraDataSource;
    PPL_IndexIS_MINUS: TFloatField;
    PPL_IndexCOMMENTS: TStringField;
    PPL_IndexINV_ID2: TFloatField;
    PPL_IndexINV_ID3: TFloatField;
    PPL_IndexINV_ID4: TFloatField;
    PPL_IndexPACK_ID: TIntegerField;
    PPL_IndexALL_INV: TStringField;
    PPL_OLD: TOraQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    StringField5: TStringField;
    FloatField17: TFloatField;
    StringField6: TStringField;
    FloatField18: TFloatField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    InvoRegPAST_NUM: TFloatField;
    SelPriceListN_ID: TFloatField;
    SelPriceListCOMPILED_NAME: TStringField;
    SelPriceListPRICE: TFloatField;
    SelPriceListCOUNTRY: TStringField;
    SelPriceListH_CODE: TStringField;
    SelPriceListCOLOUR: TStringField;
    SelPriceListRUS_MARKS: TStringField;
    SelPrntPreviewN_ID: TFloatField;
    SelPrntPreviewTITLE: TStringField;
    SelPrntPreviewPRICE: TFloatField;
    SelPrntPreviewCODE: TFloatField;
    SelPrntPreviewH_CODE: TStringField;
    SelPrntPreviewCOLOUR: TStringField;
    SelPrntPreviewF_NAME_RU: TStringField;
    SelPrntPreviewCOUNTRY: TStringField;
    SelPrntPreviewRUS_MARKS: TStringField;
    SelPrntPreviewBAR_CODE: TStringField;
    SelPrntPreviewPRINT_CODE: TFloatField;
    SelPrntPreviewPACK_PRICE: TFloatField;
    SelPrntPreviewINVOICE_ID: TFloatField;
    SelPrntPreviewPACKQ: TIntegerField;
    cds_ppl_priceINVOICE_AMOUNT: TFloatField;
    cds_ppl_priceSTOCK_AMOUNT: TFloatField;
    cds_ppl_priceFINAL_PRICE: TFloatField;
    cds_ppl_priceH_CODE: TStringField;
    cds_ppl_priceRUS_MARKS: TStringField;
    cds_ppl_priceCOMPILED_NAME_POT: TStringField;
    cds_ppl_priceF_TYPE: TStringField;
    PriceListD_CHECKED: TFloatField;
    PriceListN_ID: TFloatField;
    PriceListPRICE: TFloatField;
    PriceListPRICE_DATE: TDateTimeField;
    PriceListCOMPILED_NAME: TStringField;
    PriceListFT_ID: TFloatField;
    PriceListF_TYPE: TStringField;
    PriceListFST_ID: TFloatField;
    PriceListF_SUB_TYPE: TStringField;
    PriceListLEN: TIntegerField;
    PriceListS_ID: TFloatField;
    PriceListS_NAME_RU: TStringField;
    PriceListCOL_ID: TFloatField;
    PriceListCOLOUR: TStringField;
    PriceListCODE: TStringField;
    PriceListBAR_CODE: TStringField;
    PriceListC_ID: TFloatField;
    PriceListCOUNTRY: TStringField;
    PriceListID_DEPARTMENTS: TFloatField;
    PriceListDEPT: TStringField;
    PriceListFN_ID: TFloatField;
    PriceListF_NAME_RU: TStringField;
    PriceListQUANTITY: TFloatField;
    PriceListPACK: TIntegerField;
    PriceListH_CODE: TStringField;
    PriceListSTICKERS: TFloatField;
    PriceListGREAT_NAME: TStringField;
    PriceListGREAT_NAME_F: TStringField;
    PriceListIS_PHOTO: TFloatField;
    PriceListPHOTO: TStringField;
    PriceListCOMPILED_NAME_POT: TStringField;
    PriceListPICS: TStringField;
    PriceListORD: TFloatField;
    PriceListID_OFFICE: TIntegerField;
    PriceListBRIEF: TStringField;
    OraQuery1: TOraQuery;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    DateTimeField2: TDateTimeField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    FloatField35: TFloatField;
    FloatField36: TFloatField;
    FloatField37: TFloatField;
    FloatField38: TFloatField;
    StringField10: TStringField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    StringField11: TStringField;
    FloatField41: TFloatField;
    StringField12: TStringField;
    FloatField42: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    FloatField43: TFloatField;
    StringField16: TStringField;
    StringField17: TStringField;
    FloatField44: TFloatField;
    FloatField45: TFloatField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    FloatField46: TFloatField;
    FloatField47: TFloatField;
    FloatField48: TFloatField;
    IntegerField1: TIntegerField;
    StringField21: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    FloatField49: TFloatField;
    FloatField50: TFloatField;
    FloatField51: TFloatField;
    PPLPPLI_ID: TFloatField;
    PPLPPL_ID: TFloatField;
    PPLCOMING_DATE: TDateTimeField;
    PPLINVOICE_AMOUNT: TFloatField;
    PPLDISTRIBUTED_NUMBER: TFloatField;
    PPLOBSHAK: TFloatField;
    PPLSTOCK_AMOUNT: TFloatField;
    PPLLEFT_AMOUNT: TFloatField;
    PPLGIVEN_AMOUNT: TFloatField;
    PPLHOL_PRICE: TFloatField;
    PPLRUBLE_PRICE: TFloatField;
    PPLLAST_PRICE: TFloatField;
    PPLPRICE_PCC: TFloatField;
    PPLPRICE_PCC_PC: TFloatField;
    PPLN_ID: TFloatField;
    PPLFINAL_PRICE: TFloatField;
    PPLINV_TOTAL_SUM: TFloatField;
    PPLSTOK_TOTAL_SUM: TFloatField;
    PPLINV_TOTAL_PROFIT: TFloatField;
    PPLCAME_TYPE: TStringField;
    PPLNID_ROWNUM: TFloatField;
    PPLF_SUB_TYPE: TStringField;
    PPLCOMPILED_NAME_OTDEL: TStringField;
    PPLTOTAL_SUM: TFloatField;
    PPLCUST_COEF: TFloatField;
    PPLH_CODE: TStringField;
    PPLCOL: TFloatField;
    PPLRUS_MARKS: TStringField;
    PPLINVOICE_DATA_ID: TFloatField;
    PPLCOMPILED_NAME_POT: TStringField;
    PPLF_TYPE: TStringField;
    PPLHOL_TYPE: TStringField;
    PPLSTOK_TOTAL_PROFIT: TFloatField;
    PPLTOTAL_PROFIT: TFloatField;
    PPLCOUNTRY: TStringField;
    PPLCOLOUR: TStringField;
    PPLBAR_CODE: TStringField;
    PPLFT_ID: TFloatField;
    PPLFST_ID: TFloatField;
    PPLCOL_ID: TFloatField;
    PPLLEN: TIntegerField;
    PPLTYPE_SUBTYPE: TStringField;
    PPLSPEC_PRICE: TIntegerField;
    PPLBEST_PRICE: TIntegerField;
    PPLDISCOUNT: TFloatField;
    PPLINV_ID: TFloatField;
    PPLINV_ID2: TFloatField;
    PPLINV_ID3: TFloatField;
    PPLINV_ID4: TFloatField;
    PPLLOSS_PROFIT: TFloatField;
    PPLEQ_PRICE: TFloatField;
    PPLID_CLIENTS: TFloatField;
    PPLCLIENT_PRICE: TFloatField;
    PPLNICK: TStringField;
    PPLSPEC: TFloatField;
    PPLTO_CLIENT: TStringField;
    PPLPAINT_SUPER: TFloatField;
    PriceListSPEC_PRICE: TIntegerField;
    PriceListBEST_PRICE: TIntegerField;
    PPL_IndexPPLI_ID_OLD: TFloatField;
    PPLPPLI_ID_OLD: TFloatField;
    procedure STAR_DBBeforeConnect(Sender: TObject);
    procedure PPL1AfterPost(DataSet: TDataSet);
    procedure PPLAfterPost(DataSet: TDataSet);
    procedure PPL_IndexBeforeOpen(DataSet: TDataSet);
    procedure STAR_DBAfterConnect(Sender: TObject);
    procedure PriceListBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
   id_office: integer;
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Globals;

{$R *.dfm}

procedure TDM.STAR_DBAfterConnect(Sender: TObject);
begin
  id_office := GetOfficeID;
end;

procedure TDM.STAR_DBBeforeConnect(Sender: TObject);
begin
  TOraSession(Sender).Server   := ora_db_path;
  TOraSession(Sender).Username := username;
  TOraSession(Sender).Password := password;
end;

procedure TDM.PPL1AfterPost(DataSet: TDataSet);
begin
  STAR_DB.Commit;
  PPL.RefreshRecord;
end;

procedure TDM.PPLAfterPost(DataSet: TDataSet);
begin
  STAR_DB.Commit;
end;

procedure TDM.PPL_IndexBeforeOpen(DataSet: TDataSet);
begin
  TOraQuery(DataSet).ParamByName('ID_DEPT_').Value := CUR_DEPT_ID;
  TOraQuery(DataSet).ParamByName('V_OFFICE').Value := id_office;
end;

procedure TDM.PriceListBeforeOpen(DataSet: TDataSet);
begin
  TOraQuery(DataSet).ParamByName('V_OFFICE').AsInteger := id_office;
end;

end.
