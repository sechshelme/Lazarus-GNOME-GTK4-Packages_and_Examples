
unit elm_widget_genlist;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_genlist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_genlist.h
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
PEcore_Animator  = ^Ecore_Animator;
PEcore_Idle_Enterer  = ^Ecore_Idle_Enterer;
PEcore_Idler  = ^Ecore_Idler;
PEcore_Job  = ^Ecore_Job;
PEcore_Timer  = ^Ecore_Timer;
PEina_Hash  = ^Eina_Hash;
PEina_Inlist  = ^Eina_Inlist;
PEina_Inlist_Sorted_State  = ^Eina_Inlist_Sorted_State;
PEina_List  = ^Eina_List;
PElm_Gen_Item  = ^Elm_Gen_Item;
PElm_Gen_Item_Type  = ^Elm_Gen_Item_Type;
PElm_Genlist_Data  = ^Elm_Genlist_Data;
PElm_Genlist_Filter  = ^Elm_Genlist_Filter;
PElm_Genlist_Item_Class  = ^Elm_Genlist_Item_Class;
PElm_Genlist_Item_Move_Effect_Mode  = ^Elm_Genlist_Item_Move_Effect_Mode;
PElm_Genlist_Pan_Data  = ^Elm_Genlist_Pan_Data;
PElm_Object_Item  = ^Elm_Object_Item;
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
PItem_Block  = ^Item_Block;
PItem_Cache  = ^Item_Cache;
PItem_Size  = ^Item_Size;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_GENLIST_H}
{$define ELM_WIDGET_GENLIST_H}
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
 * @section elm-genlist-class The Elementary Genlist Class
 *
 * Elementary, besides having the @ref Genlist widget, exposes its
 * foundation -- the Elementary Genlist Class -- in order to create
 * other widgets which are a genlist with some more logic on top.
  }
{*
 * Base widget smart data extended with genlist instance data.
  }
type

  PElm_Genlist_Item_Move_Effect_Mode = ^TElm_Genlist_Item_Move_Effect_Mode;
  TElm_Genlist_Item_Move_Effect_Mode =  Longint;
  Const
    ELM_GENLIST_TREE_EFFECT_NONE = 0;
    ELM_GENLIST_TREE_EFFECT_EXPAND = 1;
    ELM_GENLIST_TREE_EFFECT_CONTRACT = 2;
;
{ stacking markers in pan }
{ the object itself }
{ a list of
                                                    * selected
                                                    * items  }
{ a list of items currently being deselected  }
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
{ an inlist of all
                                                  * blocks. a block
                                                  * consists of a
                                                  * certain number of
                                                  * items. maximum
                                                  * number of items in
                                                  * a block is
                                                  * 'max_items_per_block'.  }
{ previous scrollable
                                                           * interface's
                                                           * viewport size.
                                                           * This is used only
                                                           * when genlist is in
                                                           * a compress mode.  }
{ an inlist of
                                                      * edje object it
                                                      * cache.  }
{ reorder
                                                           * it's
                                                           * initial y
                                                           * coordinate
                                                           * in the
                                                           * pan.  }
(* Const before type ignored *)
{ maximum number of cached items. (max_items_per_block * 2)  }
{ maximum number of items per block  }
{ longpress timeout. this value comes from _elm_config by
    * default. this can be changed by
    * elm_genlist_longpress_timeout_set()  }
{ a scrollto type which remembers where to scroll ex) in, top,
    * middle  }
{*< This object blocks the event in some cases. For example, when the tree effect is running and not finished, this object blocks events to the genlist.  }
{ items move for
                                                      * tree effect  }
{ a flag for determining
                                                        * minimum width to limit
                                                        * as their content size  }
{ a flag for determining
                                                        * minimum height to limit
                                                        * as their content size  }
{ a flag
                                                            * for
                                                            * reorder
                                                            * mode
                                                            * enable/disable  }
{ this flag means genlist is supposed to be scrolled. if this flag
    * is set to @c EINA_TRUE, genlist checks whether it's ok to scroll
    * genlist now or not.  }
{ a flag for items can be highlighted or not. by default this flag
    * is true.  }
{ a flag to
                                                        * describe the
                                                        * scroll
                                                        * animation. (show,
                                                        * bring in)  }
{ this is set to @c EINA_TRUE when the item is re-queued. this
    * happens when the item is un-queued but the rel item is still in
    * the queue. this item will be processed later.  }
{ a flag for item
                                                     * multi
                                                     * selection  }
{*< value whether item loop feature is enabled or not.  }
{ _calc_job() must be called in group_calc  }
type
  PElm_Genlist_Data = ^TElm_Genlist_Data;
  TElm_Genlist_Data = record
      state : PEina_Inlist_Sorted_State;
      hit_rect : PEvas_Object;
      pan_obj : PEvas_Object;
      stack : array[0..1] of PEvas_Object;
      obj : PEvas_Object;
      selected : PEina_List;
      deselecting : PEina_List;
      group_items : PEina_List;
      items : PEina_Inlist;
      reorder_it : PElm_Gen_Item;
      last_selected_item : PElm_Object_Item;
      focused_item : PElm_Object_Item;
      last_focused_item : PElm_Object_Item;
      walking : longint;
      minw : longint;
      minh : longint;
      item_count : dword;
      pan_x : TEvas_Coord;
      pan_y : TEvas_Coord;
      select_mode : TElm_Object_Select_Mode;
      multi_select_mode : TElm_Object_Multi_Select_Mode;
      blocks : PEina_Inlist;
      reorder_old_pan_y : TEvas_Coord;
      w : TEvas_Coord;
      h : TEvas_Coord;
      realminw : TEvas_Coord;
      prev_viewport_w : TEvas_Coord;
      update_job : PEcore_Job;
      queue_idle_enterer : PEcore_Idle_Enterer;
      must_recalc_idler : PEcore_Idler;
      queue : PEina_List;
      show_item : PElm_Gen_Item;
      anchor_item : PElm_Gen_Item;
      mode_item : PElm_Gen_Item;
      reorder_rel : PElm_Gen_Item;
      expanded_item : PElm_Gen_Item;
      pin_item : PElm_Gen_Item;
      item_cache : PEina_Inlist;
      anchor_y : TEvas_Coord;
      reorder_start_y : TEvas_Coord;
      mode : TElm_List_Mode;
      multi_timer : PEcore_Timer;
      scr_hold_timer : PEcore_Timer;
      reorder_move_animator : PEcore_Animator;
      decorate_it_type : Pchar;
      start_time : Tdouble;
      prev_x : TEvas_Coord;
      prev_y : TEvas_Coord;
      prev_mx : TEvas_Coord;
      prev_my : TEvas_Coord;
      cur_x : TEvas_Coord;
      cur_y : TEvas_Coord;
      cur_mx : TEvas_Coord;
      cur_my : TEvas_Coord;
      history : array[0..(SWIPE_MOVES)-1] of record
          x : TEvas_Coord;
          y : TEvas_Coord;
        end;
      multi_device : longint;
      item_cache_count : longint;
      item_cache_max : longint;
      movements : longint;
      max_items_per_block : longint;
      longpress_timeout : Tdouble;
      item_compare_cb : TEina_Compare_Cb;
      item_compare_data_cb : TEina_Compare_Cb;
      scroll_to_type : TElm_Genlist_Item_Scrollto_Type;
      event_block_rect : PEvas_Object;
      move_items : PEina_List;
      expanded_next_item : PElm_Gen_Item;
      move_effect_mode : TElm_Genlist_Item_Move_Effect_Mode;
      reorder_fast : longint;
      filter_queue : PEina_List;
      filtered_list : PEina_List;
      filter_data : pointer;
      processed_count : dword;
      filtered_count : dword;
      top_level_parent_items : dword;
      queue_filter_enterer : PEcore_Idle_Enterer;
      size_caches : PEina_Hash;
      content_item_map : PEina_Hash;
      provider : PEo;
      focus_on_realization : PElm_Gen_Item;
      flag0 : longint;
      flag1 : word;
    end;


const
  bm_TElm_Genlist_Data_scr_minw = $1;
  bp_TElm_Genlist_Data_scr_minw = 0;
  bm_TElm_Genlist_Data_scr_minh = $2;
  bp_TElm_Genlist_Data_scr_minh = 1;
  bm_TElm_Genlist_Data_filter = $4;
  bp_TElm_Genlist_Data_filter = 2;
  bm_TElm_Genlist_Data_focus_on_selection_enabled = $8;
  bp_TElm_Genlist_Data_focus_on_selection_enabled = 3;
  bm_TElm_Genlist_Data_tree_effect_enabled = $10;
  bp_TElm_Genlist_Data_tree_effect_enabled = 4;
  bm_TElm_Genlist_Data_auto_scroll_enabled = $20;
  bp_TElm_Genlist_Data_auto_scroll_enabled = 5;
  bm_TElm_Genlist_Data_decorate_all_mode = $40;
  bp_TElm_Genlist_Data_decorate_all_mode = 6;
  bm_TElm_Genlist_Data_height_for_width = $80;
  bp_TElm_Genlist_Data_height_for_width = 7;
  bm_TElm_Genlist_Data_reorder_pan_move = $100;
  bp_TElm_Genlist_Data_reorder_pan_move = 8;
  bm_TElm_Genlist_Data_multi_timeout = $200;
  bp_TElm_Genlist_Data_multi_timeout = 9;
  bm_TElm_Genlist_Data_multi_touched = $400;
  bp_TElm_Genlist_Data_multi_touched = 10;
  bm_TElm_Genlist_Data_reorder_mode = $800;
  bp_TElm_Genlist_Data_reorder_mode = 11;
  bm_TElm_Genlist_Data_check_scroll = $1000;
  bp_TElm_Genlist_Data_check_scroll = 12;
  bm_TElm_Genlist_Data_pan_changed = $2000;
  bp_TElm_Genlist_Data_pan_changed = 13;
  bm_TElm_Genlist_Data_wasselected = $4000;
  bp_TElm_Genlist_Data_wasselected = 14;
  bm_TElm_Genlist_Data_homogeneous = $8000;
  bp_TElm_Genlist_Data_homogeneous = 15;
  bm_TElm_Genlist_Data_longpressed = $10000;
  bp_TElm_Genlist_Data_longpressed = 16;
  bm_TElm_Genlist_Data_mouse_down = $20000;
  bp_TElm_Genlist_Data_mouse_down = 17;
  bm_TElm_Genlist_Data_multi_down = $40000;
  bp_TElm_Genlist_Data_multi_down = 18;
  bm_TElm_Genlist_Data_on_sub_del = $80000;
  bp_TElm_Genlist_Data_on_sub_del = 19;
  bm_TElm_Genlist_Data_highlight = $100000;
  bp_TElm_Genlist_Data_highlight = 20;
  bm_TElm_Genlist_Data_h_bounce = $200000;
  bp_TElm_Genlist_Data_h_bounce = 21;
  bm_TElm_Genlist_Data_v_bounce = $400000;
  bp_TElm_Genlist_Data_v_bounce = 22;
  bm_TElm_Genlist_Data_bring_in = $800000;
  bp_TElm_Genlist_Data_bring_in = 23;
  bm_TElm_Genlist_Data_requeued = $1000000;
  bp_TElm_Genlist_Data_requeued = 24;
  bm_TElm_Genlist_Data_on_hold = $2000000;
  bp_TElm_Genlist_Data_on_hold = 25;
  bm_TElm_Genlist_Data_multi = $4000000;
  bp_TElm_Genlist_Data_multi = 26;
  bm_TElm_Genlist_Data_swipe = $8000000;
  bp_TElm_Genlist_Data_swipe = 27;
  bm_TElm_Genlist_Data_item_loop_enable = $10000000;
  bp_TElm_Genlist_Data_item_loop_enable = 28;
  bm_TElm_Genlist_Data_item_looping_on = $20000000;
  bp_TElm_Genlist_Data_item_looping_on = 29;
  bm_TElm_Genlist_Data_tree_effect_animator = $40000000;
  bp_TElm_Genlist_Data_tree_effect_animator = 30;
  bm_TElm_Genlist_Data_pin_item_top = $80000000;
  bp_TElm_Genlist_Data_pin_item_top = 31;
  bm_TElm_Genlist_Data_need_calc = $1;
  bp_TElm_Genlist_Data_need_calc = 0;

function scr_minw(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_scr_minw(var a : TElm_Genlist_Data; __scr_minw : TEina_Bool);
function scr_minh(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_scr_minh(var a : TElm_Genlist_Data; __scr_minh : TEina_Bool);
function filter(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_filter(var a : TElm_Genlist_Data; __filter : TEina_Bool);
function focus_on_selection_enabled(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_focus_on_selection_enabled(var a : TElm_Genlist_Data; __focus_on_selection_enabled : TEina_Bool);
function tree_effect_enabled(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_tree_effect_enabled(var a : TElm_Genlist_Data; __tree_effect_enabled : TEina_Bool);
function auto_scroll_enabled(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_auto_scroll_enabled(var a : TElm_Genlist_Data; __auto_scroll_enabled : TEina_Bool);
function decorate_all_mode(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_decorate_all_mode(var a : TElm_Genlist_Data; __decorate_all_mode : TEina_Bool);
function height_for_width(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_height_for_width(var a : TElm_Genlist_Data; __height_for_width : TEina_Bool);
function reorder_pan_move(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_reorder_pan_move(var a : TElm_Genlist_Data; __reorder_pan_move : TEina_Bool);
function multi_timeout(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_multi_timeout(var a : TElm_Genlist_Data; __multi_timeout : TEina_Bool);
function multi_touched(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_multi_touched(var a : TElm_Genlist_Data; __multi_touched : TEina_Bool);
function reorder_mode(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_reorder_mode(var a : TElm_Genlist_Data; __reorder_mode : TEina_Bool);
function check_scroll(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_check_scroll(var a : TElm_Genlist_Data; __check_scroll : TEina_Bool);
function pan_changed(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_pan_changed(var a : TElm_Genlist_Data; __pan_changed : TEina_Bool);
function wasselected(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_wasselected(var a : TElm_Genlist_Data; __wasselected : TEina_Bool);
function homogeneous(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_homogeneous(var a : TElm_Genlist_Data; __homogeneous : TEina_Bool);
function longpressed(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_longpressed(var a : TElm_Genlist_Data; __longpressed : TEina_Bool);
function mouse_down(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_mouse_down(var a : TElm_Genlist_Data; __mouse_down : TEina_Bool);
function multi_down(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_multi_down(var a : TElm_Genlist_Data; __multi_down : TEina_Bool);
function on_sub_del(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_on_sub_del(var a : TElm_Genlist_Data; __on_sub_del : TEina_Bool);
function highlight(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_highlight(var a : TElm_Genlist_Data; __highlight : TEina_Bool);
function h_bounce(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_h_bounce(var a : TElm_Genlist_Data; __h_bounce : TEina_Bool);
function v_bounce(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_v_bounce(var a : TElm_Genlist_Data; __v_bounce : TEina_Bool);
function bring_in(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_bring_in(var a : TElm_Genlist_Data; __bring_in : TEina_Bool);
function requeued(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_requeued(var a : TElm_Genlist_Data; __requeued : TEina_Bool);
function on_hold(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_on_hold(var a : TElm_Genlist_Data; __on_hold : TEina_Bool);
function multi(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_multi(var a : TElm_Genlist_Data; __multi : TEina_Bool);
function swipe(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_swipe(var a : TElm_Genlist_Data; __swipe : TEina_Bool);
function item_loop_enable(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_item_loop_enable(var a : TElm_Genlist_Data; __item_loop_enable : TEina_Bool);
function item_looping_on(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_item_looping_on(var a : TElm_Genlist_Data; __item_looping_on : TEina_Bool);
function tree_effect_animator(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_tree_effect_animator(var a : TElm_Genlist_Data; __tree_effect_animator : TEina_Bool);
function pin_item_top(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_pin_item_top(var a : TElm_Genlist_Data; __pin_item_top : TEina_Bool);
function need_calc(var a : TElm_Genlist_Data) : TEina_Bool;
procedure set_need_calc(var a : TElm_Genlist_Data; __need_calc : TEina_Bool);
type
{ FIXME: find better way not to use this }
{ Written by _item_order_update() }
{ tree effect  }
{ item hide for
                                                    * tree effect  }
{ do not use cache for
                                              * this item only once  }
{ do not use cache for this item  }
{ item is not focusable; propagate to content  }
  PElm_Gen_Item_Type = ^TElm_Gen_Item_Type;
  TElm_Gen_Item_Type = record
      it : PElm_Gen_Item;
      wsd : PElm_Genlist_Data;
      block : PItem_Block;
      items : PEina_List;
      w : TEvas_Coord;
      h : TEvas_Coord;
      minw : TEvas_Coord;
      minh : TEvas_Coord;
      group_item : PElm_Gen_Item;
      _type : TElm_Genlist_Item_Type;
      deco_it_texts : PEina_List;
      deco_it_contents : PEina_List;
      deco_all_texts : PEina_List;
      deco_all_contents : PEina_List;
      flip_contents : PEina_List;
      swipe_timer : PEcore_Timer;
      scrl_x : TEvas_Coord;
      scrl_y : TEvas_Coord;
      old_scrl_y : TEvas_Coord;
      rel : PElm_Gen_Item;
      rel_revs : PEina_List;
      deco_it_view : PEvas_Object;
      expanded_depth : longint;
      order_num_in : longint;
      flag0 : word;
    end;


const
  bm_TElm_Gen_Item_Type_decorate_all_item_realized = $1;
  bp_TElm_Gen_Item_Type_decorate_all_item_realized = 0;
  bm_TElm_Gen_Item_Type_tree_effect_finished = $2;
  bp_TElm_Gen_Item_Type_tree_effect_finished = 1;
  bm_TElm_Gen_Item_Type_move_effect_enabled = $4;
  bp_TElm_Gen_Item_Type_move_effect_enabled = 2;
  bm_TElm_Gen_Item_Type_tree_effect_hide_me = $8;
  bp_TElm_Gen_Item_Type_tree_effect_hide_me = 3;
  bm_TElm_Gen_Item_Type_stacking_even = $10;
  bp_TElm_Gen_Item_Type_stacking_even = 4;
  bm_TElm_Gen_Item_Type_want_realize = $20;
  bp_TElm_Gen_Item_Type_want_realize = 5;
  bm_TElm_Gen_Item_Type_nocache_once = $40;
  bp_TElm_Gen_Item_Type_nocache_once = 6;
  bm_TElm_Gen_Item_Type_nostacking = $80;
  bp_TElm_Gen_Item_Type_nostacking = 7;
  bm_TElm_Gen_Item_Type_expanded = $100;
  bp_TElm_Gen_Item_Type_expanded = 8;
  bm_TElm_Gen_Item_Type_mincalcd = $200;
  bp_TElm_Gen_Item_Type_mincalcd = 9;
  bm_TElm_Gen_Item_Type_updateme = $400;
  bp_TElm_Gen_Item_Type_updateme = 10;
  bm_TElm_Gen_Item_Type_nocache = $800;
  bp_TElm_Gen_Item_Type_nocache = 11;
  bm_TElm_Gen_Item_Type_queued = $1000;
  bp_TElm_Gen_Item_Type_queued = 12;
  bm_TElm_Gen_Item_Type_before = $2000;
  bp_TElm_Gen_Item_Type_before = 13;
  bm_TElm_Gen_Item_Type_show_me = $4000;
  bp_TElm_Gen_Item_Type_show_me = 14;
  bm_TElm_Gen_Item_Type_unfocusable = $8000;
  bp_TElm_Gen_Item_Type_unfocusable = 15;

function decorate_all_item_realized(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_decorate_all_item_realized(var a : TElm_Gen_Item_Type; __decorate_all_item_realized : TEina_Bool);
function tree_effect_finished(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_tree_effect_finished(var a : TElm_Gen_Item_Type; __tree_effect_finished : TEina_Bool);
function move_effect_enabled(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_move_effect_enabled(var a : TElm_Gen_Item_Type; __move_effect_enabled : TEina_Bool);
function tree_effect_hide_me(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_tree_effect_hide_me(var a : TElm_Gen_Item_Type; __tree_effect_hide_me : TEina_Bool);
function stacking_even(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_stacking_even(var a : TElm_Gen_Item_Type; __stacking_even : TEina_Bool);
function want_realize(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_want_realize(var a : TElm_Gen_Item_Type; __want_realize : TEina_Bool);
function nocache_once(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_nocache_once(var a : TElm_Gen_Item_Type; __nocache_once : TEina_Bool);
function nostacking(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_nostacking(var a : TElm_Gen_Item_Type; __nostacking : TEina_Bool);
function expanded(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_expanded(var a : TElm_Gen_Item_Type; __expanded : TEina_Bool);
function mincalcd(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_mincalcd(var a : TElm_Gen_Item_Type; __mincalcd : TEina_Bool);
function updateme(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_updateme(var a : TElm_Gen_Item_Type; __updateme : TEina_Bool);
function nocache(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_nocache(var a : TElm_Gen_Item_Type; __nocache : TEina_Bool);
function queued(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_queued(var a : TElm_Gen_Item_Type; __queued : TEina_Bool);
function before(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_before(var a : TElm_Gen_Item_Type; __before : TEina_Bool);
function show_me(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_show_me(var a : TElm_Gen_Item_Type; __show_me : TEina_Bool);
function unfocusable(var a : TElm_Gen_Item_Type) : TEina_Bool;
procedure set_unfocusable(var a : TElm_Gen_Item_Type; __unfocusable : TEina_Bool);
type
  PItem_Block = ^TItem_Block;
  TItem_Block = record
      __in_list : TEina_Inlist;
      count : longint;
      vis_count : longint;
      num : longint;
      reorder_offset : longint;
      sd : PElm_Genlist_Data;
      items : PEina_List;
      x : TEvas_Coord;
      y : TEvas_Coord;
      w : TEvas_Coord;
      h : TEvas_Coord;
      minw : TEvas_Coord;
      minh : TEvas_Coord;
      position : longint;
      item_position_stamp : longint;
      adapter : PEo;
      flag0 : word;
    end;


const
  bm_TItem_Block_position_update = $1;
  bp_TItem_Block_position_update = 0;
  bm_TItem_Block_want_unrealize = $2;
  bp_TItem_Block_want_unrealize = 1;
  bm_TItem_Block_must_recalc = $4;
  bp_TItem_Block_must_recalc = 2;
  bm_TItem_Block_realized = $8;
  bp_TItem_Block_realized = 3;
  bm_TItem_Block_updateme = $10;
  bp_TItem_Block_updateme = 4;
  bm_TItem_Block_changed = $20;
  bp_TItem_Block_changed = 5;
  bm_TItem_Block_show_me = $40;
  bp_TItem_Block_show_me = 6;

function position_update(var a : TItem_Block) : TEina_Bool;
procedure set_position_update(var a : TItem_Block; __position_update : TEina_Bool);
function want_unrealize(var a : TItem_Block) : TEina_Bool;
procedure set_want_unrealize(var a : TItem_Block; __want_unrealize : TEina_Bool);
function must_recalc(var a : TItem_Block) : TEina_Bool;
procedure set_must_recalc(var a : TItem_Block; __must_recalc : TEina_Bool);
function realized(var a : TItem_Block) : TEina_Bool;
procedure set_realized(var a : TItem_Block; __realized : TEina_Bool);
function updateme(var a : TItem_Block) : TEina_Bool;
procedure set_updateme(var a : TItem_Block; __updateme : TEina_Bool);
function changed(var a : TItem_Block) : TEina_Bool;
procedure set_changed(var a : TItem_Block; __changed : TEina_Bool);
function show_me(var a : TItem_Block) : TEina_Bool;
procedure set_show_me(var a : TItem_Block; __show_me : TEina_Bool);
(* Const before type ignored *)
{ it->itc }
{ it->group }
{ content objects for reusing }
type
  PItem_Cache = ^TItem_Cache;
  TItem_Cache = record
      __in_list : TEina_Inlist;
      base_view : PEvas_Object;
      spacer : PEvas_Object;
      item_class : PElm_Genlist_Item_Class;
      flag0 : word;
      contents : PEina_List;
    end;


const
  bm_TItem_Cache_tree = $1;
  bp_TItem_Cache_tree = 0;

function tree(var a : TItem_Cache) : TEina_Bool;
procedure set_tree(var a : TItem_Cache; __tree : TEina_Bool);
(* Const before type ignored *)
type
  PItem_Size = ^TItem_Size;
  TItem_Size = record
      itc : PElm_Genlist_Item_Class;
      minw : TEvas_Coord;
      minh : TEvas_Coord;
      expanded_depth : longint;
    end;

  PElm_Genlist_Pan_Data = ^TElm_Genlist_Pan_Data;
  TElm_Genlist_Pan_Data = record
      wobj : PEvas_Object;
      wsd : PElm_Genlist_Data;
      resize_job : PEcore_Job;
    end;

{*
 * Structure added to genlist for internal filter iterator implementation
 * Can be extended to genlist as a whole in future if needed.
  }
(* Const before type ignored *)
(* Const before type ignored *)
  PElm_Genlist_Filter = ^TElm_Genlist_Filter;
  TElm_Genlist_Filter = record
      iterator : TEina_Iterator;
      head : PEina_Inlist;
      current : PEina_Inlist;
      obj : PEvas_Object;
    end;

{*
 * @
  }
{$endif}

implementation

function scr_minw(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  scr_minw:=(a.flag0 and bm_TElm_Genlist_Data_scr_minw) shr bp_TElm_Genlist_Data_scr_minw;
end;

procedure set_scr_minw(var a : TElm_Genlist_Data; __scr_minw : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scr_minw shl bp_TElm_Genlist_Data_scr_minw) and bm_TElm_Genlist_Data_scr_minw);
end;

function scr_minh(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  scr_minh:=(a.flag0 and bm_TElm_Genlist_Data_scr_minh) shr bp_TElm_Genlist_Data_scr_minh;
end;

procedure set_scr_minh(var a : TElm_Genlist_Data; __scr_minh : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scr_minh shl bp_TElm_Genlist_Data_scr_minh) and bm_TElm_Genlist_Data_scr_minh);
end;

function filter(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  filter:=(a.flag0 and bm_TElm_Genlist_Data_filter) shr bp_TElm_Genlist_Data_filter;
end;

procedure set_filter(var a : TElm_Genlist_Data; __filter : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__filter shl bp_TElm_Genlist_Data_filter) and bm_TElm_Genlist_Data_filter);
end;

function focus_on_selection_enabled(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  focus_on_selection_enabled:=(a.flag0 and bm_TElm_Genlist_Data_focus_on_selection_enabled) shr bp_TElm_Genlist_Data_focus_on_selection_enabled;
end;

procedure set_focus_on_selection_enabled(var a : TElm_Genlist_Data; __focus_on_selection_enabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__focus_on_selection_enabled shl bp_TElm_Genlist_Data_focus_on_selection_enabled) and bm_TElm_Genlist_Data_focus_on_selection_enabled);
end;

function tree_effect_enabled(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  tree_effect_enabled:=(a.flag0 and bm_TElm_Genlist_Data_tree_effect_enabled) shr bp_TElm_Genlist_Data_tree_effect_enabled;
end;

procedure set_tree_effect_enabled(var a : TElm_Genlist_Data; __tree_effect_enabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__tree_effect_enabled shl bp_TElm_Genlist_Data_tree_effect_enabled) and bm_TElm_Genlist_Data_tree_effect_enabled);
end;

function auto_scroll_enabled(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  auto_scroll_enabled:=(a.flag0 and bm_TElm_Genlist_Data_auto_scroll_enabled) shr bp_TElm_Genlist_Data_auto_scroll_enabled;
end;

procedure set_auto_scroll_enabled(var a : TElm_Genlist_Data; __auto_scroll_enabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__auto_scroll_enabled shl bp_TElm_Genlist_Data_auto_scroll_enabled) and bm_TElm_Genlist_Data_auto_scroll_enabled);
end;

function decorate_all_mode(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  decorate_all_mode:=(a.flag0 and bm_TElm_Genlist_Data_decorate_all_mode) shr bp_TElm_Genlist_Data_decorate_all_mode;
end;

procedure set_decorate_all_mode(var a : TElm_Genlist_Data; __decorate_all_mode : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__decorate_all_mode shl bp_TElm_Genlist_Data_decorate_all_mode) and bm_TElm_Genlist_Data_decorate_all_mode);
end;

function height_for_width(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  height_for_width:=(a.flag0 and bm_TElm_Genlist_Data_height_for_width) shr bp_TElm_Genlist_Data_height_for_width;
end;

procedure set_height_for_width(var a : TElm_Genlist_Data; __height_for_width : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__height_for_width shl bp_TElm_Genlist_Data_height_for_width) and bm_TElm_Genlist_Data_height_for_width);
end;

function reorder_pan_move(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  reorder_pan_move:=(a.flag0 and bm_TElm_Genlist_Data_reorder_pan_move) shr bp_TElm_Genlist_Data_reorder_pan_move;
end;

procedure set_reorder_pan_move(var a : TElm_Genlist_Data; __reorder_pan_move : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__reorder_pan_move shl bp_TElm_Genlist_Data_reorder_pan_move) and bm_TElm_Genlist_Data_reorder_pan_move);
end;

function multi_timeout(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  multi_timeout:=(a.flag0 and bm_TElm_Genlist_Data_multi_timeout) shr bp_TElm_Genlist_Data_multi_timeout;
end;

procedure set_multi_timeout(var a : TElm_Genlist_Data; __multi_timeout : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__multi_timeout shl bp_TElm_Genlist_Data_multi_timeout) and bm_TElm_Genlist_Data_multi_timeout);
end;

function multi_touched(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  multi_touched:=(a.flag0 and bm_TElm_Genlist_Data_multi_touched) shr bp_TElm_Genlist_Data_multi_touched;
end;

procedure set_multi_touched(var a : TElm_Genlist_Data; __multi_touched : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__multi_touched shl bp_TElm_Genlist_Data_multi_touched) and bm_TElm_Genlist_Data_multi_touched);
end;

function reorder_mode(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  reorder_mode:=(a.flag0 and bm_TElm_Genlist_Data_reorder_mode) shr bp_TElm_Genlist_Data_reorder_mode;
end;

procedure set_reorder_mode(var a : TElm_Genlist_Data; __reorder_mode : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__reorder_mode shl bp_TElm_Genlist_Data_reorder_mode) and bm_TElm_Genlist_Data_reorder_mode);
end;

function check_scroll(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  check_scroll:=(a.flag0 and bm_TElm_Genlist_Data_check_scroll) shr bp_TElm_Genlist_Data_check_scroll;
end;

procedure set_check_scroll(var a : TElm_Genlist_Data; __check_scroll : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__check_scroll shl bp_TElm_Genlist_Data_check_scroll) and bm_TElm_Genlist_Data_check_scroll);
end;

function pan_changed(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  pan_changed:=(a.flag0 and bm_TElm_Genlist_Data_pan_changed) shr bp_TElm_Genlist_Data_pan_changed;
end;

procedure set_pan_changed(var a : TElm_Genlist_Data; __pan_changed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__pan_changed shl bp_TElm_Genlist_Data_pan_changed) and bm_TElm_Genlist_Data_pan_changed);
end;

function wasselected(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  wasselected:=(a.flag0 and bm_TElm_Genlist_Data_wasselected) shr bp_TElm_Genlist_Data_wasselected;
end;

procedure set_wasselected(var a : TElm_Genlist_Data; __wasselected : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__wasselected shl bp_TElm_Genlist_Data_wasselected) and bm_TElm_Genlist_Data_wasselected);
end;

function homogeneous(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  homogeneous:=(a.flag0 and bm_TElm_Genlist_Data_homogeneous) shr bp_TElm_Genlist_Data_homogeneous;
end;

procedure set_homogeneous(var a : TElm_Genlist_Data; __homogeneous : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__homogeneous shl bp_TElm_Genlist_Data_homogeneous) and bm_TElm_Genlist_Data_homogeneous);
end;

function longpressed(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  longpressed:=(a.flag0 and bm_TElm_Genlist_Data_longpressed) shr bp_TElm_Genlist_Data_longpressed;
end;

procedure set_longpressed(var a : TElm_Genlist_Data; __longpressed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__longpressed shl bp_TElm_Genlist_Data_longpressed) and bm_TElm_Genlist_Data_longpressed);
end;

function mouse_down(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  mouse_down:=(a.flag0 and bm_TElm_Genlist_Data_mouse_down) shr bp_TElm_Genlist_Data_mouse_down;
end;

procedure set_mouse_down(var a : TElm_Genlist_Data; __mouse_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__mouse_down shl bp_TElm_Genlist_Data_mouse_down) and bm_TElm_Genlist_Data_mouse_down);
end;

function multi_down(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  multi_down:=(a.flag0 and bm_TElm_Genlist_Data_multi_down) shr bp_TElm_Genlist_Data_multi_down;
end;

procedure set_multi_down(var a : TElm_Genlist_Data; __multi_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__multi_down shl bp_TElm_Genlist_Data_multi_down) and bm_TElm_Genlist_Data_multi_down);
end;

function on_sub_del(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  on_sub_del:=(a.flag0 and bm_TElm_Genlist_Data_on_sub_del) shr bp_TElm_Genlist_Data_on_sub_del;
end;

procedure set_on_sub_del(var a : TElm_Genlist_Data; __on_sub_del : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__on_sub_del shl bp_TElm_Genlist_Data_on_sub_del) and bm_TElm_Genlist_Data_on_sub_del);
end;

function highlight(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  highlight:=(a.flag0 and bm_TElm_Genlist_Data_highlight) shr bp_TElm_Genlist_Data_highlight;
end;

procedure set_highlight(var a : TElm_Genlist_Data; __highlight : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__highlight shl bp_TElm_Genlist_Data_highlight) and bm_TElm_Genlist_Data_highlight);
end;

function h_bounce(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  h_bounce:=(a.flag0 and bm_TElm_Genlist_Data_h_bounce) shr bp_TElm_Genlist_Data_h_bounce;
end;

procedure set_h_bounce(var a : TElm_Genlist_Data; __h_bounce : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__h_bounce shl bp_TElm_Genlist_Data_h_bounce) and bm_TElm_Genlist_Data_h_bounce);
end;

function v_bounce(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  v_bounce:=(a.flag0 and bm_TElm_Genlist_Data_v_bounce) shr bp_TElm_Genlist_Data_v_bounce;
end;

procedure set_v_bounce(var a : TElm_Genlist_Data; __v_bounce : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__v_bounce shl bp_TElm_Genlist_Data_v_bounce) and bm_TElm_Genlist_Data_v_bounce);
end;

function bring_in(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  bring_in:=(a.flag0 and bm_TElm_Genlist_Data_bring_in) shr bp_TElm_Genlist_Data_bring_in;
end;

procedure set_bring_in(var a : TElm_Genlist_Data; __bring_in : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__bring_in shl bp_TElm_Genlist_Data_bring_in) and bm_TElm_Genlist_Data_bring_in);
end;

function requeued(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  requeued:=(a.flag0 and bm_TElm_Genlist_Data_requeued) shr bp_TElm_Genlist_Data_requeued;
end;

procedure set_requeued(var a : TElm_Genlist_Data; __requeued : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__requeued shl bp_TElm_Genlist_Data_requeued) and bm_TElm_Genlist_Data_requeued);
end;

function on_hold(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  on_hold:=(a.flag0 and bm_TElm_Genlist_Data_on_hold) shr bp_TElm_Genlist_Data_on_hold;
end;

procedure set_on_hold(var a : TElm_Genlist_Data; __on_hold : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__on_hold shl bp_TElm_Genlist_Data_on_hold) and bm_TElm_Genlist_Data_on_hold);
end;

function multi(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  multi:=(a.flag0 and bm_TElm_Genlist_Data_multi) shr bp_TElm_Genlist_Data_multi;
end;

procedure set_multi(var a : TElm_Genlist_Data; __multi : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__multi shl bp_TElm_Genlist_Data_multi) and bm_TElm_Genlist_Data_multi);
end;

function swipe(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  swipe:=(a.flag0 and bm_TElm_Genlist_Data_swipe) shr bp_TElm_Genlist_Data_swipe;
end;

procedure set_swipe(var a : TElm_Genlist_Data; __swipe : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__swipe shl bp_TElm_Genlist_Data_swipe) and bm_TElm_Genlist_Data_swipe);
end;

function item_loop_enable(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  item_loop_enable:=(a.flag0 and bm_TElm_Genlist_Data_item_loop_enable) shr bp_TElm_Genlist_Data_item_loop_enable;
end;

procedure set_item_loop_enable(var a : TElm_Genlist_Data; __item_loop_enable : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__item_loop_enable shl bp_TElm_Genlist_Data_item_loop_enable) and bm_TElm_Genlist_Data_item_loop_enable);
end;

function item_looping_on(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  item_looping_on:=(a.flag0 and bm_TElm_Genlist_Data_item_looping_on) shr bp_TElm_Genlist_Data_item_looping_on;
end;

procedure set_item_looping_on(var a : TElm_Genlist_Data; __item_looping_on : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__item_looping_on shl bp_TElm_Genlist_Data_item_looping_on) and bm_TElm_Genlist_Data_item_looping_on);
end;

function tree_effect_animator(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  tree_effect_animator:=(a.flag0 and bm_TElm_Genlist_Data_tree_effect_animator) shr bp_TElm_Genlist_Data_tree_effect_animator;
end;

procedure set_tree_effect_animator(var a : TElm_Genlist_Data; __tree_effect_animator : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__tree_effect_animator shl bp_TElm_Genlist_Data_tree_effect_animator) and bm_TElm_Genlist_Data_tree_effect_animator);
end;

function pin_item_top(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  pin_item_top:=(a.flag0 and bm_TElm_Genlist_Data_pin_item_top) shr bp_TElm_Genlist_Data_pin_item_top;
end;

procedure set_pin_item_top(var a : TElm_Genlist_Data; __pin_item_top : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__pin_item_top shl bp_TElm_Genlist_Data_pin_item_top) and bm_TElm_Genlist_Data_pin_item_top);
end;

function need_calc(var a : TElm_Genlist_Data) : TEina_Bool;
begin
  need_calc:=(a.flag0 and bm_TElm_Genlist_Data_need_calc) shr bp_TElm_Genlist_Data_need_calc;
end;

procedure set_need_calc(var a : TElm_Genlist_Data; __need_calc : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__need_calc shl bp_TElm_Genlist_Data_need_calc) and bm_TElm_Genlist_Data_need_calc);
end;

function decorate_all_item_realized(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  decorate_all_item_realized:=(a.flag0 and bm_TElm_Gen_Item_Type_decorate_all_item_realized) shr bp_TElm_Gen_Item_Type_decorate_all_item_realized;
end;

procedure set_decorate_all_item_realized(var a : TElm_Gen_Item_Type; __decorate_all_item_realized : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__decorate_all_item_realized shl bp_TElm_Gen_Item_Type_decorate_all_item_realized) and bm_TElm_Gen_Item_Type_decorate_all_item_realized);
end;

function tree_effect_finished(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  tree_effect_finished:=(a.flag0 and bm_TElm_Gen_Item_Type_tree_effect_finished) shr bp_TElm_Gen_Item_Type_tree_effect_finished;
end;

procedure set_tree_effect_finished(var a : TElm_Gen_Item_Type; __tree_effect_finished : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__tree_effect_finished shl bp_TElm_Gen_Item_Type_tree_effect_finished) and bm_TElm_Gen_Item_Type_tree_effect_finished);
end;

function move_effect_enabled(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  move_effect_enabled:=(a.flag0 and bm_TElm_Gen_Item_Type_move_effect_enabled) shr bp_TElm_Gen_Item_Type_move_effect_enabled;
end;

procedure set_move_effect_enabled(var a : TElm_Gen_Item_Type; __move_effect_enabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__move_effect_enabled shl bp_TElm_Gen_Item_Type_move_effect_enabled) and bm_TElm_Gen_Item_Type_move_effect_enabled);
end;

function tree_effect_hide_me(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  tree_effect_hide_me:=(a.flag0 and bm_TElm_Gen_Item_Type_tree_effect_hide_me) shr bp_TElm_Gen_Item_Type_tree_effect_hide_me;
end;

procedure set_tree_effect_hide_me(var a : TElm_Gen_Item_Type; __tree_effect_hide_me : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__tree_effect_hide_me shl bp_TElm_Gen_Item_Type_tree_effect_hide_me) and bm_TElm_Gen_Item_Type_tree_effect_hide_me);
end;

function stacking_even(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  stacking_even:=(a.flag0 and bm_TElm_Gen_Item_Type_stacking_even) shr bp_TElm_Gen_Item_Type_stacking_even;
end;

procedure set_stacking_even(var a : TElm_Gen_Item_Type; __stacking_even : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__stacking_even shl bp_TElm_Gen_Item_Type_stacking_even) and bm_TElm_Gen_Item_Type_stacking_even);
end;

function want_realize(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  want_realize:=(a.flag0 and bm_TElm_Gen_Item_Type_want_realize) shr bp_TElm_Gen_Item_Type_want_realize;
end;

procedure set_want_realize(var a : TElm_Gen_Item_Type; __want_realize : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__want_realize shl bp_TElm_Gen_Item_Type_want_realize) and bm_TElm_Gen_Item_Type_want_realize);
end;

function nocache_once(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  nocache_once:=(a.flag0 and bm_TElm_Gen_Item_Type_nocache_once) shr bp_TElm_Gen_Item_Type_nocache_once;
end;

procedure set_nocache_once(var a : TElm_Gen_Item_Type; __nocache_once : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__nocache_once shl bp_TElm_Gen_Item_Type_nocache_once) and bm_TElm_Gen_Item_Type_nocache_once);
end;

function nostacking(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  nostacking:=(a.flag0 and bm_TElm_Gen_Item_Type_nostacking) shr bp_TElm_Gen_Item_Type_nostacking;
end;

procedure set_nostacking(var a : TElm_Gen_Item_Type; __nostacking : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__nostacking shl bp_TElm_Gen_Item_Type_nostacking) and bm_TElm_Gen_Item_Type_nostacking);
end;

function expanded(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  expanded:=(a.flag0 and bm_TElm_Gen_Item_Type_expanded) shr bp_TElm_Gen_Item_Type_expanded;
end;

procedure set_expanded(var a : TElm_Gen_Item_Type; __expanded : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__expanded shl bp_TElm_Gen_Item_Type_expanded) and bm_TElm_Gen_Item_Type_expanded);
end;

function mincalcd(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  mincalcd:=(a.flag0 and bm_TElm_Gen_Item_Type_mincalcd) shr bp_TElm_Gen_Item_Type_mincalcd;
end;

procedure set_mincalcd(var a : TElm_Gen_Item_Type; __mincalcd : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__mincalcd shl bp_TElm_Gen_Item_Type_mincalcd) and bm_TElm_Gen_Item_Type_mincalcd);
end;

function updateme(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  updateme:=(a.flag0 and bm_TElm_Gen_Item_Type_updateme) shr bp_TElm_Gen_Item_Type_updateme;
end;

procedure set_updateme(var a : TElm_Gen_Item_Type; __updateme : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__updateme shl bp_TElm_Gen_Item_Type_updateme) and bm_TElm_Gen_Item_Type_updateme);
end;

function nocache(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  nocache:=(a.flag0 and bm_TElm_Gen_Item_Type_nocache) shr bp_TElm_Gen_Item_Type_nocache;
end;

procedure set_nocache(var a : TElm_Gen_Item_Type; __nocache : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__nocache shl bp_TElm_Gen_Item_Type_nocache) and bm_TElm_Gen_Item_Type_nocache);
end;

function queued(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  queued:=(a.flag0 and bm_TElm_Gen_Item_Type_queued) shr bp_TElm_Gen_Item_Type_queued;
end;

procedure set_queued(var a : TElm_Gen_Item_Type; __queued : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__queued shl bp_TElm_Gen_Item_Type_queued) and bm_TElm_Gen_Item_Type_queued);
end;

function before(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  before:=(a.flag0 and bm_TElm_Gen_Item_Type_before) shr bp_TElm_Gen_Item_Type_before;
end;

procedure set_before(var a : TElm_Gen_Item_Type; __before : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__before shl bp_TElm_Gen_Item_Type_before) and bm_TElm_Gen_Item_Type_before);
end;

function show_me(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  show_me:=(a.flag0 and bm_TElm_Gen_Item_Type_show_me) shr bp_TElm_Gen_Item_Type_show_me;
end;

procedure set_show_me(var a : TElm_Gen_Item_Type; __show_me : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__show_me shl bp_TElm_Gen_Item_Type_show_me) and bm_TElm_Gen_Item_Type_show_me);
end;

function unfocusable(var a : TElm_Gen_Item_Type) : TEina_Bool;
begin
  unfocusable:=(a.flag0 and bm_TElm_Gen_Item_Type_unfocusable) shr bp_TElm_Gen_Item_Type_unfocusable;
end;

procedure set_unfocusable(var a : TElm_Gen_Item_Type; __unfocusable : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__unfocusable shl bp_TElm_Gen_Item_Type_unfocusable) and bm_TElm_Gen_Item_Type_unfocusable);
end;

function position_update(var a : TItem_Block) : TEina_Bool;
begin
  position_update:=(a.flag0 and bm_TItem_Block_position_update) shr bp_TItem_Block_position_update;
end;

procedure set_position_update(var a : TItem_Block; __position_update : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__position_update shl bp_TItem_Block_position_update) and bm_TItem_Block_position_update);
end;

function want_unrealize(var a : TItem_Block) : TEina_Bool;
begin
  want_unrealize:=(a.flag0 and bm_TItem_Block_want_unrealize) shr bp_TItem_Block_want_unrealize;
end;

procedure set_want_unrealize(var a : TItem_Block; __want_unrealize : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__want_unrealize shl bp_TItem_Block_want_unrealize) and bm_TItem_Block_want_unrealize);
end;

function must_recalc(var a : TItem_Block) : TEina_Bool;
begin
  must_recalc:=(a.flag0 and bm_TItem_Block_must_recalc) shr bp_TItem_Block_must_recalc;
end;

procedure set_must_recalc(var a : TItem_Block; __must_recalc : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__must_recalc shl bp_TItem_Block_must_recalc) and bm_TItem_Block_must_recalc);
end;

function realized(var a : TItem_Block) : TEina_Bool;
begin
  realized:=(a.flag0 and bm_TItem_Block_realized) shr bp_TItem_Block_realized;
end;

procedure set_realized(var a : TItem_Block; __realized : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__realized shl bp_TItem_Block_realized) and bm_TItem_Block_realized);
end;

function updateme(var a : TItem_Block) : TEina_Bool;
begin
  updateme:=(a.flag0 and bm_TItem_Block_updateme) shr bp_TItem_Block_updateme;
end;

procedure set_updateme(var a : TItem_Block; __updateme : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__updateme shl bp_TItem_Block_updateme) and bm_TItem_Block_updateme);
end;

function changed(var a : TItem_Block) : TEina_Bool;
begin
  changed:=(a.flag0 and bm_TItem_Block_changed) shr bp_TItem_Block_changed;
end;

procedure set_changed(var a : TItem_Block; __changed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__changed shl bp_TItem_Block_changed) and bm_TItem_Block_changed);
end;

function show_me(var a : TItem_Block) : TEina_Bool;
begin
  show_me:=(a.flag0 and bm_TItem_Block_show_me) shr bp_TItem_Block_show_me;
end;

procedure set_show_me(var a : TItem_Block; __show_me : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__show_me shl bp_TItem_Block_show_me) and bm_TItem_Block_show_me);
end;

function tree(var a : TItem_Cache) : TEina_Bool;
begin
  tree:=(a.flag0 and bm_TItem_Cache_tree) shr bp_TItem_Cache_tree;
end;

procedure set_tree(var a : TItem_Cache; __tree : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__tree shl bp_TItem_Cache_tree) and bm_TItem_Cache_tree);
end;


end.
