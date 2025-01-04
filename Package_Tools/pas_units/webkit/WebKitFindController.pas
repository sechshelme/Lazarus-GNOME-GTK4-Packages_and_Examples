unit WebKitFindController;

interface

uses
  fp_glib2, fp_GTK4, WebKit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {WEBKIT_DECLARE_FINAL_TYPE (WebKitFindController, webkit_find_controller, WEBKIT, FIND_CONTROLLER, GObject) }
type

  PWebKitFindOptions = ^TWebKitFindOptions;
  TWebKitFindOptions = longint;

const
  WEBKIT_FIND_OPTIONS_NONE = 0;
  WEBKIT_FIND_OPTIONS_CASE_INSENSITIVE = 1 shl 0;
  WEBKIT_FIND_OPTIONS_AT_WORD_STARTS = 1 shl 1;
  WEBKIT_FIND_OPTIONS_TREAT_MEDIAL_CAPITAL_AS_WORD_START = 1 shl 2;
  WEBKIT_FIND_OPTIONS_BACKWARDS = 1 shl 3;
  WEBKIT_FIND_OPTIONS_WRAP_AROUND = 1 shl 4;

type
  TWebKitFindController = record
  end;
  PWebKitFindController = ^TWebKitFindController;

  TWebKitFindControllerClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitFindControllerClass = ^TWebKitFindControllerClass;

function webkit_find_controller_get_type: TGType; cdecl; external libwebkit;
procedure webkit_find_controller_search(find_controller: PWebKitFindController; search_text: Pgchar; find_options: Tguint32; max_match_count: Tguint); cdecl; external libwebkit;
procedure webkit_find_controller_search_finish(find_controller: PWebKitFindController); cdecl; external libwebkit;
procedure webkit_find_controller_search_next(find_controller: PWebKitFindController); cdecl; external libwebkit;
procedure webkit_find_controller_search_previous(find_controller: PWebKitFindController); cdecl; external libwebkit;
procedure webkit_find_controller_count_matches(find_controller: PWebKitFindController; search_text: Pgchar; find_options: Tguint32; max_match_count: Tguint); cdecl; external libwebkit;
function webkit_find_controller_get_search_text(find_controller: PWebKitFindController): Pgchar; cdecl; external libwebkit;
function webkit_find_controller_get_options(find_controller: PWebKitFindController): Tguint32; cdecl; external libwebkit;
function webkit_find_controller_get_max_match_count(find_controller: PWebKitFindController): Tguint; cdecl; external libwebkit;
function webkit_find_controller_get_web_view(find_controller: PWebKitFindController): PWebKitWebView; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 19:51:56 ===

function WEBKIT_TYPE_FIND_CONTROLLER: TGType;
function WEBKIT_FIND_CONTROLLER(obj: Pointer): PWebKitFindController;
function WEBKIT_IS_FIND_CONTROLLER(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_FIND_CONTROLLER: TGType;
begin
  Result := webkit_find_controller_get_type;
end;

function WEBKIT_FIND_CONTROLLER(obj: Pointer): PWebKitFindController;
begin
  Result := PWebKitFindController(g_type_check_instance_cast(obj, WEBKIT_TYPE_FIND_CONTROLLER));
end;

function WEBKIT_IS_FIND_CONTROLLER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_FIND_CONTROLLER);
end;


end.
