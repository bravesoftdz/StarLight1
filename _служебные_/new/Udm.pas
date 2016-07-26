unit Udm;

interface

uses
  Windows, Forms, Dialogs, sysUtils, Classes, star_lib, DBAccess, Ora, Messages,
  MemDS, IniFiles, DB, ImgList, Controls;


type
  Tdm = class(TDataModule)
    OraSession: TOraSession;
    cdsOffices: TOraQuery;
    cdsDeps: TOraQuery;
    cdsSQL: TOraQuery;
    ImgLst: TImageList;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure OraSessionAfterConnect(Sender: TObject);
    procedure SaveIni;
  private
    { Private declarations }
    procedure LoadIni;
  public
    { Public declarations }
    id_office: integer;
    CUR_DEPT_ID: integer;
    CUR_DEPT_NAME: string;
    procedure SaveFormState(aForm: TForm);
    procedure LoadFormState(aForm: TForm);
  end;

var
  dm: Tdm;
  verApplication :String;          // ������ ���������
  strAppIniName  :String;          // ������ ���� � ����� *.ini
  strConnString  :String;          // ������ ��������
  strServerName  :String;          // ���/IP-����� �������
  intServerPort  :Integer;         // ���� �������
  strDataBaseName:String;          // ��� ���� ������
  strUserName    :String;          // ������� ������������
  strPassword    :String;          // ������ ������������
  blShowFormLogin:Boolean;         // ������� ����������� ����� ������

  strPath  :String;          // ������ ���� � ����� ����������
  intDefFont  :Integer;         // ����� �� ���������
  intDefDept  :Integer;         // ����� �� ���������
  
implementation

uses uLogin;
{$R *.dfm}

 //��� �������� ����
 procedure Tdm.SaveFormState(aForm: TForm);
    var
      ini: TIniFile;
    begin
      ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '_forms.ini'));
      with aForm do
      begin
        ini.WriteInteger(aForm.Name, 'WindowState', Integer(WindowState));
        ini.WriteInteger(aForm.Name, 'Left', Left);
        ini.WriteInteger(aForm.Name, 'Top', Top);
        ini.WriteInteger(aForm.Name, 'Width', Width);
        ini.WriteInteger(aForm.Name, 'Height', Height);
      end;
      ini.Free;
    end;

 //��� �������� ����
 procedure Tdm.LoadFormState(aForm: TForm);
    var
      ini: TIniFile;
    begin
      ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '_forms.ini'));
      with aForm do
      begin
        WindowState := TWindowState(ini.ReadInteger(aForm.Name, 'WindowState', Integer(WindowState)));
        if Integer(WindowState) = 0 then
        begin
          Left := ini.ReadInteger(aForm.Name, 'Left', Left);
          Top := ini.ReadInteger(aForm.Name, 'Top', Top);
          Width := ini.ReadInteger(aForm.Name, 'Width', Width);
          Height := ini.ReadInteger(aForm.Name, 'Height', Height);
        end;
      end;
      ini.Free;
    end;

procedure Tdm.DataModuleCreate(Sender: TObject);
var recFileInfo :TFixedFileInfo;
    i: integer;
    strMsgError :String;
begin
  strMsgError:='';

  strPath := ExtractFilePath(Application.ExeName); // ���� � ���

  // ��������� ������ �����
  recFileInfo :=  FileInfo(Application.ExeName);
  verApplication := '������ ' + IntToStr(recFileInfo.wFileVersionLS )+'.'+IntToStr( recFileInfo.wFileVersionMS ) + '.' +
                              IntToStr(recFileInfo.wProductVersionLS)+'.'+IntToStr(recFileInfo.wProductVersionMS);
   // caption ������� �����:
  Application.Title := Application.Title;
  
  // �������� ����� Login
  // ��������� ���� �� ��������� ������ ��� ���������� ���� ������
  blShowFormLogin := CreateLoginForm;
  try
    i := 0;
    while (blShowFormLogin = True) do
    begin
      i:=i+1;
        try
          OraSession.Connected := True;
          Break;
        except on E: Exception do
          begin
            strMsgError:=E.Message;
            if Pos('ORA-01005',E.Message)<>0 then
               strMsgError:='������ ������ ������. ���� � ������� ��������.';
            if Pos('ORA-01017',E.Message)<>0 then
               strMsgError:='�������� ��� ������������ ��� ������.';
            if (Pos('ORA-12154',E.Message)<>0) OR (Pos('ORA-12500',E.Message)<>0 ) then
               strMsgError:='�� ������ ���������� ���������� � �������� ��.';

            if i<4 then
            begin
               Application.MessageBox(PChar(Format('������ ����������� � ��: %s',[strMsgError])),
                          '�����������', MB_ICONERROR);

               blShowFormLogin := CreateLoginForm;
            end
            else
            begin
               Application.MessageBox(PChar(Format('������ ����������� � ��: %s '+#13#10+'���������� � ��������������.',[strMsgError])),
                          '�����������', MB_ICONERROR);

               Exit;
            end;// if i<4
          end;// on E.Exception
        end;//try
    end;//while (blShowFormLogin = True)
  finally
  end;
end;

procedure Tdm.DataModuleDestroy(Sender: TObject);
begin
 OraSession.Close;
end;


procedure Tdm.OraSessionAfterConnect(Sender: TObject);
begin
  cdsOffices.Open;
  cdsDeps.ParamByName('login_').Value := UpperCase(OraSession.Username);
  cdsDeps.ParamByName('cursor_').AsCursor;
  cdsDeps.Open;

  loadIni; // ����� �������� ����� ��������� ����.������ � ������ ��� �����
end;



procedure TDM.LoadIni;
var vv, path: string;
    RegIni : TIniFile;
begin
  try
    path   := strPath+'ini\'+OraSession.Username+'.ini';
    RegIni := TIniFile.Create(path);

    intDefFont := RegIni.ReadInteger('FontSize', 'Value', 9);
    intDefDept := RegIni.ReadInteger('Department', 'Value', 0);
  finally
    RegIni.Free;
  end;
end;


procedure TDM.SaveIni;
var vv, path: string;
    RegIni : TIniFile;
begin
  try
    path   := strPath+'ini\'+OraSession.Username+'.ini';
    RegIni := TIniFile.Create(path);

    RegIni.WriteInteger('FontSize', 'Value', intDefFont);
    RegIni.WriteInteger('Department', 'Value', intDefDept);
  finally
    RegIni.Free;
  end;
end;


end.
