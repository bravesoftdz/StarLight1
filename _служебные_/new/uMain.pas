unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, star_lib,
  Dialogs, Menus, AppEvnts, ActnList, StdActns, StdCtrls,  Buttons, ExtCtrls, ComCtrls,
  ToolWin, ImgList,IniFiles, ActnMan, ActnCtrls,UDM, DateUtils, DB, MemDS, DBAccess, Ora,
  cxGraphics, ShellAPI;

  type
  POraSession = ^TOraSession;

// ��������� ������������ ������
type
  TRecResult  = record
    intCodeErr   : Integer;    // ��� ������
    strMsgErr    : WideString; // ��������� �� ������
  end;

// ��������� ������������ ������ ������ ��������/�������
type TRecParams = record
     intADD     :Integer;  // ����������
     intEDIT    :Integer;  // ��������������
     intDELETE  :Integer;  // ��������
     intPRINT   :Integer;  // ������
     intPARAM1  :Integer;  // ���. �������� 1
     intPARAM2  :Integer;  // ���. �������� 2
     intPARAM3  :Integer;  // ���. �������� 3
end;

//������������� ������� ��� ��������/�������� ��������/�������
type
  TCreateChildForm  = function(DllHandle:THandle;
                               AppHandle:TApplication;
                               AppScreen:TScreen;
                               AppHintWindowClass:THintWindowClass;
                               FormHandle:THandle;
                               OraSessConnString:AnsiString;
                               recParams:TRecParams):TRecResult;stdcall;
type
  TDestroyChildForm = function():TRecResult;stdcall;

type
  TfrmMain = class(TForm)
    mmMain: TMainMenu;
    micom: TMenuItem;
    miEdit: TMenuItem;
    miByx: TMenuItem;
    miOtdels: TMenuItem;
    miZP: TMenuItem;
    mnNSI: TMenuItem;
    miTools: TMenuItem;
    miWindow: TMenuItem;
    miHelp: TMenuItem;
    miExit: TMenuItem;
    mmiStatis: TMenuItem;
    mmiSec: TMenuItem;
    mmiUndo: TMenuItem;
    mmiCut: TMenuItem;
    mmiCopy: TMenuItem;
    mmiPaste: TMenuItem;
    mmiKasses: TMenuItem;
    mmiKasSvod: TMenuItem;
    mmiZakaz: TMenuItem;
    mmiRazZakaz: TMenuItem;
    mmiInvoice: TMenuItem;
    mmiSklad: TMenuItem;
    mmiPrices: TMenuItem;
    mmiPrList: TMenuItem;
    mnNSI_Currency: TMenuItem;
    mmiAdminTools: TMenuItem;
    mmiSettings: TMenuItem;
    mmiWindowCascade: TMenuItem;
    mmiWindowTileHor: TMenuItem;
    mmiWindowTileVer: TMenuItem;
    mmiWindowMinimize: TMenuItem;
    mmiWindowArrange: TMenuItem;
    mmiAbout: TMenuItem;
    apevMain: TApplicationEvents;
    actlstMain: TActionList;
    mmiPretenz: TMenuItem;
    mmiByx: TMenuItem;
    EditUndo: TEditUndo;
    EditCut: TEditCut;
    EditCopy: TEditCopy;
    EditPaste: TEditPaste;
    actAbout: TAction;
    stbMain: TStatusBar;
    ActHelp: TAction;
    mmiaHelp: TMenuItem;
    WindowCascade: TAction;
    WindowTileHorizontal: TAction;
    WindowTileVertical: TAction;
    WindowMinimizeAll: TAction;
    WindowArrangeAll: TAction;
    mnNSI_Regions: TMenuItem;
    mnNSI_Cityes: TMenuItem;
    mnNSI_Adver: TMenuItem;
    mnNSI_ClientsType: TMenuItem;
    mnNSI_Dep: TMenuItem;
    mnNSI_Job: TMenuItem;
    mnNSI_Countries: TMenuItem;
    mnNSI_Supplier: TMenuItem;
    mnNSI_pcs: TMenuItem;
    miNomen: TMenuItem;
    miNomen_Nom: TMenuItem;
    miNomen_Name: TMenuItem;
    miNomen_SupName: TMenuItem;
    miNomen_TS: TMenuItem;
    miNomen_Colour: TMenuItem;
    miNomen_Spec: TMenuItem;
    miNomen_Fas: TMenuItem;
    miClient: TMenuItem;
    miClient_Reg: TMenuItem;
    miClient_Deb: TMenuItem;
    mmiFito: TMenuItem;
    mmiSpez: TMenuItem;
    procedure actAboutExecute(Sender: TObject);
    procedure mnNSI_CurrencyClick(Sender: TObject);
    procedure mmiSettingsClick(Sender: TObject);
    procedure mmiAdminToolsClick(Sender: TObject);
    procedure apevMainHint(Sender: TObject);
    procedure apevMainMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActHelpExecute(Sender: TObject);
    procedure WindowCascadeExecute(Sender: TObject);
    procedure WindowMinimizeAllExecute(Sender: TObject);
    procedure WindowArrangeAllExecute(Sender: TObject);
    procedure WindowTileHorizontalExecute(Sender: TObject);
    procedure WindowTileVerticalExecute(Sender: TObject);
    procedure mnNSI_RegionsClick(Sender: TObject);
    procedure mnNSI_CityesClick(Sender: TObject);
    procedure mnNSI_AdverClick(Sender: TObject);
    procedure mnNSI_ClientsTypeClick(Sender: TObject);
  private
    { Private declarations }
    porasessStarLight: POraSession;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses info_f, UNSICurrency, USettings, UAdmin, Orient, UReg, UCity, UPromo, UClientTypes;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// BOF - ������ �� ����������� + ����/�����
////////////////////////////////////////////////////////////////////////////////

// ������� ����� �������
procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageBox(Application.Handle,'�� ������������� ������ ����� �� ��������� ?',
                PChar(Format('%s',[Application.Title])),MB_ICONQUESTION + MB_YESNO + mb_DefButton2 ) = mrYES then
     CanClose := True
  else CanClose := False;
end;

// ����� ����� � 2_���������:
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //porasessStarLight := @DM.OraSession;
  stbMain.Panels[0].Text := verApplication;
  stbMain.Panels[1].Text := ' ������: ['+strServerName+':'+IntToStr(intServerPort)+'] ';
  stbMain.Panels[2].Text := ' ������������: ['+strUserName+'] ';
  stbMain.Refresh;
  self.Caption := Application.Title;
end;


// ����� �������
procedure TfrmMain.ActHelpExecute(Sender: TObject);
begin
  CheckShell(Handle, PChar(strpath + '\DOC\Strarlight CRM documentation.doc'));
end;

procedure TfrmMain.apevMainHint(Sender: TObject);
begin
  stbMain.Panels[3].Text := GetLongHint(Application.Hint);
end;

// ����� ��������� ����� � 1_���������:
procedure TfrmMain.apevMainMessage(var Msg: tagMSG; var Handled: Boolean);
begin
{
  if Assigned(ActiveMDIChild) AND (ActiveMDIChild.Active) then
    stbMain.Panels[1].Text := ' '+ActiveMDIChild.Caption
  else stbMain.Panels[1].Text := '';
}
end;

////////////////////////////////////////////////////////////////////////////////
// EOF - ������ �� ����������� + ����/�����
////////////////////////////////////////////////////////////////////////////////

//����� � ���������
procedure TfrmMain.actAboutExecute(Sender: TObject);
begin
  frmAbout.MainFormShow;
end;

//������ ����� mainmenu
procedure TfrmMain.miExitClick(Sender: TObject);
begin
  close;
end;

//����� �����������������
procedure TfrmMain.mmiAdminToolsClick(Sender: TObject);
begin
  frmAdmin.MainFormShow;
end;

//����� ���������
procedure TfrmMain.mmiSettingsClick(Sender: TObject);
begin
  frmSettings.MainFormShow;
end;

 //����� �������
procedure TfrmMain.mnNSI_AdverClick(Sender: TObject);
begin
  frmPromo.MainFormShow;
end;

 //����� ������
procedure TfrmMain.mnNSI_CityesClick(Sender: TObject);
begin
  frmCity.MainFormShow;
end;

 //����� ���� ��������
procedure TfrmMain.mnNSI_ClientsTypeClick(Sender: TObject);
begin
  frmClientTypes.MainFormShow;
end;

//����� ����� �����
procedure TfrmMain.mnNSI_CurrencyClick(Sender: TObject);
begin
  frmNSICurreny.MainFormShow;
end;

//����� �������
procedure TfrmMain.mnNSI_RegionsClick(Sender: TObject);
begin
  frmReg.MainFormShow;
end;

//������������ ����
procedure TfrmMain.WindowArrangeAllExecute(Sender: TObject);
 var iCount: Integer;
begin
   for iCount := 0 to MDIChildCount - 1 do
   MDIChildren[iCount].WindowState := wsNormal;
 //if Assigned(frmNSICurreny) and (frmNSICurreny.WindowState = wsMinimized) then frmNSICurreny.WindowState:= wsNormal;
 //if Assigned(frmAdmin) and (frmAdmin.WindowState = wsMinimized) then frmAdmin.WindowState:= wsNormal;
end;

//���� ��������
procedure TfrmMain.WindowCascadeExecute(Sender: TObject);
 var iCount: integer;
     {FForms : TList;
     FRect: TRect;}
begin
      for iCount := 0 to MDIChildCount - 1 do
      begin
        MDIChildren[iCount].Left := iCount * 20;
        MDIChildren[iCount].Top  := iCount * 20;
      end;
  {FForms := TList.Create;
  FRect := Screen.WorkAreaRect;
  if Assigned(frmNSICurreny) then FForms.Add(frmNSICurreny);
  if Assigned(frmAdmin) then FForms.Add(frmAdmin);
  if FForms.Count = 0 then EXIT;
  for i := 0 to FForms.Count - 1 do begin
    TForm(FForms[i]).Left := FRect.Left + (i + 1) * 20;
    TForm(FForms[i]).Top := FRect.Top + (i + 1) * 20;
  end;
  FForms.Destroy;}
end;

//���������� ����
procedure TfrmMain.WindowMinimizeAllExecute(Sender: TObject);
 var iCount: Integer;
begin
   for iCount := MDIChildCount - 1 downto 0 do
   MDIChildren[iCount].WindowState := wsMinimized;
end;

//������������ ���� �� �����.
procedure TfrmMain.WindowTileHorizontalExecute(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

// ������������ ���� �� ����.
procedure TfrmMain.WindowTileVerticalExecute(Sender: TObject);
begin
   TileMode := tbVertical;
   Tile;
end;

end.
