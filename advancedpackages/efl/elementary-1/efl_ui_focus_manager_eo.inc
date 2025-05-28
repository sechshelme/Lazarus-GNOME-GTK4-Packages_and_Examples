{$IFDEF read_interface}


  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Focus_Relations = ^TEfl_Ui_Focus_Relations;
  TEfl_Ui_Focus_Relations = record
      right : PEina_Iterator;
      left : PEina_Iterator;
      top : PEina_Iterator;
      down : PEina_Iterator;
      next : PEfl_Ui_Focus_Object;
      prev : PEfl_Ui_Focus_Object;
      parent : PEfl_Ui_Focus_Object;
      redirect : PEfl_Ui_Focus_Manager;
      node : PEfl_Ui_Focus_Object;
      logical : TEina_Bool;
      position_in_history : longint;
    end;
{$endif}
type
  PEfl_Ui_Focus_Manager_Logical_End_Detail = ^TEfl_Ui_Focus_Manager_Logical_End_Detail;
  TEfl_Ui_Focus_Manager_Logical_End_Detail = record
      is_regular_end : TEina_Bool;
      element : PEfl_Ui_Focus_Object;
    end;
function EFL_UI_FOCUS_MANAGER_INTERFACE : PEfl_Class;

function efl_ui_focus_manager_interface_get:PEfl_Class;cdecl;external libelementary;
function efl_ui_focus_manager_move(obj:PEo; direction:TEfl_Ui_Focus_Direction):PEfl_Ui_Focus_Object;cdecl;external libelementary;
function efl_ui_focus_manager_request_move(obj:PEo; direction:TEfl_Ui_Focus_Direction; child:PEfl_Ui_Focus_Object; logical:TEina_Bool):PEfl_Ui_Focus_Object;cdecl;external libelementary;
procedure efl_ui_focus_manager_focus_set(obj:PEo; focus:PEfl_Ui_Focus_Object);cdecl;external libelementary;
function efl_ui_focus_manager_focus_get(obj:PEo):PEfl_Ui_Focus_Object;cdecl;external libelementary;
procedure efl_ui_focus_manager_redirect_set(obj:PEo; redirect:PEfl_Ui_Focus_Manager);cdecl;external libelementary;
function efl_ui_focus_manager_redirect_get(obj:PEo):PEfl_Ui_Focus_Manager;cdecl;external libelementary;
function efl_ui_focus_manager_border_elements_get(obj:PEo):PEina_Iterator;cdecl;external libelementary;
function efl_ui_focus_manager_border_elements_changed_get(obj:PEo):TEina_Bool;cdecl;external libelementary;
function efl_ui_focus_manager_viewport_elements_get(obj:PEo; viewport:TEina_Rect):PEina_Iterator;cdecl;external libelementary;
function efl_ui_focus_manager_root_set(obj:PEo; root:PEfl_Ui_Focus_Object):TEina_Bool;cdecl;external libelementary;
function efl_ui_focus_manager_root_get(obj:PEo):PEfl_Ui_Focus_Object;cdecl;external libelementary;
function efl_ui_focus_manager_request_subchild(obj:PEo; root:PEfl_Ui_Focus_Object):PEfl_Ui_Focus_Object;cdecl;external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_focus_manager_fetch(obj:PEo; child:PEfl_Ui_Focus_Object):PEfl_Ui_Focus_Relations;cdecl;external libelementary;
{$endif}

function efl_ui_focus_manager_logical_end(obj:PEo):TEfl_Ui_Focus_Manager_Logical_End_Detail;cdecl;external libelementary;
procedure efl_ui_focus_manager_reset_history(obj:PEo);cdecl;external libelementary;
procedure efl_ui_focus_manager_pop_history_stack(obj:PEo);cdecl;external libelementary;
procedure efl_ui_focus_manager_setup_on_first_touch(obj:PEo; direction:TEfl_Ui_Focus_Direction; entry:PEfl_Ui_Focus_Object);cdecl;external libelementary;
procedure efl_ui_focus_manager_dirty_logic_freeze(obj:PEo);cdecl;external libelementary;
procedure efl_ui_focus_manager_dirty_logic_unfreeze(obj:PEo);cdecl;external libelementary;
  var
    _EFL_UI_FOCUS_MANAGER_EVENT_REDIRECT_CHANGED : TEfl_Event_Description;cvar;external libelementary;
    _EFL_UI_FOCUS_MANAGER_EVENT_FLUSH_PRE : TEfl_Event_Description;cvar;external libelementary;
    _EFL_UI_FOCUS_MANAGER_EVENT_COORDS_DIRTY : TEfl_Event_Description;cvar;external libelementary;
    _EFL_UI_FOCUS_MANAGER_EVENT_MANAGER_FOCUS_CHANGED : TEfl_Event_Description;cvar;external libelementary;
    _EFL_UI_FOCUS_MANAGER_EVENT_DIRTY_LOGIC_FREEZE_CHANGED : TEfl_Event_Description;cvar;external libelementary;

function EFL_UI_FOCUS_MANAGER_EVENT_REDIRECT_CHANGED : PEfl_Event_Description;
function EFL_UI_FOCUS_MANAGER_EVENT_FLUSH_PRE : PEfl_Event_Description;
function EFL_UI_FOCUS_MANAGER_EVENT_COORDS_DIRTY : PEfl_Event_Description;
function EFL_UI_FOCUS_MANAGER_EVENT_MANAGER_FOCUS_CHANGED : PEfl_Event_Description;
function EFL_UI_FOCUS_MANAGER_EVENT_DIRTY_LOGIC_FREEZE_CHANGED : PEfl_Event_Description;

// === Konventiert am: 27-5-25 16:50:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function EFL_UI_FOCUS_MANAGER_INTERFACE: PEfl_Class;
  begin
    EFL_UI_FOCUS_MANAGER_INTERFACE:=efl_ui_focus_manager_interface_get;
  end;
function EFL_UI_FOCUS_MANAGER_EVENT_REDIRECT_CHANGED: PEfl_Event_Description;
  begin
    EFL_UI_FOCUS_MANAGER_EVENT_REDIRECT_CHANGED:=@(_EFL_UI_FOCUS_MANAGER_EVENT_REDIRECT_CHANGED);
  end;
function EFL_UI_FOCUS_MANAGER_EVENT_FLUSH_PRE: PEfl_Event_Description;
  begin
    EFL_UI_FOCUS_MANAGER_EVENT_FLUSH_PRE:=@(_EFL_UI_FOCUS_MANAGER_EVENT_FLUSH_PRE);
  end;
function EFL_UI_FOCUS_MANAGER_EVENT_COORDS_DIRTY: PEfl_Event_Description;
  begin
    EFL_UI_FOCUS_MANAGER_EVENT_COORDS_DIRTY:=@(_EFL_UI_FOCUS_MANAGER_EVENT_COORDS_DIRTY);
  end;
function EFL_UI_FOCUS_MANAGER_EVENT_MANAGER_FOCUS_CHANGED: PEfl_Event_Description;
  begin
    EFL_UI_FOCUS_MANAGER_EVENT_MANAGER_FOCUS_CHANGED:=@(_EFL_UI_FOCUS_MANAGER_EVENT_MANAGER_FOCUS_CHANGED);
  end;
function EFL_UI_FOCUS_MANAGER_EVENT_DIRTY_LOGIC_FREEZE_CHANGED: PEfl_Event_Description;
  begin
    EFL_UI_FOCUS_MANAGER_EVENT_DIRTY_LOGIC_FREEZE_CHANGED:=@(_EFL_UI_FOCUS_MANAGER_EVENT_DIRTY_LOGIC_FREEZE_CHANGED);
  end;


{$ENDIF read_implementation}
