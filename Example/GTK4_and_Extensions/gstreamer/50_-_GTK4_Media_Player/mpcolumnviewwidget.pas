unit MPColumnViewWidget;

interface

uses
  fp_glib2, fp_GTK4;

type
  PMPColumnViewBox = type Pointer;
  PMPColumnViewBoxClass = type Pointer;

function mp_column_view_box_get_type: TGType;
function mp_column_view_box_new: PGTKWidget;
procedure mp_column_view_box_set_data(w: PMPColumnViewBox; i: integer);
function mp_column_view_box_get_data(w: PMPColumnViewBox): integer;

implementation

// ==== private

type
  TInstPriv = record
    meineDaten: integer;
  end;
  PInstPriv = ^TInstPriv;

  TClassPriv = record
    meineDaten: Pointer;
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


// ==== public

function mp_column_view_box_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_BOX, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(GTK_TYPE_BOX, 'MPColumnViewBox',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_column_view_box_new: PGTKWidget;
var
  priv: PInstPriv;
begin
  Result := g_object_new(mp_column_view_box_get_type, nil);
  priv := GetPriv(Result);
  with priv^ do begin
  end;
end;

procedure mp_column_view_box_set_data(w: PMPColumnViewBox; i: integer);
var
  priv: PInstPriv;
begin
  priv := GetPriv(w);
  priv^.meineDaten := i;
end;

function mp_column_view_box_get_data(w: PMPColumnViewBox): integer;
var
  priv: PInstPriv;
begin
  priv := GetPriv(w);
  Result := priv^.meineDaten;
end;

end.
