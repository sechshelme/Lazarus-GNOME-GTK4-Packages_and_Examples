unit WebKitWebEditor;

interface

uses
  fp_glib2, fp_GTK4, WebKit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitWebEditor, webkit_web_editor, WEBKIT, WEB_EDITOR, GObject) }

type
  TWebKitWebEditor = record
  end;
  PWebKitWebEditor = ^TWebKitWebEditor;

  TWebKitWebEditorClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitWebEditorClass = ^TWebKitWebEditorClass;

function webkit_web_editor_get_type: TGType; cdecl; external libwebkit;
function webkit_web_editor_get_page(editor: PWebKitWebEditor): PWebKitWebPage; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 14:02:45 ===

function WEBKIT_TYPE_WEB_EDITOR: TGType;
function WEBKIT_WEB_EDITOR(obj: Pointer): PWebKitWebEditor;
function WEBKIT_IS_WEB_EDITOR(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_WEB_EDITOR: TGType;
begin
  Result := webkit_web_editor_get_type;
end;

function WEBKIT_WEB_EDITOR(obj: Pointer): PWebKitWebEditor;
begin
  Result := PWebKitWebEditor(g_type_check_instance_cast(obj, WEBKIT_TYPE_WEB_EDITOR));
end;

function WEBKIT_IS_WEB_EDITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_WEB_EDITOR);
end;


end.
