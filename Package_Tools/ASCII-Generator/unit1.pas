unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls;

const
  BtnSize = 30;

  RectFontCount = 12;

  single_line: array[0..3, 0..RectFontCount - 1] of char = (
    (#218, #194, #191, #195, #197, #180, #192, #193, #217, #196, #179, #32),
    (#201, #203, #187, #204, #206, #185, #200, #202, #188, #205, #186, #32),
    (#213, #209, #184, #198, #216, #181, #212, #207, #190, #205, #179, #32),
    (#214, #210, #183, #199, #215, #182, #211, #208, #189, #196, #186, #32));

type
  TLineRectButtons = array[0..RectFontCount - 1] of TBitBtn;

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    FontBitmap: TPicture;
    ButtonsGroup: array[0..3] of TLineRectButtons;
    OutEdit: TEdit;
    procedure ButtonsGroupClick(Sender: TObject);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i, b: integer;
  bit: TBitmap;
  ofs: integer;
  r: TRect;
  ch: byte;
begin
  ClientWidth := 800;
  ClientHeight := 400;

  FontBitmap := TPicture.Create;
  FontBitmap.LoadFromFile('VGA.png');

  bit := TBitmap.Create;
  bit.SetSize(8, 16);

  for i := 0 to Length(ButtonsGroup) - 1 do begin
    for b := 0 to RectFontCount - 1 do begin
      ButtonsGroup[i][b] := TBitBtn.Create(Self);
      with ButtonsGroup[i][b] do begin
        Parent := Self;
        Width := BtnSize + 5;
        Height := BtnSize + 5;
        Left := i * 150 + (b mod 3) * (BtnSize + 2) + 10;
        Top := (b div 3) * (BtnSize + 2) + 10;

        ch := byte(single_line[i, b]);
        Tag := ch;
        ofs := ch * 8;
        r := Rect(ofs, 0, ofs + 8, 16);

        bit.Canvas.CopyRect(Rect(0, 0, 8, 16), FontBitmap.Bitmap.Canvas, r);


        Glyph := bit;
        OnClick := @ButtonsGroupClick;
      end;
    end;
  end;

  OutEdit := TEdit.Create(Self);
  OutEdit.Parent := Self;
  OutEdit.ReadOnly := True;
  OutEdit.Left := 10;
  OutEdit.Top := 200;

  bit.Free;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FontBitmap.Free;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  Canvas.Draw(10, 150, FontBitmap.Bitmap);
end;

procedure TForm1.ButtonsGroupClick(Sender: TObject);
begin
  OutEdit.Text := '#' + IntToStr(TBitBtn(Sender).Tag);
  WriteLn(TBitBtn(Sender).Tag);
end;

end.
