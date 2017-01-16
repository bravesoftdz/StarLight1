unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, ExtCtrls, StdCtrls, IniFiles;

type
  Tfrmftpwww = class(TForm)
    Memo1: TMemo;
    btnExport: TButton;
    TimerStore: TTimer;
    IdFTP1: TIdFTP;
    TimerClients: TTimer;
    Button4: TButton;
    Button1: TButton;
    Timer1: TTimer;
    CheckBox1: TCheckBox;
    procedure btnExportClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure TimerStoreTimer(Sender: TObject);
    procedure TimerClientsTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //timer_store, timer_clients: integer;
    timer_min : integer;
    autoran: boolean;
  end;

var
  frmftpwww: Tfrmftpwww;

implementation

{$R *.dfm}

//ftp-dir
procedure Tfrmftpwww.btnExportClick(Sender: TObject);
var
    sr:TSearchRec;
    data:string;
    name:string;
    mon,i:integer;
    FileList : TStringList;
    k:NETRESOURCE;
begin
// ���1. ��� - ���������
 IdFTP1.Connect;
 IdFTP1.ChangeDir('/orders');
 memo1.Lines.Add('1.������� � ��� �� ���������');

// ��� �����
FileList:=tstringlist.Create;
IdFTP1.List(FileList,'*', False);
if FileList.Count > 0 then
for I := 0 to FileList.Count - 1 do  begin
  //������� � ���:
  idFTP1.Get(FileList.Strings[i], ExtractFilePath(Application.ExeName)+'copy_�������\'+FileList.Strings[i], True,false);
  memo1.Lines.Add(FileList.Strings[i]);
  application.processmessages;
end;
 memo1.Lines.Add('������� �� ���');
 IdFTP1.Disconnect;
 FileList.Free;
//------------------------------------------------------------

// ���2. ��������� - ������� �����
memo1.Lines.Add('2.������� � ��� �� �������');
SetCurrentDir(ExtractFilePath(Application.ExeName)+'copy_�������\');  //����� ��� ������ ������
if FindFirst('*', faAnyFile , sr)=0 then  //���� �������, ��:
repeat
 if (sr.Name= '.') or (sr.Name='..') then continue;
 begin
  //������� � ������� �����:
  CopyFile(PChar(ExtractFilePath(Application.ExeName)+'copy_�������\'+sr.Name),PChar('\\Max\g\�������\'+sr.Name), false);
  memo1.Lines.Add(sr.Name);
  DeleteFile(ExtractFilePath(Application.ExeName)+'copy_�������\'+ sr.Name);
  application.processmessages;
 end;
until (FindNext(sr) <> 0) ;
 findclose(sr);
 memo1.Lines.Add('������� �� ����'+ DateTimeToStr(Now));
//------------------------------------------------------------


end;


//dir - ftp
procedure Tfrmftpwww.Button1Click(Sender: TObject);
var
    sr:TSearchRec;
    data:string;
    name:string;
    mon,i:integer;
    FileList : TStringList;
    k:NETRESOURCE;
begin

// ���1. ������� ����� - ���������
memo1.Lines.Add('1.������� � �������� �� ���');
SetCurrentDir('\\Max\g\���������\');  //����� ��� ������ ������
if FindFirst('*', faAnyFile , sr)=0 then  //���� �������, ��:
repeat
 if (sr.Name= '.') or (sr.Name='..') then continue;
 begin
  //������� � ������� �����:
  CopyFile(PChar('\\Max\g\���������\'+sr.Name), PChar(ExtractFilePath(Application.ExeName)+'copy_���������\'+sr.Name), false);
  memo1.Lines.Add(sr.Name);
  application.processmessages;
 end;
until (FindNext(sr) <> 0) ;
 findclose(sr);
 memo1.Lines.Add('���������� �� ���');
//------------------------------------------------------------

// ���2. ��������� - ���
 IdFTP1.Connect;
 IdFTP1.ChangeDir('/');
 memo1.Lines.Add('2.������� � ���������� �� ���');

// ��� �����
FileList:=tstringlist.Create;
SetCurrentDir(ExtractFilePath(Application.ExeName)+'copy_���������\');  //����� ��� ������ ������
if FindFirst('*', faAnyFile , sr)=0 then  //���� �������, ��:
repeat
 if (sr.Name= '.') or (sr.Name='..') then continue;
  //������� ����������:
  FileList.Add(sr.Name);
until (FindNext(sr) <> 0) ;

if FileList.Count > 0 then
for I := 0 to FileList.Count - 1 do  begin
  //����� �� ���������� �� ���:
  idFTP1.put(ExtractFilePath(Application.ExeName)+'copy_���������\'+FileList.Strings[i], FileList.Strings[i], false);
  memo1.Lines.Add(FileList.Strings[i]);
  DeleteFile(ExtractFilePath(Application.ExeName)+'copy_���������\'+ FileList.Strings[i]);
  application.processmessages;
end;
 memo1.Lines.Add('���������� �� ���'+ DateTimeToStr(Now));
 IdFTP1.Disconnect;
 FileList.Free;
//------------------------------------------------------------

end;

procedure Tfrmftpwww.Button4Click(Sender: TObject);
begin
{  TimerStore.Interval := 1000*60*60 div timer_store;
  TimerStore.Enabled  := true;
  TimerClients.Interval := 1000*60*60 div timer_clients;
  TimerClients.Enabled  := true;   }

  Timer1.Interval := 1000*60*60 div timer_min;
  Timer1.Enabled  := true;
  btnexport.Enabled:=false;
  button1.Enabled:=false;
  button4.Enabled:=false;
  if Timer1.Enabled=true  then memo1.Lines.Add('������ �������');
end;

procedure Tfrmftpwww.FormClose(Sender: TObject; var Action: TCloseAction);
begin   {
if (TimerStore.Enabled=true) and (TimerClients.Enabled=true) then begin
   TimerStore.Enabled:=false;
   TimerClients.Enabled:=false;
end;      }
//if IdFTP1.Connected=true then  IdFTP1.disConnect;
end;

procedure Tfrmftpwww.FormCreate(Sender: TObject);
var vv, path: string;
    RegIni : TIniFile;
begin
  try
    path   := ExtractFilePath(Application.ExeName);
    path   := path+'server.ini';
    RegIni := TIniFile.Create(path);
    IdFTP1.Host     := RegIni.ReadString('FTP', 'host', '');
    IdFTP1.Username := RegIni.ReadString('FTP', 'login', '');
    IdFTP1.Password := RegIni.ReadString('FTP', 'pass', '');

    //timer_store   := RegIni.ReadInteger('TIME_STORE', 'value', 24);
    //timer_clients := RegIni.ReadInteger('TIME_CLIEMTS', 'value', 1);
    timer_min  := RegIni.ReadInteger('TIMER_MIN', 'value', 4);
    autoran       := RegIni.ReadBool('AUTORAN', 'value', false);

     // if autoran then btnStartTimer.Click;
  finally
    RegIni.Free;
  end;
end;

procedure Tfrmftpwww.FormShow(Sender: TObject);
begin
//Application.Icon.LoadFromFile('m1911.ico');
end;


procedure Tfrmftpwww.Timer1Timer(Sender: TObject);
var
    sr:TSearchRec;
    data:string;
    name:string;
    mon,i:integer;
    FileList : TStringList;
    k:NETRESOURCE;
begin
try
memo1.Lines.Clear;// ��� �� �������������
// ���1. ������� ����� - ���������
memo1.Lines.Add('1.������� � �������� �� ���');
SetCurrentDir('\\Max\g\���������\');  //����� ��� ������ ������
if FindFirst('*', faAnyFile , sr)=0 then  //���� �������, ��:
repeat
 if (sr.Name= '.') or (sr.Name='..') then continue;
 begin
  //������� � ������� �����:
  CopyFile(PChar('\\Max\g\���������\'+sr.Name), PChar(ExtractFilePath(Application.ExeName)+'copy_���������\'+sr.Name), false);
  memo1.Lines.Add(sr.Name);
  application.processmessages;
 end;
until (FindNext(sr) <> 0) ;
 findclose(sr);
 memo1.Lines.Add('���������� �� ���');
//------------------------------------------------------------

// ���2. ��������� - ���
 IdFTP1.Connect;  ///////////////////////////
 IdFTP1.ChangeDir('/');
 memo1.Lines.Add('2.������� � ���������� �� ���');

// ��� �����
FileList:=tstringlist.Create;
SetCurrentDir(ExtractFilePath(Application.ExeName)+'copy_���������\');  //����� ��� ������ ������
if FindFirst('*', faAnyFile , sr)=0 then  //���� �������, ��:
repeat
 if (sr.Name= '.') or (sr.Name='..') then continue;
  //������� ����������:
  FileList.Add(sr.Name);
until (FindNext(sr) <> 0) ;

if FileList.Count > 0 then
for I := 0 to FileList.Count - 1 do  begin
  //����� �� ���������� �� ���:
  idFTP1.put(ExtractFilePath(Application.ExeName)+'copy_���������\'+FileList.Strings[i], FileList.Strings[i], false);
  memo1.Lines.Add(FileList.Strings[i]);
  DeleteFile(ExtractFilePath(Application.ExeName)+'copy_���������\'+ FileList.Strings[i]);
  application.processmessages;
end;
 memo1.Lines.Add('���������� �� ���'+ DateTimeToStr(Now));
  FileList.Free;
 IdFTP1.Disconnect;  /////////////////
//------------------------------------------------------------
//------------------------------------------------------------

 // ���3. ��� - ���������
 IdFTP1.Connect;  ////////////////
 IdFTP1.ChangeDir('/orders');
 memo1.Lines.Add('3.������� � ��� �� ���������');

// ��� �����

FileList:=tstringlist.Create;
try
IdFTP1.List(FileList,'*', False);
application.processmessages;
except
end;

if FileList.Count > 0 then
for I := 0 to FileList.Count - 1 do  begin
  //������� � ���:
  idFTP1.Get(FileList.Strings[i], ExtractFilePath(Application.ExeName)+'copy_�������\'+FileList.Strings[i], True,false);
  memo1.Lines.Add(FileList.Strings[i]);
    if checkbox1.Checked =false then IdFTP1.Delete('/orders/'+FileList.Strings[i]);
  application.processmessages;
end;
 memo1.Lines.Add('������� �� ���');
 FileList.Free;

 IdFTP1.Disconnect;  ///////////////////
//------------------------------------------------------------

// ���4. ��������� - ������� �����
memo1.Lines.Add('4.������� � ��� �� �������');
SetCurrentDir(ExtractFilePath(Application.ExeName)+'copy_�������\');  //����� ��� ������ ������

if FindFirst('*', faAnyFile , sr)=0 then  //���� �������, ��:
repeat
 if (sr.Name= '.') or (sr.Name='..') then continue;
 begin
  //������� � ������� �����:
  CopyFile(PChar(ExtractFilePath(Application.ExeName)+'copy_�������\'+sr.Name),PChar('\\Max\g\�������\'+sr.Name), false);
  memo1.Lines.Add(sr.Name);
  DeleteFile(ExtractFilePath(Application.ExeName)+'copy_�������\'+ sr.Name);
  application.processmessages;
 end;
until (FindNext(sr) <> 0) ;
 findclose(sr);
 memo1.Lines.Add('������� �� ����'+ DateTimeToStr(Now));
//------------------------------------------------------------

except
end;
end;

procedure Tfrmftpwww.TimerClientsTimer(Sender: TObject);
{var
    sr:TSearchRec;
    data:string;
    name:string;
    mon,i:integer;
    FileList : TStringList;
    k:NETRESOURCE;        }
begin
{memo1.Lines.Clear;//�.�. ������� ���� ��������
// ���1. ������� ����� - ���������
memo1.Lines.Add('1.������� � �������� �� ���');
SetCurrentDir('\\Max\g\���������\');  //����� ��� ������ ������
if FindFirst('*', faAnyFile , sr)=0 then  //���� �������, ��:
repeat
 if (sr.Name= '.') or (sr.Name='..') then continue;
 begin
  //������� � ������� �����:
  CopyFile(PChar('\\Max\g\���������\'+sr.Name), PChar(ExtractFilePath(Application.ExeName)+'copy_���������\'+sr.Name), false);
  memo1.Lines.Add(sr.Name);
  application.processmessages;
 end;
until (FindNext(sr) <> 0) ;
 findclose(sr);
 memo1.Lines.Add('���������� �� ���');
//------------------------------------------------------------

// ���2. ��������� - ���
 IdFTP1.Connect;  ///////////////////////////
 IdFTP1.ChangeDir('/');
 memo1.Lines.Add('2.������� � ���������� �� ���');

// ��� �����
FileList:=tstringlist.Create;
SetCurrentDir(ExtractFilePath(Application.ExeName)+'copy_���������\');  //����� ��� ������ ������
if FindFirst('*', faAnyFile , sr)=0 then  //���� �������, ��:
repeat
 if (sr.Name= '.') or (sr.Name='..') then continue;
  //������� ����������:
  FileList.Add(sr.Name);
until (FindNext(sr) <> 0) ;

if FileList.Count > 0 then
for I := 0 to FileList.Count - 1 do  begin
  //����� �� ���������� �� ���:
  idFTP1.put(ExtractFilePath(Application.ExeName)+'copy_���������\'+FileList.Strings[i], FileList.Strings[i], false);
  memo1.Lines.Add(FileList.Strings[i]);
  DeleteFile(ExtractFilePath(Application.ExeName)+'copy_���������\'+ FileList.Strings[i]);
  application.processmessages;
end;
 memo1.Lines.Add('���������� �� ���'+ DateTimeToStr(Now));
  FileList.Free;
 //IdFTP1.Disconnect;  /////////////////
//------------------------------------------------------------
           }
end;


procedure Tfrmftpwww.TimerStoreTimer(Sender: TObject);
{var
    sr:TSearchRec;
    data:string;
    name:string;
    mon,i:integer;
    FileList : TStringList;
    k:NETRESOURCE;}
begin
{// ���1. ��� - ���������
 //IdFTP1.Connect;  ////////////////
 IdFTP1.ChangeDir('/orders');
 memo1.Lines.Add('1.������� � ��� �� ���������');

// ��� �����
FileList:=tstringlist.Create;
IdFTP1.List(FileList,'*', False);
if FileList.Count > 0 then
for I := 0 to FileList.Count - 1 do  begin
  //������� � ���:
  idFTP1.Get(FileList.Strings[i], ExtractFilePath(Application.ExeName)+'copy_�������\'+FileList.Strings[i], True,false);
  memo1.Lines.Add(FileList.Strings[i]);
  application.processmessages;
end;
 memo1.Lines.Add('������� �� ���');
 IdFTP1.Disconnect;  ///////////////////
 FileList.Free;
//------------------------------------------------------------

// ���2. ��������� - ������� �����
memo1.Lines.Add('2.������� � ��� �� �������');
SetCurrentDir(ExtractFilePath(Application.ExeName)+'copy_�������\');  //����� ��� ������ ������
if FindFirst('*', faAnyFile , sr)=0 then  //���� �������, ��:
repeat
 if (sr.Name= '.') or (sr.Name='..') then continue;
 begin
  //������� � ������� �����:
  CopyFile(PChar(ExtractFilePath(Application.ExeName)+'copy_�������\'+sr.Name),PChar('\\Max\g\�������\'+sr.Name), false);
  memo1.Lines.Add(sr.Name);
  DeleteFile(ExtractFilePath(Application.ExeName)+'copy_�������\'+ sr.Name);
  application.processmessages;
 end;
until (FindNext(sr) <> 0) ;
 findclose(sr);
 memo1.Lines.Add('������� �� ����'+ DateTimeToStr(Now));
//------------------------------------------------------------
          }
end;


end.
