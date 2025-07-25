unit ibusinputcontext;

interface

uses
  fp_glib2, ibus, ibusproxy, ibusenginedesc, ibustext;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  TIBusInputContext = record
    parent: TIBusProxy;
  end;
  PIBusInputContext = ^TIBusInputContext;

  TIBusInputContextClass = record
    parent: TIBusProxyClass;
    pdummy: array[0..23] of Tgpointer;
  end;
  PIBusInputContextClass = ^TIBusInputContextClass;

function ibus_input_context_get_type: TGType; cdecl; external libibus;
function ibus_input_context_new(path: Pgchar; connection: PGDBusConnection; cancellable: PGCancellable; error: PPGError): PIBusInputContext; cdecl; external libibus;
procedure ibus_input_context_new_async(path: Pgchar; connection: PGDBusConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_input_context_new_async_finish(res: PGAsyncResult; error: PPGError): PIBusInputContext; cdecl; external libibus;
function ibus_input_context_get_input_context(path: Pgchar; connection: PGDBusConnection): PIBusInputContext; cdecl; external libibus;
procedure ibus_input_context_get_input_context_async(path: Pgchar; connection: PGDBusConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_input_context_get_input_context_async_finish(res: PGAsyncResult; error: PPGError): PIBusInputContext; cdecl; external libibus;
procedure ibus_input_context_process_hand_writing_event(context: PIBusInputContext; coordinates: Pgdouble; coordinates_len: Tguint); cdecl; external libibus;
procedure ibus_input_context_cancel_hand_writing(context: PIBusInputContext; n_strokes: Tguint); cdecl; external libibus;
procedure ibus_input_context_process_key_event_async(context: PIBusInputContext; keyval: Tguint32; keycode: Tguint32; state: Tguint32; timeout_msec: Tgint;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_input_context_process_key_event_async_finish(context: PIBusInputContext; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libibus;
function ibus_input_context_process_key_event(context: PIBusInputContext; keyval: Tguint32; keycode: Tguint32; state: Tguint32): Tgboolean; cdecl; external libibus;
procedure ibus_input_context_set_cursor_location(context: PIBusInputContext; x: Tgint32; y: Tgint32; w: Tgint32; h: Tgint32); cdecl; external libibus;
procedure ibus_input_context_set_cursor_location_relative(context: PIBusInputContext; x: Tgint32; y: Tgint32; w: Tgint32; h: Tgint32); cdecl; external libibus;
procedure ibus_input_context_set_capabilities(context: PIBusInputContext; capabilities: Tguint32); cdecl; external libibus;
procedure ibus_input_context_property_activate(context: PIBusInputContext; prop_name: Pgchar; state: Tguint32); cdecl; external libibus;
procedure ibus_input_context_focus_in(context: PIBusInputContext); cdecl; external libibus;
procedure ibus_input_context_focus_out(context: PIBusInputContext); cdecl; external libibus;
procedure ibus_input_context_reset(context: PIBusInputContext); cdecl; external libibus;
procedure ibus_input_context_get_engine_async(context: PIBusInputContext; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_input_context_get_engine_async_finish(context: PIBusInputContext; res: PGAsyncResult; error: PPGError): PIBusEngineDesc; cdecl; external libibus;
function ibus_input_context_get_engine(context: PIBusInputContext): PIBusEngineDesc; cdecl; external libibus;
procedure ibus_input_context_set_engine(context: PIBusInputContext; name: Pgchar); cdecl; external libibus;
procedure ibus_input_context_set_surrounding_text(context: PIBusInputContext; text: PIBusText; cursor_pos: Tguint32; anchor_pos: Tguint32); cdecl; external libibus;
function ibus_input_context_needs_surrounding_text(context: PIBusInputContext): Tgboolean; cdecl; external libibus;
procedure ibus_input_context_set_content_type(context: PIBusInputContext; purpose: Tguint; hints: Tguint); cdecl; external libibus;
procedure ibus_input_context_set_client_commit_preedit(context: PIBusInputContext; client_commit: Tgboolean); cdecl; external libibus;
procedure ibus_input_context_set_post_process_key_event(context: PIBusInputContext; enable: Tgboolean); cdecl; external libibus;
procedure ibus_input_context_post_process_key_event(context: PIBusInputContext); cdecl; external libibus;

// === Konventiert am: 25-7-25 15:55:43 ===

function IBUS_TYPE_INPUT_CONTEXT: TGType;
function IBUS_INPUT_CONTEXT(obj: Pointer): PIBusInputContext;
function IBUS_INPUT_CONTEXT_CLASS(klass: Pointer): PIBusInputContextClass;
function IBUS_IS_INPUT_CONTEXT(obj: Pointer): Tgboolean;
function IBUS_IS_INPUT_CONTEXT_CLASS(klass: Pointer): Tgboolean;
function IBUS_INPUT_CONTEXT_GET_CLASS(obj: Pointer): PIBusInputContextClass;

implementation

function IBUS_TYPE_INPUT_CONTEXT: TGType;
begin
  IBUS_TYPE_INPUT_CONTEXT := ibus_input_context_get_type;
end;

function IBUS_INPUT_CONTEXT(obj: Pointer): PIBusInputContext;
begin
  Result := PIBusInputContext(g_type_check_instance_cast(obj, IBUS_TYPE_INPUT_CONTEXT));
end;

function IBUS_INPUT_CONTEXT_CLASS(klass: Pointer): PIBusInputContextClass;
begin
  Result := PIBusInputContextClass(g_type_check_class_cast(klass, IBUS_TYPE_INPUT_CONTEXT));
end;

function IBUS_IS_INPUT_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_INPUT_CONTEXT);
end;

function IBUS_IS_INPUT_CONTEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_INPUT_CONTEXT);
end;

function IBUS_INPUT_CONTEXT_GET_CLASS(obj: Pointer): PIBusInputContextClass;
begin
  Result := PIBusInputContextClass(PGTypeInstance(obj)^.g_class);
end;



end.
