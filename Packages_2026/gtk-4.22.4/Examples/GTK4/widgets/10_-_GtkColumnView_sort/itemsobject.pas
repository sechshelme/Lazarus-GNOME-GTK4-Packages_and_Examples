unit ItemsObject;

interface

uses
  fp_glib2;

type
  PCVItem = type Pointer;
  PCVClass = type Pointer;

function cv_item_get_type: TGType;
function cv_item_new(c0, c1: Pgchar): PCVItem;
function cv_item_get_col0(o: PCVItem): pchar;
function cv_item_get_col1(o: PCVItem): pchar;

implementation

// ==== private

type
  TInstPriv = record
    col0, col1: Pgchar;
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
    if col0 <> nil then begin
      g_free(col0);
    end;
    if col1 <> nil then begin
      g_free(col1);
    end;
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
    col0 := nil;
    col1 := nil;
  end;
end;


// ==== public

function cv_item_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(G_TYPE_OBJECT, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(G_TYPE_OBJECT, 'ColumnViewItems',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function cv_item_new(c0, c1: Pgchar): PCVItem;
var
  priv: PInstPriv;
begin
  Result := g_object_new(cv_item_get_type, nil);
  priv := GetPriv(Result);
  priv^.col0 := g_strdup(c0);
  priv^.col1 := g_strdup(c1);
end;

function cv_item_get_col0(o: PCVItem): pchar;
var
  priv: PInstPriv;
begin
  priv := GetPriv(o);
  with priv^ do begin
    Result := col0;
  end;
end;

function cv_item_get_col1(o: PCVItem): pchar;
var
  priv: PInstPriv;
begin
  priv := GetPriv(o);
  with priv^ do begin
    Result := col1;
  end;
end;

end.
