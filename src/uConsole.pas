unit uConsole;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TConsole = class(TForm)
    DebugInfo: TRichEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
    var m_displayed: Boolean;
  public
    { Public declarations }
    procedure Log(data: String); overload;
    procedure Log(const format: string; const args: array of const); overload;
  end;

var
  Console: TConsole;

implementation

{$R *.dfm}

procedure TConsole.FormCreate(Sender: TObject);
begin
  m_displayed := False;
end;

procedure TConsole.FormHide(Sender: TObject);
begin
  m_displayed := False;
end;

procedure TConsole.FormShow(Sender: TObject);
begin
  left := Screen.WorkAreaRect.Left;
  top := Screen.WorkAreaRect.Bottom - height;
  m_displayed := true;

end;

procedure TConsole.Log(data: string);
begin
  DebugInfo.Lines.Add(data);
end;

procedure TConsole.Log(const format: string; const args: array of const);
begin
  Log(String.Format(format, args));
end;

end.
