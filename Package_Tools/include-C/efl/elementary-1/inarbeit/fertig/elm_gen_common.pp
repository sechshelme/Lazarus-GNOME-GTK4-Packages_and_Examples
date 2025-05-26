
unit elm_gen_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_gen_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_gen_common.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PEcore_Timer  = ^Ecore_Timer;
PEina_List  = ^Eina_List;
PElm_Gen_Item  = ^Elm_Gen_Item;
PElm_Gen_Item_Class  = ^Elm_Gen_Item_Class;
PElm_Gen_Item_Tooltip  = ^Elm_Gen_Item_Tooltip;
PElm_Gen_Item_Type  = ^Elm_Gen_Item_Type;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_GEN_H_}
{$define ELM_GEN_H_}
{$include <Elementary.h>}
{$include <Elementary_Cursor.h>}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ELM_GEN_ITEM_FROM_INLIST(it : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELM_GEN_ITEM_PREV(_it : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELM_GEN_ITEM_NEXT(_it : longint) : longint;

const
  SWIPE_MOVES = 12;  
{ common item handles for genlist/gengrid  }
type
(* Const before type ignored *)
(* Const before type ignored *)
  PElm_Gen_Item_Tooltip = ^TElm_Gen_Item_Tooltip;
  TElm_Gen_Item_Tooltip = record
      data : pointer;
      content_cb : TElm_Tooltip_Item_Content_Cb;
      del_cb : TEvas_Smart_Cb;
      style : Pchar;
      flag0 : word;
    end;


const
  bm_TElm_Gen_Item_Tooltip_free_size = $1;
  bp_TElm_Gen_Item_Tooltip_free_size = 0;

function free_size(var a : TElm_Gen_Item_Tooltip) : TEina_Bool;
procedure set_free_size(var a : TElm_Gen_Item_Tooltip; __free_size : TEina_Bool);
(* Const before type ignored *)
{*< a generation of an item. when the item is created, this value is set to the value of genlist/gengrid generation. this value will be decreased when the item is going to be deleted  }
(* Const before type ignored *)
(* Const before type ignored *)
{*< this is set true when an item is being dragged. this is set false on multidown/mouseup/mousedown. when this is true, the item should not be unrealized. or evas mouse down/up event will be corrupted.  }
{*< item uses style mode for highlight/select  }
{*< a flag that shows the flip status of the item.  }
{*< content objs have or previously did exist (size calcs)  }
{*< flag used for hiding the items which do not match filter text  }
{*<flag used to indicate whether or not item has been filtered  }
type
  PElm_Gen_Item = ^TElm_Gen_Item;
  TElm_Gen_Item = record
      base : PElm_Widget_Item_Data;
      __in_list : TEina_Inlist;
      item : PElm_Gen_Item_Type;
      itc : PElm_Gen_Item_Class;
      x : TEvas_Coord;
      y : TEvas_Coord;
      dx : TEvas_Coord;
      dy : TEvas_Coord;
      spacer : PEvas_Object;
      deco_all_view : PEvas_Object;
      parent : PElm_Gen_Item;
      texts : PEina_List;
      contents : PEina_List;
      states : PEina_List;
      content_objs : PEina_List;
      long_timer : PEcore_Timer;
      generation : longint;
      mouse_cursor : Pchar;
      item_focus_chain : PEina_List;
      func : record
          func : TEvas_Smart_Cb;
          data : pointer;
        end;
      tooltip : TElm_Gen_Item_Tooltip;
      del_cb : TEcore_Cb;
      unrealize_cb : TEcore_Cb;
      sel_cb : TEcore_Cb;
      unsel_cb : TEcore_Cb;
      highlight_cb : TEcore_Cb;
      unhighlight_cb : TEcore_Cb;
      position : longint;
      select_mode : TElm_Object_Select_Mode;
      flag0 : word;
    end;


const
  bm_TElm_Gen_Item_position_update = $1;
  bp_TElm_Gen_Item_position_update = 0;
  bm_TElm_Gen_Item_want_unrealize = $2;
  bp_TElm_Gen_Item_want_unrealize = 1;
  bm_TElm_Gen_Item_realized = $4;
  bp_TElm_Gen_Item_realized = 2;
  bm_TElm_Gen_Item_selected = $8;
  bp_TElm_Gen_Item_selected = 3;
  bm_TElm_Gen_Item_highlighted = $10;
  bp_TElm_Gen_Item_highlighted = 4;
  bm_TElm_Gen_Item_dragging = $20;
  bp_TElm_Gen_Item_dragging = 5;
  bm_TElm_Gen_Item_down = $40;
  bp_TElm_Gen_Item_down = 6;
  bm_TElm_Gen_Item_group = $80;
  bp_TElm_Gen_Item_group = 7;
  bm_TElm_Gen_Item_reorder = $100;
  bp_TElm_Gen_Item_reorder = 8;
  bm_TElm_Gen_Item_decorate_it_set = $200;
  bp_TElm_Gen_Item_decorate_it_set = 9;
  bm_TElm_Gen_Item_flipped = $400;
  bp_TElm_Gen_Item_flipped = 10;
  bm_TElm_Gen_Item_has_contents = $800;
  bp_TElm_Gen_Item_has_contents = 11;
  bm_TElm_Gen_Item_cursor_engine_only = $1000;
  bp_TElm_Gen_Item_cursor_engine_only = 12;
  bm_TElm_Gen_Item_hide = $2000;
  bp_TElm_Gen_Item_hide = 13;
  bm_TElm_Gen_Item_filtered = $4000;
  bp_TElm_Gen_Item_filtered = 14;
  bm_TElm_Gen_Item_callbacks = $8000;
  bp_TElm_Gen_Item_callbacks = 15;

function position_update(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_position_update(var a : TElm_Gen_Item; __position_update : TEina_Bool);
function want_unrealize(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_want_unrealize(var a : TElm_Gen_Item; __want_unrealize : TEina_Bool);
function realized(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_realized(var a : TElm_Gen_Item; __realized : TEina_Bool);
function selected(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_selected(var a : TElm_Gen_Item; __selected : TEina_Bool);
function highlighted(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_highlighted(var a : TElm_Gen_Item; __highlighted : TEina_Bool);
function dragging(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_dragging(var a : TElm_Gen_Item; __dragging : TEina_Bool);
function down(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_down(var a : TElm_Gen_Item; __down : TEina_Bool);
function group(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_group(var a : TElm_Gen_Item; __group : TEina_Bool);
function reorder(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_reorder(var a : TElm_Gen_Item; __reorder : TEina_Bool);
function decorate_it_set(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_decorate_it_set(var a : TElm_Gen_Item; __decorate_it_set : TEina_Bool);
function flipped(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_flipped(var a : TElm_Gen_Item; __flipped : TEina_Bool);
function has_contents(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_has_contents(var a : TElm_Gen_Item; __has_contents : TEina_Bool);
function cursor_engine_only(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_cursor_engine_only(var a : TElm_Gen_Item; __cursor_engine_only : TEina_Bool);
function hide(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_hide(var a : TElm_Gen_Item; __hide : TEina_Bool);
function filtered(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_filtered(var a : TElm_Gen_Item; __filtered : TEina_Bool);
function callbacks(var a : TElm_Gen_Item) : TEina_Bool;
procedure set_callbacks(var a : TElm_Gen_Item; __callbacks : TEina_Bool);
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELM_GEN_ITEM_FROM_INLIST(it : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if it then
    if_local1:=EINA_INLIST_CONTAINER_GET(it,Elm_Gen_Item)
  else
    if_local1:=NULL;
  ELM_GEN_ITEM_FROM_INLIST:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELM_GEN_ITEM_PREV(_it : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if _it then
    if_local1:=ELM_GEN_ITEM_FROM_INLIST((EINA_INLIST_GET(_it))^.prev)
  else
    if_local1:=NULL;
  ELM_GEN_ITEM_PREV:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELM_GEN_ITEM_NEXT(_it : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if _it then
    if_local1:=ELM_GEN_ITEM_FROM_INLIST((EINA_INLIST_GET(_it))^.next)
  else
    if_local1:=NULL;
  ELM_GEN_ITEM_NEXT:=if_local1;
end;

function free_size(var a : TElm_Gen_Item_Tooltip) : TEina_Bool;
begin
  free_size:=(a.flag0 and bm_TElm_Gen_Item_Tooltip_free_size) shr bp_TElm_Gen_Item_Tooltip_free_size;
end;

procedure set_free_size(var a : TElm_Gen_Item_Tooltip; __free_size : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__free_size shl bp_TElm_Gen_Item_Tooltip_free_size) and bm_TElm_Gen_Item_Tooltip_free_size);
end;

function position_update(var a : TElm_Gen_Item) : TEina_Bool;
begin
  position_update:=(a.flag0 and bm_TElm_Gen_Item_position_update) shr bp_TElm_Gen_Item_position_update;
end;

procedure set_position_update(var a : TElm_Gen_Item; __position_update : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__position_update shl bp_TElm_Gen_Item_position_update) and bm_TElm_Gen_Item_position_update);
end;

function want_unrealize(var a : TElm_Gen_Item) : TEina_Bool;
begin
  want_unrealize:=(a.flag0 and bm_TElm_Gen_Item_want_unrealize) shr bp_TElm_Gen_Item_want_unrealize;
end;

procedure set_want_unrealize(var a : TElm_Gen_Item; __want_unrealize : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__want_unrealize shl bp_TElm_Gen_Item_want_unrealize) and bm_TElm_Gen_Item_want_unrealize);
end;

function realized(var a : TElm_Gen_Item) : TEina_Bool;
begin
  realized:=(a.flag0 and bm_TElm_Gen_Item_realized) shr bp_TElm_Gen_Item_realized;
end;

procedure set_realized(var a : TElm_Gen_Item; __realized : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__realized shl bp_TElm_Gen_Item_realized) and bm_TElm_Gen_Item_realized);
end;

function selected(var a : TElm_Gen_Item) : TEina_Bool;
begin
  selected:=(a.flag0 and bm_TElm_Gen_Item_selected) shr bp_TElm_Gen_Item_selected;
end;

procedure set_selected(var a : TElm_Gen_Item; __selected : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__selected shl bp_TElm_Gen_Item_selected) and bm_TElm_Gen_Item_selected);
end;

function highlighted(var a : TElm_Gen_Item) : TEina_Bool;
begin
  highlighted:=(a.flag0 and bm_TElm_Gen_Item_highlighted) shr bp_TElm_Gen_Item_highlighted;
end;

procedure set_highlighted(var a : TElm_Gen_Item; __highlighted : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__highlighted shl bp_TElm_Gen_Item_highlighted) and bm_TElm_Gen_Item_highlighted);
end;

function dragging(var a : TElm_Gen_Item) : TEina_Bool;
begin
  dragging:=(a.flag0 and bm_TElm_Gen_Item_dragging) shr bp_TElm_Gen_Item_dragging;
end;

procedure set_dragging(var a : TElm_Gen_Item; __dragging : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__dragging shl bp_TElm_Gen_Item_dragging) and bm_TElm_Gen_Item_dragging);
end;

function down(var a : TElm_Gen_Item) : TEina_Bool;
begin
  down:=(a.flag0 and bm_TElm_Gen_Item_down) shr bp_TElm_Gen_Item_down;
end;

procedure set_down(var a : TElm_Gen_Item; __down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__down shl bp_TElm_Gen_Item_down) and bm_TElm_Gen_Item_down);
end;

function group(var a : TElm_Gen_Item) : TEina_Bool;
begin
  group:=(a.flag0 and bm_TElm_Gen_Item_group) shr bp_TElm_Gen_Item_group;
end;

procedure set_group(var a : TElm_Gen_Item; __group : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__group shl bp_TElm_Gen_Item_group) and bm_TElm_Gen_Item_group);
end;

function reorder(var a : TElm_Gen_Item) : TEina_Bool;
begin
  reorder:=(a.flag0 and bm_TElm_Gen_Item_reorder) shr bp_TElm_Gen_Item_reorder;
end;

procedure set_reorder(var a : TElm_Gen_Item; __reorder : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__reorder shl bp_TElm_Gen_Item_reorder) and bm_TElm_Gen_Item_reorder);
end;

function decorate_it_set(var a : TElm_Gen_Item) : TEina_Bool;
begin
  decorate_it_set:=(a.flag0 and bm_TElm_Gen_Item_decorate_it_set) shr bp_TElm_Gen_Item_decorate_it_set;
end;

procedure set_decorate_it_set(var a : TElm_Gen_Item; __decorate_it_set : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__decorate_it_set shl bp_TElm_Gen_Item_decorate_it_set) and bm_TElm_Gen_Item_decorate_it_set);
end;

function flipped(var a : TElm_Gen_Item) : TEina_Bool;
begin
  flipped:=(a.flag0 and bm_TElm_Gen_Item_flipped) shr bp_TElm_Gen_Item_flipped;
end;

procedure set_flipped(var a : TElm_Gen_Item; __flipped : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__flipped shl bp_TElm_Gen_Item_flipped) and bm_TElm_Gen_Item_flipped);
end;

function has_contents(var a : TElm_Gen_Item) : TEina_Bool;
begin
  has_contents:=(a.flag0 and bm_TElm_Gen_Item_has_contents) shr bp_TElm_Gen_Item_has_contents;
end;

procedure set_has_contents(var a : TElm_Gen_Item; __has_contents : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__has_contents shl bp_TElm_Gen_Item_has_contents) and bm_TElm_Gen_Item_has_contents);
end;

function cursor_engine_only(var a : TElm_Gen_Item) : TEina_Bool;
begin
  cursor_engine_only:=(a.flag0 and bm_TElm_Gen_Item_cursor_engine_only) shr bp_TElm_Gen_Item_cursor_engine_only;
end;

procedure set_cursor_engine_only(var a : TElm_Gen_Item; __cursor_engine_only : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__cursor_engine_only shl bp_TElm_Gen_Item_cursor_engine_only) and bm_TElm_Gen_Item_cursor_engine_only);
end;

function hide(var a : TElm_Gen_Item) : TEina_Bool;
begin
  hide:=(a.flag0 and bm_TElm_Gen_Item_hide) shr bp_TElm_Gen_Item_hide;
end;

procedure set_hide(var a : TElm_Gen_Item; __hide : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__hide shl bp_TElm_Gen_Item_hide) and bm_TElm_Gen_Item_hide);
end;

function filtered(var a : TElm_Gen_Item) : TEina_Bool;
begin
  filtered:=(a.flag0 and bm_TElm_Gen_Item_filtered) shr bp_TElm_Gen_Item_filtered;
end;

procedure set_filtered(var a : TElm_Gen_Item; __filtered : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__filtered shl bp_TElm_Gen_Item_filtered) and bm_TElm_Gen_Item_filtered);
end;

function callbacks(var a : TElm_Gen_Item) : TEina_Bool;
begin
  callbacks:=(a.flag0 and bm_TElm_Gen_Item_callbacks) shr bp_TElm_Gen_Item_callbacks;
end;

procedure set_callbacks(var a : TElm_Gen_Item; __callbacks : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__callbacks shl bp_TElm_Gen_Item_callbacks) and bm_TElm_Gen_Item_callbacks);
end;


end.
