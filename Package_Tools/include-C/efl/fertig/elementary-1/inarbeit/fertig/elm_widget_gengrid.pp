
unit elm_widget_gengrid;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_gengrid.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_gengrid.h
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
Pdword  = ^dword;
PEcore_Animator  = ^Ecore_Animator;
PEcore_Job  = ^Ecore_Job;
PEina_Hash  = ^Eina_Hash;
PEina_Inlist  = ^Eina_Inlist;
PEina_Inlist_Sorted_State  = ^Eina_Inlist_Sorted_State;
PEina_List  = ^Eina_List;
PElm_Gen_Item  = ^Elm_Gen_Item;
PElm_Gen_Item_Type  = ^Elm_Gen_Item_Type;
PElm_Gengrid_Data  = ^Elm_Gengrid_Data;
PElm_Gengrid_Pan_Data  = ^Elm_Gengrid_Pan_Data;
PElm_Object_Item  = ^Elm_Object_Item;
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
PItem_Cache  = ^Item_Cache;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_GENGRID_H}
{$define ELM_WIDGET_GENGRID_H}
{$include "elm_gen_common.h"}
{$include "Elementary.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-gengrid-class The Elementary Gengrid Class
 *
 * Elementary, besides having the @ref Gengrid widget, exposes its
 * foundation -- the Elementary Gengrid Class -- in order to create
 * other widgets which are a gengrid with some more logic on top.
  }
{*
 * Base widget smart data extended with gengrid instance data.
  }
type
{ the object itself }
{ stacking markers in pan for selectraise feature }
{ a list of
                                                    * selected
                                                    * items  }
{ a list of
                                                       * groups index
                                                       * items  }
{ an inlist of all items  }
{ item currently
                                                     * being
                                                     * repositioned  }
{*< a focused item by keypad arrow or mouse. This is set to NULL if widget looses focus.  }
{*< This records the last focused item when widget looses focus. This is required to set the focus on last focused item when widgets gets focus.  }
{*< select mode for multiple selection  }
{ longpress timeout. this value comes from _elm_config by
    * default. this can be changed by
    * elm_config_longpress_timeout_set()  }
{ a generation of gengrid. when gengrid is cleared, this value
    * will be increased and a new generation will start  }
{ The stuff below directly come from gengrid without any thinking  }
{*< The items which are getting swapped  }
{*< This is the data used to store information related to animation  }
{*< focus key direction  }
{*< Position mappings for animation  }
{*< Coordinates of it1 and it2  }
{*< Reorder type  }
{*< animation is happening  }
{*< the mode which describes which rectangle should be returned in the interest region getter }
{ a flag for reorder mode enable/disable  }
{ a flag for items can be highlighted or not. by default this flag
    * is true.  }
{*< a flag whether
                                                        * gengrid is marked
                                                        * as to be cleared or
                                                        * not. if this flag
                                                        * is true, gengrid
                                                        * clear was already
                                                        * deferred.   }
{ a flag for item
                                                     * multi
                                                     * selection  }
{*< a flag that mouse is down on the list at the moment. this flag is set to true on mouse and reset to false on mouse up  }
{*< value whether item loop feature is enabled or not.  }
{ an inlist of
                                                      * edje object it
                                                      * cache.  }
{ custom dimensions may be set for any item.
    * the logic for placing items requires that either item widths
    * for horizontal gengrid or item height for vertical gengrid
    * may be varied at once.  }
{ a flag that items have custom sizes  }
{ array to store sum of the widths for items placed already for each row or sum of heights for each column. this is to find location of next item.  }
{ array to store total sum of all widths or heights. this is used for item alignment calculations.  }
{ maximum of the total sums over all rows or columns. this is also used for item alignment calculations.  }
{ amount of memory allocated to above dynamic arrays in terms of number of rows or columns.  }
{ boolean flag indicating if there needs to be an update to the focus_order of the widget. }
  PElm_Gengrid_Data = ^TElm_Gengrid_Data;
  TElm_Gengrid_Data = record
      state : PEina_Inlist_Sorted_State;
      hit_rect : PEvas_Object;
      pan_obj : PEvas_Object;
      obj : PEvas_Object;
      stack : PEvas_Object;
      selected : PEina_List;
      group_items : PEina_List;
      items : PEina_Inlist;
      reorder_it : PElm_Gen_Item;
      last_selected_item : PElm_Object_Item;
      focused_item : PElm_Object_Item;
      last_focused_item : PElm_Object_Item;
      show_it : PElm_Object_Item;
      bring_in_it : PElm_Object_Item;
      scroll_to_type : TElm_Gengrid_Item_Scrollto_Type;
      content_item_map : PEina_Hash;
      provider : PEo;
      focus_on_realization : PElm_Gen_Item;
      calc_job : PEcore_Job;
      walking : longint;
      item_width : longint;
      item_height : longint;
      group_item_width : longint;
      group_item_height : longint;
      minw : longint;
      minh : longint;
      item_count : dword;
      pan_x : TEvas_Coord;
      pan_y : TEvas_Coord;
      select_mode : TElm_Object_Select_Mode;
      multi_select_mode : TElm_Object_Multi_Select_Mode;
      calc_cb : TEcore_Cb;
      clear_cb : TEcore_Cb;
      longpress_timeout : Tdouble;
      generation : longint;
      item_compare_cb : TEina_Compare_Cb;
      nmax : dword;
      reorder_item_x : TEvas_Coord;
      reorder_item_y : TEvas_Coord;
      old_pan_x : TEvas_Coord;
      old_pan_y : TEvas_Coord;
      items_lost : longint;
      align_x : Tdouble;
      align_y : Tdouble;
      reorder : record
          it1 : PElm_Gen_Item;
          it2 : PElm_Gen_Item;
          data : pointer;
          dir : TElm_Focus_Direction;
          tween_mode : TEcore_Pos_Map;
          x1 : TEvas_Coord;
          y1 : TEvas_Coord;
          x2 : TEvas_Coord;
          y2 : TEvas_Coord;
          _type : TElm_Gengrid_Reorder_Type;
          flag0 : word;
        end;
      mode : TElm_Focus_Region_Show_Mode;
      flag0 : word;
      old_h_bounce : TEina_Bool;
      old_v_bounce : TEina_Bool;
      flag1 : word;
      item_cache : PEina_Inlist;
      item_cache_count : longint;
      item_cache_max : longint;
      flag2 : word;
      custom_size_sum : Pdword;
      custom_tot_sum : Pdword;
      custom_tot_max : dword;
      custom_alloc_size : dword;
      scr_minw : TEina_Bool;
      scr_minh : TEina_Bool;
      order_dirty : TEina_Bool;
    end;


const
  bm_TElm_Gengrid_Data_running = $1;
  bp_TElm_Gengrid_Data_running = 0;
  bm_TElm_Gengrid_Data_reorder_item_changed = $1;
  bp_TElm_Gengrid_Data_reorder_item_changed = 0;
  bm_TElm_Gengrid_Data_move_effect_enabled = $2;
  bp_TElm_Gengrid_Data_move_effect_enabled = 1;
  bm_TElm_Gengrid_Data_reorder_mode = $1;
  bp_TElm_Gengrid_Data_reorder_mode = 0;
  bm_TElm_Gengrid_Data_was_selected = $2;
  bp_TElm_Gengrid_Data_was_selected = 1;
  bm_TElm_Gengrid_Data_longpressed = $4;
  bp_TElm_Gengrid_Data_longpressed = 2;
  bm_TElm_Gengrid_Data_pan_changed = $8;
  bp_TElm_Gengrid_Data_pan_changed = 3;
  bm_TElm_Gengrid_Data_horizontal = $10;
  bp_TElm_Gengrid_Data_horizontal = 4;
  bm_TElm_Gengrid_Data_highlight = $20;
  bp_TElm_Gengrid_Data_highlight = 5;
  bm_TElm_Gengrid_Data_clear_me = $40;
  bp_TElm_Gengrid_Data_clear_me = 6;
  bm_TElm_Gengrid_Data_on_hold = $80;
  bp_TElm_Gengrid_Data_on_hold = 7;
  bm_TElm_Gengrid_Data_filled = $100;
  bp_TElm_Gengrid_Data_filled = 8;
  bm_TElm_Gengrid_Data_multi = $200;
  bp_TElm_Gengrid_Data_multi = 9;
  bm_TElm_Gengrid_Data_show_region = $400;
  bp_TElm_Gengrid_Data_show_region = 10;
  bm_TElm_Gengrid_Data_bring_in = $800;
  bp_TElm_Gengrid_Data_bring_in = 11;
  bm_TElm_Gengrid_Data_mouse_down = $1000;
  bp_TElm_Gengrid_Data_mouse_down = 12;
  bm_TElm_Gengrid_Data_item_loop_enable = $2000;
  bp_TElm_Gengrid_Data_item_loop_enable = 13;
  bm_TElm_Gengrid_Data_custom_size_mode = $1;
  bp_TElm_Gengrid_Data_custom_size_mode = 0;

function reorder_item_changed(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_reorder_item_changed(var a : TElm_Gengrid_Data; __reorder_item_changed : TEina_Bool);
function move_effect_enabled(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_move_effect_enabled(var a : TElm_Gengrid_Data; __move_effect_enabled : TEina_Bool);
function reorder_mode(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_reorder_mode(var a : TElm_Gengrid_Data; __reorder_mode : TEina_Bool);
function was_selected(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_was_selected(var a : TElm_Gengrid_Data; __was_selected : TEina_Bool);
function longpressed(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_longpressed(var a : TElm_Gengrid_Data; __longpressed : TEina_Bool);
function pan_changed(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_pan_changed(var a : TElm_Gengrid_Data; __pan_changed : TEina_Bool);
function horizontal(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_horizontal(var a : TElm_Gengrid_Data; __horizontal : TEina_Bool);
function highlight(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_highlight(var a : TElm_Gengrid_Data; __highlight : TEina_Bool);
function clear_me(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_clear_me(var a : TElm_Gengrid_Data; __clear_me : TEina_Bool);
function on_hold(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_on_hold(var a : TElm_Gengrid_Data; __on_hold : TEina_Bool);
function filled(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_filled(var a : TElm_Gengrid_Data; __filled : TEina_Bool);
function multi(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_multi(var a : TElm_Gengrid_Data; __multi : TEina_Bool);
function show_region(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_show_region(var a : TElm_Gengrid_Data; __show_region : TEina_Bool);
function bring_in(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_bring_in(var a : TElm_Gengrid_Data; __bring_in : TEina_Bool);
function mouse_down(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_mouse_down(var a : TElm_Gengrid_Data; __mouse_down : TEina_Bool);
function item_loop_enable(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_item_loop_enable(var a : TElm_Gengrid_Data; __item_loop_enable : TEina_Bool);
function custom_size_mode(var a : TElm_Gengrid_Data) : TEina_Bool;
procedure set_custom_size_mode(var a : TElm_Gengrid_Data; __custom_size_mode : TEina_Bool);
{ do not use cache for
                                              * this item only once  }
{ do not use cache for this item  }
{ for non homogeneous items  }
type
  PElm_Gen_Item_Type = ^TElm_Gen_Item_Type;
  TElm_Gen_Item_Type = record
      it : PElm_Gen_Item;
      wsd : PElm_Gengrid_Data;
      item_reorder_move_animator : PEcore_Animator;
      gx : TEvas_Coord;
      gy : TEvas_Coord;
      ox : TEvas_Coord;
      oy : TEvas_Coord;
      tx : TEvas_Coord;
      ty : TEvas_Coord;
      rx : TEvas_Coord;
      ry : TEvas_Coord;
      moving_effect_start_time : dword;
      prev_group : longint;
      flag0 : word;
      w : TEvas_Coord;
      h : TEvas_Coord;
      sw : TEvas_Coord;
      sh : TEvas_Coord;
    end;


const
  bm_TElm_Gen_Item_Type_group_realized = $1;
  bp_TElm_Gen_Item_Type_group_realized = 0;
  bm_TElm_Gen_Item_Type_moving = $2;
  bp_TElm_Gen_Item_Type_moving = 1;
  bm_TElm_Gen_Item_Type_nocache_once = $4;
  bp_TElm_Gen_Item_Type_nocache_once = 2;
  bm_TElm_Gen_Item_Type_nocache = $8;
  bp_TElm_Gen_Item_Type_nocache = 3;

function group_realized(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_group_realized(var a : TElm_Gen_Item_Type; __group_realized : TEina_Bool);
function moving(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_moving(var a : TElm_Gen_Item_Type; __moving : TEina_Bool);
function nocache_once(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_nocache_once(var a : TElm_Gen_Item_Type; __nocache_once : TEina_Bool);
function nocache(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_nocache(var a : TElm_Gen_Item_Type; __nocache : TEina_Bool);
type
(* Const before type ignored *)
{ it->itc->item_style }
  PItem_Cache = ^TItem_Cache;
  TItem_Cache = record
      __in_list : TEina_Inlist;
      base_view : PEvas_Object;
      spacer : PEvas_Object;
      item_style : Pchar;
      contents : PEina_List;
    end;

  PElm_Gengrid_Pan_Data = ^TElm_Gengrid_Pan_Data;
  TElm_Gengrid_Pan_Data = record
      wobj : PEvas_Object;
      wsd : PElm_Gengrid_Data;
      resize_job : PEcore_Job;
    end;

{*
 * @
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GG_IT(_it : longint) : longint;

{$endif}

implementation

function reorder_item_changed(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  reorder_item_changed:=(a.flag0 and bm_TElm_Gengrid_Data_reorder_item_changed) shr bp_TElm_Gengrid_Data_reorder_item_changed;
end;

procedure set_reorder_item_changed(var a : TElm_Gengrid_Data; __reorder_item_changed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__reorder_item_changed shl bp_TElm_Gengrid_Data_reorder_item_changed) and bm_TElm_Gengrid_Data_reorder_item_changed);
end;

function move_effect_enabled(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  move_effect_enabled:=(a.flag0 and bm_TElm_Gengrid_Data_move_effect_enabled) shr bp_TElm_Gengrid_Data_move_effect_enabled;
end;

procedure set_move_effect_enabled(var a : TElm_Gengrid_Data; __move_effect_enabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__move_effect_enabled shl bp_TElm_Gengrid_Data_move_effect_enabled) and bm_TElm_Gengrid_Data_move_effect_enabled);
end;

function reorder_mode(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  reorder_mode:=(a.flag1 and bm_TElm_Gengrid_Data_reorder_mode) shr bp_TElm_Gengrid_Data_reorder_mode;
end;

procedure set_reorder_mode(var a : TElm_Gengrid_Data; __reorder_mode : TEina_Bool);
begin
  a.flag1:=a.flag1 or ((__reorder_mode shl bp_TElm_Gengrid_Data_reorder_mode) and bm_TElm_Gengrid_Data_reorder_mode);
end;

function was_selected(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  was_selected:=(a.flag1 and bm_TElm_Gengrid_Data_was_selected) shr bp_TElm_Gengrid_Data_was_selected;
end;

procedure set_was_selected(var a : TElm_Gengrid_Data; __was_selected : TEina_Bool);
begin
  a.flag1:=a.flag1 or ((__was_selected shl bp_TElm_Gengrid_Data_was_selected) and bm_TElm_Gengrid_Data_was_selected);
end;

function longpressed(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  longpressed:=(a.flag1 and bm_TElm_Gengrid_Data_longpressed) shr bp_TElm_Gengrid_Data_longpressed;
end;

procedure set_longpressed(var a : TElm_Gengrid_Data; __longpressed : TEina_Bool);
begin
  a.flag1:=a.flag1 or ((__longpressed shl bp_TElm_Gengrid_Data_longpressed) and bm_TElm_Gengrid_Data_longpressed);
end;

function pan_changed(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  pan_changed:=(a.flag1 and bm_TElm_Gengrid_Data_pan_changed) shr bp_TElm_Gengrid_Data_pan_changed;
end;

procedure set_pan_changed(var a : TElm_Gengrid_Data; __pan_changed : TEina_Bool);
begin
  a.flag1:=a.flag1 or ((__pan_changed shl bp_TElm_Gengrid_Data_pan_changed) and bm_TElm_Gengrid_Data_pan_changed);
end;

function horizontal(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  horizontal:=(a.flag1 and bm_TElm_Gengrid_Data_horizontal) shr bp_TElm_Gengrid_Data_horizontal;
end;

procedure set_horizontal(var a : TElm_Gengrid_Data; __horizontal : TEina_Bool);
begin
  a.flag1:=a.flag1 or ((__horizontal shl bp_TElm_Gengrid_Data_horizontal) and bm_TElm_Gengrid_Data_horizontal);
end;

function highlight(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  highlight:=(a.flag1 and bm_TElm_Gengrid_Data_highlight) shr bp_TElm_Gengrid_Data_highlight;
end;

procedure set_highlight(var a : TElm_Gengrid_Data; __highlight : TEina_Bool);
begin
  a.flag1:=a.flag1 or ((__highlight shl bp_TElm_Gengrid_Data_highlight) and bm_TElm_Gengrid_Data_highlight);
end;

function clear_me(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  clear_me:=(a.flag1 and bm_TElm_Gengrid_Data_clear_me) shr bp_TElm_Gengrid_Data_clear_me;
end;

procedure set_clear_me(var a : TElm_Gengrid_Data; __clear_me : TEina_Bool);
begin
  a.flag1:=a.flag1 or ((__clear_me shl bp_TElm_Gengrid_Data_clear_me) and bm_TElm_Gengrid_Data_clear_me);
end;

function on_hold(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  on_hold:=(a.flag1 and bm_TElm_Gengrid_Data_on_hold) shr bp_TElm_Gengrid_Data_on_hold;
end;

procedure set_on_hold(var a : TElm_Gengrid_Data; __on_hold : TEina_Bool);
begin
  a.flag1:=a.flag1 or ((__on_hold shl bp_TElm_Gengrid_Data_on_hold) and bm_TElm_Gengrid_Data_on_hold);
end;

function filled(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  filled:=(a.flag1 and bm_TElm_Gengrid_Data_filled) shr bp_TElm_Gengrid_Data_filled;
end;

procedure set_filled(var a : TElm_Gengrid_Data; __filled : TEina_Bool);
begin
  a.flag1:=a.flag1 or ((__filled shl bp_TElm_Gengrid_Data_filled) and bm_TElm_Gengrid_Data_filled);
end;

function multi(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  multi:=(a.flag1 and bm_TElm_Gengrid_Data_multi) shr bp_TElm_Gengrid_Data_multi;
end;

procedure set_multi(var a : TElm_Gengrid_Data; __multi : TEina_Bool);
begin
  a.flag1:=a.flag1 or ((__multi shl bp_TElm_Gengrid_Data_multi) and bm_TElm_Gengrid_Data_multi);
end;

function show_region(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  show_region:=(a.flag1 and bm_TElm_Gengrid_Data_show_region) shr bp_TElm_Gengrid_Data_show_region;
end;

procedure set_show_region(var a : TElm_Gengrid_Data; __show_region : TEina_Bool);
begin
  a.flag1:=a.flag1 or ((__show_region shl bp_TElm_Gengrid_Data_show_region) and bm_TElm_Gengrid_Data_show_region);
end;

function bring_in(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  bring_in:=(a.flag1 and bm_TElm_Gengrid_Data_bring_in) shr bp_TElm_Gengrid_Data_bring_in;
end;

procedure set_bring_in(var a : TElm_Gengrid_Data; __bring_in : TEina_Bool);
begin
  a.flag1:=a.flag1 or ((__bring_in shl bp_TElm_Gengrid_Data_bring_in) and bm_TElm_Gengrid_Data_bring_in);
end;

function mouse_down(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  mouse_down:=(a.flag1 and bm_TElm_Gengrid_Data_mouse_down) shr bp_TElm_Gengrid_Data_mouse_down;
end;

procedure set_mouse_down(var a : TElm_Gengrid_Data; __mouse_down : TEina_Bool);
begin
  a.flag1:=a.flag1 or ((__mouse_down shl bp_TElm_Gengrid_Data_mouse_down) and bm_TElm_Gengrid_Data_mouse_down);
end;

function item_loop_enable(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  item_loop_enable:=(a.flag1 and bm_TElm_Gengrid_Data_item_loop_enable) shr bp_TElm_Gengrid_Data_item_loop_enable;
end;

procedure set_item_loop_enable(var a : TElm_Gengrid_Data; __item_loop_enable : TEina_Bool);
begin
  a.flag1:=a.flag1 or ((__item_loop_enable shl bp_TElm_Gengrid_Data_item_loop_enable) and bm_TElm_Gengrid_Data_item_loop_enable);
end;

function custom_size_mode(var a : TElm_Gengrid_Data) : TEina_Bool;
begin
  custom_size_mode:=(a.flag2 and bm_TElm_Gengrid_Data_custom_size_mode) shr bp_TElm_Gengrid_Data_custom_size_mode;
end;

procedure set_custom_size_mode(var a : TElm_Gengrid_Data; __custom_size_mode : TEina_Bool);
begin
  a.flag2:=a.flag2 or ((__custom_size_mode shl bp_TElm_Gengrid_Data_custom_size_mode) and bm_TElm_Gengrid_Data_custom_size_mode);
end;

function group_realized(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  group_realized:=(a.flag0 and bm_TElm_Gen_Item_Type_group_realized) shr bp_TElm_Gen_Item_Type_group_realized;
end;

procedure set_group_realized(var a : TElm_Gen_Item_Type; __group_realized : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__group_realized shl bp_TElm_Gen_Item_Type_group_realized) and bm_TElm_Gen_Item_Type_group_realized);
end;

function moving(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  moving:=(a.flag0 and bm_TElm_Gen_Item_Type_moving) shr bp_TElm_Gen_Item_Type_moving;
end;

procedure set_moving(var a : TElm_Gen_Item_Type; __moving : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__moving shl bp_TElm_Gen_Item_Type_moving) and bm_TElm_Gen_Item_Type_moving);
end;

function nocache_once(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  nocache_once:=(a.flag0 and bm_TElm_Gen_Item_Type_nocache_once) shr bp_TElm_Gen_Item_Type_nocache_once;
end;

procedure set_nocache_once(var a : TElm_Gen_Item_Type; __nocache_once : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__nocache_once shl bp_TElm_Gen_Item_Type_nocache_once) and bm_TElm_Gen_Item_Type_nocache_once);
end;

function nocache(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  nocache:=(a.flag0 and bm_TElm_Gen_Item_Type_nocache) shr bp_TElm_Gen_Item_Type_nocache;
end;

procedure set_nocache(var a : TElm_Gen_Item_Type; __nocache : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__nocache shl bp_TElm_Gen_Item_Type_nocache) and bm_TElm_Gen_Item_Type_nocache);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GG_IT(_it : longint) : longint;
begin
  GG_IT:=_it^.item;
end;


end.
