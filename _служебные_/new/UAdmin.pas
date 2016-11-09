unit UAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, star_lib, Menus, cxLookAndFeelPainters, DBGridEhGrouping,
  ImgList, ActnList, ExtCtrls, GridsEh, DBGridEh, cxButtons, Mask, DBCtrlsEh,
  ComCtrls, DB, MemDS, DBAccess, Ora, cxGraphics, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, {PI_Library_reg,}
  cxLabel, cxButtonEdit, dxBar, cxBarEditItem, dxBarExtItems, cxClasses;

type
  TfrmAdmin = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Splitter1: TSplitter;
    Panel7: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    Label21: TLabel;
    Label1: TLabel;
    Label13: TLabel;
    ComboBox6: TComboBox;
    ComboBox1: TComboBox;
    ComboBox3: TDBComboBoxEh;
    BitBtn2: TcxButton;
    BitBtn1: TcxButton;
    BitBtn10: TcxButton;
    DBGridEh2: TDBGridEh;
    Panel2: TPanel;
    Panel15: TPanel;
    Label10: TLabel;
    ComboBox2: TDBComboBoxEh;
    BitBtn15: TcxButton;
    Panel13: TPanel;
    Label9: TLabel;
    DBGridEh3: TDBGridEh;
    TabSheet3: TTabSheet;
    Splitter2: TSplitter;
    Panel6: TPanel;
    DBGrid4: TDBGridEh;
    Panel5: TPanel;
    btnClients: TcxButton;
    Panel9: TPanel;
    Panel10: TPanel;
    Label7: TLabel;
    Panel11: TPanel;
    DBGrid3: TDBGridEh;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    DBGrid2: TDBGridEh;
    TabSheet4: TTabSheet;
    Panel17: TPanel;
    DBGridEh1: TDBGridEh;
    Panel18: TPanel;
    RadioGroup1: TRadioGroup;
    DBComboBoxEh1: TDBComboBoxEh;
    tsh_debetors: TTabSheet;
    Panel8: TPanel;
    Label3: TLabel;
    EhDebitors: TDBGridEh;
    ImageList1: TImageList;
    SelQ: TOraQuery;
    Q_EMPL: TOraQuery;
    Q_EMPLNN: TFloatField;
    Q_EMPLACTIVE: TIntegerField;
    Q_EMPLCCODE: TStringField;
    Q_EMPLFIO: TStringField;
    Q_EMPLID_CLIENTS: TIntegerField;
    Q_EMPLLOGIN: TStringField;
    Q_EMPLNICK: TStringField;
    Q_EMPLSTAFF: TIntegerField;
    Q_EMPLCOUNT: TIntegerField;
    Q_EMPLID_OFFICE: TIntegerField;
    Q_EMPLBRIEF: TStringField;
    Q_EMPL_DS: TOraDataSource;
    Q_SET_CASH: TOraQuery;
    Q_SET_CASHN_CASH: TIntegerField;
    Q_SET_CASHID_CLIENTS: TFloatField;
    Q_SET_CASHFIO: TStringField;
    Q_SET_CASHLOGIN: TStringField;
    Q_SET_CASHNICK: TStringField;
    Q_SET_CASHID_OFFICE: TIntegerField;
    Q_SET_CASHBRIEF: TStringField;
    Q_SET_CASH_DS: TOraDataSource;
    Q_PROGS: TOraQuery;
    Q_PROGSID_ADMIN_PROGRAMS: TIntegerField;
    Q_PROGSNAME: TStringField;
    Q_PROGSINFO: TStringField;
    Q_PROGS_DS: TOraDataSource;
    Q_GROUPS: TOraQuery;
    Q_GROUPSID_ROLE_GROUPS: TIntegerField;
    Q_GROUPSNAME: TStringField;
    Q_GROUPSINFO: TStringField;
    Q_GROUPSID_DEP: TIntegerField;
    Q_GROUPSDEP_NAME: TStringField;
    Q_GROUPSID_OFFICE: TIntegerField;
    Q_GROUPSBRIEF: TStringField;
    Q_GROUPS_DS: TOraDataSource;
    Q_SET_DEBITOR: TOraQuery;
    Q_SET_DEBITORDEBETORS: TFloatField;
    Q_SET_DEBITORFIO: TStringField;
    Q_SET_DEBITORLOGIN: TStringField;
    Q_SET_DEBITORNICK: TStringField;
    Q_SET_DEBITORID_OFFICE: TIntegerField;
    Q_SET_DEBITORBRIEF: TStringField;
    Q_SET_DEBITORID_CLIENTS: TIntegerField;
    Q_SET_DEBITOR_DS: TOraDataSource;
    Q_EM_PR: TOraQuery;
    Q_EM_PRID_EMPLOYEES: TIntegerField;
    Q_EM_PRID_ROLE_GROUPS: TIntegerField;
    Q_EM_PRNAME: TStringField;
    Q_EM_PRID_DEP: TIntegerField;
    Q_EM_PRDEP_NAME: TStringField;
    Q_EM_PR_DS: TOraDataSource;
    Q_GR_PR: TOraQuery;
    Q_GR_PRID_PROGRAMS: TIntegerField;
    Q_GR_PRID_ROLE_GROUPS: TIntegerField;
    Q_GR_PRC_START: TIntegerField;
    Q_GR_PRC_EDIT: TIntegerField;
    Q_GR_PRC_DEL: TIntegerField;
    Q_GR_PRC_PRINT: TIntegerField;
    Q_GR_PRC_ADDIT: TIntegerField;
    Q_GR_PRNAME: TStringField;
    Q_GR_PR_DS: TOraDataSource;
    Ora_SQL: TOraSQL;
    bmMain: TdxBarManager;
    bmToolBar: TdxBar;
    bmFooter: TdxBar;
    btnRefresh: TdxBarLargeButton;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    cxBarEditItem1: TcxBarEditItem;
    imgOtdel: TcxBarEditItem;
    btnHelp: TdxBarLargeButton;
    btnExit: TdxBarLargeButton;
    cxBarEditItem3: TcxBarEditItem;
    cxBarEditItem4: TcxBarEditItem;
    cxBarEditItem2: TcxBarEditItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    cxBarEditItem5: TcxBarEditItem;
    btnHotKeys: TdxBarButton;
    AlMain: TActionList;
    aRefresh: TAction;
    aNew: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aExit: TAction;
    ctrl_a: TAction;
    TabSheet5: TTabSheet;
    dxBarEdit1: TdxBarEdit;
    cxBarEditItem6: TcxBarEditItem;
    TabSheet6: TTabSheet;
    Panel3: TPanel;
    DBGridEh4: TDBGridEh;
    BitBtn7: TcxButton;
    BitBtn8: TcxButton;
    BitBtn9: TcxButton;
    imgoffice: TcxBarEditItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgOfficePropertiesChange(Sender: TObject);
    procedure Q_EMPLAfterScroll(DataSet: TDataSet);
    procedure Q_GROUPSAfterScroll(DataSet: TDataSet);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure ctrl_aExecute(Sender: TObject);
    procedure btnClientsClick(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure btnAddPermissionClick(Sender: TObject);
    procedure Q_PROGSAfterOpen(DataSet: TDataSet);
    procedure Action1Execute(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aNewExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure Q_GROUPSAfterOpen(DataSet: TDataSet);
    procedure Q_EMPLAfterRefresh(DataSet: TDataSet);
  private
    { Private declarations }
    p_read, p_edit, p_delete, p_print: boolean;
  public
    { Public declarations }
    page: integer;
    id_office: integer;
    function MainFormShow : boolean;
    procedure RefreshAll;
  end;

var
  frmAdmin: TfrmAdmin;

implementation

uses umain, UDM, uEditAdmins;

{$R *.dfm}

procedure TfrmAdmin.RefreshAll;
begin
  // �������� �����������
  Q_EMPL.AfterScroll := nil;
  Q_EMPL.Close;
  Q_EMPL.ParamByName('v_office').AsInteger := id_office;
  Q_EMPL.Open;
  Q_EMPL.AfterScroll := Q_EMPLAfterScroll;
  Q_SET_CASH.Close;
  Q_SET_CASH.ParamByName('v_office').AsInteger := id_office;
  Q_SET_CASH.Open;
  // �������� ��������
  Q_PROGS.Close;
  Q_PROGS.Open;
  // �������� �����
  Q_GROUPS.AfterScroll := nil;
  Q_GROUPS.Close;
  Q_GROUPS.ParamByName('v_office').AsInteger := id_office;
  Q_GROUPS.Open;
  Q_GROUPS.AfterScroll := Q_GROUPSAfterScroll;

  // �������� ���������
  Q_SET_DEBITOR.Close;
  Q_SET_DEBITOR.ParamByName('v_office').AsInteger := id_office;
  Q_SET_DEBITOR.Open;
end;

procedure TfrmAdmin.FormCreate(Sender: TObject);
 var i:integer;  recUserRules : TUserRules;
begin
  Application.CreateForm(TfrmEditAdmins, frmEditAdmins);

  DBGridEh2.SumList.Active := true;
  DBGrid4.SumList.Active := true;
  DBGrid2.SumList.Active := true;

for i:=0 to ComponentCount-1 do
 if (Components[i] is TControl) and  (Components[i] is TDBGridEH) then
 (Components[i] as TDBGridEH).Font.Size := intDefFont;

   // ��������� ���� �� ���������
  recUserRules  := getRules(DM.cdsRules,1);
  p_read        := recUserRules.r_read;
  p_edit        := recUserRules.r_edit;
  p_delete      := recUserRules.r_delete;
  p_print       := recUserRules.r_print;

  Btnadd.Enabled    := p_edit;
  Btnedit.Enabled   := p_edit;
  Btndelete.Enabled := p_delete;
end;

procedure TfrmAdmin.FormShow(Sender: TObject);
begin
 if (imgOffice.Enabled) then
  begin
   try
    id_office := GetOfficeID;
    imgOffice.Enabled := (id_office = 1);

    imgOffice.Properties.OnChange := nil;
    SelQ.Close;
    SelQ.SQL.Clear;
    SelQ.SQL.Add('SELECT ID_OFFICE, OFFICE_NAME FROM OFFICES ORDER BY OFFICE_NAME');
    SelQ.Open;
    RefreshAll;
    FillImgComboCx2(SelQ, imgOffice, '���...');
    SelQ.Close;
    imgOffice.EditValue := id_office;
   except
    on E: Exception do ShowMessage(E.Message);
   end;
  end;

  DBGridEh2.Columns.Items[1].Visible := imgOffice.Enabled;
  DBGridEh1.Columns.Items[0].Visible := imgOffice.Enabled;

  Btnadd.Enabled    := (GetOfficeID = 1);
  Btnedit.Enabled   := (GetOfficeID = 1);
  btndelete.Enabled := (GetOfficeID = 1);
end;

procedure TfrmAdmin.imgOfficePropertiesChange(Sender: TObject);
begin
 // DM.id_office := imgOffice.EditValue;
 // RefreshAll;
end;

function TfrmAdmin.MainFormShow : boolean;
Begin
 if not Assigned(frmAdmin) then
  begin
    frmAdmin := TfrmAdmin.Create(Application);
    try
      frmAdmin.Show;
      LoadFormState(frmAdmin); //�����.����
    finally
      null;
    end;
  end
  else
    if (frmAdmin.WindowState = wsMinimized) then frmAdmin.WindowState := wsNormal;
end;



procedure TfrmAdmin.Q_EMPLAfterRefresh(DataSet: TDataSet);
begin
 { FillComboEh(selq, DBComboBoxEh1, 'select id_clients, FIO from employees_view where (id_office = '+IntToStr(id_office)+' or '+IntToStr(id_office)+' = 0) and active=1 and login is not null order by FIO');
  selq.Close;
  Q_EMPLAfterScroll(nil);      }
end;

procedure TfrmAdmin.Q_EMPLAfterScroll(DataSet: TDataSet);
begin
    Q_EM_PR.Close;
    Q_EM_PR.ParamByName('role_').AsInteger := Q_EMPLID_CLIENTS.AsInteger;
    Q_EM_PR.ParamByName('v_office').AsInteger := id_office;
    Q_EM_PR.Open;
end;

// �������� ������ ��������
procedure TfrmAdmin.Q_GROUPSAfterOpen(DataSet: TDataSet);
begin
  ComboBox3.OnChange := nil;
  DBGrid4.DataSource := nil;

  FillComboOlmer(Q_GROUPS,ComboBox2,'�������� ������ ��� ����������...');
  FillComboOlmer(Q_GROUPS,ComboBox3,'���');

  DBGrid4.DataSource := Q_GROUPS_DS;
  ComboBox3.OnChange := ComboBox6Change;
  Q_GROUPSAfterScroll(nil);
end;

// ��������� ������ �������� ��� ������
procedure TfrmAdmin.Q_GROUPSAfterScroll(DataSet: TDataSet);
begin
    Q_GR_PR.Close;
    Q_GR_PR.ParamByName('role_').AsInteger := Q_GROUPSID_ROLE_GROUPS.AsInteger;
    Q_GR_PR.ParamByName('v_office').AsInteger := id_office;
    Q_GR_PR.Open;
end;

// �������� ������ �����������
procedure TfrmAdmin.Q_PROGSAfterOpen(DataSet: TDataSet);
begin
  frmEditAdmins.ComboBox1.Items.Clear;
  DBGrid2.DataSource := nil;

  FillComboOlmer(Q_PROGS,frmEditAdmins.ComboBox1,'');

  DBGrid2.DataSource := Q_PROGS_DS;
end;

// ���������� ������ � ��
procedure TfrmAdmin.Action1Execute(Sender: TObject);
begin
  if Q_GR_PR_DS.State = dsEdit then Q_GR_PR.Post;
end;

// ��������
procedure TfrmAdmin.aDeleteExecute(Sender: TObject);
 var ind, ind1, ind2: integer;
begin
try
// �������� � ���������� ������
if PageControl1.ActivePage.PageIndex=0 then begin
  if (Q_EM_PR.FieldByName('ID_EMPLOYEES').AsInteger > 0) then
  begin
    if (DM.id_office <> Q_EMPL.FieldByName('ID_OFFICE').AsInteger) and (DM.id_office > 0) then
    begin
      MessageBox(Handle,'������ ������ �� ����������� ������ �����. �������������� ���������!','��������!',MB_ICONERROR);
      exit;
    end;

    if MessageDlg('�� ������������� ������ ������� ������?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
    begin
      Ora_SQL.SQL.Clear;
      Ora_SQL.SQL.Add('begin admins.remove_role(:EMPL_ID_, :GROUP_ID_); end;' );
      Ora_SQL.ParamByName('EMPL_ID_').AsInteger :=  Q_EM_PR.FieldByName('ID_EMPLOYEES').AsInteger;
      Ora_SQL.ParamByName('GROUP_ID_').AsInteger := Q_EM_PR.FieldByName('ID_ROLE_GROUPS').AsInteger;

      // �������� ��������� SQL ������ �� ��������
      try
        Ora_SQL.Execute;
        Q_EM_PR.Refresh;
        DBGridEh3.SetFocus;
      except
        on E: Exception do
        begin
          if (StrPos(PChar(E.Message), PChar('01031')) <> nil) then ShowMessage('� ��� ��� ���� �� ������ ��������!')
          else  ShowMessage(E.Message);
        end;
      End;
    end;
  end;
end;

// �������� ������
if PageControl1.ActivePage.PageIndex=1 then begin
if  (Q_GROUPS.FieldByName('ID_ROLE_GROUPS').AsInteger > 0) then
begin
      if (DM.id_office <> Q_GROUPS.FieldByName('ID_OFFICE').AsInteger) and (DM.id_office > 0) then
      begin
        MessageBox(Handle,'������ ������ �� ����������� ������ �����. �������������� ���������!','��������!',MB_ICONERROR);
        exit;
      end;

  if MessageDlg('�� ������������� ������ ������� ������?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
  begin
    ind := Q_GROUPS.FieldByName('ID_ROLE_GROUPS').AsInteger;

    Ora_SQL.SQL.Clear;
    Ora_SQL.SQL.Add('begin admins.remove_role(:id_); end;' );
    Ora_SQL.ParamByName('id_').AsInteger :=  ind;

    // �������� ��������� SQL ������ �� ��������
    try

      Ora_SQL.Execute;
      Q_GROUPS.Refresh;
      Q_GR_PR.Refresh;
      DBGrid4.SetFocus;

    except
      on E: Exception do
      begin
        if (StrPos(PChar(E.Message), PChar('01031')) <> nil) then ShowMessage('� ��� ��� ���� �� ������ ��������!')
        else  ShowMessage(E.Message);
      end;
    End;
  end;
end
else ShowMessage('� ���� ������ ��� ������� ��� ��������!');
end;

// ������� ���������
if PageControl1.ActivePage.PageIndex=2 then begin
if  (Q_PROGS.FieldByName('ID_ADMIN_PROGRAMS').AsInteger > 0) then
begin
  if MessageDlg('�� ������������� ������ ������� ������?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
  begin

    Ora_SQL.SQL.Clear;
    Ora_SQL.SQL.Add('begin admins.remove_program(:id_); end;' );
    Ora_SQL.ParamByName('id_').AsInteger :=  Q_PROGS.FieldByName('ID_ADMIN_PROGRAMS').AsInteger;

    // �������� ��������� SQL ������ �� ��������
    try
      Ora_SQL.Execute;
      Q_PROGS.Refresh;

      ShowMessage('�������� ������ �������.');
    except
      on E: Exception do
      begin
        if (StrPos(PChar(E.Message), PChar('01031')) <> nil) then ShowMessage('� ��� ��� ���� �� ������ ��������!')
        else
        begin
          if (StrPos(PChar(E.Message), PChar('02292')) <> nil) then ShowMessage('��������� ������������ � �������!'#10#13'������� ��������� �� ���� �����')
          else  ShowMessage(E.Message);
        end;
      end;
    End;
  end;
end
else ShowMessage('� ���� ������ ��� ������� ��� ��������!');
end;

//������� ������ � ������
if PageControl1.ActivePage.PageIndex=3 then begin
     if MessageDlg('�� ������������� ������ ������� ������?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
    begin

        Ora_SQL.SQL.Clear;
        Ora_SQL.SQL.Add('begin admins.remove_cash(:cash_, :id_client_); end;' );
        Ora_SQL.ParamByName('cash_').AsInteger :=  Q_SET_CASHN_CASH.AsInteger;
        Ora_SQL.ParamByName('id_client_').AsInteger :=  Q_SET_CASHID_CLIENTS.AsInteger;

        // �������� ��������� SQL ������
        try
          Ora_SQL.Execute;


          Q_SET_CASH.Refresh;
        except
          on E: Exception do
          begin
            if (StrPos(PChar(E.Message), PChar('01031')) <> nil) then ShowMessage('� ��� ��� ���� �� ������ ��������!')
            else  ShowMessage(E.Message);
          end;
        End;
    end;
end;

// ������� ������ � ���������
if PageControl1.ActivePage.PageIndex=4 then begin
  if MessageDlg('�� ������������� ������ ������� ������?',mtConfirmation,[mbYes, mbNo],0) = mrNo then exit;
  try
    selq.Close;
    selq.SQL.Clear;
    selq.SQL.Add('delete from DEBETOR_PERMISSIONS where USER_ID = :p1');
    selq.ParamByName('p1').AsInteger := Q_SET_DEBITORID_CLIENTS.AsInteger;
    selq.Execute;
    dm.OraSession.Commit;
    Q_SET_DEBITOR.Refresh;
  except
     on E: Exception do ShowMessage(E.Message);
  end;
end;

if PageControl1.ActivePage.PageIndex=5 then begin

end;

// �������� ���� �������
if PageControl1.ActivePage.PageIndex=6 then begin
if  (Q_GR_PR.FieldByName('ID_ROLE_GROUPS').AsInteger > 0) then
begin
    if (DM.id_office <> Q_EMPL.FieldByName('ID_OFFICE').AsInteger) and (DM.id_office > 0) then
    begin
      MessageBox(Handle,'������ ������ �� ����������� ������ �����. �������������� ���������!','��������!',MB_ICONERROR);
      exit;
    end;

  if MessageDlg('�� ������������� ������ ������� ������?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
  begin
    ind1 := Q_GR_PR.FieldByName('ID_ROLE_GROUPS').AsInteger;
    ind2 := Q_GR_PR.FieldByName('ID_PROGRAMS').AsInteger;

    Ora_SQL.SQL.Clear;
    Ora_SQL.SQL.Add('begin admins.remove_role_program(:GROUP_ID_, :PROG_ID_); end;');
    Ora_SQL.ParamByName('GROUP_ID_').Value := ind1;
    Ora_SQL.ParamByName('PROG_ID_').Value := ind2;

    // �������� ��������� SQL ������ �� ��������
    try

      Ora_SQL.Execute;
      Q_GR_PR.Refresh;
      DBGrid3.SetFocus;

    except
      on E: Exception do
      begin
        if (StrPos(PChar(E.Message), PChar('01031')) <> nil) then ShowMessage('� ��� ��� ���� �� ������ ��������!')
        else  ShowMessage(E.Message);
      end;
    End;
  end;
end
else ShowMessage('� ���� ������ ��� ������� ��� ��������!');
end;

finally
end;
end;

// ��������������
procedure TfrmAdmin.aEditExecute(Sender: TObject);
 var ind: integer;
begin
try
if PageControl1.ActivePage.PageIndex=0 then begin

end;

// �������������� ������
if PageControl1.ActivePage.PageIndex=1 then begin
    page:=2;
    if (Q_GROUPS.FieldByName('NAME').AsString <> '') then
    begin
      if (DM.id_office <> Q_GROUPS.FieldByName('ID_OFFICE').AsInteger) and (DM.id_office > 0) then
      begin
        MessageBox(Handle,'������ ������ �� ����������� ������ �����. �������������� ���������!','��������!',MB_ICONERROR);
        exit;
      end;

      frmEditAdmins.ttype := 4;
      frmEditAdmins.Edit1.Text := Q_GROUPS.FieldByName('NAME').AsString;
      frmEditAdmins.MEMO1.Text := Q_GROUPS.FieldByName('INFO').AsString;
      frmEditAdmins.Label6.Caption := '������ �����';
      frmEditAdmins.Edit1.Tag := Q_GROUPS.FieldByName('ID_ROLE_GROUPS').AsInteger;
      frmEditAdmins.Store_DepsCBEx.Tag := Q_GROUPS.FieldByName('ID_DEP').AsInteger;
      frmEditAdmins.ShowModal;
      DBGrid4.SetFocus;
    end;
end;

// �������������� ���������
if PageControl1.ActivePage.PageIndex=2 then begin
    page:=2;
    if (Q_PROGS.FieldByName('NAME').AsString <> '') then
    begin
      frmEditAdmins.ttype := 2;
      frmEditAdmins.Edit1.Text := Q_PROGS.FieldByName('NAME').AsString;
      frmEditAdmins.MEMO1.Text := Q_PROGS.FieldByName('INFO').AsString;
      frmEditAdmins.Label6.Caption := '������ ��������';
      frmEditAdmins.Edit1.Tag := Q_PROGS.FieldByName('ID_ADMIN_PROGRAMS').AsInteger;
      frmEditAdmins.ShowModal;
      DBGrid2.SetFocus;
    end;
end;

if PageControl1.ActivePage.PageIndex=3 then begin

end;

if PageControl1.ActivePage.PageIndex=4 then begin

end;

if PageControl1.ActivePage.PageIndex=5 then begin

end;

// �������������� ���� �������
if PageControl1.ActivePage.PageIndex=6 then begin
  page:=1;
  if (Q_GR_PR.FieldByName('ID_ROLE_GROUPS').AsInteger > 0) then
  begin
    if (DM.id_office <> Q_EMPL.FieldByName('ID_OFFICE').AsInteger) and (DM.id_office > 0) then
    begin
      MessageBox(Handle,'������ ������ �� ����������� ������ �����. �������������� ���������!','��������!',MB_ICONERROR);
      exit;
    end;

    frmEditAdmins.ttype := 2;

    ind := frmEditAdmins.ComboBox1.Items.IndexOf(Q_GR_PR.FieldByName('NAME').AsString);
    frmEditAdmins.ComboBox1.ItemIndex := ind;
    frmEditAdmins.ComboBox1.Enabled := false;

    if Q_GR_PR.FieldByName('C_START').AsInteger = 1 then frmEditAdmins.CheckBox3.checked := true else frmEditAdmins.CheckBox3.checked := false;
    if Q_GR_PR.FieldByName('C_EDIT').AsInteger = 1 then frmEditAdmins.CheckBox4.checked := true else frmEditAdmins.CheckBox4.checked := false;
    if Q_GR_PR.FieldByName('C_DEL').AsInteger = 1 then frmEditAdmins.CheckBox5.checked := true else frmEditAdmins.CheckBox5.checked := false;
    if Q_GR_PR.FieldByName('C_PRINT').AsInteger = 1 then frmEditAdmins.CheckBox6.checked := true else frmEditAdmins.CheckBox6.checked := false;
    if Q_GR_PR.FieldByName('C_ADDIT').AsInteger = 1 then frmEditAdmins.CheckBox7.checked := true else frmEditAdmins.CheckBox7.checked := false;
    frmEditAdmins.ComboBox1.Tag := Q_GR_PR.FieldByName('ID_PROGRAMS').AsInteger;
    frmEditAdmins.ShowModal;
    DBGrid3.SetFocus;
  end;
end;

finally
end;
end;

procedure TfrmAdmin.aExitExecute(Sender: TObject);
begin
  Close;
end;

// ����������
procedure TfrmAdmin.aNewExecute(Sender: TObject);
begin
try
// ���������� ���������� ������
if PageControl1.ActivePage.PageIndex=0 then begin
  if (ComboBox2.ItemIndex > 0) then
  begin
    if (DM.id_office <> Q_EMPL.FieldByName('ID_OFFICE').AsInteger) and (DM.id_office > 0) then
    begin
      MessageBox(Handle,'������ ������ �� ����������� ������ �����. �������������� ���������!','��������!',MB_ICONERROR);
      exit;
    end;   

     Ora_SQL.SQL.Clear;
     Ora_SQL.SQL.Add('begin admins.add_role(:EMPL_ID_, :GROUP_ID_); end;' );
     Ora_SQL.ParamByName('EMPL_ID_').AsInteger :=  Q_EMPL.FieldByName('ID_CLIENTS').AsInteger;
     Ora_SQL.ParamByName('GROUP_ID_').AsInteger :=  ComboBox2.Value;

     // �������� ��������� SQL ������
     try
        Ora_SQL.Execute;
        Q_EM_PR.Refresh;
        DBGridEh3.SetFocus;

      except
        on E: Exception do
        begin
          if (StrPos(PChar(E.Message), PChar('01031')) <> nil) then ShowMessage('� ��� ��� ���� �� ������ ��������!')
          else
          begin
            if (StrPos(PChar(E.Message), PChar('20001')) <> nil) then ShowMessage('��������� ������ ��� ��������� � ����������!')
          else  ShowMessage(E.Message);
          end;
        end;
      End;
  end;
end;

// ���������� ������
if PageControl1.ActivePage.PageIndex=1 then begin
    page:=2;
    frmEditAdmins.ttype := 3;
    frmEditAdmins.Edit1.Text := '';
    frmEditAdmins.Memo1.Lines.Clear;
    frmEditAdmins.Label6.Caption := '������ �����';
    frmEditAdmins.Edit1.Tag := 0;
    frmEditAdmins.Store_DepsCBEx.Tag := 0;
    frmEditAdmins.ShowModal;
    DBGrid4.SetFocus;
end;

// ���������� ���������
if PageControl1.ActivePage.PageIndex=2 then begin
    page:=2;
    frmEditAdmins.ttype := 1;
    frmEditAdmins.Edit1.Text := '';
    frmEditAdmins.Memo1.Lines.Clear;
    frmEditAdmins.Label6.Caption := '������ ��������';
    frmEditAdmins.Edit1.Tag := 0;
    frmEditAdmins.ShowModal;
    DBGrid2.SetFocus;
end;

// ���������� ������� � ������ 
if PageControl1.ActivePage.PageIndex=3 then begin
  If DBComboBoxEh1.ItemIndex > -1 then
  begin
      if Q_SET_CASH.Locate('N_CASH;ID_CLIENTS', VarArrayOf([(RadioGroup1.itemindex+1), DBComboBoxEh1.Value]), []) = false then
      begin

        Ora_SQL.SQL.Clear;
        Ora_SQL.SQL.Add('begin admins.set_cash(:cash_, :id_client_); end;' );
        Ora_SQL.ParamByName('cash_').AsInteger :=  (RadioGroup1.itemindex+1);
        Ora_SQL.ParamByName('id_client_').AsInteger :=  DBComboBoxEh1.Value;

        // �������� ��������� SQL ������
        try
          Ora_SQL.Execute;
          Q_SET_CASH.Refresh;
          Q_SET_CASH.Locate('N_CASH;ID_CLIENTS', VarArrayOf([(RadioGroup1.itemindex+1), DBComboBoxEh1.Value]), []);
        except
          on E: Exception do
          begin
            if (StrPos(PChar(E.Message), PChar('01031')) <> nil) then ShowMessage('� ��� ��� ���� �� ������ ��������!')
            else  ShowMessage(E.Message);
          end;
        End;
      end;
  end;
end;

// �������� ������ � ���������
if PageControl1.ActivePage.PageIndex=4 then begin
    page:=4;
    frmEditAdmins.DBComboBoxEh2.Tag := 0;
    frmEditAdmins.Label1.Caption   := '���������:';
    frmEditAdmins.showmodal;
    Q_SET_DEBITOR.Refresh;
    Q_SET_DEBITOR.Locate('id_clients',frmEditAdmins.DBComboBoxEh2.Tag,[]);
    EhDebitors.SetFocus;
end;

if PageControl1.ActivePage.PageIndex=5 then begin

end;

// �������� ������ � ������
if PageControl1.ActivePage.PageIndex=6 then begin
    page:=1;
    frmEditAdmins.ttype := 1;
    frmEditAdmins.ComboBox1.ItemIndex := -1;
    frmEditAdmins.CheckBox3.checked := false;
    frmEditAdmins.CheckBox4.checked := false;
    frmEditAdmins.CheckBox5.checked := false;
    frmEditAdmins.CheckBox6.checked := false;
    frmEditAdmins.CheckBox7.checked := false;
    frmEditAdmins.ComboBox1.Enabled := true;
    frmEditAdmins.ComboBox1.Tag := 0;
    frmEditAdmins.ShowModal;
    DBGrid3.SetFocus;
end;
finally
end;
end;

procedure TfrmAdmin.aRefreshExecute(Sender: TObject);
var idd: integer;
begin
if (pageControl1.ActivePageIndex = 0) then
begin
  idd := Q_EMPLID_CLIENTS.AsInteger;
  Q_EMPL.Refresh;
  Q_EMPL.Locate('ID_CLIENTS',idd,[]);
  DBGridEh2.SetFocus;
end;
if (pageControl1.ActivePageIndex = 1) then
begin
  idd := Q_GROUPSID_ROLE_GROUPS.AsInteger;
  Q_GROUPS.Refresh;
  Q_GROUPS.Locate('ID_ROLE_GROUPS',idd,[]);
  DBGrid4.SetFocus;
end;
if (pageControl1.ActivePageIndex = 2) then
begin
  Q_PROGS.Refresh;
  DBGrid2.SetFocus;
end;
if (pageControl1.ActivePageIndex = 3) then
begin
  Q_SET_CASH.Refresh;
  DBGridEh1.SetFocus;
end;
end;

procedure TfrmAdmin.BitBtn10Click(Sender: TObject);
begin
if (Q_EMPL.FieldByName('ID_CLIENTS').AsInteger > 0) then
begin
  if (DM.id_office <> Q_EMPL.FieldByName('ID_OFFICE').AsInteger) and (DM.id_office > 0) then
  begin
    MessageBox(Handle,'������ ������ �� ����������� �������� �����. �������������� ���������!','��������!',MB_ICONERROR);
    exit;
  end;

  if (Q_EMPL.FieldByName('LOGIN').AsString <> '') then showmessage('������ ��������� ��� ����� ������� ������!'+#10#13+'�� ������ �������� ������ ��� ������� ��!')
  else
  begin
    frmEditAdmins.Edit10.Text := '';
    frmEditAdmins.MaskEdit1.Text := '';
    frmEditAdmins.MaskEdit2.Text := '';

    frmEditAdmins.ShowModal;
    DBGridEh2.SetFocus;
  end;
end;
end;


procedure TfrmAdmin.BitBtn15Click(Sender: TObject);
begin
  If (ComboBox2.ItemIndex > 0) then
  begin
    Q_GROUPS.Locate('NAME',ComboBox2.Text,[]);
    PageControl1.ActivePageIndex := 1;
  end;
end;

 procedure TfrmAdmin.BitBtn19Click(Sender: TObject);
begin

end;

//������ ������ � ��
procedure TfrmAdmin.BitBtn1Click(Sender: TObject);
var ind: integer;
begin
  if (DM.id_office <> Q_EMPL.FieldByName('ID_OFFICE').AsInteger) and (DM.id_office > 0) then
  begin
    MessageBox(Handle,'������ ������ �� ����������� �������� �����. �������������� ���������!','��������!',MB_ICONERROR);
    exit;
  end;

  if (Q_EMPL.FieldByName('LOGIN').AsString = '') then showmessage('������ ��������� �� ����� ������� ������!'+#10#13+'���������� ������� ������� ������� ������!')
  else
    begin
      if MessageDlg('�� ������������� ������ ������ ������ � ��?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
      begin
          ind := Q_EMPL.FieldByName('ID_CLIENTS').AsInteger;
          Ora_SQL.SQL.Clear;
          Ora_SQL.SQL.Add('begin admins.remove_pass(:user_, :id_); end;' );
          Ora_SQL.ParamByName('user_').AsString :=  Q_EMPL.FieldByName('LOGIN').AsString;
          Ora_SQL.ParamByName('id_').AsInteger :=  ind;

          // �������� ��������� SQL ������
          try
            Ora_SQL.Execute;
            Q_EMPL.Refresh;
            Q_EMPL.Locate('ID_CLIENTS',ind,[]);
            ShowMessage('�������� ������ �������.');
            DBGridEh2.SetFocus;
          except
            on E: Exception do
            begin
              if (StrPos(PChar(E.Message), PChar('01031')) <> nil) then ShowMessage('� ��� ��� ���� �� ������ ��������!')
              else  ShowMessage(E.Message);
            end;
          End;
      end;
  end;
end;

//����� ������
procedure TfrmAdmin.BitBtn2Click(Sender: TObject);
var id: integer;
begin
  if (DM.id_office <> Q_EMPL.FieldByName('ID_OFFICE').AsInteger) and (DM.id_office > 0) then
  begin
    MessageBox(Handle,'������ ������ �� ����������� �������� �����. �������������� ���������!','��������!',MB_ICONERROR);
    exit;
  end;

  if (Q_EMPL.FieldByName('LOGIN').AsString = '') then showmessage('������ ��������� �� ����� ������� ������!'+#10#13+'���������� ������� ������� ������� ������!')
  else
  begin
    id := Q_EMPL.FieldByName('ID_CLIENTS').AsInteger;
    frmEditAdmins.Edit10.Text := Q_EMPL.FieldByName('LOGIN').AsString;
    frmEditAdmins.MaskEdit1.Text := '';
    frmEditAdmins.MaskEdit2.Text := '';

    frmEditAdmins.ShowModal;
    Q_EMPL.Locate('ID_CLIENTS',id,[]);
    DBGridEh2.SetFocus;
  end;
end;


procedure TfrmAdmin.BitBtn7Click(Sender: TObject);
begin
    page:=1;
    frmEditAdmins.ttype := 1;
    frmEditAdmins.ComboBox1.ItemIndex := -1;
    frmEditAdmins.CheckBox3.checked := false;
    frmEditAdmins.CheckBox4.checked := false;
    frmEditAdmins.CheckBox5.checked := false;
    frmEditAdmins.CheckBox6.checked := false;
    frmEditAdmins.CheckBox7.checked := false;
    frmEditAdmins.ComboBox1.Enabled := true;
    frmEditAdmins.ComboBox1.Tag := 0;
    frmEditAdmins.ShowModal;
    DBGrid3.SetFocus;
end;

procedure TfrmAdmin.BitBtn8Click(Sender: TObject);
 var ind: integer;
begin
  page:=1;
  if (Q_GR_PR.FieldByName('ID_ROLE_GROUPS').AsInteger > 0) then
  begin
    if (DM.id_office <> Q_EMPL.FieldByName('ID_OFFICE').AsInteger) and (DM.id_office > 0) then
    begin
      MessageBox(Handle,'������ ������ �� ����������� ������ �����. �������������� ���������!','��������!',MB_ICONERROR);
      exit;
    end;

    frmEditAdmins.ttype := 2;

    ind := frmEditAdmins.ComboBox1.Items.IndexOf(Q_GR_PR.FieldByName('NAME').AsString);
    frmEditAdmins.ComboBox1.ItemIndex := ind;
    frmEditAdmins.ComboBox1.Enabled := false;

    if Q_GR_PR.FieldByName('C_START').AsInteger = 1 then frmEditAdmins.CheckBox3.checked := true else frmEditAdmins.CheckBox3.checked := false;
    if Q_GR_PR.FieldByName('C_EDIT').AsInteger = 1 then frmEditAdmins.CheckBox4.checked := true else frmEditAdmins.CheckBox4.checked := false;
    if Q_GR_PR.FieldByName('C_DEL').AsInteger = 1 then frmEditAdmins.CheckBox5.checked := true else frmEditAdmins.CheckBox5.checked := false;
    if Q_GR_PR.FieldByName('C_PRINT').AsInteger = 1 then frmEditAdmins.CheckBox6.checked := true else frmEditAdmins.CheckBox6.checked := false;
    if Q_GR_PR.FieldByName('C_ADDIT').AsInteger = 1 then frmEditAdmins.CheckBox7.checked := true else frmEditAdmins.CheckBox7.checked := false;
    frmEditAdmins.ComboBox1.Tag := Q_GR_PR.FieldByName('ID_PROGRAMS').AsInteger;
    frmEditAdmins.ShowModal;
    DBGrid3.SetFocus;
  end;
end;

procedure TfrmAdmin.BitBtn9Click(Sender: TObject);
 var ind1,ind2: integer;
begin
if  (Q_GR_PR.FieldByName('ID_ROLE_GROUPS').AsInteger > 0) then
begin
    if (DM.id_office <> Q_EMPL.FieldByName('ID_OFFICE').AsInteger) and (DM.id_office > 0) then
    begin
      MessageBox(Handle,'������ ������ �� ����������� ������ �����. �������������� ���������!','��������!',MB_ICONERROR);
      exit;
    end;

  if MessageDlg('�� ������������� ������ ������� ������?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
  begin
    ind1 := Q_GR_PR.FieldByName('ID_ROLE_GROUPS').AsInteger;
    ind2 := Q_GR_PR.FieldByName('ID_PROGRAMS').AsInteger;

    Ora_SQL.SQL.Clear;
    Ora_SQL.SQL.Add('begin admins.remove_role_program(:GROUP_ID_, :PROG_ID_); end;');
    Ora_SQL.ParamByName('GROUP_ID_').Value := ind1;
    Ora_SQL.ParamByName('PROG_ID_').Value := ind2;

    // �������� ��������� SQL ������ �� ��������
    try

      Ora_SQL.Execute;
      Q_GR_PR.Refresh;
      DBGrid3.SetFocus;

    except
      on E: Exception do
      begin
        if (StrPos(PChar(E.Message), PChar('01031')) <> nil) then ShowMessage('� ��� ��� ���� �� ������ ��������!')
        else  ShowMessage(E.Message);
      end;
    End;
  end;
end
else ShowMessage('� ���� ������ ��� ������� ��� ��������!');
end;

procedure TfrmAdmin.btnAddPermissionClick(Sender: TObject);
begin

end;

// ���������� ����������� � ��������� ������
procedure TfrmAdmin.btnClientsClick(Sender: TObject);
begin
  if not Q_GROUPS.Active or (Q_GROUPS.RecordCount = 0) then exit;
  frmEditAdmins.OpenForUpdate(DM.OraSession, Q_GROUPSID_ROLE_GROUPS.AsInteger, Q_GROUPSNAME.AsString);
end;

// ������ �����������
procedure TfrmAdmin.ComboBox6Change(Sender: TObject);
var sql: string;
begin

  sql := 'SELECT NN, ACTIVE, CCODE, FIO, ID_CLIENTS, LOGIN, NICK, STAFF, COUNT, id_office, brief from employees_view WHERE (id_office = '+IntToStr(DM.id_office)+' or '+IntToStr(DM.id_office)+' = 0) ';
  if (ComboBox6.ItemIndex = 1) then  sql := sql + ' AND LOGIN is not null';
  if (ComboBox6.ItemIndex = 2) then  sql := sql + ' AND LOGIN is null';

  if (ComboBox1.ItemIndex = 1) then  sql := sql + ' AND ACTIVE = 1';
  if (ComboBox1.ItemIndex = 2) then  sql := sql + ' AND ACTIVE = 0';

  if (ComboBox3.ItemIndex > 0) then
    sql := sql + ' AND ID_CLIENTS IN (SELECT ID_EMPLOYEES FROM ADMIN_EMPLOYEES_ROLE_GROUPS WHERE ID_ROLE_GROUPS='+IntToStr(ComboBox3.Value)+')';

  Q_EMPL.Close;
  Q_EMPL.SQL.Clear;
  Q_EMPL.SQL.Add(sql);

  try
    Q_EMPL.Open;
    DBGridEh2.SetFocus;
  except
    on E: Exception do ShowMessage(E.Message);
  End;
end;

procedure TfrmAdmin.ctrl_aExecute(Sender: TObject);
begin

end;

//  ���������� ������
procedure TfrmAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('������� ���������?',mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    Action := caNone
  else
  begin
    DBGridEh2.SumList.Active := false;
    DBGrid4.SumList.Active := false;
    DBGrid2.SumList.Active := false;
    SaveFormState(frmAdmin); //�����.����
    frmAdmin := nil;
    Action := caFree;
  end;
end;

end.
