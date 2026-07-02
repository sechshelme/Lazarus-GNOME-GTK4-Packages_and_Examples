unit AnimateBars;

interface

uses
  fp_glib2, fp_GTK4,
  ChartBarsWidget;

type
  PAnimateBars = type Pointer;
  PAnimateBarsClass = type Pointer;

function animate_bar_get_type: TGType;
function animate_bar_new(cnt: Tgint): PGTKWidget;

implementation

// ==== private

type
  TInstPriv = record
    barCount: Tgint;
  end;
  PInstPriv = ^TInstPriv;

  TClassPriv = record
  end;
  PClassPriv = ^TClassPriv;

var
  parent_class: Tgpointer = nil;
  instance_size: integer = 0;

function GetPriv(w: Tgpointer): PInstPriv; inline;
begin
  Result := PInstPriv(w + instance_size);
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(obj);
  with priv^ do begin
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(instance);
  with priv^ do begin
  end;
end;

// =======

function tick_cp(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
var
  priv: PInstPriv;
  i: integer;
  current_time, h: Tgdouble;
begin
  priv := GetPriv(widget);
  with priv^ do begin
    current_time := gdk_frame_clock_get_frame_time(frame_clock) / 5000000.0;
    for i := 0 to barCount - 1 do begin
      h := sin(current_time * (10 + i)) + 1.5;

      chart_bars_widget_change_bar(PChartBarsWidget(widget), i, h);
    end;
  end;
  gtk_widget_queue_draw(widget);
  Result := G_SOURCE_CONTINUE;
end;




// ==== public

function animate_bar_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(chart_bars_widget_get_type, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(chart_bars_widget_get_type, 'AnimateBar',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function animate_bar_new(cnt: Tgint): PGTKWidget;
var
  priv: PInstPriv;
  i: integer;
  s: Pgchar;
begin
  Result := g_object_new(animate_bar_get_type, nil);
  chart_bars_widget_set_auto_hight(PChartBarsWidget(Result), False);
  chart_bars_widget_set_height(PChartBarsWidget(Result), 3.0);
  priv := GetPriv(Result);
  with priv^ do begin
    barCount := cnt;

    for i := 0 to barCount - 1 do begin
      s := g_strdup_printf('%d', i);
      chart_bars_widget_add_bar(PChartBarsWidget(Result), g_random_double, s);
      g_free(s);
    end;

    gtk_widget_add_tick_callback(GTK_WIDGET(Result), @tick_cp, nil, nil);
  end;
end;

end.
