unit UStat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, DB,
  Ora, MemDS, DBAccess, cxStyles, cxGraphics, cxEdit, cxCurrencyEdit,
  ImgList, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer, cxCalendar,
  cxLabel, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  Tfrm_stat = class(TForm)
    Panel3: TPanel;
    cxButton2: TcxButton;
    Panel1: TPanel;
    CDS_STAT: TOraQuery;
    DS_STAT: TOraDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    CDS_STATTRUCKS: TStringField;
    CDS_STATHOL_SUB_TYPE: TStringField;
    CDS_STATPRIZNAK: TStringField;
    CDS_STATQUANT: TFloatField;
    gr_stat_v: TcxGridDBTableView;
    gr_stat_l: TcxGridLevel;
    gr_stat: TcxGrid;
    gr_stat_vTRUCKS: TcxGridDBColumn;
    gr_stat_vHOL_SUB_TYPE: TcxGridDBColumn;
    gr_stat_vPRIZNAK: TcxGridDBColumn;
    gr_stat_vQUANT: TcxGridDBColumn;
    CDS_STATHOL_COUNTRY: TStringField;
    gr_stat_vHOL_COUNTRY: TcxGridDBColumn;
    pmStatCustom: TPopupMenu;
    mnExpandAll: TMenuItem;
    mnCollapseAll: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure mnExpandAllClick(Sender: TObject);
    procedure mnCollapseAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_stat: Tfrm_stat;

implementation

uses Globals, UDM;

{$R *.dfm}

procedure Tfrm_stat.FormShow(Sender: TObject);
begin
  if (CDS_STAT.Active) and (CDS_STAT.RecordCount > 0) then
      gr_stat_v.DataController.Groups.FullExpand;
end;

procedure Tfrm_stat.mnCollapseAllClick(Sender: TObject);
begin
  gr_stat_v.DataController.Groups.FullCollapse;
end;

procedure Tfrm_stat.mnExpandAllClick(Sender: TObject);
begin
  gr_stat_v.DataController.Groups.FullExpand;
end;

end.
