unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  OpenGLContext, gl,
  fp_FreeType2,
  LazUTF8;
type
  TForm1 = class(TForm)
    OpenGLControl1: TOpenGLControl;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure OpenGLControl1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    imageWidht, imageHeight: integer;
    library_: TFT_Library;
    face: TFT_Face;
    num_chars: TFT_Long;

    procedure draw_bitmap(var bit: TFT_Bitmap; x: TFT_Int; y: TFT_Int);
    procedure Face_To_Image(angle: single);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

var
  image: array of byte = nil;

procedure TForm1.FormCreate(Sender: TObject);
const
  //  fileName = '/usr/share/fonts/truetype/freefont/FreeMono.ttf';
  //  fileName = '/usr/share/fonts/truetype/noto/NotoSansMono-Bold.ttf';
//  fileName = '/usr/share/fonts/truetype/ubuntu/Ubuntu-MI.ttf';
  fileName = '/usr/share/fonts/truetype/droid/DroidSansFallbackFull.ttf';
//  fileName = '/usr/share/fonts/truetype/noto/NotoColorEmoji.ttf';
var
  error: TFT_Error;
begin

  Timer1.Enabled := False;
  Timer1.Interval := 100;
  ClientWidth := 1600;
  ClientHeight := 1200;

  OpenGLControl1.Align := alClient;
  OpenGLControl1.AutoResizeViewport := False;
  OpenGLControl1.MakeCurrent();
  glClearColor(0, 0, 0, 0);

  error := FT_Init_FreeType(@library_);
  if error <> 0 then begin
    WriteLn('Fehler: ', error);
  end;

  error := FT_New_Face(library_, fileName, 0, @face);
  if error <> 0 then begin
    WriteLn('Fehler: ', error);
  end;

//  error := FT_Set_Char_Size(face, 300, 00, 0, 350);
  error := FT_Set_Char_Size(face, 300, 00, 0, 350);
  if error <> 0 then begin
    WriteLn('Fehler: Set_Char_Size   ', FT_Error_String( error));
  end;

  num_chars := face^.num_glyphs;
   WriteLn('num_chars: ', num_chars);
  Timer1.Enabled := True;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FT_Done_Face(face);
  FT_Done_FreeType(library_);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  imageWidht := ClientWidth and not %11;
  imageHeight := ClientHeight;
  SetLength(image, imageWidht * imageHeight);
  FillDWord(image[0], Length(image) div 4, 0);
end;

procedure TForm1.OpenGLControl1Click(Sender: TObject);
begin
  Width := Width + 1;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
const
  angle: single = 0.0;
begin
  angle += 0.3;
  Face_To_Image(angle);

  glDrawPixels(imageWidht, imageHeight, GL_LUMINANCE, GL_UNSIGNED_BYTE, Pointer(image));
  OpenGLControl1.SwapBuffers;
end;

procedure TForm1.draw_bitmap(var bit: TFT_Bitmap; x: TFT_Int; y: TFT_Int);
var
  x_max, y_max, ofs, i, j, p, q: TFT_Int;
begin
  x_max := x + bit.Width;
  y_max := y + bit.rows;

  i := x;
  p := 0;
  while (i < x_max) do begin

    j := y;
    q := 0;
    while (j < y_max) do begin

      if (i >= 0) and (j >= 0) and (i < imageWidht) and (j < imageHeight) then begin
        ofs := j * imageWidht + i;
        image[ofs] := image[ofs] or bit.buffer[(bit.rows-q-1) * bit.Width + p];
      end;

      Inc(j);
      Inc(q);
    end;
    Inc(i);
    Inc(p);
  end;
end;

procedure TForm1.Face_To_Image(angle: single);
var
  error: TFT_Error;
  pen: TFT_Vector;
  matrix: TFT_Matrix;
  slot: TFT_GlyphSlot;

  n: integer;
begin

  slot := face^.glyph;

  matrix.xx := 0000;
  matrix.xy := -10000;
  matrix.yx :=  10000;
  matrix.yy :=  10000;

  pen.x := 40000;
  pen.y := -10000;

  for n := 0 to num_chars - 1 do begin
//    FT_Set_Transform(face, @matrix, @pen);



           error:=FT_Load_Glyph(face, n, FT_LOAD_RENDER);
    if error <> 0 then begin
      WriteLn('Fehler: Load_Char   ', error);
    end;

    error:=FT_Render_Glyph(slot, FT_RENDER_MODE_NORMAL);
    if error <> 0 then begin
      WriteLn('Fehler: FT_Render_Glyph   ', error);
    end;
    draw_bitmap(slot^.bitmap, (n mod 64) * 20 + 30, OpenGLControl1.Height - (n div 64)*20 - 100);
//    draw_bitmap(slot^.bitmap,  200, OpenGLControl1.Height - 200);
//    draw_bitmap(slot^.bitmap, slot^.bitmap_left, OpenGLControl1.Height - slot^.bitmap_top);

    pen.x += slot^.advance.x;
    pen.y += slot^.advance.y;
  end;
end;

end.
