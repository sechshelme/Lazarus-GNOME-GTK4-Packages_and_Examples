unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_plplot, fp_graphene, Beams;

type
  TMyWidget = record
    parent_instance: TGtkWidget;
    Beams: PBars;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new: PGTKWidget;
procedure my_widget_reset_data(self: PMyWidget);

implementation

// ==== private

var
  parent_class: PMyWidgetClass = nil;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  self: PMyWidget absolute widget;
  r: Tgraphene_rect_t;
  width, height: integer;
  texture: PGdkTexture;
  bytes: PGBytes;
  i: integer;

  px, py: array[0..3] of TPLFLT;
  p: TPLFLT;
  aligned_width, pl_stride: longint;
  pl_pixels: Tgpointer;

begin
  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);
  WriteLn(width,' x ',height);

  if (width > 50) and (height > 50) then  begin
    with self^ do begin
      aligned_width := (width + 3) and not 3;
      pl_stride := aligned_width * 3;
      pl_pixels := g_malloc0(pl_stride * height);

      c_plsstrm(0);
      c_plsdev('mem');
      c_plsmem(aligned_width, height, pl_pixels);

      c_plinit;

      c_plclear();
      c_pladv(0);

      c_plcol0(1);

      c_plvpor(0.15, 0.9, 0.15, 0.9);
      c_plwind(0.0, bars_n(Beams) + 1.0, 0.0, bars_max_size(Beams) * 1.1);

      for i := 0 to bars_n(Beams) - 1 do begin
        p := i + 1.0;

        px[0] := p - 0.4;
        py[0] := 0.0;
        px[1] := p - 0.4;
        py[1] := bars_get_data(Beams, i);
        px[2] := p + 0.4;
        py[2] := bars_get_data(Beams, i);
        px[3] := p + 0.4;
        py[3] := 0.0;

        c_plscol0(1, 255 - Trunc(255 / bars_n(Beams) * i), Trunc(255 / bars_n(Beams) * i), 0);
        c_plcol0(1);
        c_plfill(4, @px, @py);
        c_plcol0(0);
        c_plline(4, @px, @py);

        c_plcol0(15);
        c_plmtex('b', 1.5, (p / (bars_n(Beams) + 1)), 0.5, bars_get_label(Beams, i));
      end;

      c_plcol0(15);
      c_plsyax(0, 0);
      c_plbox('bc', 1.0, 0, 'bcnstv', 0.0, 0);

      c_pllab('Jahre', 'Umsatz (sFr)', 'Bericht der letzen Jahre');
      c_plend;

      bytes := g_bytes_new_take(pl_pixels, height * pl_stride);
      texture := gdk_memory_texture_new(width, height, GDK_MEMORY_B8G8R8, bytes, pl_stride);

      graphene_rect_init(@r, 0, 0, width, height);

      gtk_snapshot_append_texture(snapshot, texture, @r);

      g_object_unref(texture);
      g_bytes_unref(bytes);
    end;
  end;
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PMyWidget absolute obj;
begin
  with self^ do begin
    bars_unref(Beams);
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  GTK_WIDGET_CLASS(g_class)^.snapshot := @snapshoot_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMyWidget absolute instance;
begin
  with self^ do begin
    Beams := bars_new;
  end;
end;


// ==== public

function my_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'MyWidget', SizeOf(TMyWidgetClass), @class_init, SizeOf(TMyWidget), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_widget_new: PGTKWidget;
var
  self: PMyWidget absolute Result;
begin
  Result := g_object_new(my_widget_get_type, nil);
end;

procedure my_widget_reset_data(self: PMyWidget);
var
  w: PMyWidget absolute self;
begin
  with self^ do begin
    bars_new_data(Beams);
  end;
  gtk_widget_queue_draw(GTK_WIDGET(w));
end;

end.
