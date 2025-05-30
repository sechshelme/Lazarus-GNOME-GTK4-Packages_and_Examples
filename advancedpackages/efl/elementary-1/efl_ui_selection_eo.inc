{$IFDEF read_interface}


type
  PEfl_Ui_Selection = ^TEfl_Ui_Selection;
  TEfl_Ui_Selection = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Cnp_Buffer = ^TEfl_Ui_Cnp_Buffer;
  TEfl_Ui_Cnp_Buffer = longint;

const
  EFL_UI_CNP_BUFFER_SELECTION = 0;
  EFL_UI_CNP_BUFFER_COPY_AND_PASTE = 1;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Wm_Selection_Changed = record
    buffer: TEfl_Ui_Cnp_Buffer;
    caused_by: PEfl_Ui_Selection;
    seat: dword;
  end;
  PEfl_Ui_Wm_Selection_Changed = ^TEfl_Ui_Wm_Selection_Changed;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SELECTION_MIXIN: PEfl_Class;

function efl_ui_selection_mixin_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_selection_set(obj: PEo; buffer: TEfl_Ui_Cnp_Buffer; content: PEina_Content; seat: dword); cdecl; external libelementary;
procedure efl_ui_selection_clear(obj: PEo; buffer: TEfl_Ui_Cnp_Buffer; seat: dword); cdecl; external libelementary;
function efl_ui_selection_get(obj: PEo; buffer: TEfl_Ui_Cnp_Buffer; seat: dword; acceptable_types: PEina_Iterator): PEina_Future; cdecl; external libelementary;
function efl_ui_selection_has_selection(obj: PEo; buffer: TEfl_Ui_Cnp_Buffer; seat: dword): TEina_Bool; cdecl; external libelementary;

var
  _EFL_UI_SELECTION_EVENT_WM_SELECTION_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_SELECTION_EVENT_WM_SELECTION_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 29-5-25 19:47:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SELECTION_MIXIN: PEfl_Class;
begin
  EFL_UI_SELECTION_MIXIN := efl_ui_selection_mixin_get;
end;

function EFL_UI_SELECTION_EVENT_WM_SELECTION_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_SELECTION_EVENT_WM_SELECTION_CHANGED := @(_EFL_UI_SELECTION_EVENT_WM_SELECTION_CHANGED);
end;
{$endif}


{$ENDIF read_implementation}
