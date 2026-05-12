unit VUMeterWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

type
  TLevel = record
    L, R: Tgdouble;
  end;
  PLevel = ^TLevel;

type
  TVUMeterWidget = record
    parent_instance: TGtkWidget;
    level: TLevel;
  end;
  PVUMeterWidget = ^TVUMeterWidget;

  TVUMeterWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PVUMeterWidgetClass = ^TVUMeterWidgetClass;

function vu_meter_widget_get_type: TGType;
function vu_meter_widget_new: PGTKWidget;
procedure vu_meter_widget_set_level(self: PVUMeterWidget; level: PLevel);

implementation

// ==== private

var
  parent_class: PVUMeterWidgetClass = nil;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  self: PVUMeterWidget absolute widget;
  width, height: single;
  r: Tgraphene_rect_t;
  color: TGdkRGBA;
  w: single;
const
  border = 3.0;

  function dB_to_Prozent(db: double): single;
  begin
    Result := 300 - abs(Round(db) * 10);
  end;

begin
  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);

  gdk_rgba_parse(@color, '#002000');
  graphene_rect_init(@r, 0, 0, width, height);
  gtk_snapshot_push_clip(snapshot, @r);

  gtk_snapshot_append_color(snapshot, @color, @r);

  gdk_rgba_parse(@color, 'red');

  with self^ do begin
    w := dB_to_Prozent(Level.L);
    graphene_rect_init(@r, border, border, w, height / 2 - 2 * border);
    gtk_snapshot_append_color(snapshot, @color, @r);

    w := dB_to_Prozent(Level.R);
    graphene_rect_init(@r, border, height / 2 + border, w, height / 2 - 2 * border);
    gtk_snapshot_append_color(snapshot, @color, @r);
  end;

  gtk_snapshot_pop(snapshot);
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PVUMeterWidget absolute obj;
begin
  with self^ do begin
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
  self: PVUMeterWidget absolute instance;
begin
  with self^ do begin
    level.L := -50.0;
    level.R := -50.0;
  end;
end;


// ==== public

function vu_meter_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'Snapshot', SizeOf(TVUMeterWidgetClass), @class_init, SizeOf(TVUMeterWidget), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function vu_meter_widget_new: PGTKWidget;
var
  self: PVUMeterWidget absolute Result;
begin
  Result := g_object_new(vu_meter_widget_get_type, nil);
end;

procedure vu_meter_widget_set_level(self: PVUMeterWidget; level: PLevel);
begin
  self^.level := level^;
  gtk_widget_queue_draw(GTK_WIDGET(self));
end;

end.
