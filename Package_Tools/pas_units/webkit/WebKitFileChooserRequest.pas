unit WebKitFileChooserRequest;

interface

uses
  fp_glib2, fp_GTK4, web_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitFileChooserRequest, webkit_file_chooser_request, WEBKIT, FILE_CHOOSER_REQUEST, GObject) }
type
  TWebKitFileChooserRequest = record
  end;
  PWebKitFileChooserRequest = ^TWebKitFileChooserRequest;

  TWebKitFileChooserRequestClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitFileChooserRequestClass = ^TWebKitFileChooserRequestClass;

function webkit_file_chooser_request_get_type: TGType; cdecl; external libwebkit;
function webkit_file_chooser_request_get_mime_types(request: PWebKitFileChooserRequest): PPgchar; cdecl; external libwebkit;
function webkit_file_chooser_request_get_mime_types_filter(request: PWebKitFileChooserRequest): PGtkFileFilter; cdecl; external libwebkit;
function webkit_file_chooser_request_get_select_multiple(request: PWebKitFileChooserRequest): Tgboolean; cdecl; external libwebkit;
procedure webkit_file_chooser_request_select_files(request: PWebKitFileChooserRequest; files: PPgchar); cdecl; external libwebkit;
function webkit_file_chooser_request_get_selected_files(request: PWebKitFileChooserRequest): PPgchar; cdecl; external libwebkit;
procedure webkit_file_chooser_request_cancel(request: PWebKitFileChooserRequest); cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:41:12 ===

function WEBKIT_TYPE_FILE_CHOOSER_REQUEST: TGType;
function WEBKIT_FILE_CHOOSER_REQUEST(obj: Pointer): PWebKitFileChooserRequest;
function WEBKIT_IS_FILE_CHOOSER_REQUEST(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_FILE_CHOOSER_REQUEST: TGType;
begin
  Result := webkit_file_chooser_request_get_type;
end;

function WEBKIT_FILE_CHOOSER_REQUEST(obj: Pointer): PWebKitFileChooserRequest;
begin
  Result := PWebKitFileChooserRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_FILE_CHOOSER_REQUEST));
end;

function WEBKIT_IS_FILE_CHOOSER_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_FILE_CHOOSER_REQUEST);
end;


end.
