object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Leap Motion Delphi Demo'
  ClientHeight = 628
  ClientWidth = 815
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 24
    Top = 215
    Width = 369
    Height = 202
  end
  object Image2: TImage
    Left = 415
    Top = 215
    Width = 385
    Height = 202
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 441
    Height = 201
    Caption = 'Tracking'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 66
      Height = 13
      Caption = 'Hands Count:'
    end
    object HandsCountLabel: TLabel
      Left = 88
      Top = 16
      Width = 84
      Height = 13
      Caption = 'HandsCountLabel'
    end
    object Label2: TLabel
      Left = 16
      Top = 35
      Width = 54
      Height = 13
      Caption = 'Framerate:'
    end
    object FramerateLabel: TLabel
      Left = 76
      Top = 35
      Width = 75
      Height = 13
      Caption = 'FramerateLabel'
    end
    object GroupBox2: TGroupBox
      Left = 3
      Top = 54
      Width = 214
      Height = 139
      Caption = 'Left hand'
      TabOrder = 0
      object Label3: TLabel
        Left = 13
        Top = 19
        Width = 58
        Height = 13
        Caption = 'Confidence:'
      end
      object LeftConfidenceLabel: TLabel
        Left = 77
        Top = 19
        Width = 6
        Height = 13
        Caption = '0'
      end
      object LeftVisibleTimeLabel: TLabel
        Left = 77
        Top = 38
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label4: TLabel
        Left = 13
        Top = 38
        Width = 58
        Height = 13
        Caption = 'Visible Time:'
      end
      object Label5: TLabel
        Left = 13
        Top = 57
        Width = 73
        Height = 13
        Caption = 'Pinch Distance:'
      end
      object LeftPinchDistanceLabel: TLabel
        Left = 92
        Top = 57
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label6: TLabel
        Left = 13
        Top = 76
        Width = 57
        Height = 13
        Caption = 'Grab Angle:'
      end
      object LeftGrabAngleLabel: TLabel
        Left = 76
        Top = 76
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label7: TLabel
        Left = 13
        Top = 95
        Width = 74
        Height = 13
        Caption = 'Pinch Strength:'
      end
      object LeftPinchStrengthLabel: TLabel
        Left = 93
        Top = 95
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label8: TLabel
        Left = 13
        Top = 114
        Width = 72
        Height = 13
        Caption = 'Grab Strength:'
      end
      object LeftGrabStrengthLabel: TLabel
        Left = 91
        Top = 114
        Width = 6
        Height = 13
        Caption = '0'
      end
    end
    object GroupBox3: TGroupBox
      Left = 223
      Top = 54
      Width = 214
      Height = 139
      Caption = 'Right hand'
      TabOrder = 1
      object Label9: TLabel
        Left = 13
        Top = 19
        Width = 58
        Height = 13
        Caption = 'Confidence:'
      end
      object RightConfidenceLabel: TLabel
        Left = 77
        Top = 19
        Width = 6
        Height = 13
        Caption = '0'
      end
      object RightVisibleTimeLabel: TLabel
        Left = 77
        Top = 38
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label12: TLabel
        Left = 13
        Top = 38
        Width = 58
        Height = 13
        Caption = 'Visible Time:'
      end
      object Label13: TLabel
        Left = 13
        Top = 57
        Width = 73
        Height = 13
        Caption = 'Pinch Distance:'
      end
      object RightPinchDistanceLabel: TLabel
        Left = 92
        Top = 57
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label15: TLabel
        Left = 13
        Top = 76
        Width = 57
        Height = 13
        Caption = 'Grab Angle:'
      end
      object RightGrabAngleLabel: TLabel
        Left = 76
        Top = 76
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label17: TLabel
        Left = 13
        Top = 95
        Width = 74
        Height = 13
        Caption = 'Pinch Strength:'
      end
      object RightPinchStrengthLabel: TLabel
        Left = 93
        Top = 95
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label19: TLabel
        Left = 13
        Top = 114
        Width = 72
        Height = 13
        Caption = 'Grab Strength:'
      end
      object RightGrabStrengthLabel: TLabel
        Left = 91
        Top = 114
        Width = 6
        Height = 13
        Caption = '0'
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 455
    Top = 8
    Width = 273
    Height = 201
    Caption = 'Device'
    TabOrder = 1
    object StreamingCheckBox: TCheckBox
      Left = 16
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Streaming'
      Enabled = False
      TabOrder = 0
    end
    object PausedCheckBox: TCheckBox
      Left = 16
      Top = 39
      Width = 97
      Height = 17
      Caption = 'Paused'
      Enabled = False
      TabOrder = 1
    end
    object LowResourceCheckBox: TCheckBox
      Left = 16
      Top = 108
      Width = 97
      Height = 17
      Caption = 'Low Resource'
      Enabled = False
      TabOrder = 2
    end
    object RobustCheckBox: TCheckBox
      Left = 16
      Top = 62
      Width = 97
      Height = 17
      Caption = 'Robust'
      Enabled = False
      TabOrder = 3
    end
    object SmudgedCheckBox: TCheckBox
      Left = 16
      Top = 85
      Width = 97
      Height = 17
      Caption = 'Smudged'
      Enabled = False
      TabOrder = 4
    end
    object UnknownFailureCheckBox: TCheckBox
      Left = 140
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Unknown Failure'
      Enabled = False
      TabOrder = 5
    end
    object BadCalibrationCheckBox: TCheckBox
      Left = 140
      Top = 39
      Width = 97
      Height = 17
      Caption = 'Bad Calibration'
      Enabled = False
      TabOrder = 6
    end
    object BadFirmwareCheckBox: TCheckBox
      Left = 140
      Top = 62
      Width = 97
      Height = 17
      Caption = 'Bad Firmware'
      Enabled = False
      TabOrder = 7
    end
    object BadTransportCheckBox: TCheckBox
      Left = 140
      Top = 85
      Width = 97
      Height = 17
      Caption = 'Bad Transport'
      Enabled = False
      TabOrder = 8
    end
    object BadControlCheckBox: TCheckBox
      Left = 140
      Top = 108
      Width = 97
      Height = 17
      Caption = 'Bad Control'
      Enabled = False
      TabOrder = 9
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 425
    Width = 815
    Height = 203
    Align = alBottom
    Caption = 'Logs'
    TabOrder = 2
    object LogsMemo: TMemo
      Left = 2
      Top = 15
      Width = 811
      Height = 186
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
