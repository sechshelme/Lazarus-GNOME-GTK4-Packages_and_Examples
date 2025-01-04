{$IFDEF read_interface}


  {JSC_DECLARE_FINAL_TYPE (JSCException, jsc_exception, JSC, EXCEPTION, GObject) }
type
  TJSCException = record
  end;
  PJSCException = ^TJSCException;
  PPJSCException = ^PJSCException;

  TJSCExceptionClass = record
    parent_class: TGObjectClass;
  end;
  PJSCExceptionClass = ^TJSCExceptionClass;

function jsc_exception_get_type: TGType; cdecl; external libjavascriptcoregtk;
function jsc_exception_new(context: PJSCContext; message: pchar): PJSCException; cdecl; external libjavascriptcoregtk;
function jsc_exception_new_printf(context: PJSCContext; format: pchar; args: array of const): PJSCException; cdecl; external libjavascriptcoregtk;
function jsc_exception_new_printf(context: PJSCContext; format: pchar): PJSCException; cdecl; external libjavascriptcoregtk;
function jsc_exception_new_vprintf(context: PJSCContext; format: pchar; args: Tva_list): PJSCException; cdecl; external libjavascriptcoregtk;
function jsc_exception_new_with_name(context: PJSCContext; Name: pchar; message: pchar): PJSCException; cdecl; external libjavascriptcoregtk;
function jsc_exception_new_with_name_printf(context: PJSCContext; Name: pchar; format: pchar; args: array of const): PJSCException; cdecl; external libjavascriptcoregtk;
function jsc_exception_new_with_name_printf(context: PJSCContext; Name: pchar; format: pchar): PJSCException; cdecl; external libjavascriptcoregtk;
function jsc_exception_new_with_name_vprintf(context: PJSCContext; Name: pchar; format: pchar; args: Tva_list): PJSCException; cdecl; external libjavascriptcoregtk;
function jsc_exception_get_name(Exception: PJSCException): pchar; cdecl; external libjavascriptcoregtk;
function jsc_exception_get_message(Exception: PJSCException): pchar; cdecl; external libjavascriptcoregtk;
function jsc_exception_get_line_number(Exception: PJSCException): Tguint; cdecl; external libjavascriptcoregtk;
function jsc_exception_get_column_number(Exception: PJSCException): Tguint; cdecl; external libjavascriptcoregtk;
function jsc_exception_get_source_uri(Exception: PJSCException): pchar; cdecl; external libjavascriptcoregtk;
function jsc_exception_get_backtrace_string(Exception: PJSCException): pchar; cdecl; external libjavascriptcoregtk;
function jsc_exception_to_string(Exception: PJSCException): pchar; cdecl; external libjavascriptcoregtk;
function jsc_exception_report(Exception: PJSCException): pchar; cdecl; external libjavascriptcoregtk;

// === Konventiert am: 4-1-25 17:40:04 ===

function JSC_TYPE_EXCEPTION: TGType;
function JSC_EXCEPTION(obj: Pointer): PJSCException;
function JSC_IS_EXCEPTION(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function JSC_TYPE_EXCEPTION: TGType;
begin
  Result := jsc_exception_get_type;
end;

function JSC_EXCEPTION(obj: Pointer): PJSCException;
begin
  Result := PJSCException(g_type_check_instance_cast(obj, JSC_TYPE_EXCEPTION));
end;

function JSC_IS_EXCEPTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, JSC_TYPE_EXCEPTION);
end;


{$ENDIF read_implementation}
