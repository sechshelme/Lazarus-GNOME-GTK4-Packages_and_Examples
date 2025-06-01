unit efl_access_selection_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Access_Selection = ^TEfl_Access_Selection;
  TEfl_Access_Selection = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_SELECTION_INTERFACE: PEfl_Class;

function efl_access_selection_interface_get: PEfl_Class; cdecl; external libelementary;
function efl_access_selection_selected_children_count_get(obj: PEo): longint; cdecl; external libelementary;
function efl_access_selection_selected_child_get(obj: PEo; selected_child_index: longint): PEfl_Object; cdecl; external libelementary;
function efl_access_selection_child_select(obj: PEo; child_index: longint): TEina_Bool; cdecl; external libelementary;
function efl_access_selection_selected_child_deselect(obj: PEo; child_index: longint): TEina_Bool; cdecl; external libelementary;
function efl_access_selection_is_child_selected(obj: PEo; child_index: longint): TEina_Bool; cdecl; external libelementary;
function efl_access_selection_all_children_select(obj: PEo): TEina_Bool; cdecl; external libelementary;
function efl_access_selection_clear(obj: PEo): TEina_Bool; cdecl; external libelementary;
function efl_access_selection_child_deselect(obj: PEo; child_index: longint): TEina_Bool; cdecl; external libelementary;

var
  _EFL_ACCESS_SELECTION_EVENT_ACCESS_SELECTION_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_ACCESS_SELECTION_EVENT_ACCESS_SELECTION_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 30-5-25 13:11:32 ===


implementation

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_SELECTION_INTERFACE: PEfl_Class;
begin
  EFL_ACCESS_SELECTION_INTERFACE := efl_access_selection_interface_get;
end;

function EFL_ACCESS_SELECTION_EVENT_ACCESS_SELECTION_CHANGED: PEfl_Event_Description;
begin
  EFL_ACCESS_SELECTION_EVENT_ACCESS_SELECTION_CHANGED := @(_EFL_ACCESS_SELECTION_EVENT_ACCESS_SELECTION_CHANGED);
end;
{$endif}


end.
