program LeapMotionDemo;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uConsole in 'uConsole.pas' {Console},
  LeapMotion.Headers in 'LeapMotion\LeapMotion.Headers.pas',
  LeapMotion.Lib.ConnectionEventThread in 'LeapMotion\LeapMotion.Lib.ConnectionEventThread.pas',
  LeapMotion.Lib.Lock in 'LeapMotion\LeapMotion.Lib.Lock.pas',
  LeapMotion.Lib in 'LeapMotion\LeapMotion.Lib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TConsole, Console);
  Application.Run;
end.
