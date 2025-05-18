unit efl_canvas_group_eo;

interface

uses
  ctypes, efl, fp_eina, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Group = ^TEfl_Canvas_Group;
  TEfl_Canvas_Group = TEo;

function EFL_CANVAS_GROUP_CLASS: PEfl_Class;

function efl_canvas_group_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_canvas_group_need_recalculate_set(obj: PEo; value: TEina_Bool); cdecl; external libevas;
function efl_canvas_group_need_recalculate_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_canvas_group_change(obj: PEo); cdecl; external libevas;
procedure efl_canvas_group_calculate(obj: PEo); cdecl; external libevas;
function efl_canvas_group_members_iterate(obj: PEo): PEina_Iterator; cdecl; external libevas;
procedure efl_canvas_group_member_add(obj: PEo; sub_obj: PEfl_Canvas_Object); cdecl; external libevas;
procedure efl_canvas_group_member_remove(obj: PEo; sub_obj: PEfl_Canvas_Object); cdecl; external libevas;
function efl_canvas_group_member_is(obj: PEo; sub_obj: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;

var
  _EFL_CANVAS_GROUP_EVENT_MEMBER_ADDED: TEfl_Event_Description; cvar;external libevas;
  _EFL_CANVAS_GROUP_EVENT_MEMBER_REMOVED: TEfl_Event_Description; cvar;external libevas;

function EFL_CANVAS_GROUP_EVENT_MEMBER_ADDED: PEfl_Event_Description;
function EFL_CANVAS_GROUP_EVENT_MEMBER_REMOVED: PEfl_Event_Description;


// === Konventiert am: 13-5-25 19:18:10 ===


implementation


function EFL_CANVAS_GROUP_CLASS: PEfl_Class;
begin
  EFL_CANVAS_GROUP_CLASS := efl_canvas_group_class_get;
end;

function EFL_CANVAS_GROUP_EVENT_MEMBER_ADDED: PEfl_Event_Description;
begin
  EFL_CANVAS_GROUP_EVENT_MEMBER_ADDED := @(_EFL_CANVAS_GROUP_EVENT_MEMBER_ADDED);
end;

function EFL_CANVAS_GROUP_EVENT_MEMBER_REMOVED: PEfl_Event_Description;
begin
  EFL_CANVAS_GROUP_EVENT_MEMBER_REMOVED := @(_EFL_CANVAS_GROUP_EVENT_MEMBER_REMOVED);
end;


end.
