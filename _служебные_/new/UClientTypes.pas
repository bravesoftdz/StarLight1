unit UClientTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, star_lib, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxImageComboBox, cxLabel, cxButtonEdit,
  DBAccess, Ora, MemDS, DBClient, ActnList, dxBar, cxBarEditItem, dxBarExtItems,
  cxClasses, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, ImgList;

type
  TfrmClientTypes = class(TForm)
    grClientTypes: TcxGrid;
    grClientTypesView: TcxGridDBTableView;
    tview_TYPESnn: TcxGridDBColumn;
    tview_TYPESBRIEF: TcxGridDBColumn;
    tview_TYPESNAME: TcxGridDBColumn;
    tview_TYPEST_TYPE: TcxGridDBColumn;
    tview_TYPESDISCOUNT: TcxGridDBColumn;
    tview_TYPESINFO: TcxGridDBColumn;
    grClientTypesLevel: TcxGridLevel;
    bmMain: TdxBarManager;
    bmToolBar: TdxBar;
    bmFooter: TdxBar;
    btnRefresh: TdxBarLargeButton;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    imgOffice: TcxBarEditItem;
    imgOtdel: TcxBarEditItem;
    btnHelp: TdxBarLargeButton;
    btnExit: TdxBarLargeButton;
    cxBarEditItem3: TcxBarEditItem;
    cxBarEditItem4: TcxBarEditItem;
    cxBarEditItem1: TcxBarEditItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    cxBarEditItem2: TcxBarEditItem;
    AlMain: TActionList;
    aRefresh: TAction;
    aNew: TAction;
    aEdit: TAction;
    aDelete: TAction;
    Q_CT: TOraQuery;
    Q_CT_DS: TOraDataSource;
    SelQ: TOraQuery;
    tview_TYPESCONTRACTOR: TcxGridDBColumn;
    Q_CTID_CLIENT_TYPES: TIntegerField;
    Q_CTNAME: TStringField;
    Q_CTINFO: TStringField;
    Q_CTT_TYPE: TIntegerField;
    Q_CTDISCOUNT: TFloatField;
    Q_CTID_OFFICE: TIntegerField;
    Q_CTBRIEF: TStringField;
    Q_CTNN: TFloatField;
    Q_CTIS_CONTRACTOR: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aNewExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgOfficePropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure grClientTypesViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure Q_CT_DSDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    id_office: integer;
    function MainFormShow : boolean;
  end;

var
  frmClientTypes: TfrmClientTypes;

implementation

{$R *.dfm}

uses umain, UDM, uEditClientTypes;

function TfrmClientTypes.MainFormShow : boolean;
Begin
 if not Assigned(frmClientTypes) then
  begin
    frmClientTypes := TfrmClientTypes.Create(Application);
    try
      frmClientTypes.Show;
      LoadFormState(frmClientTypes); //�����.����
    finally
      null;
    end;
  end
  else
    if (frmClientTypes.WindowState = wsMinimized) then frmClientTypes.WindowState := wsNormal;
end;

procedure TfrmClientTypes.Q_CT_DSDataChange(Sender: TObject; Field: TField);
begin

end;

// �������� �� �������
procedure TfrmClientTypes.aDeleteExecute(Sender: TObject);
var idd: integer;
    cds : TcxGridDBTableView;
begin
  if ( (grClientTypes.ActiveView.DataController as TcxDBDataController).DataSet.RecordCount > 0 ) then
  begin
  
  if (id_office <> (grClientTypes.ActiveView.DataController as TcxDBDataController).DataSet.FieldByName('ID_OFFICE').AsInteger) then
  begin
    MessageBox(Handle,'������ ������ �� ����������� �������� �����. �������������� ���������!','��������!',MB_ICONERROR);
    exit;
  end;

  try
  cds := (grClientTypes.ActiveLevel.GridView as TcxGridDBTableView);

  if (cds.DataController.DataSource.DataSet.active) and (cds.DataController.DataSource.DataSet.RecordCount > 0) then
  begin
    if MessageDlg('�� ������������� ������ ������� ������?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
    begin
      selq.Close;
      selq.SQL.Clear;
      selq.SQL.Add('begin BOOKS.delete_record(:table_, :pk_, :id_); end;');

      // �������� ��������� SQL ������ �� ��������
      try
         selq.ParamByName('table_').AsString := 'BOOKS_CLIENT_TYPES';
         selq.ParamByName('pk_').AsString := 'ID_CLIENT_TYPES';
         selq.ParamByName('id_').AsInteger := Q_CT.FieldByName('ID_CLIENT_TYPES').Value;
         Q_CT.Next;
         idd := Q_CT.FieldByName('ID_CLIENT_TYPES').Value;
         selq.Execute;
         Q_CT.Refresh;
         Q_CT.Locate('ID_CLIENT_TYPES',idd,[]);
         selq.Close;
      except
        on E: Exception do
        begin
          if (StrPos(PChar(E.Message), PChar('01031')) <> nil) then MessageBox(Handle, '� ��� ��� ���� �� ������ ��������!', '�� ������� ��������� ��������!', MB_ICONERROR)
          else
            if (StrPos(PChar(E.Message), PChar('02292')) <> nil) then MessageBox(Handle, '��������� ������ ������������ � ������ ������ ��������!'+#10#13+'�������� �������� ������ �� ������������ ��������!', '�� ������� ��������� ��������!', MB_ICONERROR)
            else MessageBox(Handle, PChar(E.Message), '�� ������� ��������� ��������!', MB_ICONERROR);
          end;
        End;
    end;
  end
  else ShowMessage('� ���� ������ ��� ������� ��� ��������!');
  finally
    grClientTypes.SetFocus;
  end;
  end;
end;


// �������������� �������
procedure TfrmClientTypes.aEditExecute(Sender: TObject);
begin
  if ( (grClientTypes.ActiveView.DataController as TcxDBDataController).DataSet.RecordCount > 0 ) then
  begin

  if (id_office <> (grClientTypes.ActiveView.DataController as TcxDBDataController).DataSet.FieldByName('ID_OFFICE').AsInteger) then
  begin
    MessageBox(Handle,'������ ������ �� ����������� �������� �����. �������������� ���������!','��������!',MB_ICONERROR);
    exit;
  end;

  frmEditClientTypes := TfrmEditClientTypes.Create(Application);
  try
    if Q_CT.FieldByName('NAME').AsString <> '' then
    begin
      frmEditClientTypes.ttype := 6;
      frmEditClientTypes.Edit1.Tag := Q_CT.FieldByName('ID_CLIENT_TYPES').AsInteger;
      frmEditClientTypes.Edit1.Text := Q_CT.FieldByName('NAME').AsString;
      frmEditClientTypes.MEMO1.Text := Q_CT.FieldByName('INFO').AsString;
      frmEditClientTypes.Label6.Caption := '���� �������� :: ��������������';
      frmEditClientTypes.CheckBox1.Caption := ' ������ � ������������� � �����������';
      frmEditClientTypes.CheckBox1.Visible := true;
      if Q_CT.FieldByName('T_TYPE').AsInteger = 1 then frmEditClientTypes.checkbox1.checked := true else frmEditClientTypes.checkbox1.checked := false;
      frmEditClientTypes.Label7.Visible := true;
      frmEditClientTypes.Znak_EditPercent.Visible := true;
      frmEditClientTypes.DBNumberEditEh1.Visible := true;
      if (Q_CT.FieldByName('DISCOUNT').AsInteger>0) then frmEditClientTypes.Znak_EditPercent.ItemIndex:=1;
      if (Q_CT.FieldByName('DISCOUNT').AsInteger<0) then frmEditClientTypes.Znak_EditPercent.ItemIndex:=0;
      frmEditClientTypes.DBNumberEditEh1.Text:=inttostr(ABS(Q_CT.FieldByName('DISCOUNT').AsInteger));
      frmEditClientTypes.ShowModal;
      Q_CT.Refresh;
      Q_CT.Locate('ID_CLIENT_TYPES', frmEditClientTypes.Edit1.Tag, []);
    end;
  finally
    frmEditClientTypes.Free;
    grClientTypes.SetFocus;
  end;
  
  end;
end;

// ���������� � �������
procedure TfrmClientTypes.aNewExecute(Sender: TObject);
begin

  if id_office > 1 then
  begin
    MessageBox(Handle,'��� ������ ����������� ������ ����� ������� ���� ��������.','��������!',MB_ICONERROR);
    exit;
  end;
       
  frmEditClientTypes := TfrmEditClientTypes.Create(Application);

  try
    frmEditClientTypes.Znak_EditPercent.Visible := false;
    frmEditClientTypes.DBNumberEditEh1.Visible  := false;
    frmEditClientTypes.Edit1.Text               := '';
    frmEditClientTypes.Edit1.Tag                := 0;
    frmEditClientTypes.Memo1.Lines.Clear;
    frmEditClientTypes.ttype                    := 5;
    frmEditClientTypes.Label6.Caption           := '���� �������� :: ����������';
    frmEditClientTypes.CheckBox1.Visible        := true;
    frmEditClientTypes.CheckBox1.Caption        := ' ������ � ������������� � �����������';
    frmEditClientTypes.Label7.Visible           := true;
    frmEditClientTypes.DBNumberEditEh1.Visible  := true;
    frmEditClientTypes.Znak_EditPercent.Visible := true;
    frmEditClientTypes.ShowModal;
    Q_CT.Refresh;
    Q_CT.Locate('ID_CLIENT_TYPES', frmEditClientTypes.Edit1.Tag, []);
  finally
    frmEditClientTypes.Free;
    grClientTypes.SetFocus;
  end;

end;

// ���������� ������
procedure TfrmClientTypes.aRefreshExecute(Sender: TObject);
begin
//Q_CT.Refresh;
 Q_CT.Close;
 Q_CT.ParamByName('V_OFFICE').AsInteger :=  id_office;
 Q_CT.ParamByName('cursor_').DataType := ftCursor;
 Q_CT.Open;
 grClientTypes.SetFocus;
end;

// ����� �� �����
procedure TfrmClientTypes.btnExitClick(Sender: TObject);
begin
 if MessageDlg('������� ���������?',mtConfirmation,[mbYes, mbNo],0) = mrYes then Close;
end;

// �������� �����
procedure TfrmClientTypes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 SaveFormState(frmClientTypes);  //�����.����
  frmClientTypes := nil;
 Action := caFree;
end;

procedure TfrmClientTypes.FormCreate(Sender: TObject);
 var i:integer;
begin
 grClientTypes.Font.Size := intDefFont;
end;

//����� ����
procedure TfrmClientTypes.imgOfficePropertiesChange(Sender: TObject);
begin
 intDefOffice := imgOffice.EditValue;
  //DM.id_office := imgOffice.EditValue; //� ����� id_office ���� �����.���� ����������
 aRefresh.Execute;  //�������� �������
end;

procedure TfrmClientTypes.FormShow(Sender: TObject);
begin
 try
   dm.cxImgLst.GetBitmap(32, btnRefresh.largeGlyph);
   dm.cxImgLst.GetBitmap(4, btnAdd.largeGlyph);
   dm.cxImgLst.GetBitmap(5, btnedit.largeGlyph);
   dm.cxImgLst.GetBitmap(6, btnDelete.largeGlyph);
   dm.cxImgLst.GetBitmap(20, btnHelp.largeGlyph);
   dm.cxImgLst.GetBitmap(33, btnExit.largeGlyph);
   //AddN.Enabled    := DM.r_edit;
   //EditN.Enabled   := DM.r_edit;
   //DeleteN.Enabled := DM.r_delete;

  if (imgOffice.Enabled) then
  begin
   try
    id_office := GetOfficeID;
    imgOffice.Enabled := (id_office = 1);
    //grClientTypes.Columns[0].Visible := imgOffice.Enabled;

    imgOffice.Properties.OnChange := nil;
    SelQ.Close;
    SelQ.SQL.Clear;
    SelQ.SQL.Add('SELECT ID_OFFICE, OFFICE_NAME FROM OFFICES ORDER BY OFFICE_NAME');
    SelQ.Open;
    SelQ.Close;
    imgOffice.EditValue := id_office;
    imgOffice.Properties.OnChange := imgOfficePropertiesChange;

    Q_CT.ParamByName('v_office').AsInteger := id_office;
    Q_CT.Open;
   except
    on E: Exception do ShowMessage(E.Message);
   end;
  end;

 finally
  grClientTypes.SetFocus;
 end;
end;

procedure TfrmClientTypes.grClientTypesViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
 var val1: variant;
begin
 { if (not AViewInfo.Selected) and (grClientTypesView.DataController.DataSet.RecordCount > 0) then
  begin
    // ������ ���������������� 
    val1  := grClientTypesView.DataController.GetValue(
                AViewInfo.GridRecord.RecordIndex, grClientTypesView.GetColumnByFieldName('ID_OFFICE').Index
                );
    if (val1 <> id_office) then
    begin
        ACanvas.Font.Style := [fsItalic];
    end;
  end;   }
end;

end.
