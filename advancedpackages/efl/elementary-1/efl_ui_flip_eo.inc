{$IFDEF read_interface}


type
  PEfl_Ui_Flip = ^TEfl_Ui_Flip;
  TEfl_Ui_Flip = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Flip_Mode = ^TEfl_Ui_Flip_Mode;
  TEfl_Ui_Flip_Mode = longint;

const
  EFL_UI_FLIP_MODE_ROTATE_Y_CENTER_AXIS = 0;
  EFL_UI_FLIP_MODE_ROTATE_X_CENTER_AXIS = 1;
  EFL_UI_FLIP_MODE_ROTATE_XZ_CENTER_AXIS = 2;
  EFL_UI_FLIP_MODE_ROTATE_YZ_CENTER_AXIS = 3;
  EFL_UI_FLIP_MODE_CUBE_LEFT = 4;
  EFL_UI_FLIP_MODE_CUBE_RIGHT = 5;
  EFL_UI_FLIP_MODE_CUBE_UP = 6;
  EFL_UI_FLIP_MODE_CUBE_DOWN = 7;
  EFL_UI_FLIP_MODE_PAGE_LEFT = 8;
  EFL_UI_FLIP_MODE_PAGE_RIGHT = 9;
  EFL_UI_FLIP_MODE_PAGE_UP = 10;
  EFL_UI_FLIP_MODE_PAGE_DOWN = 11;
  EFL_UI_FLIP_MODE_CROSS_FADE = 12;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Flip_Interaction = ^TEfl_Ui_Flip_Interaction;
  TEfl_Ui_Flip_Interaction = longint;

const
  EFL_UI_FLIP_INTERACTION_NONE = 0;
  EFL_UI_FLIP_INTERACTION_ROTATE = 1;
  EFL_UI_FLIP_INTERACTION_CUBE = 2;
  EFL_UI_FLIP_INTERACTION_PAGE = 3;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FLIP_CLASS: PEfl_Class;

function efl_ui_flip_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_flip_interaction_set(obj: PEo; mode: TEfl_Ui_Flip_Interaction); cdecl; external libelementary;
function efl_ui_flip_interaction_get(obj: PEo): TEfl_Ui_Flip_Interaction; cdecl; external libelementary;
function efl_ui_flip_front_visible_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_flip_interaction_direction_hitsize_set(obj: PEo; dir: TEfl_Ui_Layout_Orientation; hitsize: double); cdecl; external libelementary;
function efl_ui_flip_interaction_direction_hitsize_get(obj: PEo; dir: TEfl_Ui_Layout_Orientation): double; cdecl; external libelementary;
procedure efl_ui_flip_interaction_direction_enabled_set(obj: PEo; dir: TEfl_Ui_Layout_Orientation; enabled: TEina_Bool); cdecl; external libelementary;
function efl_ui_flip_interaction_direction_enabled_get(obj: PEo; dir: TEfl_Ui_Layout_Orientation): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_flip_go(obj: PEo; mode: TEfl_Ui_Flip_Mode); cdecl; external libelementary;
procedure efl_ui_flip_go_to(obj: PEo; front: TEina_Bool; mode: TEfl_Ui_Flip_Mode); cdecl; external libelementary;

var
  _EFL_UI_FLIP_EVENT_ANIMATE_BEGIN: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_FLIP_EVENT_ANIMATE_DONE: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_FLIP_EVENT_ANIMATE_BEGIN: PEfl_Event_Description;
function EFL_UI_FLIP_EVENT_ANIMATE_DONE: PEfl_Event_Description;
{$endif}

// === Konventiert am: 27-5-25 19:21:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FLIP_CLASS: PEfl_Class;
begin
  EFL_UI_FLIP_CLASS := efl_ui_flip_class_get;
end;

function EFL_UI_FLIP_EVENT_ANIMATE_BEGIN: PEfl_Event_Description;
begin
  EFL_UI_FLIP_EVENT_ANIMATE_BEGIN := @(_EFL_UI_FLIP_EVENT_ANIMATE_BEGIN);
end;

function EFL_UI_FLIP_EVENT_ANIMATE_DONE: PEfl_Event_Description;
begin
  EFL_UI_FLIP_EVENT_ANIMATE_DONE := @(_EFL_UI_FLIP_EVENT_ANIMATE_DONE);
end;
{$endif}


{$ENDIF read_implementation}
