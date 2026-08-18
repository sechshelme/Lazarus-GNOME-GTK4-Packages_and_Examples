unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene, fp_FreeType2;

type
  TRGBA = record
    r, g, b, a: byte;
  end;
  PRGBA = ^TRGBA;

type
  TMyWidget = record
    parent_instance: TGtkWidget;
    library_: TFT_Library;
    face: TFT_Face;
    num_chars: TFT_Long;

    buffer: record
      data: PRGBA;
      width: integer;
      height: integer;
      end;

    text: pchar;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new: PGTKWidget;
procedure my_widget_set_text(self: PMyWidget; text: pchar);

implementation

var
  parent_class: PMyWidgetClass = nil;

procedure draw_bitmap(self: PMyWidget; bit: PFT_Bitmap; x: TFT_Int; y: TFT_Int);
var
  x_max, y_max, ofs, i, j, p, q: TFT_Int;
  intensity: byte;
begin
  with self^ do begin
    x_max := x + bit^.Width;
    y_max := y + bit^.rows;

    i := x;
    p := 0;
    while (i < x_max) do begin
      j := y;
      q := 0;
      while (j < y_max) do begin
        if (i >= 0) and (j >= 0) and (i < buffer.width) and (j < buffer.height) then begin
          ofs := j * buffer.width + i;

          intensity := bit^.buffer[q * bit^.Width + p];

          if intensity > 0 then begin
            buffer.data[ofs].r := buffer.data[ofs].r or intensity;
            buffer.data[ofs].g := buffer.data[ofs].g or intensity;
            buffer.data[ofs].b := buffer.data[ofs].b or intensity;
            buffer.data[ofs].a := buffer.data[ofs].a or intensity;
          end;
        end;
        Inc(j);
        Inc(q);
      end;
      Inc(i);
      Inc(p);
    end;
  end;
end;

procedure Face_To_Image(self: PMyWidget; angle: single);
var
  error: TFT_Error;
  pen: TFT_Vector;
  slot: TFT_GlyphSlot;
  n: integer;
begin
  with self^ do begin
    slot := face^.glyph;

    pen.x := 40000;
    pen.y := -10000;

    FillChar(buffer.data^, buffer.height * buffer.width * SizeOf(TRGBA), $00);

    for n := 0 to num_chars - 1 do begin
      error := FT_Load_Glyph(face, n, FT_LOAD_RENDER);
      if error <> 0 then begin
        WriteLn('Fehler: Load_Char   ', error);
      end;

      error := FT_Render_Glyph(slot, FT_RENDER_MODE_NORMAL);
      if error <> 0 then begin
        WriteLn('Fehler: FT_Render_Glyph   ', error);
      end;
      draw_bitmap(self, @slot^.bitmap, (n mod 64) * 20 + 30, buffer.height - (n div 64) * 20 - 100);

      pen.x += slot^.advance.x;
      pen.y += slot^.advance.y;
    end;
  end;
end;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  self: PMyWidget absolute widget;
  r: Tgraphene_rect_t;
  w, h: integer;
  texture: PGdkTexture;
  bytes: PGBytes;
const
  ang: single = 0.0;
begin
  w := gtk_widget_get_width(widget);
  h := gtk_widget_get_height(widget);

  if (w <= 0) or (h <= 0) then begin
    Exit;
  end;

  with self^ do begin
    if (w <> buffer.width) or (h <> buffer.height) then begin
      if buffer.data <> nil then begin g_free(buffer.data); end;

      buffer.data := g_malloc(h * w * 4);
      buffer.width := w;
      buffer.height := h;
    end;

    Face_To_Image(self, ang);
    ang += 0.01;

    bytes := g_bytes_new_static(buffer.data, buffer.height * buffer.width * SizeOf(TRGBA));
    texture := gdk_memory_texture_new(w, h, GDK_MEMORY_R8G8B8A8, bytes, buffer.width * SizeOf(TRGBA));
    graphene_rect_init(@r, 0, 0, w, h);
    gtk_snapshot_append_texture(snapshot, texture, @r);

    g_object_unref(texture);
    g_bytes_unref(bytes);
  end;
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PMyWidget absolute obj;
begin
  with self^ do begin
    if buffer.data <> nil then begin
      g_free(buffer.data);
      buffer.data := nil;
    end;

    if text <> nil then begin
      g_free(text);
    end;

    FT_Done_Face(face);
    FT_Done_FreeType(library_);
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  GTK_WIDGET_CLASS(g_class)^.snapshot := @snapshoot_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

function tick_cp(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
begin
  gtk_widget_queue_draw(widget);
  Result := G_SOURCE_CONTINUE;
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMyWidget absolute instance;
  error: TFT_Error;
const
  //  fontName = '/usr/share/fonts/truetype/freefont/FreeMono.ttf';
  //  fontName = '/usr/share/fonts/truetype/noto/NotoSansMono-Bold.ttf';
  //  fontName = '/usr/share/fonts/truetype/ubuntu/Ubuntu-MI.ttf';
  //  fontName = '/usr/share/fonts/truetype/droid/DroidSansFallbackFull.ttf';
  //  fontName = '/usr/share/fonts/truetype/noto/NotoColorEmoji.ttf';

 // fontname = '/usr/share/fonts/truetype/ubuntu/Ubuntu-B.ttf';

 fontName = '/home/tux/Schreibtisch/test/Honk-Regular-VariableFont_MORF,SHLN.ttf';

begin
  with self^ do begin
    error := FT_Init_FreeType(@library_);
    if error <> 0 then begin
      WriteLn('Fehler: ', error);
    end;

    error := FT_New_Face(library_, fontname, 0, @face);
    if error <> 0 then begin
      WriteLn('Fehler: ', error);
    end;

    error := FT_Set_Char_Size(face, 300, 00, 0, 350);
    if error <> 0 then begin
      WriteLn('Fehler: Set_Char_Size   ', error);
    end;

    num_chars := face^.num_glyphs;

    buffer.data := nil;
    buffer.width := 0;
    buffer.height := 0;

    self^.text := nil;

    gtk_widget_add_tick_callback(GTK_WIDGET(self), @tick_cp, self, nil);
  end;
end;

function my_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'DemoFreeTypeWidget', SizeOf(TMyWidgetClass), @class_init, SizeOf(TMyWidget), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_widget_new: PGTKWidget;
begin
  Result := g_object_new(my_widget_get_type, nil);
end;

procedure my_widget_set_text(self: PMyWidget; text: pchar);
begin
  if self^.text <> nil then begin
    g_free(self^.text);
  end;
  self^.text := g_strdup(text);
end;

end.
