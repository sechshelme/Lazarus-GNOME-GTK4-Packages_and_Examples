unit ibusobject;

interface

uses
  fp_glib2, ibus;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PIBusObjectFlags = ^TIBusObjectFlags;
  TIBusObjectFlags = longint;

const
  IBUS_IN_DESTRUCTION = 1 shl 0;
  IBUS_DESTROYED = 1 shl 1;
  IBUS_RESERVED_1 = 1 shl 2;
  IBUS_RESERVED_2 = 1 shl 3;

type
  PIBusObjectPrivate = type Pointer;

  TIBusObject = record
    parent: TGInitiallyUnowned;
    flags: Tguint32;
    priv: PIBusObjectPrivate;
  end;
  PIBusObject = ^TIBusObject;


  TIBusObjectDestroyFunc = procedure(obj: PIBusObject); cdecl;

  TIBusObjectClass = record
    parent: TGInitiallyUnownedClass;
    destroy: procedure(obj: PIBusObject); cdecl;
    pdummy: array[0..6] of Tgpointer;
  end;
  PIBusObjectClass = ^TIBusObjectClass;


function ibus_object_get_type: TGType; cdecl; external libibus;
function ibus_object_new: PIBusObject; cdecl; external libibus;
procedure ibus_object_destroy(obj: PIBusObject); cdecl; external libibus;

function IBUS_OBJECT_FLAGS(obj: PIBusObject): longint;

procedure IBUS_OBJECT_SET_FLAGS(obj: PIBusObject; flag: integer);
procedure IBUS_OBJECT_UNSET_FLAGS(obj: PIBusObject; flag: integer);

function IBUS_OBJECT_IN_DESTRUCTION(obj: PIBusObject): longint;
function IBUS_OBJECT_DESTROYED(obj: PIBusObject): longint;

// === Konventiert am: 25-7-25 14:59:53 ===

function IBUS_TYPE_OBJECT: TGType;
function IBUS_OBJECT(obj: Pointer): PIBusObject;
function IBUS_OBJECT_CLASS(klass: Pointer): PIBusObjectClass;
function IBUS_IS_OBJECT(obj: Pointer): Tgboolean;
function IBUS_IS_OBJECT_CLASS(klass: Pointer): Tgboolean;
function IBUS_OBJECT_GET_CLASS(obj: Pointer): PIBusObjectClass;


implementation

function IBUS_TYPE_OBJECT: TGType;
begin
  IBUS_TYPE_OBJECT := ibus_object_get_type;
end;

function IBUS_OBJECT(obj: Pointer): PIBusObject;
begin
  Result := PIBusObject(g_type_check_instance_cast(obj, IBUS_TYPE_OBJECT));
end;

function IBUS_OBJECT_CLASS(klass: Pointer): PIBusObjectClass;
begin
  Result := PIBusObjectClass(g_type_check_class_cast(klass, IBUS_TYPE_OBJECT));
end;

function IBUS_IS_OBJECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_OBJECT);
end;

function IBUS_IS_OBJECT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_OBJECT);
end;

function IBUS_OBJECT_GET_CLASS(obj: Pointer): PIBusObjectClass;
begin
  Result := PIBusObjectClass(PGTypeInstance(obj)^.g_class);
end;

// ==============

function IBUS_OBJECT_FLAGS(obj: PIBusObject): longint;
begin
  IBUS_OBJECT_FLAGS := (IBUS_OBJECT(obj))^.flags;
end;

procedure IBUS_OBJECT_SET_FLAGS(obj: PIBusObject; flag: integer);
begin
  obj^.flags := obj^.flags or flag;
end;

procedure IBUS_OBJECT_UNSET_FLAGS(obj: PIBusObject; flag: integer);
begin
  obj^.flags := obj^.flags and not flag;
end;

function IBUS_OBJECT_IN_DESTRUCTION(obj: PIBusObject): longint;
begin
  IBUS_OBJECT_IN_DESTRUCTION := (IBUS_OBJECT_FLAGS(obj)) and IBUS_IN_DESTRUCTION;
end;

function IBUS_OBJECT_DESTROYED(obj: PIBusObject): longint;
begin
  IBUS_OBJECT_DESTROYED := (IBUS_OBJECT_FLAGS(obj)) and IBUS_DESTROYED;
end;


end.
