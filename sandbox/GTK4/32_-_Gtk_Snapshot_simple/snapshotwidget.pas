unit SnapshotWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

type
  TSnapshotWidget = record
    parent_instance: TGtkWidget;
    custom_color: PGdkRGBA;
  end;
  PSnapshotWidget = ^TSnapshotWidget;

  TSnapshotWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PSnapshotWidgetClass = ^TSnapshotWidgetClass;

function snapshot_widget_get_type: TGType;
function snapshot_widget_new: PGTKWidget;
procedure snapshot_widget_set_color(self: PSnapshotWidget; col:PGdkRGBA);

implementation

// ==== private

var
  parent_class: PSnapshotWidgetClass = nil;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  self: PSnapshotWidget absolute widget;
  r: Tgraphene_rect_t;
  width, height: single;
  p: Tgraphene_point_t;
  color: TGdkRGBA;
begin
  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);

  graphene_rect_init(@r, 0, 0, width, height);
  gtk_snapshot_push_clip(snapshot, @r);

  graphene_rect_init(@r, -(width / 2), -(height / 2), width, height);
  graphene_point_init(@p, width / 2, height / 2);
  gtk_snapshot_translate(snapshot, @p);

  color.SetItems(0.2, 0.0, 0.0, 1.0);
  gtk_snapshot_append_color(snapshot, @color, @r);

  gtk_snapshot_save(snapshot);
  gtk_snapshot_scale(snapshot, 0.9, 0.9);
  color := PSnapshotWidget(widget)^.custom_color^;
  gtk_snapshot_append_color(snapshot, @color, @r);
  gtk_snapshot_restore(snapshot);

  gtk_snapshot_pop(snapshot);
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PSnapshotWidget absolute obj;
begin
  with self^ do begin
    g_free(custom_color);
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
  self: PSnapshotWidget absolute instance;
begin
  with self^ do begin
    custom_color := g_malloc(SizeOf(TGdkRGBA));
    custom_color^.SetItems(0.0, 0.2, 0.0, 1.0);
  end;
end;


// ==== public

function snapshot_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'Snapshot', SizeOf(TSnapshotWidgetClass), @class_init, SizeOf(TSnapshotWidget), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function snapshot_widget_new: PGTKWidget;
var
  self: PSnapshotWidget absolute Result;
begin
  Result := g_object_new(snapshot_widget_get_type, nil);
end;

procedure snapshot_widget_set_color(self: PSnapshotWidget; col: PGdkRGBA);
begin
  self^.custom_color^ := col^;
  gtk_widget_queue_draw(GTK_WIDGET(self));
end;

end.
