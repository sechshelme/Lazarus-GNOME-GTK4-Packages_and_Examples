unit WebKitWebProcessExtension;

interface

uses
  fp_glib2, fp_GTK4, WebKit, WebKitWebPage, WebKitUserMessage;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {WEBKIT_DECLARE_FINAL_TYPE (WebKitWebProcessExtension, webkit_web_process_extension, WEBKIT, WEB_PROCESS_EXTENSION, GObject) }
type
  TWebKitWebProcessExtension = record
  end;
  PWebKitWebProcessExtension = ^TWebKitWebProcessExtension;

  TWebKitWebProcessExtensionClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitWebProcessExtensionClass = ^TWebKitWebProcessExtensionClass;

  TWebKitWebProcessExtensionInitializeFunction = procedure(extension: PWebKitWebProcessExtension); cdecl;
  TWebKitWebProcessExtensionInitializeWithUserDataFunction = procedure(extension: PWebKitWebProcessExtension; user_data: PGVariant); cdecl;

function webkit_web_process_extension_get_type: TGType; cdecl; external libwebkit;
function webkit_web_process_extension_get_page(extension: PWebKitWebProcessExtension; page_id: Tguint64): PWebKitWebPage; cdecl; external libwebkit;
procedure webkit_web_process_extension_send_message_to_context(extension: PWebKitWebProcessExtension; message: PWebKitUserMessage; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_web_process_extension_send_message_to_context_finish(extension: PWebKitWebProcessExtension; Result: PGAsyncResult; error: PPGError): PWebKitUserMessage; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 13:53:38 ===

function WEBKIT_TYPE_WEB_PROCESS_EXTENSION: TGType;
function WEBKIT_WEB_PROCESS_EXTENSION(obj: Pointer): PWebKitWebProcessExtension;
function WEBKIT_IS_WEB_PROCESS_EXTENSION(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_WEB_PROCESS_EXTENSION: TGType;
begin
  Result := webkit_web_process_extension_get_type;
end;

function WEBKIT_WEB_PROCESS_EXTENSION(obj: Pointer): PWebKitWebProcessExtension;
begin
  Result := PWebKitWebProcessExtension(g_type_check_instance_cast(obj, WEBKIT_TYPE_WEB_PROCESS_EXTENSION));
end;

function WEBKIT_IS_WEB_PROCESS_EXTENSION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_WEB_PROCESS_EXTENSION);
end;


end.
