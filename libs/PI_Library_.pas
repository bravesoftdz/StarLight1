unit PI_Library;

{***********************************************************
 *   ���������� �������� �������� �����������              *
 *   ������ 2009 �.                                        *
 ***********************************************************}

interface

uses StdCtrls,Classes,Variants,Ora,SysUtils,Graphics,OraError,Dialogs,
     CheckLst,windows,ComCtrls,DB,cxImageComboBox, DBGrids, cxBarEditItem;

type
  PFixedFileInfo = ^TFixedFileInfo;
  TFixedFileInfo = record
     dwSignature       : DWORD;
     dwStrucVersion    : DWORD;
     wFileVersionMS    : WORD;  // Minor Version
     wFileVersionLS    : WORD;  // Major Version
     wProductVersionMS : WORD;  // Build Number
     wProductVersionLS : WORD;  // Release Version
     dwFileFlagsMask   : DWORD;
     dwFileFlags       : DWORD;
     dwFileOS          : DWORD;
     dwFileType        : DWORD;
     dwFileSubtype     : DWORD;
     dwFileDateMS      : DWORD;
     dwFileDateLS      : DWORD;
  end; // TFixedFileInfo
type
 PTOKEN_USER = ^TOKEN_USER;
 _TOKEN_USER = record
   User : TSidAndAttributes;
 end;
 TOKEN_USER = _TOKEN_USER;



function FillImgComboCx(TheQuery : TOraQuery; TheCombo : TCxImageComboBox; BeginStr : String) : boolean;
function FillImgComboCxItm(TheQuery : TOraQuery; TheCombo : TCxBarEditItem; BeginStr : String) : boolean;

function FillListBox(TheQuery : TOraQuery; TheListBox : TListBox; TheList : TList; TheSql : String) : boolean;
procedure CheckListBox(IDList : TList; CheckedList : TList; CheckListBox : TCheckListBox);
function  StrToVar(Str : String) : Variant;
function  StrToVarInt(Str : String) : Variant;
function  StrToVarFloat(Str : String) : Variant;
function  VarToStr(VarVar : Variant) : String;
function  VarToInt(VarVar : Variant) : Integer;
function BoolToInt(inp : boolean) : integer;
function CharToBool(value : string) : boolean;
function EditIsNotEmpty(Ed : TEdit) : boolean;
function OpenConnection(Conn : TOraSession) : boolean;
procedure ListToStr (TheList : TList; OUT TheString : String);
function SysExec(start_line : String; start_dir : String) : boolean;
function IsThereAnotherApp(AppExe : String) : boolean;
procedure ReactivateOraQuery(Que : TOraQuery);
procedure ClickOnListedID (InList : TList; InID : Integer);
procedure CheckTEditContentFloat(Sender: TObject; ColNormal : TColor; ColAlert : TColor);
function StringListToStr (TheList : TStrings) : WideString;
procedure CheckAllInt(TheList : TList; TheIdFieldName : String; TheQuery : TOraQuery; TheGrid : TDBGrid);


// ������ �����
  function FileInfo( const FileName : String ) : TFixedFileInfo;
// ���������� � �����
  function GetFileInformation( const FileName, Value : String ): String;
// ��������� ����� ������������ � ������ ��� ������� �������� ������� ����� ��� �������
  function GetCurrentUserAndDomain (szUser : PChar; var chUser: DWORD; szDomain :PChar; var chDomain : DWORD ):Boolean;

const RussianMonthsNames: array[1..12] of String =  //������ ������ ������� �������� �������
('������',
 '�������',
 '����',
 '������',
 '���',
 '����',
 '����',
 '������',
 '��������',
 '�������',
 '������',
 '�������');

const RussianWeekDays: array[1..7,0..1] of String =  //������ ������ ������� �������� ���� ������
(('�����������','��'),
 ('�������','��'),
 ('�����','��'),
 ('�������','��'),
 ('�������','��'),
 ('�������','��'),
 ('�����������','��'));

implementation

function FillImgComboCx(TheQuery : TOraQuery; TheCombo : TCxImageComboBox; BeginStr : String) : boolean;
{********************************************************************************
 * ������� ������������� ��� ���������� �����-����� ����������                  *
 * � ����� ��� ����������� ID ������� �������� ���������� DevExpress            *
 * TheQuery - TQuery � ������� ������                                           *
 * TheCombo - �����-���� ��� ��������                                           *
 * BeginStr - ��������� ������ � ������ � ID=0, ���� NULL �� ��� ������ ������  *
 * ������ ������� TheQuery �������� ID , � ������ - ��������.                   *
 ********************************************************************************}
var cbep: TcxImageComboBoxProperties;
    itm: TcxImageComboBoxItem;
Begin
  try
    TheQuery.First;
//    TheCombo.Properties.Items.Clear;

    cbep := (TheCombo.Properties as TcxImageComboBoxProperties);
    cbep.Items.Clear;

    if Length(BeginStr) > 0 then
    begin
     	itm             := cbep.Items.Add;
   		itm.Description	:= BeginStr;
     	itm.Value			  := 0;
    end;

    while not TheQuery.Eof do
    begin
     	itm             := cbep.Items.Add;
   		itm.Description	:= TheQuery.Fields[1].AsString;
     	itm.Value			  := TheQuery.Fields[0].AsString;
      if TheQuery.Fields.Count = 3 then
       	itm.Tag			  := TheQuery.Fields[2].AsInteger;
 	    TheQuery.Next;
    end;

    TheQuery.First;
    
    FillImgComboCx := true;
  except
    FillImgComboCx := false;
  End;
End;



function FillImgComboCxItm(TheQuery : TOraQuery; TheCombo : TCxBarEditItem; BeginStr : String) : boolean;
{********************************************************************************
 * ������� ������������� ��� ���������� �����-����� ����������                  *
 * � ����� ��� ����������� ID ������� �������� ���������� DevExpress            *
 * TheQuery - TQuery � ������� ������                                           *
 * TheCombo - �����-���� ��� ��������                                           *
 * BeginStr - ��������� ������ � ������ � ID=0, ���� NULL �� ��� ������ ������  *
 * ������ ������� TheQuery �������� ID , � ������ - ��������.                   *
 ********************************************************************************}
var cbep: TcxImageComboBoxProperties;
    itm: TcxImageComboBoxItem;
Begin
  try
    TheQuery.First;
//    TheCombo.Properties.Items.Clear;

    cbep := (TheCombo.Properties as TcxImageComboBoxProperties);
    cbep.Items.Clear;

    if Length(BeginStr) > 0 then
    begin
     	itm             := cbep.Items.Add;
   		itm.Description	:= BeginStr;
     	itm.Value			  := 0;
    end;

    while not TheQuery.Eof do
    begin
     	itm             := cbep.Items.Add;
   		itm.Description	:= TheQuery.Fields[1].AsString;
     	itm.Value			  := TheQuery.Fields[0].AsString;
 	    TheQuery.Next;
    end;

    TheQuery.First;
    
    FillImgComboCxItm := true;
  except
    FillImgComboCxItm := false;
  End;
End;


function FillListBox(TheQuery : TOraQuery; TheListBox : TListBox; TheList : TList; TheSql : String) : boolean;
{***************************************************************
 * ������� ������������� ��� ���������� ����-����� ����������  *
 * � ����� ��� ����������� ID ������� ��������                 *
 * TheQuery - TQuery ��� �������� � ��                         *
 * TheListBox - �����-���� ��� ��������                        *
 * TheList - ���� ��� �������� ID                              *
 * TheSql - SQL ��������� ������� ������ ��������� ������,     *
 * ������ ������� �������� �������� ID , � ������ - ��������.  *
 ***************************************************************}
Begin
  try
    with TheQuery do
      Begin
        Close;
        SQL.Clear;
        SQL.Add(TheSql);
        Open;
      End;
    TheList.Clear;
    TheListBox.Items.Clear;
    while not TheQuery.Eof do
      Begin
        TheList.Add(Pointer(TheQuery.Fields[0].AsInteger));
        TheListBox.Items.Add(TheQuery.Fields[1].AsString);
        TheQuery.Next;
      End;
    TheQuery.Close;
    TheListBox.ItemIndex := 0;
    FillListBox := true;
  except
    FillListBox := false;
  End;
End;

procedure CheckListBox(IDList : TList; CheckedList : TList; CheckListBox : TCheckListBox);
{***************************************************************
 * ������� ������������� ��� ���������� ������������ ��������� *
 * IDList - ���� ID                                            *
 * CheckedList - ���� ���������� ID                            *
 * CheckListBox - ���������                                    *
 ***************************************************************}
VAR
  i,CheckedIndex : integer;
  pID : Pointer;
Begin
  For i := 0 to CheckListBox.Items.Count - 1 do
    Begin
      pID := IDList[i];
      CheckedIndex := CheckedList.IndexOf(pID);
      if CheckedIndex = -1 then CheckListBox.Checked[i] := false
                           else CheckListBox.Checked[i] := true;
    End;
End;

procedure ListToStr (TheList : TList; OUT TheString : String);
{***************************************************************
 * ������� ������������� ��� ����������� ������ � ������       *
 * � ������������� �������                                     *
 * TheList - ����                                              *
 * TheString - ������                                          *
 ***************************************************************}
VAR
i : integer;
Begin
  TheString := '';
  for i := 0 to TheList.Count -1 do
    Begin
      TheString := TheString + IntToStr(Integer(TheList[i]));
      if i < (TheList.Count -1) then TheString := TheString + ',';
    End;
End;

function  StrToVar(Str : String) : Variant;
Begin
  if Str = '' then StrToVar := NULL
              else StrToVar := Str;
End;

function  StrToVarInt(Str : String) : Variant;
Begin
  try
    result := StrToInt(Str);
  except
    result := NULL;
  end;
End;

function  StrToVarFloat(Str : String) : Variant;
{***************************************************************
 * ������� ������������� ��� ����������� string � variant      *
 * �� ����������� � Float = ����                               *
 ***************************************************************}
Begin
  try
    result := StrToFloat(Str);
  except
    result := NULL;
  end;
End;

function  VarToStr(VarVar : Variant) : String;
{***************************************************************
 * ������� ������������� ��� ��������������                    *
 * ���������� ���� Variant � �������                           *
 ***************************************************************}
VAR
  VT : TVarType;
Begin
  VT := VarType(VarVar);
  case VT of
    varEmpty,varNull	: VarToStr := '';
    varString : VarToStr := VarVar;
    varInteger,varSmallint : VarToStr := IntToStr(VarVar);
    varSingle,varDouble	: VarToStr := FloatToStr(VarVar);
    varDate : VarToStr := DateToStr(VarVar);
  End;
End;

function  VarToInt(VarVar : Variant) : Integer;
{***************************************************************
 * ������� ������������� ��� ��������������                    *
 * ���������� ���� Variant � integer                           *
 * � ������ ������������� �������������� ��������� -1          * 
 ***************************************************************}
VAR
  VT : TVarType;
Begin
  VT := VarType(VarVar);
  case VT of
    varEmpty,varNull	: VarToInt := -1;
    varString : try
                  VarToInt := StrToInt(VarVar);
                except
                  VarToInt := -1
                end;
    varInteger,varSmallint : VarToInt := VarVar;
    varSingle,varDouble	: VarToInt := Trunc(VarVar);
  End;
End;


function BoolToInt(inp : boolean) : integer;
Begin
  if inp then BoolToInt := 1
         else BoolToInt := 0;
End;

function CharToBool(value : string) : boolean;
Begin
  if value = '1' then CharToBool := true
         else CharToBool := false;
End;


function EditIsNotEmpty(Ed : TEdit) : boolean;
VAR
  tmp_str : string;
Begin
  tmp_str := trim(Ed.text);
  if tmp_str = '' then
    Begin
      Ed.Clear;
      Ed.Color := clRed;
      EditIsNotEmpty := false;
    End
  else
    Begin
      EditIsNotEmpty := true;
    End;
End;

function OpenConnection(Conn : TOraSession) : boolean;
{***************************************************************
 * ������� ������������� ��� ���������� � �� � ��� ������      *
 * ��������� �� �������                                        *
 * Conn - TOraSession ������� ����� ����������                 *
 ***************************************************************}
Begin
  try
    OpenConnection := True;
    Conn.Connect;
    Conn.StartTransaction;
  except
    on E: EOraError do
      Begin
        if E.ErrorCode = 01017 then ShowMessage('������������ �����/������!' + #13 + E.Message);
        if E.ErrorCode = 28000 then ShowMessage('������������ ������������!' + #13 + E.Message);
        if E.ErrorCode = 01005 then ShowMessage('� ������?' + #13 + E.Message);
        if E.ErrorCode = 1 then ShowMessage('������������ ���� � ��!' + #13 + E.Message);
        OpenConnection := False;
      End;
    else
      Begin
        OpenConnection := False;
        ShowMessage('������!');
      End;
  end;
End;

function SysExec(start_line : String; start_dir : String) : boolean;
{*****************************************************************
 * ������� ������������� ��� ���������� ������� ������� �������� *
 * start_line - ���������� + ���������                           *
 * start_dir - ��������� ����������                              *
 *****************************************************************}
VAR
  pr_si : STARTUPINFO;
  pr_pi : PROCESS_INFORMATION;
begin

  ZeroMemory(@pr_si,sizeof(pr_si));
  pr_si.cb := SizeOf(pr_si);
  start_line := 'notepad help.txt';
  pr_si.cb := SizeOf(pr_si);
  SysExec := CreateProcess( nil, // No module name (use command line).
                            PChar(start_line),  // Command line.
                            nil,                // Process handle not inheritable.
                            nil,                // Thread handle not inheritable.
                            False,              // Set handle inheritance to FALSE.
                            0,                  // No creation flags.
                            nil,                // Use parent's environment block.
                            PChar('./help'),    // Use starting directory.
                            pr_si,              // Pointer to STARTUPINFO structure.
                            pr_pi )             // Pointer to PROCESS_INFORMATION structure.
end;

function IsThereAnotherApp(AppExe : String) : boolean;
var
  CCMapping:THandle;
Begin
  CCMapping := CreateFileMapping($ffffffff,nil,PAGE_READONLY,0,32,PChar(AppExe));
  result := true;
  if CCMapping=0 then
    begin
      ShowMessage('������ ��������� ������!');
      exit;
    end
  else if GetLastError=ERROR_ALREADY_EXISTS then
    begin
      exit;
    end;
  result := false;
End;

procedure ReactivateOraQuery(Que : TOraQuery);
Begin
  with Que do
    if active then refresh
              else Open;
end;

procedure ClickOnListedID (InList : TList; InID : Integer);
{*****************************************************************
 * ������� �������� / ��������� ID �� ������ ��������������      *
 * ��� ������������ � ������                                     *
 *****************************************************************}
VAR
  ind : integer;
Begin
  ind := InList.IndexOf(Pointer(InID));
  if ind <> -1 then InList.Delete(ind)
               else InList.Add(Pointer(InID));
End;

procedure CheckTEditContentFloat(Sender: TObject; ColNormal : TColor; ColAlert : TColor);
{*****************************************************************
 * ������� ��������� �������� �������� �� ������������ ����     *
 * float, � ������ ��� � ���� �� ������ � ����������� �� ���.    *
 *****************************************************************}
Begin
  if Sender.ClassName <> 'TEdit' then exit;
  with TEdit(Sender) do
    Begin
      if Text = '' then Color := ColNormal
      else
        try
          StrToFloat(Text);
          Color := ColNormal;
        except
          Color := ColAlert;
        end;
    End;
End;

function StringListToStr (TheList : TStrings) : WideString;
{***************************************************************
 * ������� ������������� ��� ����������� TStrings � ������  *
 * � ������������� �������                                     *
 * TheList - ����                                              *
 ***************************************************************}
VAR
i : integer;
Begin
  result := '';
  for i := 0 to TheList.Count -1 do
    Begin
      result := result + '''' + TheList[i] + '''';
      if i < (TheList.Count -1) then result := result + ',';
    End;
End;

procedure CheckAllInt(TheList : TList; TheIdFieldName : String; TheQuery : TOraQuery; TheGrid : TDBGrid);
{***************************************************************
 * ������� ������������� ��� ���������� TheList ���������� ����*
 * TheIdFieldName �� TheQuery                                  *
 ***************************************************************}
Var
  SavePlace : TBookmark;
  THE_ID : Integer;
begin
  TheGrid.Hide;
  With TheQuery do
    Begin
      SavePlace := GetBookmark;
      first;
      TheList.Clear;
      while not eof do
        Begin
          THE_ID := FieldByName(TheIdFieldName).Value;
          TheList.Add(Pointer(THE_ID));
          Next;
        End;
      GotoBookmark(SavePlace);
      FreeBookmark(SavePlace);
    End;
  TheGrid.Show;
End;



//// ������ ����� FIXEDFILEINFO
function FileInfo( const FileName :String ) : TFixedFileInfo;
var
  dwHandle, dwVersionSize : DWORD;
  strSubBlock             : String;
  pTemp                   : Pointer;
  pData                   : Pointer;
begin
   strSubBlock := '\';

   // get version information values
   dwVersionSize := GetFileVersionInfoSize( PChar( FileName ), // pointer to filename string
                                            dwHandle );        // pointer to variable to receive zero

   // if GetFileVersionInfoSize is successful
   if dwVersionSize <> 0 then
   begin
      GetMem( pTemp, dwVersionSize );
      try
         if GetFileVersionInfo( PChar( FileName ),             // pointer to filename string
                                dwHandle,                      // ignored
                                dwVersionSize,                 // size of buffer
                                pTemp ) then                   // pointer to buffer to receive file-version info.

            if VerQueryValue( pTemp,                           // pBlock     - address of buffer for version resource
                              PChar( strSubBlock ),            // lpSubBlock - address of value to retrieve
                              pData,                           // lplpBuffer - address of buffer for version pointer
                              dwVersionSize ) then             // puLen      - address of version-value length buffer
               Result := PFixedFileInfo( pData )^;
      finally
         FreeMem( pTemp );
      end; // try
   end; // if dwVersionSize
end;

function GetFileInformation( const FileName, Value : String ): String;
var
  dwHandle, dwVersionSize   : DWORD;
  strLangCharSetInfoString  : String;
  pcBuffer                  : PChar;
  pTemp                     : Pointer;
begin
   strLangCharSetInfoString := '\StringFileInfo\040904E4\' + Value;
   // get version information values
   dwVersionSize := GetFileVersionInfoSize( PChar( FileName ),   // pointer to filename string
                                            dwHandle );          // pointer to variable to receive zero
   // if GetFileVersionInfoSize is successful
   if dwVersionSize <> 0 then
   begin
      GetMem( pcBuffer, dwVersionSize );
      try
         if GetFileVersionInfo( PChar( FileName ),               // pointer to filename string
                                dwHandle,                        // ignored
                                dwVersionSize,                   // size of buffer
                                pcBuffer ) then                  // pointer to buffer to receive file-version info.

            if VerQueryValue( pcBuffer,                          // pBlock     - address of buffer for version resource
                              PChar( strLangCharSetInfoString ), // lpSubBlock - address of value to retrieve
                              pTemp,                             // lplpBuffer - address of buffer for version pointer
                              dwVersionSize ) then               // puLen      - address of version-value length buffer

               Result := PChar( pTemp );
      finally
         FreeMem( pcBuffer );
      end; // try
   end;// if dwVersionSize
end; // GetFileInformation

// ��������� ����� ������������ � ������ ��� ������� �������� ������� ����� ��� �������
function GetCurrentUserAndDomain (szUser : PChar; var chUser: DWORD; szDomain :PChar; var chDomain : DWORD ):Boolean;
var
 hToken : THandle;
 cbBuf  : Cardinal;
 ptiUser : PTOKEN_USER;
 snu    : SID_NAME_USE;
begin
  Result:=false;
  // �������� ������ ������� �������� ������ ������ ��������
  if not OpenThreadToken(GetCurrentThread(),TOKEN_QUERY,true,hToken) then
  begin
    if GetLastError() <> ERROR_NO_TOKEN then exit;
    // � ������ ������ - �������� ������ ������� ������ ��������.
    if not OpenProcessToken(GetCurrentProcess(),TOKEN_QUERY,hToken)
     then exit;
  end;

  // �������� GetTokenInformation ��� ��������� ������� ������
  if not GetTokenInformation(hToken, TokenUser, nil, 0, cbBuf) then
     if GetLastError()<> ERROR_INSUFFICIENT_BUFFER then
     begin
       CloseHandle(hToken);
       Exit;
     end;

  if cbBuf = 0 then exit;

  // �������� ������ ��� �����
  GetMem(ptiUser,cbBuf);

  // � ������ �������� ������ ������� ��������� �� TOKEN_USER
  if GetTokenInformation(hToken,TokenUser,ptiUser,cbBuf,cbBuf) then
  begin
   // ���� ��� ������������ � ��� ����� �� ��� SID
   if LookupAccountSid(nil,ptiUser.User.Sid,szUser,chUser,szDomain,chDomain,snu)
    then Result:=true;
  end;

  // ����������� �������
  CloseHandle(hToken);
  FreeMem(ptiUser);
end;


end.
