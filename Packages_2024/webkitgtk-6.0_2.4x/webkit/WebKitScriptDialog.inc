{$IFDEF read_interface}

type
  PWebKitScriptDialogType = ^TWebKitScriptDialogType;
  TWebKitScriptDialogType = longint;

const
  WEBKIT_SCRIPT_DIALOG_ALERT = 0;
  WEBKIT_SCRIPT_DIALOG_CONFIRM = 1;
  WEBKIT_SCRIPT_DIALOG_PROMPT = 2;
  WEBKIT_SCRIPT_DIALOG_BEFORE_UNLOAD_CONFIRM = 3;

type
  TWebKitScriptDialog = record
  end;
  PWebKitScriptDialog = ^TWebKitScriptDialog;

function webkit_script_dialog_get_type: TGType; cdecl; external libwebkit;
function webkit_script_dialog_ref(dialog: PWebKitScriptDialog): PWebKitScriptDialog; cdecl; external libwebkit;
procedure webkit_script_dialog_unref(dialog: PWebKitScriptDialog); cdecl; external libwebkit;
function webkit_script_dialog_get_dialog_type(dialog: PWebKitScriptDialog): TWebKitScriptDialogType; cdecl; external libwebkit;
function webkit_script_dialog_get_message(dialog: PWebKitScriptDialog): Pgchar; cdecl; external libwebkit;
procedure webkit_script_dialog_confirm_set_confirmed(dialog: PWebKitScriptDialog; confirmed: Tgboolean); cdecl; external libwebkit;
function webkit_script_dialog_prompt_get_default_text(dialog: PWebKitScriptDialog): Pgchar; cdecl; external libwebkit;
procedure webkit_script_dialog_prompt_set_text(dialog: PWebKitScriptDialog; Text: Pgchar); cdecl; external libwebkit;
procedure webkit_script_dialog_close(dialog: PWebKitScriptDialog); cdecl; external libwebkit;

// === Konventiert am: 3-1-25 13:20:12 ===

function WEBKIT_TYPE_SCRIPT_DIALOG: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_SCRIPT_DIALOG: TGType;
begin
  WEBKIT_TYPE_SCRIPT_DIALOG := webkit_script_dialog_get_type;
end;



{$ENDIF read_implementation}
