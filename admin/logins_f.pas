unit logins_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, DB;

type
  Tlogins = class(TForm)
    GroupBox7: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    BitBtn14: TBitBtn;
    BitBtn17: TBitBtn;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Edit10: TEdit;
    BitBtn4: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  logins: Tlogins;

implementation

uses DataM, main_form;

{$R *.dfm}

// �������� �����
procedure Tlogins.BitBtn4Click(Sender: TObject);
begin
  close;
end;

// ��������� \ ��������� ������ � ��
procedure Tlogins.BitBtn14Click(Sender: TObject);
var ind: integer;
begin
  if ((Edit10.Text <> '') and (MaskEdit1.Text <> '') and (MaskEdit2.Text <> '')) then
  begin

  if (DM.Q_EMPL.FieldByName('LOGIN').IsNull = false) then
  // ��������� ������� ������ ��� ������������ ��
  begin
      if MessageDlg('���������� ������� ������ ������������ � ��!'+#10#13+'�� ������� � ������������ ����������?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
      begin
        if (MaskEdit1.Text <> MaskEdit2.Text) then ShowMessage('������������ ���� �������!')
        else
        begin

          DM.Ora_SQL.SQL.Clear;
          DM.Ora_SQL.SQL.Add('begin admins.change_pass(:user_, :pass_); end;' );
          DM.Ora_SQL.ParamByName('user_').AsString :=  DM.Q_EMPL.FieldByName('LOGIN').AsString;
          DM.Ora_SQL.ParamByName('pass_').AsString :=  MaskEdit1.Text;

          // �������� ��������� SQL ������ �� ���������� ������������
          try
            DM.Ora_SQL.Execute;
            DM.Q_EMPL.Refresh;
            ShowMessage('�������� ������ �������.');
          except
            on E: Exception do
            begin
              if (StrPos(PChar(E.Message), PChar('01031')) <> nil) then ShowMessage('� ��� ��� ���� �� ������ ��������!')
              else  ShowMessage(E.Message);
            end;
          End;  
        end;
      end;
    end

  else

    // �������� ������� ������ ��� ������ ������������ ��
 //   if (trim(DM.Q_EMPL.FieldByName('LOGIN').AsString) = '') then
    begin
      if MessageDlg('��������� ����� ������� ������ ������������ � ��!'+#10#13+'�� ������� � ������������ ����������?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
      begin
        if (MaskEdit1.Text <> MaskEdit2.Text) then ShowMessage('������������ ���� �������!')
        else
        begin
            ind := DM.Q_EMPL.FieldByName('ID_CLIENTS').AsInteger;
          DM.Ora_SQL.SQL.Clear;
          DM.Ora_SQL.SQL.Add('begin admins.new_pass(:user_, :pass_, :id_); end;' );
          DM.Ora_SQL.Prepare;
          DM.Ora_SQL.ParamByName('user_').AsString :=  Edit10.Text;
          DM.Ora_SQL.ParamByName('pass_').AsString :=  MaskEdit1.Text;
          DM.Ora_SQL.ParamByName('id_').AsInteger :=  ind;

          // �������� ��������� SQL ������ �� ���������� ������������
          try
            DM.Ora_SQL.Execute;
            DM.Q_EMPL.Refresh;
            DM.Q_EMPL.Locate('ID_CLIENTS',ind,[]);

            Edit10.Text := '';
            MaskEdit1.Text := '';
            MaskEdit2.Text := '';

            ShowMessage('�������� ������ �������.');
          except
            on E: Exception do
            begin
//              if (StrPos(PChar(E.Message), PChar('01031')) <> nil) then ShowMessage('� ��� ��� ���� �� ������ ��������!')
//              else
              ShowMessage(E.Message);
            end;
          End;
        end;
      end;
    end;

  end
  else ShowMessage('��������� ��������� ��� ���������!');
end;

// ������� ����� 
procedure Tlogins.BitBtn17Click(Sender: TObject);
begin
  Edit10.Text := '';
  MaskEdit1.Text := '';
  MaskEdit2.Text := '';
end;

end.
