{$IFDEF read_interface}


type
  TIBusProcessKeyEventData = record
    keyval: Tguint;
    keycode: Tguint;
    state: Tguint;
  end;
  PIBusProcessKeyEventData = ^TIBusProcessKeyEventData;

  PIBusExtensionEventPrivate = type Pointer;

  TIBusExtensionEvent = record
    parent: TIBusSerializable;
    priv: PIBusExtensionEventPrivate;
  end;
  PIBusExtensionEvent = ^TIBusExtensionEvent;

  TIBusExtensionEventClass = record
    parent: TIBusSerializableClass;
    pdummy: array[0..9] of Tgpointer;
  end;
  PIBusExtensionEventClass = ^TIBusExtensionEventClass;


function ibus_extension_event_get_type: TGType; cdecl; external libibus;
function ibus_extension_event_new(first_property_name: Pgchar): PIBusExtensionEvent; varargs; cdecl; external libibus;
function ibus_extension_event_get_version(event: PIBusExtensionEvent): Tguint; cdecl; external libibus;
function ibus_extension_event_get_name(event: PIBusExtensionEvent): Pgchar; cdecl; external libibus;
function ibus_extension_event_is_enabled(event: PIBusExtensionEvent): Tgboolean; cdecl; external libibus;
function ibus_extension_event_is_extension(event: PIBusExtensionEvent): Tgboolean; cdecl; external libibus;
function ibus_extension_event_get_params(event: PIBusExtensionEvent): Pgchar; cdecl; external libibus;

type
  PIBusXEventType = ^TIBusXEventType;
  TIBusXEventType = longint;

const
  IBUS_X_EVENT_NOTHING = -(1);
  IBUS_X_EVENT_KEY_PRESS = 0;
  IBUS_X_EVENT_KEY_RELEASE = 1;
  IBUS_X_EVENT_OTHER = 2;
  IBUS_X_EVENT_EVENT_LAST = 3;

type
  PIBusXEventPrivate = type Pointer;

  TIBusXEvent = record
    parent: TIBusSerializable;
    priv: PIBusXEventPrivate;
    event_type: TIBusXEventType;
    window: Tguint;
    send_event: Tgint8;
    serial: Tgulong;
  end;
  PIBusXEvent = ^TIBusXEvent;

  TIBusXEventClass = record
    parent: TIBusSerializableClass;
    pdummy: array[0..9] of Tgpointer;
  end;
  PIBusXEventClass = ^TIBusXEventClass;


function ibus_x_event_get_type: TGType; cdecl; external libibus;
function ibus_x_event_new(first_property_name: Pgchar): PIBusXEvent; cdecl; varargs; external libibus;
function ibus_x_event_get_version(event: PIBusXEvent): Tguint; cdecl; external libibus;
function ibus_x_event_get_event_type(event: PIBusXEvent): TIBusXEventType; cdecl; external libibus;
function ibus_x_event_get_window(event: PIBusXEvent): Tguint32; cdecl; external libibus;
function ibus_x_event_get_send_event(event: PIBusXEvent): Tgint8; cdecl; external libibus;
function ibus_x_event_get_serial(event: PIBusXEvent): Tgulong; cdecl; external libibus;
function ibus_x_event_get_time(event: PIBusXEvent): Tguint32; cdecl; external libibus;
function ibus_x_event_get_state(event: PIBusXEvent): Tguint; cdecl; external libibus;
function ibus_x_event_get_keyval(event: PIBusXEvent): Tguint; cdecl; external libibus;
function ibus_x_event_get_length(event: PIBusXEvent): Tgint; cdecl; external libibus;
function ibus_x_event_get_string(event: PIBusXEvent): Pgchar; cdecl; external libibus;
function ibus_x_event_get_hardware_keycode(event: PIBusXEvent): Tguint16; cdecl; external libibus;
function ibus_x_event_get_group(event: PIBusXEvent): Tguint8; cdecl; external libibus;
function ibus_x_event_get_is_modifier(event: PIBusXEvent): Tgboolean; cdecl; external libibus;
function ibus_x_event_get_subwindow(event: PIBusXEvent): Tguint32; cdecl; external libibus;
function ibus_x_event_get_root(event: PIBusXEvent): Tguint32; cdecl; external libibus;
function ibus_x_event_get_x(event: PIBusXEvent): Tgint; cdecl; external libibus;
function ibus_x_event_get_y(event: PIBusXEvent): Tgint; cdecl; external libibus;
function ibus_x_event_get_x_root(event: PIBusXEvent): Tgint; cdecl; external libibus;
function ibus_x_event_get_y_root(event: PIBusXEvent): Tgint; cdecl; external libibus;
function ibus_x_event_get_same_screen(event: PIBusXEvent): Tgboolean; cdecl; external libibus;
function ibus_x_event_get_purpose(event: PIBusXEvent): Pgchar; cdecl; external libibus;

// === Konventiert am: 25-7-25 17:26:08 ===

function IBUS_TYPE_EXTENSION_EVENT: TGType;
function IBUS_EXTENSION_EVENT(obj: Pointer): PIBusExtensionEvent;
function IBUS_EXTENSION_EVENT_CLASS(klass: Pointer): PIBusExtensionEventClass;
function IBUS_IS_EXTENSION_EVENT(obj: Pointer): Tgboolean;
function IBUS_IS_EXTENSION_EVENT_CLASS(klass: Pointer): Tgboolean;
function IBUS_EXTENSION_EVENT_GET_CLASS(obj: Pointer): PIBusExtensionEventClass;

function IBUS_TYPE_X_EVENT: TGType;
function IBUS_X_EVENT(obj: Pointer): PIBusXEvent;
function IBUS_X_EVENT_CLASS(klass: Pointer): PIBusXEventClass;
function IBUS_IS_X_EVENT(obj: Pointer): Tgboolean;
function IBUS_IS_X_EVENT_CLASS(klass: Pointer): Tgboolean;
function IBUS_X_EVENT_GET_CLASS(obj: Pointer): PIBusXEventClass;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_EXTENSION_EVENT: TGType;
begin
  IBUS_TYPE_EXTENSION_EVENT := ibus_extension_event_get_type;
end;

function IBUS_EXTENSION_EVENT(obj: Pointer): PIBusExtensionEvent;
begin
  Result := PIBusExtensionEvent(g_type_check_instance_cast(obj, IBUS_TYPE_EXTENSION_EVENT));
end;

function IBUS_EXTENSION_EVENT_CLASS(klass: Pointer): PIBusExtensionEventClass;
begin
  Result := PIBusExtensionEventClass(g_type_check_class_cast(klass, IBUS_TYPE_EXTENSION_EVENT));
end;

function IBUS_IS_EXTENSION_EVENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_EXTENSION_EVENT);
end;

function IBUS_IS_EXTENSION_EVENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_EXTENSION_EVENT);
end;

function IBUS_EXTENSION_EVENT_GET_CLASS(obj: Pointer): PIBusExtensionEventClass;
begin
  Result := PIBusExtensionEventClass(PGTypeInstance(obj)^.g_class);
end;

// ============

function IBUS_TYPE_X_EVENT: TGType;
begin
  IBUS_TYPE_X_EVENT := ibus_x_event_get_type;
end;

function IBUS_X_EVENT(obj: Pointer): PIBusXEvent;
begin
  Result := PIBusXEvent(g_type_check_instance_cast(obj, IBUS_TYPE_X_EVENT));
end;

function IBUS_X_EVENT_CLASS(klass: Pointer): PIBusXEventClass;
begin
  Result := PIBusXEventClass(g_type_check_class_cast(klass, IBUS_TYPE_X_EVENT));
end;

function IBUS_IS_X_EVENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_X_EVENT);
end;

function IBUS_IS_X_EVENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_X_EVENT);
end;

function IBUS_X_EVENT_GET_CLASS(obj: Pointer): PIBusXEventClass;
begin
  Result := PIBusXEventClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
