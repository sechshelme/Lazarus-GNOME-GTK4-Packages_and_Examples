unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene, fp_FreeType2;

type
  TMyWidget = record
    parent_instance: TGtkWidget;
    library_: TFT_Library;
    face: TFT_Face;

    buffer: pbyte;
    buffer_width: integer;
    buffer_height: integer;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new: PGTKWidget;

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
        if (i >= 0) and (j >= 0) and (i < buffer_width) and (j < buffer_height) then begin
          ofs := j * buffer_width*4 + i * 4;

          intensity := bit^.buffer[q * bit^.Width + p];

          if intensity > 0 then begin
            buffer[ofs + 0] := buffer[ofs + 0] or intensity;
            buffer[ofs + 1] := buffer[ofs + 1] or intensity;
            buffer[ofs + 2] := buffer[ofs + 2] or intensity;
            buffer[ofs + 3] := buffer[ofs + 3] or intensity;
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
  matrix: TFT_Matrix;
  slot: TFT_GlyphSlot;
  n: integer;
  output_utf32: Pgunichar;
  items_read: Tglong = 0;
  items_written: Tglong = 0;
  err: PGError = nil;
begin
  with self^ do begin
    slot := face^.glyph;

    matrix.xx := Round(Cos(angle) * 10000);
    matrix.xy := Round(Sin(angle) * 10000);
    matrix.yx := -Round(Sin(angle) * 10000);
    matrix.yy := Round(Cos(angle) * 10000);

    pen.x := (buffer_width div 2) * 64;
    pen.y := (buffer_height div 2) * 64;


    FillChar(buffer^, buffer_height * buffer_width*4, $00);

    output_utf32 := g_utf8_to_ucs4(pchar('hello äöü 😊'), -1, @items_read, @items_written, @err);
    if output_utf32 <> nil then begin
      for n := 0 to items_written - 1 do begin
        FT_Set_Transform(face, @matrix, @pen);

        error := FT_Load_Char(face, TFT_ULong(output_utf32[n]), FT_LOAD_RENDER);
        if error <> 0 then begin
          WriteLn('Fehler: Load_Char ', error);
          continue;
        end;

        draw_bitmap(self, @slot^.bitmap, slot^.bitmap_left, buffer_height - slot^.bitmap_top);

        pen.x += slot^.advance.x;
        pen.y += slot^.advance.y;
      end;
      g_free(output_utf32);
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
    if (w <> buffer_width) or (h <> buffer_height) then begin
      if buffer <> nil then begin g_free(buffer); end;

      buffer := g_malloc(h * w*4);
      buffer_width := w;
      buffer_height := h;
    end;

    Face_To_Image(self, ang);
    ang += 0.01;

    bytes := g_bytes_new_static(buffer, buffer_height * buffer_width*4);
    texture := gdk_memory_texture_new(w, h, GDK_MEMORY_R8G8B8A8, bytes, buffer_width*4);
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
    if buffer <> nil then begin
      g_free(buffer);
      buffer := nil;
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
  fontname = '/usr/share/fonts/truetype/ubuntu/Ubuntu-B.ttf';
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

    error := FT_Set_Char_Size(face, 5000, 00, 0, 350);
    if error <> 0 then begin
      WriteLn('Fehler: Set_Char_Size   ', error);
    end;

    buffer := nil;
    buffer_width := 0;
    buffer_height := 0;

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

end.
