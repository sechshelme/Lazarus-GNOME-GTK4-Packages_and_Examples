unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons;

const
  BtnSize = 30;

  RectFontCount = 12;
  // Einfache Linien (single)
  single_line: array[0..3, 0..RectFontCount - 1] of char = ((
    #218, // obere linke Ecke ┌
    #194, // horizontal und unten ┬
    #191, // obere rechte Ecke ┐
    #195, // vertikale und rechts ├
    #197, // Kreuzung ┼
    #180, // vertikale und links ┤
    #192, // untere linke Ecke └
    #193, // horizontal und oben ┴
    #217, // untere rechte Ecke ┘
    #196, // horizontale Linie ─
    #179, // vertikale Linie │
    #32   // Blank
    ),

    // Doppelte Linien (double)
    (
    #201, // obere linke Ecke ╔
    #203, // horizontal und unten ╦
    #187, // obere rechte Ecke ╗
    #204, // vertikale und rechts ╠
    #206, // Kreuzung ╬
    #185, // vertikale und links ╣
    #200, // untere linke Ecke ╚
    #202, // horizontal und oben ╩
    #188, // untere rechte Ecke ╝
    #205, // horizontale Linie ═
    #186, // vertikale Linie ║
    #32   // Blank
    ),

    // Gemischte Linien 1 (Beispiel: einfach oben, doppelt unten)
    (
    #213, // ╒ obere linke Ecke
    #209, // ┴ horizontal und oben (einfach)
    #184, // ╕ obere rechte Ecke
    #199, // ╞ vertikale und rechts gemischt
    #197, // ┼ Kreuzung (einfach)
    #182, // ╢ vertikale und links gemischt
    #212, // ╘ untere linke Ecke
    #207, // ┬ horizontal und unten (einfach)
    #190, // ╛ untere rechte Ecke
    #205, // ═ horizontale Linie (doppelt)
    #179, // │ vertikale Linie (einfach)
    #32   // Blank
    ),

    // Gemischte Linien 2 (Beispiel: doppelt oben, einfach unten)
    (
    #214, // ╓ obere linke Ecke
    #210, // ╨ horizontal und oben (doppelt)
    #183, // ╖ obere rechte Ecke
    #199, // ╟ vertikale und rechts gemischt
    #215, // ╫ Kreuzung (doppelt)
    #182, // ╡ vertikale und links gemischt
    #211, // ╙ untere linke Ecke
    #208, // ╧ horizontal und unten (doppelt)
    #189, // ╜ untere rechte Ecke
    #196, // ─ horizontale Linie (einfach)
    #186, // ║ vertikale Linie (doppelt)
    #32   // Blank
    ));


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
  ClientWidth:=800;
  ClientHeight:=400;

  FontBitmap := TPicture.Create;
  FontBitmap.LoadFromFile('VGA.png');

  bit := TBitmap.Create;
  bit.SetSize(8, 16);

  for i := 0 to Length(ButtonsGroup) - 1 do begin
    for b := 0 to RectFontCount - 1 do begin
      ButtonsGroup[i][b] := TBitBtn.Create(Self);
      with ButtonsGroup[i][b] do begin
        Parent := Self;
        Width := BtnSize;
        Height := BtnSize;
        Left := i * 150 + (b mod 3) * (BtnSize + 2);
        Top := (b div 3) * (BtnSize + 2);

        ch := byte(single_line[i, b]);
        ofs := ch * 8;
        r := Rect(ofs, 0, ofs + 8, 16);

        bit.Canvas.CopyRect(Rect(0, 0, 8, 16), FontBitmap.Bitmap.Canvas, r);


        Glyph := bit;
      end;
    end;
  end;

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

end.
