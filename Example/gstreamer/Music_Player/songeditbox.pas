unit SongEditBox;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Controls, StdCtrls, ExtCtrls, Buttons, Graphics,
  Common;

type
  TEditBox = class(TPanel)
  private
    FOnPlayBoxEvent: TPlayBoxEvent;
    procedure BtnClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    property OnPlayBoxEvent: TPlayBoxEvent read FOnPlayBoxEvent write FOnPlayBoxEvent;
  private
    procedure LoadButtons(const props: TcmdProps);
  end;


implementation

procedure TEditBox.BtnClick(Sender: TObject);
begin
  if OnPlayBoxEvent <> nil then  begin
    OnPlayBoxEvent(Tcommand(TBitBtn(Sender).Tag));
  end;
end;

constructor TEditBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Anchors := [akTop, akRight];
  LoadButtons(EditCmdProb);
end;

procedure TEditBox.LoadButtons(const props: TcmdProps);
const
  BT_HEIGHT = 28;
  BORDER = 5;
var
  i: integer;
  Btn: TBitBtn;
  propsCount: SizeInt;
  pic: TPicture;
  path: string;
begin
  propsCount := Length(props);

  Height := propsCount * (BT_HEIGHT + BORDER) + BORDER;

  pic := TPicture.Create;
  for i := 0 to propsCount - 1 do begin
    Btn := TBitBtn.Create(Self);
    Btn.Caption := props[i].Caption;
    Btn.Tag := PtrInt(props[i].cmd);
    Btn.OnClick := @BtnClick;
    Btn.Width := Self.Width - 2 * BORDER;
    Btn.Anchors := [akTop, akLeft, akRight];
    Btn.Height := BT_HEIGHT;
    Btn.Left := BORDER;
    Btn.Top := i * (BT_HEIGHT + BORDER) + BORDER;
    Btn.Parent := Self;
    path := 'png/' + props[i].IconPath + '.png';
    if FileExists(path) then  begin
      pic.LoadFromFile('png/' + props[i].IconPath + '.png');
    end;
    Btn.Glyph := pic.Bitmap;
  end;
  pic.Free;
end;

end.
