unit WebKitWebInspector;

interface

uses
  fp_glib2, fp_GTK4, WebKit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitWebInspector, webkit_web_inspector, WEBKIT, WEB_INSPECTOR, GObject) }
type
  TWebKitWebInspector = record
  end;
  PWebKitWebInspector = ^TWebKitWebInspector;

  TWebKitWebInspectorClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitWebInspectorClass = ^TWebKitWebInspectorClass;

function webkit_web_inspector_get_type: TGType; cdecl; external libwebkit;
function webkit_web_inspector_get_web_view(inspector: PWebKitWebInspector): PWebKitWebViewBase; cdecl; external libwebkit;
function webkit_web_inspector_get_inspected_uri(inspector: PWebKitWebInspector): pchar; cdecl; external libwebkit;
function webkit_web_inspector_is_attached(inspector: PWebKitWebInspector): Tgboolean; cdecl; external libwebkit;
procedure webkit_web_inspector_attach(inspector: PWebKitWebInspector); cdecl; external libwebkit;
procedure webkit_web_inspector_detach(inspector: PWebKitWebInspector); cdecl; external libwebkit;
procedure webkit_web_inspector_show(inspector: PWebKitWebInspector); cdecl; external libwebkit;
procedure webkit_web_inspector_close(inspector: PWebKitWebInspector); cdecl; external libwebkit;
function webkit_web_inspector_get_attached_height(inspector: PWebKitWebInspector): Tguint; cdecl; external libwebkit;
function webkit_web_inspector_get_can_attach(inspector: PWebKitWebInspector): Tgboolean; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 19:55:34 ===

function WEBKIT_TYPE_WEB_INSPECTOR: TGType;
function WEBKIT_WEB_INSPECTOR(obj: Pointer): PWebKitWebInspector;
function WEBKIT_IS_WEB_INSPECTOR(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_WEB_INSPECTOR: TGType;
begin
  Result := webkit_web_inspector_get_type;
end;

function WEBKIT_WEB_INSPECTOR(obj: Pointer): PWebKitWebInspector;
begin
  Result := PWebKitWebInspector(g_type_check_instance_cast(obj, WEBKIT_TYPE_WEB_INSPECTOR));
end;

function WEBKIT_IS_WEB_INSPECTOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_WEB_INSPECTOR);
end;


end.
