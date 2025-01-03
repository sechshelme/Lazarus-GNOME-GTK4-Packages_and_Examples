unit WebKitInputMethodContext;

interface

uses
  fp_glib2, fp_GDK4, fp_GTK4, web_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_DERIVABLE_TYPE (WebKitInputMethodContext, webkit_input_method_context, WEBKIT, INPUT_METHOD_CONTEXT, GObject) }
type
  PWebKitInputPurpose = ^TWebKitInputPurpose;
  TWebKitInputPurpose = longint;

const
  WEBKIT_INPUT_PURPOSE_FREE_FORM = 0;
  WEBKIT_INPUT_PURPOSE_DIGITS = 1;
  WEBKIT_INPUT_PURPOSE_NUMBER = 2;
  WEBKIT_INPUT_PURPOSE_PHONE = 3;
  WEBKIT_INPUT_PURPOSE_URL = 4;
  WEBKIT_INPUT_PURPOSE_EMAIL = 5;
  WEBKIT_INPUT_PURPOSE_PASSWORD = 6;

type
  PWebKitInputHints = ^TWebKitInputHints;
  TWebKitInputHints = longint;

const
  WEBKIT_INPUT_HINT_NONE = 0;
  WEBKIT_INPUT_HINT_SPELLCHECK = 1 shl 0;
  WEBKIT_INPUT_HINT_LOWERCASE = 1 shl 1;
  WEBKIT_INPUT_HINT_UPPERCASE_CHARS = 1 shl 2;
  WEBKIT_INPUT_HINT_UPPERCASE_WORDS = 1 shl 3;
  WEBKIT_INPUT_HINT_UPPERCASE_SENTENCES = 1 shl 4;
  WEBKIT_INPUT_HINT_INHIBIT_OSK = 1 shl 5;

type
  TWebKitInputMethodContextPrivate = record
  end;
  PWebKitInputMethodContextPrivate = ^TWebKitInputMethodContextPrivate;

  TWebKitInputMethodContext = record
    parent_instance: TGObject;
    priv: PWebKitInputMethodContextPrivate;
  end;
  PWebKitInputMethodContext = ^TWebKitInputMethodContext;

  TWebKitInputMethodContextClass = record
    parent_class: TGObjectClass;
    preedit_started: procedure(context: PWebKitInputMethodContext); cdecl;
    preedit_changed: procedure(context: PWebKitInputMethodContext); cdecl;
    preedit_finished: procedure(context: PWebKitInputMethodContext); cdecl;
    committed: procedure(context: PWebKitInputMethodContext; Text: pchar); cdecl;
    delete_surrounding: procedure(context: PWebKitInputMethodContext; offset: longint; n_chars: Tguint); cdecl;
    set_enable_preedit: procedure(context: PWebKitInputMethodContext; Enabled: Tgboolean); cdecl;
    get_preedit: procedure(context: PWebKitInputMethodContext; Text: PPgchar; underlines: PPGList; cursor_offset: Pguint); cdecl;
    filter_key_event: function(context: PWebKitInputMethodContext; key_event: PGdkEvent): Tgboolean; cdecl;
    notify_focus_in: procedure(context: PWebKitInputMethodContext); cdecl;
    notify_focus_out: procedure(context: PWebKitInputMethodContext); cdecl;
    notify_cursor_area: procedure(context: PWebKitInputMethodContext; x: longint; y: longint; Width: longint; Height: longint); cdecl;
    notify_surrounding: procedure(context: PWebKitInputMethodContext; Text: Pgchar; length: Tguint; cursor_index: Tguint; selection_index: Tguint); cdecl;
    reset: procedure(context: PWebKitInputMethodContext); cdecl;
    _webkit_reserved0: procedure; cdecl;
    _webkit_reserved1: procedure; cdecl;
    _webkit_reserved2: procedure; cdecl;
    _webkit_reserved3: procedure; cdecl;
    _webkit_reserved4: procedure; cdecl;
    _webkit_reserved5: procedure; cdecl;
    _webkit_reserved6: procedure; cdecl;
    _webkit_reserved7: procedure; cdecl;
    _webkit_reserved8: procedure; cdecl;
    _webkit_reserved9: procedure; cdecl;
    _webkit_reserved10: procedure; cdecl;
    _webkit_reserved11: procedure; cdecl;
    _webkit_reserved12: procedure; cdecl;
    _webkit_reserved13: procedure; cdecl;
    _webkit_reserved14: procedure; cdecl;
    _webkit_reserved15: procedure; cdecl;
  end;
  PWebKitInputMethodContextClass = ^TWebKitInputMethodContextClass;

  TWebKitInputMethodUnderline = record
  end;
  PWebKitInputMethodUnderline = ^TWebKitInputMethodUnderline;

function webkit_input_method_context_get_type: TGType; cdecl; external libwebkit;
procedure webkit_input_method_context_set_enable_preedit(context: PWebKitInputMethodContext; Enabled: Tgboolean); cdecl; external libwebkit;
procedure webkit_input_method_context_get_preedit(context: PWebKitInputMethodContext; Text: PPchar; underlines: PPGList; cursor_offset: Pguint); cdecl; external libwebkit;
function webkit_input_method_context_filter_key_event(context: PWebKitInputMethodContext; key_event: PGdkEvent): Tgboolean; cdecl; external libwebkit;
procedure webkit_input_method_context_notify_focus_in(context: PWebKitInputMethodContext); cdecl; external libwebkit;
procedure webkit_input_method_context_notify_focus_out(context: PWebKitInputMethodContext); cdecl; external libwebkit;
procedure webkit_input_method_context_notify_cursor_area(context: PWebKitInputMethodContext; x: longint; y: longint; Width: longint; Height: longint); cdecl; external libwebkit;
procedure webkit_input_method_context_notify_surrounding(context: PWebKitInputMethodContext; Text: Pgchar; length: longint; cursor_index: Tguint; selection_index: Tguint); cdecl; external libwebkit;
procedure webkit_input_method_context_reset(context: PWebKitInputMethodContext); cdecl; external libwebkit;
function webkit_input_method_underline_get_type: TGType; cdecl; external libwebkit;
function webkit_input_method_underline_new(start_offset: Tguint; end_offset: Tguint): PWebKitInputMethodUnderline; cdecl; external libwebkit;
function webkit_input_method_underline_copy(underline: PWebKitInputMethodUnderline): PWebKitInputMethodUnderline; cdecl; external libwebkit;
procedure webkit_input_method_underline_free(underline: PWebKitInputMethodUnderline); cdecl; external libwebkit;
procedure webkit_input_method_underline_set_color(underline: PWebKitInputMethodUnderline; rgba: PGdkRGBA); cdecl; external libwebkit;
function webkit_input_method_context_get_input_purpose(context: PWebKitInputMethodContext): TWebKitInputPurpose; cdecl; external libwebkit;
procedure webkit_input_method_context_set_input_purpose(context: PWebKitInputMethodContext; purpose: TWebKitInputPurpose); cdecl; external libwebkit;
function webkit_input_method_context_get_input_hints(context: PWebKitInputMethodContext): TWebKitInputHints; cdecl; external libwebkit;
procedure webkit_input_method_context_set_input_hints(context: PWebKitInputMethodContext; hints: TWebKitInputHints); cdecl; external libwebkit;

function WEBKIT_TYPE_INPUT_METHOD_UNDERLINE: TGType;

// === Konventiert am: 3-1-25 20:10:00 ===

function WEBKIT_TYPE_INPUT_METHOD_CONTEXT: TGType;
function WEBKIT_INPUT_METHOD_CONTEXT(obj: Pointer): PWebKitInputMethodContext;
function WEBKIT_IS_INPUT_METHOD_CONTEXT(obj: Pointer): Tgboolean;
function WEBKIT_INPUT_METHOD_CONTEXT_CLASS(klass: Pointer): PWebKitInputMethodContextClass;
function WEBKIT_IS_INPUT_METHOD_CONTEXT_CLASS(klass: Pointer): Tgboolean;
function WEBKIT_INPUT_METHOD_CONTEXT_GET_CLASS(obj: Pointer): PWebKitInputMethodContextClass;

implementation

function WEBKIT_TYPE_INPUT_METHOD_CONTEXT: TGType;
begin
  Result := webkit_input_method_context_get_type;
end;

function WEBKIT_INPUT_METHOD_CONTEXT(obj: Pointer): PWebKitInputMethodContext;
begin
  Result := PWebKitInputMethodContext(g_type_check_instance_cast(obj, WEBKIT_TYPE_INPUT_METHOD_CONTEXT));
end;

function WEBKIT_IS_INPUT_METHOD_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_INPUT_METHOD_CONTEXT);
end;

function WEBKIT_INPUT_METHOD_CONTEXT_CLASS(klass: Pointer): PWebKitInputMethodContextClass;
begin
  Result := PWebKitInputMethodContextClass(g_type_check_class_cast(klass, WEBKIT_TYPE_INPUT_METHOD_CONTEXT));
end;

function WEBKIT_IS_INPUT_METHOD_CONTEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, WEBKIT_TYPE_INPUT_METHOD_CONTEXT);
end;

function WEBKIT_INPUT_METHOD_CONTEXT_GET_CLASS(obj: Pointer): PWebKitInputMethodContextClass;
begin
  Result := PWebKitInputMethodContextClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function WEBKIT_TYPE_INPUT_METHOD_UNDERLINE: TGType;
begin
  Result := webkit_input_method_underline_get_type;
end;


end.
