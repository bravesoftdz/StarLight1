program ClientOrders;

uses
  Forms,
  UClientOrder in 'UClientOrder.pas' {frmClientOrders};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '������ ���������� �������';
  Application.CreateForm(TfrmClientOrders, frmClientOrders);
  Application.Run;
end.
