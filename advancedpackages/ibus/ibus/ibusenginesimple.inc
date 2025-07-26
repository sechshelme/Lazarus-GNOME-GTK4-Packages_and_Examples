{$IFDEF read_interface}


const
  IBUS_MAX_COMPOSE_LEN = $FF;

type
  PIBusEngineSimplePrivate = type Pointer;

  TIBusEngineSimple = record
    parent: TIBusEngine;
    priv: PIBusEngineSimplePrivate;
  end;
  PIBusEngineSimple = ^TIBusEngineSimple;

  TIBusEngineSimpleClass = record
    parent: TIBusEngineClass;
    pdummy: array[0..7] of Tgpointer;
  end;
  PIBusEngineSimpleClass = ^TIBusEngineSimpleClass;

const
  IBUS_COMPOSE_IGNORE_KEYLIST: array[0..15] of Tguint16 = (
    IBUS_KEY_Shift_L,
    IBUS_KEY_Shift_R,
    IBUS_KEY_Control_L,
    IBUS_KEY_Control_R,
    IBUS_KEY_Caps_Lock,
    IBUS_KEY_Shift_Lock,
    IBUS_KEY_Meta_L,
    IBUS_KEY_Meta_R,
    IBUS_KEY_Alt_L,
    IBUS_KEY_Alt_R,
    IBUS_KEY_Super_L,
    IBUS_KEY_Super_R,
    IBUS_KEY_Hyper_L,
    IBUS_KEY_Hyper_R,
    IBUS_KEY_Mode_switch,
    IBUS_KEY_ISO_Level3_Shift
    );


function ibus_engine_simple_get_type: TGType; cdecl; external libibus;
procedure ibus_engine_simple_add_table(simple: PIBusEngineSimple; data: Pguint16; max_seq_len: Tgint; n_seqs: Tgint); cdecl; external libibus;
function ibus_engine_simple_add_table_by_locale(simple: PIBusEngineSimple; locale: Pgchar): Tgboolean; cdecl; external libibus;
function ibus_engine_simple_add_compose_file(simple: PIBusEngineSimple; file_: Pgchar): Tgboolean; cdecl; external libibus;

// === Konventiert am: 26-7-25 15:53:56 ===

function IBUS_TYPE_ENGINE_SIMPLE: TGType;
function IBUS_ENGINE_SIMPLE(obj: Pointer): PIBusEngineSimple;
function IBUS_ENGINE_SIMPLE_CLASS(klass: Pointer): PIBusEngineSimpleClass;
function IBUS_IS_ENGINE_SIMPLE(obj: Pointer): Tgboolean;
function IBUS_IS_ENGINE_SIMPLE_CLASS(klass: Pointer): Tgboolean;
function IBUS_ENGINE_SIMPLE_GET_CLASS(obj: Pointer): PIBusEngineSimpleClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_ENGINE_SIMPLE: TGType;
begin
  IBUS_TYPE_ENGINE_SIMPLE := ibus_engine_simple_get_type;
end;

function IBUS_ENGINE_SIMPLE(obj: Pointer): PIBusEngineSimple;
begin
  Result := PIBusEngineSimple(g_type_check_instance_cast(obj, IBUS_TYPE_ENGINE_SIMPLE));
end;

function IBUS_ENGINE_SIMPLE_CLASS(klass: Pointer): PIBusEngineSimpleClass;
begin
  Result := PIBusEngineSimpleClass(g_type_check_class_cast(klass, IBUS_TYPE_ENGINE_SIMPLE));
end;

function IBUS_IS_ENGINE_SIMPLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_ENGINE_SIMPLE);
end;

function IBUS_IS_ENGINE_SIMPLE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_ENGINE_SIMPLE);
end;

function IBUS_ENGINE_SIMPLE_GET_CLASS(obj: Pointer): PIBusEngineSimpleClass;
begin
  Result := PIBusEngineSimpleClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
