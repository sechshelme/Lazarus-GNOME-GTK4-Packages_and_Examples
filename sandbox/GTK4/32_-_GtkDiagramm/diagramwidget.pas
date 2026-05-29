unit DiagramWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

type
  PDiagramWidget = type Pointer;
  PDiagramWidgetClass = type Pointer;

function diagram_widget_get_type: TGType;
function diagram_widget_new: PGTKWidget;
procedure diagram_widget_add_bar(w: PDiagramWidget; y: Tgfloat; l: Pgchar);
procedure diagram_widget_change_bar(w: PDiagramWidget; index: Tgint; y: Tgfloat);
procedure diagram_widget_set_auto_hight(w: PDiagramWidget; a: boolean);
procedure diagram_widget_set_hight(w: PDiagramWidget; s: Tgfloat);


implementation

// ==== private

type
  Tbar = record
    y: Tgfloat;
    lab: Pgchar;
  end;
  Pbar = ^Tbar;

type
  TInstPriv = record
    bars: PGArray;
    maxHeight: Tgfloat;
    AutoSize: boolean;
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

function GetRGBACol(i: SizeInt): TGdkRGBA;
begin
  result.SetItems((((i mod 6) + 1) and 4) shr 2 * 0.8, (((i mod 6) + 1) and 2) shr 1 * 0.8, (((i mod 6) + 1) and 1) * 0.8, 1.0);
end;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  priv: PInstPriv;
  width, height, dis, h: single;
  r: Tgraphene_rect_t;
  col: TGdkRGBA;
  len: Tguint;
  i: integer;
  item: Pbar;
begin
  priv := GetPriv(widget);

  with priv^ do begin
    width := gtk_widget_get_width(widget);
    height := gtk_widget_get_height(widget);

    graphene_rect_init(@r, 0, 0, width, height);
    col.SetItems(0.2, 0.0, 0.1, 1.0);
    gtk_snapshot_append_color(snapshot, @col, @r);

    len := bars^.len;
    dis := width / len;

    for i := 0 to len - 1 do begin
      item := Pbar(bars^.Data) + i;

      h := height / maxHeight * item^.y * 0.9;

      graphene_rect_init(@r, -dis / 3, height, dis / 3 * 2, -h);
      graphene_rect_offset(@r, dis / 2 + dis * i, 0);

      col := GetRGBACol(i);
      gtk_snapshot_append_color(snapshot, @col, @r);
    end;
  end;

end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(obj);
  with priv^ do begin
    g_array_free(bars, True);
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  GTK_WIDGET_CLASS(g_class)^.snapshot := @snapshoot_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure array_clear_func(Data: Tgpointer); cdecl;
var
  bar: Pbar absolute Data;
begin
  if bar^.lab <> nil then begin
    g_free(bar^.lab);
  end;
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(instance);
  with priv^ do begin
    bars := g_array_new(False, False, SizeOf(Tbar));
    g_array_set_clear_func(bars, @array_clear_func);
    maxHeight := 0.0;
    AutoSize := True;
  end;
end;


// ==== public

function diagram_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_WIDGET, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'DiagramWidget',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function diagram_widget_new: PGTKWidget;
var
  priv: PInstPriv;
begin
  Result := g_object_new(diagram_widget_get_type, nil);
  priv := GetPriv(Result);
end;

procedure diagram_widget_add_bar(w: PDiagramWidget; y: Tgfloat; l: Pgchar);
var
  priv: PInstPriv;
  bar: Tbar;
begin
  priv := GetPriv(w);
  with priv^ do begin
    if AutoSize then begin
      if y > maxHeight then begin
        maxHeight := y;
      end;
    end;
    bar.y := y;
    bar.lab := g_strdup(l);
    g_array_append_val(bars, bar);
  end;
  gtk_widget_queue_draw(GTK_WIDGET(w));
end;

procedure diagram_widget_change_bar(w: PDiagramWidget; index: Tgint; y: Tgfloat  );
var
  priv: PInstPriv;
  i: integer;
  item: Pbar;
begin
  priv := GetPriv(w);
  with priv^ do begin
    item := Pbar(priv^.bars^.data) + index;
    item^.y := y;

    if AutoSize then begin
      maxHeight := 0.0;
      for i := 0 to bars^.len - 1 do begin
        item := Pbar(bars^.Data) + i;
        if item^.y > maxHeight then begin
          maxHeight := item^.y;
        end;
      end;
    end;
  end;
end;

procedure diagram_widget_set_auto_hight(w: PDiagramWidget; a: boolean);
var
  priv: PInstPriv;
begin
  priv := GetPriv(w);
  with priv^ do begin
    AutoSize := a;
  end;
end;

procedure diagram_widget_set_hight(w: PDiagramWidget; s: Tgfloat);
var
  priv: PInstPriv;
begin
  priv := GetPriv(w);
  with priv^ do begin
    maxHeight := s;
  end;
end;

end.
