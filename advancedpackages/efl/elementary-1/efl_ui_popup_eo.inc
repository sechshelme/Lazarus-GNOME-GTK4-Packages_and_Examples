{$IFDEF read_interface}


type
  PEfl_Ui_Popup = ^TEfl_Ui_Popup;
  TEfl_Ui_Popup = TEo;

type
  PEfl_Ui_Popup_Align = ^TEfl_Ui_Popup_Align;
  TEfl_Ui_Popup_Align = (EFL_UI_POPUP_ALIGN_NONE := 0, EFL_UI_POPUP_ALIGN_CENTER,
    EFL_UI_POPUP_ALIGN_LEFT, EFL_UI_POPUP_ALIGN_RIGHT,
    EFL_UI_POPUP_ALIGN_TOP, EFL_UI_POPUP_ALIGN_BOTTOM
    );

function EFL_UI_POPUP_CLASS: PEfl_Config;

function efl_ui_popup_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_popup_align_set(obj: PEo; _type: TEfl_Ui_Popup_Align); cdecl; external libelementary;
function efl_ui_popup_align_get(obj: PEo): TEfl_Ui_Popup_Align; cdecl; external libelementary;
procedure efl_ui_popup_closing_timeout_set(obj: PEo; time: double); cdecl; external libelementary;
function efl_ui_popup_closing_timeout_get(obj: PEo): double; cdecl; external libelementary;
procedure efl_ui_popup_anchor_set(obj: PEo; anchor: PEfl_Canvas_Object); cdecl; external libelementary;
function efl_ui_popup_anchor_get(obj: PEo): PEfl_Canvas_Object; cdecl; external libelementary;
procedure efl_ui_popup_align_priority_set(obj: PEo; first: TEfl_Ui_Popup_Align; second: TEfl_Ui_Popup_Align; third: TEfl_Ui_Popup_Align; fourth: TEfl_Ui_Popup_Align;
  fifth: TEfl_Ui_Popup_Align); cdecl; external libelementary;
procedure efl_ui_popup_align_priority_get(obj: PEo; first: PEfl_Ui_Popup_Align; second: PEfl_Ui_Popup_Align; third: PEfl_Ui_Popup_Align; fourth: PEfl_Ui_Popup_Align;
  fifth: PEfl_Ui_Popup_Align); cdecl; external libelementary;

var
  _EFL_UI_POPUP_EVENT_BACKWALL_CLICKED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_POPUP_EVENT_TIMEOUT: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_POPUP_EVENT_BACKWALL_CLICKED: PEfl_Event_Description;
function EFL_UI_POPUP_EVENT_TIMEOUT: PEfl_Event_Description;

// === Konventiert am: 28-5-25 13:31:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_POPUP_CLASS: PEfl_Config;
begin
  EFL_UI_POPUP_CLASS := efl_ui_popup_class_get;
end;

function EFL_UI_POPUP_EVENT_BACKWALL_CLICKED: PEfl_Event_Description;
begin
  EFL_UI_POPUP_EVENT_BACKWALL_CLICKED := @(_EFL_UI_POPUP_EVENT_BACKWALL_CLICKED);
end;

function EFL_UI_POPUP_EVENT_TIMEOUT: PEfl_Event_Description;
begin
  EFL_UI_POPUP_EVENT_TIMEOUT := @(_EFL_UI_POPUP_EVENT_TIMEOUT);
end;


{$ENDIF read_implementation}
