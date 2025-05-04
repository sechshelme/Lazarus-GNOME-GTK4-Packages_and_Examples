unit PlayPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Controls, StdCtrls, ExtCtrls, Buttons, Graphics, ComCtrls,
  Common;

type
  TPlayBtnPanel = class(TPanel)
  private
    FOnPlayBoxEvent: TPlayBoxEvent;
    procedure BtnClick(Sender: TObject);
    procedure LoadButtons(const props: TcmdProps);
  public
    constructor Create(AOwner: TComponent); override;
    property OnPlayBoxEvent: TPlayBoxEvent read FOnPlayBoxEvent write FOnPlayBoxEvent;
  end;

type
  TPlayPanel = class(TPanel)
  public
    PlayBtnPanel: TPlayBtnPanel;
    TrackBar: TTrackBar;
    PositionLabel, DurationLabel,
    PositionValueLabel, DurationValueLabel: TLabel;
    LevelLShape, LevelRShape: TShape;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{ TPlayBtnPanel }

procedure TPlayBtnPanel.BtnClick(Sender: TObject);
begin
  if OnPlayBoxEvent <> nil then  begin
    OnPlayBoxEvent(Tcommand(TBitBtn(Sender).Tag));
  end;
end;

constructor TPlayBtnPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Anchors := [akLeft, akTop];
  LoadButtons(PlayCmdProp);
end;

procedure TPlayBtnPanel.LoadButtons(const props: TcmdProps);
const
  BT_WIDTH = 28;
  BT_HEIGHT = 28;
  BORDER = 5;
var
  i: integer;
  Btn: TSpeedButton;
  propsCount: SizeInt;
  pic: TPicture;
  path: string;
begin
  propsCount := Length(props);

  Width := propsCount * (BT_WIDTH + BORDER) + BORDER;
  Height := BT_HEIGHT + 2 * BORDER;

  pic := TPicture.Create;
  for i := 0 to propsCount - 1 do begin
    Btn := TSpeedButton.Create(Self);
    //    Btn.Caption := props[i].Caption;
    Btn.Caption := '';
    Btn.Tag := PtrInt(props[i].cmd);
    Btn.OnClick := @BtnClick;
    Btn.Width := BT_WIDTH;
    Btn.Height := BT_HEIGHT;
    Btn.Top := BORDER;
    Btn.Left := i * (BT_WIDTH + BORDER) + BORDER;
    Btn.Parent := Self;
    path := 'png/' + props[i].IconPath + '.png';
    if FileExists(path) then  begin
      pic.LoadFromFile('png/' + props[i].IconPath + '.png');
    end;
    Btn.Glyph := pic.Bitmap;
  end;
  pic.Free;
end;

{ TPlayPanel }

constructor TPlayPanel.Create(AOwner: TComponent);
var
  h: integer;
begin
  inherited Create(AOwner);
  TrackBar := TTrackBar.Create(Self);
  TrackBar.Left := 5;
  TrackBar.Parent := Self;
  TrackBar.Width := Width - 10;
//  TrackBar.Anchors := [akTop, akLeft, akRight];
  TrackBar.Align:=alTop;
  h := TrackBar.Height + 10;

  PlayBtnPanel := TPlayBtnPanel.Create(Self);
  PlayBtnPanel.Parent := Self;
  PlayBtnPanel.Top := h;
  PlayBtnPanel.Left := 5;

  DurationLabel := TLabel.Create(Self);
  DurationLabel.Parent := Self;
  DurationLabel.Font.Style := [fsbold];
  DurationLabel.Top := h;
  DurationLabel.Left := 200;
  DurationLabel.Caption := 'Duration';

  PositionLabel := TLabel.Create(Self);
  PositionLabel.Parent := Self;
  PositionLabel.Font.Style := [fsbold];
  PositionLabel.Top := h;
  PositionLabel.Left := 400;
  PositionLabel.Caption := 'Position';

  DurationValueLabel := TLabel.Create(Self);
  DurationValueLabel.Parent := Self;
  DurationValueLabel.Top := h + 20;
  DurationValueLabel.Left := 200;
  DurationValueLabel.Caption := '00:00';

  PositionValueLabel := TLabel.Create(Self);
  PositionValueLabel.Parent := Self;
  PositionValueLabel.Top := h + 20;
  PositionValueLabel.Left := 400;
  PositionValueLabel.Caption := '00:00';

  LevelLShape := TShape.Create(Self);
  LevelLShape.Parent := Self;
  LevelLShape.Top := h;
  LevelLShape.Height := 10;
  LevelLShape.Width := 0;
  LevelLShape.Left := 600;
  LevelLShape.Brush.Color := clRed;

  LevelRShape := TShape.Create(Self);
  LevelRShape.Parent := Self;
  LevelRShape.Top := h + 15;
  LevelRShape.Height := 10;
  LevelRShape.Width := 0;
  LevelRShape.Left := 600;
  LevelRShape.Brush.Color := clRed;

  Height := h + PlayBtnPanel.Height + 5;
end;

end.
