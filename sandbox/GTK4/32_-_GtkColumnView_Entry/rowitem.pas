unit RowItem;

interface

uses
  fp_glib2;

type
  PRowItem = type Pointer;
  PRowItemClass = type Pointer;

function row_item_get_type: TGType;
function row_item_new(t: Pgchar): PRowItem;
function row_item_get_text(o: PRowItem): pchar;
procedure row_item_set_text(o: PRowItem; t: pchar);

implementation

// ==== private

type
  TInstPriv = record
    text: Pgchar;
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
    if text <> nil then begin
      g_free(text);
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
    text := nil;
  end;
end;


// ==== public

function row_item_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(G_TYPE_OBJECT, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(G_TYPE_OBJECT, 'RowItem',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function row_item_new(t: Pgchar): PRowItem;
var
  priv: PInstPriv;
begin
  Result := g_object_new(row_item_get_type, nil);
  priv := GetPriv(Result);
  priv^.text := g_strdup(t);
end;

function row_item_get_text(o: PRowItem): pchar;
var
  priv: PInstPriv;
begin
  priv := GetPriv(o);
  with priv^ do begin
    Result := text;
  end;
end;

procedure row_item_set_text(o: PRowItem; t: pchar);
var
  priv: PInstPriv;
begin
  priv := GetPriv(o);
  with priv^ do begin
    if text <> nil then begin
      g_free(text);
    end;
    if t <> nil then  begin
      text := g_strdup(t);
    end else begin
      text := nil;
    end;
  end;
end;

end.
