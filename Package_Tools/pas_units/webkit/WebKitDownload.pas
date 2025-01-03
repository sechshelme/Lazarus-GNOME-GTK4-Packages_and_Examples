unit WebKitDownload;

interface

uses
  fp_glib2, fp_GTK4, web_common, WebKitURIRequest, WebKitURIResponse;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitDownload, webkit_download, WEBKIT, DOWNLOAD, GObject) }
type
  TWebKitDownload = record
  end;
  PWebKitDownload = ^TWebKitDownload;

  TWebKitDownloadClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitDownloadClass = ^TWebKitDownloadClass;

function webkit_download_get_type: TGType; cdecl; external libwebkit;
function webkit_download_get_request(download: PWebKitDownload): PWebKitURIRequest; cdecl; external libwebkit;
function webkit_download_get_destination(download: PWebKitDownload): Pgchar; cdecl; external libwebkit;
procedure webkit_download_set_destination(download: PWebKitDownload; destination: Pgchar); cdecl; external libwebkit;
function webkit_download_get_response(download: PWebKitDownload): PWebKitURIResponse; cdecl; external libwebkit;
procedure webkit_download_cancel(download: PWebKitDownload); cdecl; external libwebkit;
function webkit_download_get_estimated_progress(download: PWebKitDownload): Tgdouble; cdecl; external libwebkit;
function webkit_download_get_elapsed_time(download: PWebKitDownload): Tgdouble; cdecl; external libwebkit;
function webkit_download_get_received_data_length(download: PWebKitDownload): Tguint64; cdecl; external libwebkit;
function webkit_download_get_web_view(download: PWebKitDownload): PWebKitWebView; cdecl; external libwebkit;
function webkit_download_get_allow_overwrite(download: PWebKitDownload): Tgboolean; cdecl; external libwebkit;
procedure webkit_download_set_allow_overwrite(download: PWebKitDownload; allowed: Tgboolean); cdecl; external libwebkit;

// === Konventiert am: 3-1-25 19:25:15 ===

function WEBKIT_TYPE_DOWNLOAD: TGType;
function WEBKIT_DOWNLOAD(obj: Pointer): PWebKitDownload;
function WEBKIT_IS_DOWNLOAD(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_DOWNLOAD: TGType;
begin
  Result := webkit_download_get_type;
end;

function WEBKIT_DOWNLOAD(obj: Pointer): PWebKitDownload;
begin
  Result := PWebKitDownload(g_type_check_instance_cast(obj, WEBKIT_TYPE_DOWNLOAD));
end;

function WEBKIT_IS_DOWNLOAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_DOWNLOAD);
end;


end.
