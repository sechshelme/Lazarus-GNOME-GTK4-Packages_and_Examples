unit JSCContext;

interface

uses
  fp_glib2, JSCValue, JSCClass, JSCException, JSCVirtualMachine;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {JSC_DECLARE_FINAL_TYPE (JSCContext, jsc_context, JSC, CONTEXT, GObject) }
type
  TJSCContext = record
  end;
  PJSCContext = ^TJSCContext;

  TJSCContextClass = record
    parent_class: TGObjectClass;
  end;
  PJSCContextClass = ^TJSCContextClass;

  TJSCExceptionHandler = procedure(context: PJSCContext; Exception: PJSCException; user_data: Tgpointer); cdecl;

  PJSCCheckSyntaxMode = ^TJSCCheckSyntaxMode;
  TJSCCheckSyntaxMode = longint;

const
  JSC_CHECK_SYNTAX_MODE_SCRIPT = 0;
  JSC_CHECK_SYNTAX_MODE_MODULE = 1;

type
  PJSCCheckSyntaxResult = ^TJSCCheckSyntaxResult;
  TJSCCheckSyntaxResult = longint;

const
  JSC_CHECK_SYNTAX_RESULT_SUCCESS = 0;
  JSC_CHECK_SYNTAX_RESULT_RECOVERABLE_ERROR = 1;
  JSC_CHECK_SYNTAX_RESULT_IRRECOVERABLE_ERROR = 2;
  JSC_CHECK_SYNTAX_RESULT_UNTERMINATED_LITERAL_ERROR = 3;
  JSC_CHECK_SYNTAX_RESULT_OUT_OF_MEMORY_ERROR = 4;
  JSC_CHECK_SYNTAX_RESULT_STACK_OVERFLOW_ERROR = 5;

function jsc_context_get_type: TGType; cdecl; external libjavascriptcoregtk;
function jsc_context_new: PJSCContext; cdecl; external libjavascriptcoregtk;
function jsc_context_new_with_virtual_machine(vm: PJSCVirtualMachine): PJSCContext; cdecl; external libjavascriptcoregtk;
function jsc_context_get_virtual_machine(context: PJSCContext): PJSCVirtualMachine; cdecl; external libjavascriptcoregtk;
function jsc_context_get_exception(context: PJSCContext): PJSCException; cdecl; external libjavascriptcoregtk;
procedure jsc_context_throw(context: PJSCContext; error_message: pchar); cdecl; external libjavascriptcoregtk;
procedure jsc_context_throw_printf(context: PJSCContext; format: pchar; args: array of const); cdecl; external libjavascriptcoregtk;
procedure jsc_context_throw_printf(context: PJSCContext; format: pchar); cdecl; external libjavascriptcoregtk;
procedure jsc_context_throw_with_name(context: PJSCContext; error_name: pchar; error_message: pchar); cdecl; external libjavascriptcoregtk;
procedure jsc_context_throw_with_name_printf(context: PJSCContext; error_name: pchar; format: pchar; args: array of const); cdecl; external libjavascriptcoregtk;
procedure jsc_context_throw_with_name_printf(context: PJSCContext; error_name: pchar; format: pchar); cdecl; external libjavascriptcoregtk;
procedure jsc_context_throw_exception(context: PJSCContext; Exception: PJSCException); cdecl; external libjavascriptcoregtk;
procedure jsc_context_clear_exception(context: PJSCContext); cdecl; external libjavascriptcoregtk;
procedure jsc_context_push_exception_handler(context: PJSCContext; handler: TJSCExceptionHandler; user_data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libjavascriptcoregtk;
procedure jsc_context_pop_exception_handler(context: PJSCContext); cdecl; external libjavascriptcoregtk;
function jsc_context_get_current: PJSCContext; cdecl; external libjavascriptcoregtk;
function jsc_context_evaluate(context: PJSCContext; code: pchar; length: Tgssize): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_context_evaluate_with_source_uri(context: PJSCContext; code: pchar; length: Tgssize; uri: pchar; line_number: Tguint): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_context_evaluate_in_object(context: PJSCContext; code: pchar; length: Tgssize; object_instance: Tgpointer; object_class: PJSCClass;
  uri: pchar; line_number: Tguint; obj: PPJSCValue): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_context_check_syntax(context: PJSCContext; code: pchar; length: Tgssize; mode: TJSCCheckSyntaxMode; uri: pchar;
  line_number: dword; Exception: PPJSCException): TJSCCheckSyntaxResult; cdecl; external libjavascriptcoregtk;
function jsc_context_get_global_object(context: PJSCContext): PJSCValue; cdecl; external libjavascriptcoregtk;
procedure jsc_context_set_value(context: PJSCContext; Name: pchar; Value: PJSCValue); cdecl; external libjavascriptcoregtk;
function jsc_context_get_value(context: PJSCContext; Name: pchar): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_context_register_class(context: PJSCContext; Name: pchar; parent_class: PJSCClass; vtable: PJSCClassVTable; destroy_notify: TGDestroyNotify): PJSCClass; cdecl; external libjavascriptcoregtk;

// === Konventiert am: 4-1-25 17:37:11 ===

function JSC_TYPE_CONTEXT: TGType;
function JSC_CONTEXT(obj: Pointer): PJSCContext;
function JSC_IS_CONTEXT(obj: Pointer): Tgboolean;

implementation

function JSC_TYPE_CONTEXT: TGType;
begin
  Result := jsc_context_get_type;
end;

function JSC_CONTEXT(obj: Pointer): PJSCContext;
begin
  Result := PJSCContext(g_type_check_instance_cast(obj, JSC_TYPE_CONTEXT));
end;

function JSC_IS_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, JSC_TYPE_CONTEXT);
end;


end.
