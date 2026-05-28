unit IdleObject;

interface

uses
  fp_glib2;

type
  PIdelObject = type Pointer;
  PIdelObjectClass = type Pointer;

function idle_object_get_type: TGType;
function idle_object_new: PIdelObject;
procedure idle_object_add(o: PIdelObject; cnt: Tgssize);

implementation

// ==== private

type
  TInstPriv = record
    counter: Tgssize;
    idle_id: Tguint;
  end;
  PInstPriv = ^TInstPriv;

  TClassPriv = record
  end;
  PClassPriv = ^TClassPriv;

var
  parent_class: Tgpointer = nil;
  instance_size: integer = 0;
  signal_id: Tguint = 0;


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
    if idle_id <> 0 then  begin
      g_source_remove(idle_id);
    end;
    idle_id := 0;
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(g_class);
  with priv^ do begin
    G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
    parent_class := g_type_class_peek_parent(g_class);
    signal_id := g_signal_new('triggered', G_TYPE_FROM_CLASS(g_class), G_SIGNAL_RUN_LAST, 0, nil, nil, nil, G_TYPE_NONE, 1, G_TYPE_STRING);
  end;
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(instance);
  with priv^ do begin
    idle_id := 0;
    counter := 0;
  end;
end;

// ======

function add_item_cp(user_data: Tgpointer): Tgboolean; cdecl;
var
  priv: PInstPriv;
  s: Pgchar;
begin
  priv := GetPriv(user_data);
  with priv^ do begin
    Dec(counter);
    s := g_strdup_printf('%ld', counter);
    g_signal_emit(user_data, signal_id, 0, s);
    g_free(s);
    if counter <= 0 then  begin
      Result := G_SOURCE_REMOVE_;
      idle_id := 0;
    end else begin
      Result := G_SOURCE_CONTINUE;
    end;
  end;
end;


// ==== public

function idle_object_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(G_TYPE_OBJECT, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(G_TYPE_OBJECT, 'IdleObject',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function idle_object_new: PIdelObject;
var
  priv: PInstPriv;
begin
  Result := g_object_new(idle_object_get_type, nil);
  priv := GetPriv(Result);
end;

procedure idle_object_add(o: PIdelObject; cnt: Tgssize);
var
  priv: PInstPriv;
begin
  priv := GetPriv(o);
  with priv^ do begin
    Inc(counter, cnt);
    if idle_id = 0 then  begin
      idle_id := g_idle_add(@add_item_cp, o);
    end;
  end;
end;

end.
