unit StartU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, cxLookAndFeelPainters, cxButtons,
  ExtCtrls, cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, DB, ActnList, IniFiles;

type
  TStartF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    BitBtn4: TcxButton;
    BitBtn1: TcxButton;
    BitBtn2: TcxButton;
    imgcb_dept: TcxImageComboBox;
    ActionList1: TActionList;
    aGetRules: TAction;
    btn_price: TcxButton;
    cbOffices: TcxImageComboBox;
    Label2: TLabel;
    btnArchive: TcxButton;
    btnDiscount: TcxButton;
    btnSpecOffer: TcxButton;
    btnTruckSale: TcxButton;
    btnEditPercent: TcxButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgcb_deptPropertiesChange(Sender: TObject);
    procedure aGetRulesExecute(Sender: TObject);
    procedure btn_priceClick(Sender: TObject);
    procedure cbOfficesPropertiesChange(Sender: TObject);
    procedure btnArchiveClick(Sender: TObject);
    procedure btnDiscountClick(Sender: TObject);
    procedure btnSpecOfferClick(Sender: TObject);
    procedure btnTruckSaleClick(Sender: TObject);
    procedure btnEditPercentClick(Sender: TObject);
  private
    { Private declarations }
    procedure AfterSetDept();
  public
    { Public declarations }
  end;

var
  StartF: TStartF;

implementation

uses PriceU, PreparePrintU, PI_Library, Globals, DataModule, UNacenka,
  UPriceArchive, UClientSale, USpecOrder, UTruckSale, uEditPercent;

{$R *.dfm}


//
//  ���������������
//
procedure TStartF.BitBtn1Click(Sender: TObject);
begin
  if (imgcb_dept.ItemIndex >= 0) then
  begin
    PriceF := TPriceF.Create(Application);
    try
      PriceF.ShowPriceList;
    finally
      PriceF.Free;
    end;
  end else MessageBox(Handle, '���������� ������� �����', '��������', MB_ICONWARNING);
end;


//
// ������ �������� � ��������
//
procedure TStartF.BitBtn2Click(Sender: TObject);
begin
  if (imgcb_dept.ItemIndex >= 0) then
  begin
    PreparePrintF := TPreparePrintF.Create(Application);
    try
      PreparePrintF.ShowModal;
    finally
      PreparePrintF.Free;
    end;
  end else MessageBox(Handle, '���������� ������� �����', '��������', MB_ICONWARNING);
end;



//
//  ������������� �������� ������
//
procedure TStartF.AfterSetDept();
Begin
  if CUR_DEPT_ID <> null then
    Begin
      Label1.Caption  := '������� ����� : ' + CUR_DEPT_NAME;
      aGetRules.Execute;
    End
  else
    Begin
      Label1.Caption      := '������� ����� :';
      BitBtn1.Enabled     := false;
      BitBtn2.Enabled     := false;
      btn_price.Enabled   := false;
      btnArchive.Enabled  := false;
      btnDiscount.Enabled := false;
      //btnSpecOffer.Enabled := false;
      btnTruckSale.Enabled := false;
    End;
End;


//
//  ��� �������� ����� ����� �� ���������
//
procedure TStartF.FormShow(Sender: TObject);
var RegIni : TIniFile;
begin
  try
    RegIni := TIniFile.Create(StartDir+'\pricelist.ini');
    def_folder := RegIni.ReadString('folder', 'Value', '..');
    title_name := RegIni.ReadString('title', 'Value', '��������');

    DM.STAR_DB.Connect;


    cbOffices.Enabled := (dm.id_office = 1);
    if (cbOffices.Enabled) then
    begin
      try
        cbOffices.Properties.OnChange := nil;
        DM.SelQ.Close;
        DM.SelQ.SQL.Clear;
        DM.SelQ.SQL.Add('SELECT ID_OFFICE, OFFICE_NAME FROM OFFICES ORDER BY OFFICE_NAME');
        DM.SelQ.Open;
        FillImgComboCx(DM.SelQ, cbOffices, '���');
        DM.SelQ.Close;
        cbOffices.EditValue := DM.id_office;
        cbOffices.Properties.OnChange := cbOfficesPropertiesChange;
      except
        on E: Exception do ShowMessage(E.Message);
      end;
    end;


    with DM.SelQ do
    Begin
      try
        Close;
        SQL.Clear;
        SQL.Add('begin admins.get_deps_on_user(:login_, :cursor_); end;');
        ParamByName('login_').Value := UpperCase(Username);
        ParamByName('cursor_').AsCursor;
        Open;
      except
        on E: Exception do
        begin
          if (Pos(E.Message, 'SQL statement doesn''t return rows') > 0) then
              MessageBox(Handle, '� ��� �� ������ �� ���� ����� ������. ���������� � ���������� �� ���������.', '��������!', MB_ICONWARNING)
          else
              MessageBox(Handle, PChar(E.Message), '������!', MB_ICONERROR);
          exit;
        end;
      end;
    end;

    if (DM.SelQ.RecordCount = 0) then
    begin
       BitBtn1.Enabled     := false;
       BitBtn2.Enabled     := false;
       btn_price.Enabled   := false;
       btnArchive.Enabled  := false;
       btnDiscount.Enabled := false;
       //btnSpecOffer.Enabled := false;
       btnTruckSale.Enabled := false;
       MessageBox(Handle, '� ��� �� ������ �� ���� ����� ������. ���������� � ���������� �� ���������.', '��������!', MB_ICONWARNING);
    end
    else
    begin
       imgcb_dept.Properties.OnChange := nil;
       FillImgComboCx(DM.SelQ, imgcb_dept, '');
       imgcb_dept.EditValue           := INPUT_DEPT_ID; //CUR_DEPT_ID;
       imgcb_dept.Properties.OnChange := imgcb_deptPropertiesChange;
       imgcb_deptPropertiesChange(Sender);
       //aGetRules.Execute;
    end;

  except on E: Exception do
    MessageBox(Handle, PChar(E.Message), '������!', MB_ICONERROR)
  end;
end;


//
//  ��� ����� ������ ���������� ���������
//
procedure TStartF.imgcb_deptPropertiesChange(Sender: TObject);
begin
  CUR_DEPT_ID   := imgcb_dept.EditValue;
  CUR_DEPT_NAME := imgcb_dept.EditText;
  AfterSetDept();
end;


procedure TStartF.aGetRulesExecute(Sender: TObject);
begin
  with DM.SelQ do
  Begin
      Close;
      SQL.Clear;
      SQL.Add('begin starter.get_rules(:login_, :id_dep_, :cursor_); end;');
      ParamByName('id_dep_').AsInteger := CUR_DEPT_ID;
      ParamByName('login_').AsString   := UpperCase(Username);
      ParamByName('cursor_').DataType  := ftCursor;
      Open;
      Filter := 'id_programs=16';
      Filtered := true;

      if (RecordCount > 0) then
      begin
         if FieldByName('C_EDIT').AsInteger=1 then ed := true else ed := false;
         if FieldByName('C_DEL').AsInteger=1 then del := true else del := false;
         if FieldByName('C_PRINT').AsInteger=1 then pr := true else pr := false;
         if FieldByName('C_ADDIT').AsInteger=1 then addit := true else addit := false;
      end
      else
      begin
        ed    := false;
        del   := false;
        pr    := false;
        addit := false;
      end;
      BitBtn1.Enabled     := ed;
      BitBtn2.Enabled     := pr;
      btn_price.Enabled   := addit;
      btnArchive.Enabled  := addit;
      btnDiscount.Enabled := addit;
      //btnSpecOffer.Enabled := addit;
      btnTruckSale.Enabled := addit;
      Close;
      Filter := '';
      Filtered := false;
  End;
end;



//
//  �������� �����  
//
procedure TStartF.BitBtn4Click(Sender: TObject);
begin
   Close;
end;
procedure TStartF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (MessageDlg('������� ����������?', mtConfirmation, [mbOk, mbNo], 0) = mrOk) then
  begin
     DM.STAR_DB.Close;
     Action := caFree;
  end
  else Action := caNone;
end;


// ����� � ����������
procedure TStartF.btn_priceClick(Sender: TObject);
begin
  if (imgcb_dept.ItemIndex >= 0) then
  begin
    frmPrice := TfrmPrice.Create(Application);
    try
      frmPrice.ShowModal;
    finally
      frmPrice.Free;
    end;
  end else MessageBox(Handle, '���������� ������� �����', '��������', MB_ICONWARNING);
end;


procedure TStartF.cbOfficesPropertiesChange(Sender: TObject);
begin
  DM.id_office   := cbOffices.EditValue;
end;


// �������� �����
procedure TStartF.btnArchiveClick(Sender: TObject);
begin
  if (imgcb_dept.ItemIndex >= 0) then
  begin
    frmPriceArchive := TfrmPriceArchive.Create(Application);
    try
      frmPriceArchive.ShowModal;
    finally
      frmPriceArchive.Free;
    end;
  end else MessageBox(Handle, '���������� ������� �����', '��������', MB_ICONWARNING);
end;


// ������� ��� �������������
procedure TStartF.btnDiscountClick(Sender: TObject);
begin
  if (imgcb_dept.ItemIndex >= 0) then
  begin
    frmClientSales := TfrmClientSales.Create(Application);
    try
      frmClientSales.ShowModal;
    finally
      frmClientSales.Free;
    end;
  end else MessageBox(Handle, '���������� ������� �����', '��������', MB_ICONWARNING);
end;

//%
procedure TStartF.btnEditPercentClick(Sender: TObject);
begin
  frmEditPercent.showmodal;
end;

// ����.�����������
procedure TStartF.btnSpecOfferClick(Sender: TObject);
begin
  frmSpecOrder.SpecOfferFormShow;
end;

// ������� � �����
procedure TStartF.btnTruckSaleClick(Sender: TObject);
begin
  frmTruckSale.TruckSaleFormShow;
end;

end.
