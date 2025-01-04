unit WebKitPrintOperation;

interface

uses
  fp_glib2, fp_GTK4, WebKit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitPrintOperation, webkit_print_operation, WEBKIT, PRINT_OPERATION, GObject) }
type
  PWebKitPrintOperationResponse = ^TWebKitPrintOperationResponse;
  TWebKitPrintOperationResponse = longint;

const
  WEBKIT_PRINT_OPERATION_RESPONSE_PRINT = 0;
  WEBKIT_PRINT_OPERATION_RESPONSE_CANCEL = 1;

type
  TWebKitPrintOperation = record
  end;
  PWebKitPrintOperation = ^TWebKitPrintOperation;

  TWebKitPrintOperationClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitPrintOperationClass = ^TWebKitPrintOperationClass;

function webkit_print_operation_get_type: TGType; cdecl; external libwebkit;
function webkit_print_operation_new(web_view: PWebKitWebView): PWebKitPrintOperation; cdecl; external libwebkit;
function webkit_print_operation_get_print_settings(print_operation: PWebKitPrintOperation): PGtkPrintSettings; cdecl; external libwebkit;
procedure webkit_print_operation_set_print_settings(print_operation: PWebKitPrintOperation; print_settings: PGtkPrintSettings); cdecl; external libwebkit;
function webkit_print_operation_get_page_setup(print_operation: PWebKitPrintOperation): PGtkPageSetup; cdecl; external libwebkit;
procedure webkit_print_operation_set_page_setup(print_operation: PWebKitPrintOperation; page_setup: PGtkPageSetup); cdecl; external libwebkit;
function webkit_print_operation_run_dialog(print_operation: PWebKitPrintOperation; parent: PGtkWindow): TWebKitPrintOperationResponse; cdecl; external libwebkit;
procedure webkit_print_operation_print(print_operation: PWebKitPrintOperation); cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:27:53 ===

function WEBKIT_TYPE_PRINT_OPERATION: TGType;
function WEBKIT_PRINT_OPERATION(obj: Pointer): PWebKitPrintOperation;
function WEBKIT_IS_PRINT_OPERATION(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_PRINT_OPERATION: TGType;
begin
  Result := webkit_print_operation_get_type;
end;

function WEBKIT_PRINT_OPERATION(obj: Pointer): PWebKitPrintOperation;
begin
  Result := PWebKitPrintOperation(g_type_check_instance_cast(obj, WEBKIT_TYPE_PRINT_OPERATION));
end;

function WEBKIT_IS_PRINT_OPERATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_PRINT_OPERATION);
end;




end.
