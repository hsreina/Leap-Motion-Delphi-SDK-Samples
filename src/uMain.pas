unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  LeapMotion.Lib, LeapMotion.Headers, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    HandsCountLabel: TLabel;
    Label2: TLabel;
    FramerateLabel: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    LeftConfidenceLabel: TLabel;
    LeftVisibleTimeLabel: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LeftPinchDistanceLabel: TLabel;
    Label6: TLabel;
    LeftGrabAngleLabel: TLabel;
    Label7: TLabel;
    LeftPinchStrengthLabel: TLabel;
    Label8: TLabel;
    LeftGrabStrengthLabel: TLabel;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    RightConfidenceLabel: TLabel;
    RightVisibleTimeLabel: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    RightPinchDistanceLabel: TLabel;
    Label15: TLabel;
    RightGrabAngleLabel: TLabel;
    Label17: TLabel;
    RightPinchStrengthLabel: TLabel;
    Label19: TLabel;
    RightGrabStrengthLabel: TLabel;
    GroupBox4: TGroupBox;
    StreamingCheckBox: TCheckBox;
    PausedCheckBox: TCheckBox;
    LowResourceCheckBox: TCheckBox;
    RobustCheckBox: TCheckBox;
    SmudgedCheckBox: TCheckBox;
    UnknownFailureCheckBox: TCheckBox;
    BadCalibrationCheckBox: TCheckBox;
    BadFirmwareCheckBox: TCheckBox;
    BadTransportCheckBox: TCheckBox;
    BadControlCheckBox: TCheckBox;
    GroupBox5: TGroupBox;
    LogsMemo: TMemo;
    Image1: TImage;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    var m_lib: TLeapMotionLib;
    procedure OnConnectionEvent(const event: LEAP_CONNECTION_EVENT);
    procedure OnTrackingEvent(const event: LEAP_TRACKING_EVENT);
    procedure OnImageEvent(const event: LEAP_IMAGE_EVENT);

    procedure LogHand(const hand: LEAP_HAND);
    procedure LogLeftHand(const hand: LEAP_HAND);
    procedure LogRightHand(const hand: LEAP_HAND);
    procedure OnDeviceEvent(const event: LEAP_DEVICE_EVENT);
    procedure OnLogEvent(const event: LEAP_LOG_EVENT);
    procedure OnLogEvents(const event: LEAP_LOG_EVENTS);
    procedure Log(const data: String; const args: array of const);
    procedure LogLogEvent(const logEvent: LEAP_LOG_EVENT);
    procedure RenderImage(const source: LEAP_IMAGE; const dest: TImage);
  public
    { Public declarations }
  end;

  TRGBTripleArray = array [UInt16] of TRGBTriple;
  pRGBTripleArray = ^TRGBTripleArray;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uConsole, System.TypInfo;

procedure TForm1.FormCreate(Sender: TObject);
begin
  m_lib := TLeapMotionLib.Create;
  m_lib.OnConnectionEvent := OnConnectionEvent;
  m_lib.OnTrackingEvent := OnTrackingEvent;
  m_lib.OnDeviceEvent := OnDeviceEvent;
  m_lib.OnLogEvent := OnLogEvent;
  m_lib.OnLogEvents := OnLogEvents;
  m_lib.OnImageEvent := OnImageEvent;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  m_lib.Free;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Console.Show;
end;

procedure TForm1.OnConnectionEvent(const event: LEAP_CONNECTION_EVENT);
begin
  m_lib.SetPolicyFlags(UInt64(eLeapPolicyFlag.eLeapPolicyFlag_Images), 0);
end;

procedure TForm1.OnTrackingEvent(const event: LEAP_TRACKING_EVENT);
var
  nHands: UInt32;
  pHand: PLEAP_HAND;
  I: Integer;
begin
  nHands := event.nHands;
  HandsCountLabel.Caption := nHands.ToString();
  Frameratelabel.Caption := event.framerate.ToString();
  pHand := event.pHands;
  for I := 1 to nHands do
  begin
    LogHand(pHand^);
    Inc(pHand);
  end;
end;

procedure TForm1.LogHand(const hand: LEAP_HAND);
var
  handType: eLeapHandType;
begin
  handType := hand._type;
  if handType = eLeapHandType.eLeapHandType_Left then
  begin
    LogLeftHand(hand);
  end else if handType = eLeapHandType.eLeapHandType_Right then
  begin
    LogRightHand(hand);
  end;
end;

procedure TForm1.LogLeftHand(const hand: LEAP_HAND);
begin
  LeftConfidenceLabel.Caption := hand.confidence.ToString();
  LeftVisibleTimeLabel.Caption := hand.visible_time.ToString();
  LeftPinchDistanceLabel.Caption := hand.pinch_distance.ToString();
  LeftGrabAngleLabel.Caption := hand.grab_angle.ToString();
  LeftPinchStrengthLabel.Caption := hand.pinch_strength.ToString();
  LeftGrabStrengthLabel.Caption := hand.grab_strength.ToString();
end;

procedure TForm1.LogRightHand(const hand: LEAP_HAND);
begin
  RightConfidenceLabel.Caption := hand.confidence.ToString();
  RightVisibleTimeLabel.Caption := hand.visible_time.ToString();
  RightPinchDistanceLabel.Caption := hand.pinch_distance.ToString();
  RightGrabAngleLabel.Caption := hand.grab_angle.ToString();
  RightPinchStrengthLabel.Caption := hand.pinch_strength.ToString();
  RightGrabStrengthLabel.Caption := hand.grab_strength.ToString();
end;

Function HasStatus(deviceStatus: UInt32; enumDeviceStatus: eLeapDeviceStatus): Boolean;
var
  flag: UInt32;
begin
  flag := UInt32(enumDeviceStatus);
  Result := (deviceStatus and flag) > 0;
end;

procedure TForm1.OnDeviceEvent(const event: LEAP_DEVICE_EVENT);
var
  deviceStatus: UInt32;
begin
  deviceStatus := event.status;

  // Sorry, I don't understand this concept. bit mask or not?
  if (deviceStatus >= $E8000000) then
  begin
    UnknownFailureCheckBox.Checked := HasStatus(deviceStatus, eLeapDeviceStatus.eLeapDeviceStatus_UnknownFailure);
    BadCalibrationCheckBox.Checked := HasStatus(deviceStatus, eLeapDeviceStatus.eLeapDeviceStatus_BadCalibration);
    BadFirmwareCheckBox.Checked := HasStatus(deviceStatus, eLeapDeviceStatus.eLeapDeviceStatus_BadFirmware);
    BadTransportCheckBox.Checked := HasStatus(deviceStatus, eLeapDeviceStatus.eLeapDeviceStatus_BadTransport);
    BadControlCheckBox.Checked := HasStatus(deviceStatus, eLeapDeviceStatus.eLeapDeviceStatus_BadControl);
  end else
  begin
    StreamingCheckBox.Checked := HasStatus(deviceStatus, eLeapDeviceStatus.eLeapDeviceStatus_Streaming);
    PausedCheckBox.Checked := HasStatus(deviceStatus, eLeapDeviceStatus.eLeapDeviceStatus_Paused);
    RobustCheckBox.Checked := HasStatus(deviceStatus, eLeapDeviceStatus.eLeapDeviceStatus_Robust);
    SmudgedCheckBox.Checked := HasStatus(deviceStatus, eLeapDeviceStatus.eLeapDeviceStatus_Smudged);
    LowResourceCheckBox.Checked := HasStatus(deviceStatus, eLeapDeviceStatus.eLeapDeviceStatus_LowResource);
  end;
end;

procedure TForm1.OnLogEvent(const event: LEAP_LOG_EVENT);
begin
  LogLogEvent(event);
end;

procedure TForm1.OnLogEvents(const event: LEAP_LOG_EVENTS);
var
  I: Integer;
  pEvent: PLEAP_LOG_EVENT;
begin
  pEvent := event.events;
  for I := 1 to event.nEvents do
  begin
    LogLogEvent(pEvent^);
    Inc(pEvent);
  end;
end;

procedure TForm1.Log(const data: string; const args: array of const);
begin
  Logsmemo.Lines.Add(String.Format(data, args));
end;

procedure TForm1.LogLogEvent(const logEvent: LEAP_LOG_EVENT);
begin
  Log('%s %d, %s', [
    System.TypInfo.GetEnumName(TypeInfo(eLeapLogSeverity), UInt32(logEvent.severity)),
    logEvent.timestamp,
    logEvent._message
  ]);
end;

procedure TForm1.RenderImage(const source: LEAP_IMAGE; const dest: TImage);
var
  sourceWidth, sourceHeight, y, x: UInt32;
  Line: pRGBTripleArray;
  pixels: PByte;
begin
  pixels := source.data;
  Inc(pixels, source.offset);
  with source.properties do
  begin
    sourceWidth := source.properties.width;
    sourceHeight := source.properties.height;
  end;

  with dest.Picture.Bitmap do
  begin

    PixelFormat := pf32bit;

    if not (Width = sourceWidth) then
    begin
      Width := sourceWidth;
    end;
    if not (Height = sourceHeight) then
    begin
      Height := sourceHeight;
    end;

    for y := 0 to sourceHeight - 1 do
    begin
      Line := Scanline[y];
      for x := 0 to sourceWidth - 1 do
      begin
        Line[x].rgbtBlue := pixels[x];
        Line[x].rgbtGreen := pixels[x];
        Line[x].rgbtRed := pixels[x];
      end;
      inc(pixels, sourceWidth);
    end;
  end;
  dest.Refresh;
end;

procedure TForm1.OnImageEvent(const event: LEAP_IMAGE_EVENT);
begin
  RenderImage(event.image[0], Image2);
  RenderImage(event.image[1], Image1);
end;

end.
