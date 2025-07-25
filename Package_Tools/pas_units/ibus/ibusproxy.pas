unit ibusproxy;

interface

uses
  fp_glib2, ibus, ibusobject;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  TIBusProxy = record
    parent: TGDBusProxy;
    flags: Tguint32;
    own: Tgboolean;
  end;
  PIBusProxy = ^TIBusProxy;

  TIBusProxyClass = record
    parent: TGDBusProxyClass;
    destroy: procedure(proxy: PIBusProxy); cdecl;
    pdummy: array[0..6] of Tgpointer;
  end;
  PIBusProxyClass = ^TIBusProxyClass;

function ibus_proxy_get_type: TGType; cdecl; external libibus;
procedure ibus_proxy_destroy(proxy: PIBusProxy); cdecl; external libibus;

function IBUS_PROXY_FLAGS(obj: PIBusProxy): longint;
procedure IBUS_PROXY_SET_FLAGS(obj: PIBusProxy; flag: integer);
procedure IBUS_PROXY_UNSET_FLAGS(obj: PIBusProxy; flag: integer);
function IBUS_PROXY_DESTROYED(obj: PIBusProxy): longint;


// === Konventiert am: 25-7-25 16:45:57 ===

function IBUS_TYPE_PROXY: TGType;
function IBUS_PROXY(obj: Pointer): PIBusProxy;
function IBUS_PROXY_CLASS(klass: Pointer): PIBusProxyClass;
function IBUS_IS_PROXY(obj: Pointer): Tgboolean;
function IBUS_IS_PROXY_CLASS(klass: Pointer): Tgboolean;
function IBUS_PROXY_GET_CLASS(obj: Pointer): PIBusProxyClass;

implementation

function IBUS_TYPE_PROXY: TGType;
begin
  IBUS_TYPE_PROXY := ibus_proxy_get_type;
end;

function IBUS_PROXY(obj: Pointer): PIBusProxy;
begin
  Result := PIBusProxy(g_type_check_instance_cast(obj, IBUS_TYPE_PROXY));
end;

function IBUS_PROXY_CLASS(klass: Pointer): PIBusProxyClass;
begin
  Result := PIBusProxyClass(g_type_check_class_cast(klass, IBUS_TYPE_PROXY));
end;

function IBUS_IS_PROXY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_PROXY);
end;

function IBUS_IS_PROXY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_PROXY);
end;

function IBUS_PROXY_GET_CLASS(obj: Pointer): PIBusProxyClass;
begin
  Result := PIBusProxyClass(PGTypeInstance(obj)^.g_class);
end;

// ======

function IBUS_PROXY_FLAGS(obj: PIBusProxy): longint;
begin
  IBUS_PROXY_FLAGS := (IBUS_PROXY(obj))^.flags;
end;

procedure IBUS_PROXY_SET_FLAGS(obj: PIBusProxy; flag: integer);
begin
  obj^.flags := obj^.flags or flag;
end;

procedure IBUS_PROXY_UNSET_FLAGS(obj: PIBusProxy; flag: integer);
begin
  obj^.flags := obj^.flags and not flag;
end;

function IBUS_PROXY_DESTROYED(obj: PIBusProxy): longint;
begin
  IBUS_PROXY_DESTROYED := (IBUS_PROXY_FLAGS(obj)) and IBUS_DESTROYED;
end;


end.
