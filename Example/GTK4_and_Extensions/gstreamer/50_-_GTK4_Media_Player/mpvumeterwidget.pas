unit MPVUMeterWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

type
  PMPVUMeterWidget = type Pointer;
  PMPVUMeterWidgetClass = type Pointer;

function mp_vu_meter_widget_get_type: TGType;
function mp_vu_meter_widget_new: PGTKWidget;
procedure mp_vu_meter_widget_set_level(w: PMPVUMeterWidget; level: PGArray);

implementation

// ==== private

type
  TInstPriv = record
    level: PGArray;
  end;
  PInstPriv = ^TInstPriv;

  TClassPriv = record
    level: PGArray;
  end;
  PClassPriv = ^TClassPriv;

var
  parent_class: Tgpointer = nil;
  instance_size: integer = 0;

function GetPriv(w: Tgpointer): PInstPriv; inline;
begin
  Result := PInstPriv(w + instance_size);
end;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  priv: PInstPriv;
  width, height: single;
  r: Tgraphene_rect_t;
  c_green, c_yellow, c_red, c_bg: TGdkRGBA;
  w_full, w_seg, h_per_channel, y_pos, x_start: single;
  i: integer;
  db: double;
const
  border = 2.0;

  function GetWidthForDB(val: double; max_w: single): single;
  begin
    if val < -60 then begin
      val := -60;
    end;
    if val > 0 then begin
      val := 0;
    end;
    Result := ((val + 60) / 60) * max_w;
  end;

begin
  priv := GetPriv(widget);

  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);

  gdk_rgba_parse(@c_bg, '#001500');
  gdk_rgba_parse(@c_green, '#00FF00');
  gdk_rgba_parse(@c_yellow, '#FFFF00');
  gdk_rgba_parse(@c_red, '#FF0000');

  graphene_rect_init(@r, 0, 0, width, height);
  gtk_snapshot_append_color(snapshot, @c_bg, @r);

  if (priv^.level <> nil) and (priv^.level^.len > 0) then begin
    h_per_channel := height / priv^.level^.len;

    for i := 0 to priv^.level^.len - 1 do begin
      db := Pgdouble(priv^.level^.data)[i];
      w_full := GetWidthForDB(db, width - (2 * border));
      y_pos := (i * h_per_channel) + border;
      x_start := border;

      w_seg := GetWidthForDB(-20, width - (2 * border));
      if w_full < w_seg then begin
        w_seg := w_full;
      end;
      if w_seg > 0 then begin
        graphene_rect_init(@r, x_start, y_pos, w_seg, h_per_channel - (2 * border));
        gtk_snapshot_append_color(snapshot, @c_green, @r);
        x_start := x_start + w_seg;
      end;

      if db > -20 then begin
        w_seg := GetWidthForDB(-6, width - (2 * border)) - GetWidthForDB(-20, width - (2 * border));
        if w_full < (x_start + w_seg) then begin
          w_seg := w_full - x_start;
        end;
        if w_seg > 0 then begin
          graphene_rect_init(@r, x_start, y_pos, w_seg, h_per_channel - (2 * border));
          gtk_snapshot_append_color(snapshot, @c_yellow, @r);
          x_start := x_start + w_seg;
        end;
      end;

      if db > -6 then begin
        w_seg := w_full - x_start;
        if w_seg > 0 then begin
          graphene_rect_init(@r, x_start, y_pos, w_seg, h_per_channel - (2 * border));
          gtk_snapshot_append_color(snapshot, @c_red, @r);
        end;
      end;
    end;
  end;
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(obj);
  if priv^.Level <> nil then  begin
    g_array_free(priv^.Level, True);
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  GTK_WIDGET_CLASS(g_class)^.snapshot := @snapshoot_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(instance);
  with priv^ do begin
    level := nil;
  end;
end;


// ==== public

function mp_vu_meter_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_WIDGET, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'MPVUMeterWidget',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_vu_meter_widget_new: PGTKWidget;
var
  priv: PInstPriv;
begin
  Result := g_object_new(mp_vu_meter_widget_get_type, nil);
  priv := GetPriv(Result);
end;

procedure mp_vu_meter_widget_set_level(w: PMPVUMeterWidget; level: PGArray);
var
  priv: PInstPriv;
begin
  priv := GetPriv(w);
  if priv^.level <> nil then  begin
    g_array_free(priv^.Level, True);
  end;

  priv^.level := g_array_copy(level);
  gtk_widget_queue_draw(GTK_WIDGET(w));
end;

end.
