unit WebKitEditorState;

interface

uses
  fp_glib2, fp_GTK4, WebKit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitEditorState, webkit_editor_state, WEBKIT, EDITOR_STATE, GObject) }
type
  PWebKitEditorTypingAttributes = ^TWebKitEditorTypingAttributes;
  TWebKitEditorTypingAttributes = longint;

const
  WEBKIT_EDITOR_TYPING_ATTRIBUTE_NONE = 1 shl 1;
  WEBKIT_EDITOR_TYPING_ATTRIBUTE_BOLD = 1 shl 2;
  WEBKIT_EDITOR_TYPING_ATTRIBUTE_ITALIC = 1 shl 3;
  WEBKIT_EDITOR_TYPING_ATTRIBUTE_UNDERLINE = 1 shl 4;
  WEBKIT_EDITOR_TYPING_ATTRIBUTE_STRIKETHROUGH = 1 shl 5;

type
  TWebKitEditorState = record
  end;
  PWebKitEditorState = ^TWebKitEditorState;

  TWebKitEditorStateClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitEditorStateClass = ^TWebKitEditorStateClass;

function webkit_editor_state_get_type: TGType; cdecl; external libwebkit;
function webkit_editor_state_get_typing_attributes(editor_state: PWebKitEditorState): Tguint; cdecl; external libwebkit;
function webkit_editor_state_is_cut_available(editor_state: PWebKitEditorState): Tgboolean; cdecl; external libwebkit;
function webkit_editor_state_is_copy_available(editor_state: PWebKitEditorState): Tgboolean; cdecl; external libwebkit;
function webkit_editor_state_is_paste_available(editor_state: PWebKitEditorState): Tgboolean; cdecl; external libwebkit;
function webkit_editor_state_is_undo_available(editor_state: PWebKitEditorState): Tgboolean; cdecl; external libwebkit;
function webkit_editor_state_is_redo_available(editor_state: PWebKitEditorState): Tgboolean; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 20:06:01 ===

function WEBKIT_TYPE_EDITOR_STATE: TGType;
function WEBKIT_EDITOR_STATE(obj: Pointer): PWebKitEditorState;
function WEBKIT_IS_EDITOR_STATE(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_EDITOR_STATE: TGType;
begin
  Result := webkit_editor_state_get_type;
end;

function WEBKIT_EDITOR_STATE(obj: Pointer): PWebKitEditorState;
begin
  Result := PWebKitEditorState(g_type_check_instance_cast(obj, WEBKIT_TYPE_EDITOR_STATE));
end;

function WEBKIT_IS_EDITOR_STATE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_EDITOR_STATE);
end;


end.
