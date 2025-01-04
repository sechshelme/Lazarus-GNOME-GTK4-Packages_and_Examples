unit WebKitFrame;

interface

uses
  fp_glib2, fp_GTK4, WebKit, WebKitScriptWorld;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitFrame, webkit_frame, WEBKIT, FRAME, GObject) }
type
  TWebKitFrame = record
  end;
  PWebKitFrame = ^TWebKitFrame;

  TWebKitFrameClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitFrameClass = ^TWebKitFrameClass;

function webkit_frame_get_type: TGType; cdecl; external libwebkit;
function webkit_frame_get_id(frame: PWebKitFrame): Tguint64; cdecl; external libwebkit;
function webkit_frame_is_main_frame(frame: PWebKitFrame): Tgboolean; cdecl; external libwebkit;
function webkit_frame_get_uri(frame: PWebKitFrame): Pgchar; cdecl; external libwebkit;
function webkit_frame_get_js_context(frame: PWebKitFrame): PJSCContext; cdecl; external libwebkit;
function webkit_frame_get_js_context_for_script_world(frame: PWebKitFrame; world: PWebKitScriptWorld): PJSCContext; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 13:57:43 ===

function WEBKIT_TYPE_FRAME: TGType;
function WEBKIT_FRAME(obj: Pointer): PWebKitFrame;
function WEBKIT_IS_FRAME(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_FRAME: TGType;
begin
  Result := webkit_frame_get_type;
end;

function WEBKIT_FRAME(obj: Pointer): PWebKitFrame;
begin
  Result := PWebKitFrame(g_type_check_instance_cast(obj, WEBKIT_TYPE_FRAME));
end;

function WEBKIT_IS_FRAME(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_FRAME);
end;


end.
