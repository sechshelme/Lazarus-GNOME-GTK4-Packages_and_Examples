
unit elm_interface_scrollable;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_interface_scrollable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_interface_scrollable.h
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
Pdouble  = ^double;
PEcore_Idle_Enterer  = ^Ecore_Idle_Enterer;
PElm_Pan  = ^Elm_Pan;
PElm_Pan_Smart_Data  = ^Elm_Pan_Smart_Data;
PElm_Scrollable_Smart_Interface_Data  = ^Elm_Scrollable_Smart_Interface_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_INTEFARCE_SCROLLER_H}
{$define ELM_INTEFARCE_SCROLLER_H}
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-scrollable-interface The Elementary Scrollable Interface
 *
 * This is a common interface for widgets having @b scrollable views.
 * Widgets using/implementing this must use the
 * @c EVAS_SMART_SUBCLASS_IFACE_NEW macro (instead of the
 * @c EVAS_SMART_SUBCLASS_NEW one) when declaring its smart class,
 * so an interface is also declared.
 *
 * The scrollable interface comes built with Elementary and is exposed
 * as #ELM_SCROLLABLE_IFACE.
 *
 * The interface API is explained in details at
 * #Elm_Scrollable_Smart_Interface.
 *
 * An Elementary scrollable interface will handle an internal @b
 * panning object. It has the function of clipping and moving the
 * actual scrollable content around, by the command of the scrollable
 * interface calls. Though it's not the common case, one might
 * want/have to change some aspects of the internal panning object
 * behavior.  For that, we have it also exposed here --
 * #Elm_Pan_Smart_Class. Use elm_pan_smart_class_get() to build your
 * custom panning object, when creating a scrollable widget (again,
 * only if you need a custom panning object) and set it with
 * Elm_Scrollable_Smart_Interface::extern_pan_set.
  }
{$include <elm_pan_eo.legacy.h>}
{$include <elm_scroller.h>}
{*
 * Elementary scroller panning base smart data.
  }
type
  PElm_Pan_Smart_Data = ^TElm_Pan_Smart_Data;
  TElm_Pan_Smart_Data = record
      self : PEvas_Object;
      content : PEvas_Object;
      interface_object : PEvas_Object;
      x : TEvas_Coord;
      y : TEvas_Coord;
      w : TEvas_Coord;
      h : TEvas_Coord;
      content_w : TEvas_Coord;
      content_h : TEvas_Coord;
      px : TEvas_Coord;
      py : TEvas_Coord;
    end;

{*
 * Elementary scrollable interface base data.
  }

  TElm_Interface_Scrollable_Cb = procedure (para1:PEvas_Object; data:pointer);cdecl;

  TElm_Interface_Scrollable_Min_Limit_Cb = procedure (obj:PEvas_Object; w:TEina_Bool; h:TEina_Bool);cdecl;

  TElm_Interface_Scrollable_Resize_Cb = procedure (obj:PEvas_Object; w:TEvas_Coord; h:TEvas_Coord);cdecl;
{$include "elm_interface_scrollable.eo.h"}
{*< Last "wanted" geometry  }
{*< an animator which is called whenever a scroller is moving due to a flick action(mouse down, move, up)  }
{*< an animator to express the bouncing animation on x axis.  }
{*< an animator to express the bouncing animation on y axis.  }
{ Efl_Ui_Focus_Manager  }
type
  PElm_Scrollable_Smart_Interface_Data = ^TElm_Scrollable_Smart_Interface_Data;
  TElm_Scrollable_Smart_Interface_Data = record
      x : TEvas_Coord;cdecl;
      y : TEvas_Coord;
      w : TEvas_Coord;
      h : TEvas_Coord;
      wx : TEvas_Coord;
      wy : TEvas_Coord;
      ww : TEvas_Coord;
      wh : TEvas_Coord;
      obj : PEvas_Object;
      content : PEvas_Object;
      pan_obj : PEvas_Object;
      edje_obj : PEvas_Object;
      event_rect : PEvas_Object;
      parent_widget : PEvas_Object;
      hbar_flags : TElm_Scroller_Policy;
      vbar_flags : TElm_Scroller_Policy;
      one_direction_at_a_time : TElm_Scroller_Single_Direction;
      block : TEfl_Ui_Layout_Orientation;
      down : record
          x : TEvas_Coord;
          y : TEvas_Coord;
          sx : TEvas_Coord;
          sy : TEvas_Coord;
          dx : TEvas_Coord;
          dy : TEvas_Coord;
          pdx : TEvas_Coord;
          pdy : TEvas_Coord;
          bx : TEvas_Coord;
          by : TEvas_Coord;
          ax : TEvas_Coord;
          ay : TEvas_Coord;
          bx0 : TEvas_Coord;
          by0 : TEvas_Coord;
          b0x : TEvas_Coord;
          b0y : TEvas_Coord;
          b2x : TEvas_Coord;
          b2y : TEvas_Coord;
          history : array[0..59] of record
              x : TEvas_Coord;
              y : TEvas_Coord;
              timestamp : Tdouble;
            end;
          est_timestamp_diff : Tdouble;
          dragged_began_timestamp : Tdouble;
          anim_start : Tdouble;
          anim_start2 : Tdouble;
          anim_start3 : Tdouble;
          anim_dur : Tdouble;
          onhold_vx : Tdouble;
          onhold_vy : Tdouble;
          onhold_tlast : Tdouble;
          onhold_vxe : Tdouble;
          onhold_vye : Tdouble;
          last_time_x_wheel : Tdouble;
          last_time_y_wheel : Tdouble;
          hold_x : TEvas_Coord;
          hold_y : TEvas_Coord;
          locked_x : TEvas_Coord;
          locked_y : TEvas_Coord;
          hdir : longint;
          vdir : longint;
          hold_enterer : PEcore_Idle_Enterer;
          flag0 : longint;
        end;
      content_info : record
          w : TEvas_Coord;
          h : TEvas_Coord;
          flag0 : word;
        end;
      step : record
          x : TEvas_Coord;
          y : TEvas_Coord;
        end;
      page : record
          x : TEvas_Coord;
          y : TEvas_Coord;
        end;
      current_page : record
          x : TEvas_Coord;
          y : TEvas_Coord;
        end;
      cb_func : record
          drag_start : TElm_Interface_Scrollable_Cb;
          drag_stop : TElm_Interface_Scrollable_Cb;
          animate_start : TElm_Interface_Scrollable_Cb;
          animate_stop : TElm_Interface_Scrollable_Cb;
          scroll : TElm_Interface_Scrollable_Cb;
          scroll_left : TElm_Interface_Scrollable_Cb;
          scroll_right : TElm_Interface_Scrollable_Cb;
          scroll_up : TElm_Interface_Scrollable_Cb;
          scroll_down : TElm_Interface_Scrollable_Cb;
          edge_left : TElm_Interface_Scrollable_Cb;
          edge_right : TElm_Interface_Scrollable_Cb;
          edge_top : TElm_Interface_Scrollable_Cb;
          edge_bottom : TElm_Interface_Scrollable_Cb;
          vbar_drag : TElm_Interface_Scrollable_Cb;
          vbar_press : TElm_Interface_Scrollable_Cb;
          vbar_unpress : TElm_Interface_Scrollable_Cb;
          hbar_drag : TElm_Interface_Scrollable_Cb;
          hbar_press : TElm_Interface_Scrollable_Cb;
          hbar_unpress : TElm_Interface_Scrollable_Cb;
          page_change : TElm_Interface_Scrollable_Cb;
          content_min_limit : TElm_Interface_Scrollable_Min_Limit_Cb;
          content_viewport_resize : TElm_Interface_Scrollable_Resize_Cb;
        end;
      scrollto : record
          x : record
              start : TEvas_Coord;
              end : TEvas_Coord;
              t_start : Tdouble;
              t_end : Tdouble;
              animator : TEina_Bool;
            end;
          y : record
              start : TEvas_Coord;
              end : TEvas_Coord;
              t_start : Tdouble;
              t_end : Tdouble;
              animator : TEina_Bool;
            end;
        end;
      pagerel_h : Tdouble;
      pagerel_v : Tdouble;
      pagesize_h : TEvas_Coord;
      pagesize_v : TEvas_Coord;
      page_limit_h : longint;
      page_limit_v : longint;
      current_calc : longint;
      last_wheel_mul : Tdouble;
      last_wheel : dword;
      size_adjust_recurse : byte;
      size_count : byte;
      event_info : pointer;
      gravity_x : Tdouble;
      gravity_y : Tdouble;
      prev_cw : TEvas_Coord;
      prev_ch : TEvas_Coord;
      flag0 : longint;
      manager : pointer;
    end;


const
  bm_TElm_Scrollable_Smart_Interface_Data_hold_animator = $1;
  bp_TElm_Scrollable_Smart_Interface_Data_hold_animator = 0;
  bm_TElm_Scrollable_Smart_Interface_Data_onhold_animator = $2;
  bp_TElm_Scrollable_Smart_Interface_Data_onhold_animator = 1;
  bm_TElm_Scrollable_Smart_Interface_Data_momentum_animator = $4;
  bp_TElm_Scrollable_Smart_Interface_Data_momentum_animator = 2;
  bm_TElm_Scrollable_Smart_Interface_Data_bounce_x_animator = $8;
  bp_TElm_Scrollable_Smart_Interface_Data_bounce_x_animator = 3;
  bm_TElm_Scrollable_Smart_Interface_Data_bounce_y_animator = $10;
  bp_TElm_Scrollable_Smart_Interface_Data_bounce_y_animator = 4;
  bm_TElm_Scrollable_Smart_Interface_Data_last_hold_x_wheel = $20;
  bp_TElm_Scrollable_Smart_Interface_Data_last_hold_x_wheel = 5;
  bm_TElm_Scrollable_Smart_Interface_Data_last_hold_y_wheel = $40;
  bp_TElm_Scrollable_Smart_Interface_Data_last_hold_y_wheel = 6;
  bm_TElm_Scrollable_Smart_Interface_Data_bounce_x_hold = $80;
  bp_TElm_Scrollable_Smart_Interface_Data_bounce_x_hold = 7;
  bm_TElm_Scrollable_Smart_Interface_Data_bounce_y_hold = $100;
  bp_TElm_Scrollable_Smart_Interface_Data_bounce_y_hold = 8;
  bm_TElm_Scrollable_Smart_Interface_Data_dragged_began = $200;
  bp_TElm_Scrollable_Smart_Interface_Data_dragged_began = 9;
  bm_TElm_Scrollable_Smart_Interface_Data_want_dragged = $400;
  bp_TElm_Scrollable_Smart_Interface_Data_want_dragged = 10;
  bm_TElm_Scrollable_Smart_Interface_Data_hold_parent = $800;
  bp_TElm_Scrollable_Smart_Interface_Data_hold_parent = 11;
  bm_TElm_Scrollable_Smart_Interface_Data_want_reset = $1000;
  bp_TElm_Scrollable_Smart_Interface_Data_want_reset = 12;
  bm_TElm_Scrollable_Smart_Interface_Data_cancelled = $2000;
  bp_TElm_Scrollable_Smart_Interface_Data_cancelled = 13;
  bm_TElm_Scrollable_Smart_Interface_Data_dragged = $4000;
  bp_TElm_Scrollable_Smart_Interface_Data_dragged = 14;
  bm_TElm_Scrollable_Smart_Interface_Data_locked = $8000;
  bp_TElm_Scrollable_Smart_Interface_Data_locked = 15;
  bm_TElm_Scrollable_Smart_Interface_Data_scroll = $10000;
  bp_TElm_Scrollable_Smart_Interface_Data_scroll = 16;
  bm_TElm_Scrollable_Smart_Interface_Data_dir_x = $20000;
  bp_TElm_Scrollable_Smart_Interface_Data_dir_x = 17;
  bm_TElm_Scrollable_Smart_Interface_Data_dir_y = $40000;
  bp_TElm_Scrollable_Smart_Interface_Data_dir_y = 18;
  bm_TElm_Scrollable_Smart_Interface_Data_hold = $80000;
  bp_TElm_Scrollable_Smart_Interface_Data_hold = 19;
  bm_TElm_Scrollable_Smart_Interface_Data_now = $100000;
  bp_TElm_Scrollable_Smart_Interface_Data_now = 20;
  bm_TElm_Scrollable_Smart_Interface_Data_resized = $1;
  bp_TElm_Scrollable_Smart_Interface_Data_resized = 0;
  bm_TElm_Scrollable_Smart_Interface_Data_size_adjust_recurse_abort = $1;
  bp_TElm_Scrollable_Smart_Interface_Data_size_adjust_recurse_abort = 0;
  bm_TElm_Scrollable_Smart_Interface_Data_momentum_animator_disabled = $2;
  bp_TElm_Scrollable_Smart_Interface_Data_momentum_animator_disabled = 1;
  bm_TElm_Scrollable_Smart_Interface_Data_bounce_animator_disabled = $4;
  bp_TElm_Scrollable_Smart_Interface_Data_bounce_animator_disabled = 2;
  bm_TElm_Scrollable_Smart_Interface_Data_page_snap_horiz = $8;
  bp_TElm_Scrollable_Smart_Interface_Data_page_snap_horiz = 3;
  bm_TElm_Scrollable_Smart_Interface_Data_page_snap_vert = $10;
  bp_TElm_Scrollable_Smart_Interface_Data_page_snap_vert = 4;
  bm_TElm_Scrollable_Smart_Interface_Data_wheel_disabled = $20;
  bp_TElm_Scrollable_Smart_Interface_Data_wheel_disabled = 5;
  bm_TElm_Scrollable_Smart_Interface_Data_hbar_visible = $40;
  bp_TElm_Scrollable_Smart_Interface_Data_hbar_visible = 6;
  bm_TElm_Scrollable_Smart_Interface_Data_vbar_visible = $80;
  bp_TElm_Scrollable_Smart_Interface_Data_vbar_visible = 7;
  bm_TElm_Scrollable_Smart_Interface_Data_bounce_horiz = $100;
  bp_TElm_Scrollable_Smart_Interface_Data_bounce_horiz = 8;
  bm_TElm_Scrollable_Smart_Interface_Data_bounce_vert = $200;
  bp_TElm_Scrollable_Smart_Interface_Data_bounce_vert = 9;
  bm_TElm_Scrollable_Smart_Interface_Data_is_mirrored = $400;
  bp_TElm_Scrollable_Smart_Interface_Data_is_mirrored = 10;
  bm_TElm_Scrollable_Smart_Interface_Data_extern_pan = $800;
  bp_TElm_Scrollable_Smart_Interface_Data_extern_pan = 11;
  bm_TElm_Scrollable_Smart_Interface_Data_bouncemey = $1000;
  bp_TElm_Scrollable_Smart_Interface_Data_bouncemey = 12;
  bm_TElm_Scrollable_Smart_Interface_Data_bouncemex = $2000;
  bp_TElm_Scrollable_Smart_Interface_Data_bouncemex = 13;
  bm_TElm_Scrollable_Smart_Interface_Data_freeze = $4000;
  bp_TElm_Scrollable_Smart_Interface_Data_freeze = 14;
  bm_TElm_Scrollable_Smart_Interface_Data_freeze_want = $8000;
  bp_TElm_Scrollable_Smart_Interface_Data_freeze_want = 15;
  bm_TElm_Scrollable_Smart_Interface_Data_hold = $10000;
  bp_TElm_Scrollable_Smart_Interface_Data_hold = 16;
  bm_TElm_Scrollable_Smart_Interface_Data_min_w = $20000;
  bp_TElm_Scrollable_Smart_Interface_Data_min_w = 17;
  bm_TElm_Scrollable_Smart_Interface_Data_min_h = $40000;
  bp_TElm_Scrollable_Smart_Interface_Data_min_h = 18;
  bm_TElm_Scrollable_Smart_Interface_Data_go_left = $80000;
  bp_TElm_Scrollable_Smart_Interface_Data_go_left = 19;
  bm_TElm_Scrollable_Smart_Interface_Data_go_right = $100000;
  bp_TElm_Scrollable_Smart_Interface_Data_go_right = 20;
  bm_TElm_Scrollable_Smart_Interface_Data_go_up = $200000;
  bp_TElm_Scrollable_Smart_Interface_Data_go_up = 21;
  bm_TElm_Scrollable_Smart_Interface_Data_go_down = $400000;
  bp_TElm_Scrollable_Smart_Interface_Data_go_down = 22;
  bm_TElm_Scrollable_Smart_Interface_Data_loop_h = $800000;
  bp_TElm_Scrollable_Smart_Interface_Data_loop_h = 23;
  bm_TElm_Scrollable_Smart_Interface_Data_loop_v = $1000000;
  bp_TElm_Scrollable_Smart_Interface_Data_loop_v = 24;

function size_adjust_recurse_abort(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_size_adjust_recurse_abort(var a : TElm_Scrollable_Smart_Interface_Data; __size_adjust_recurse_abort : TEina_Bool);
function momentum_animator_disabled(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_momentum_animator_disabled(var a : TElm_Scrollable_Smart_Interface_Data; __momentum_animator_disabled : TEina_Bool);
function bounce_animator_disabled(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_bounce_animator_disabled(var a : TElm_Scrollable_Smart_Interface_Data; __bounce_animator_disabled : TEina_Bool);
function page_snap_horiz(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_page_snap_horiz(var a : TElm_Scrollable_Smart_Interface_Data; __page_snap_horiz : TEina_Bool);
function page_snap_vert(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_page_snap_vert(var a : TElm_Scrollable_Smart_Interface_Data; __page_snap_vert : TEina_Bool);
function wheel_disabled(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_wheel_disabled(var a : TElm_Scrollable_Smart_Interface_Data; __wheel_disabled : TEina_Bool);
function hbar_visible(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_hbar_visible(var a : TElm_Scrollable_Smart_Interface_Data; __hbar_visible : TEina_Bool);
function vbar_visible(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_vbar_visible(var a : TElm_Scrollable_Smart_Interface_Data; __vbar_visible : TEina_Bool);
function bounce_horiz(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_bounce_horiz(var a : TElm_Scrollable_Smart_Interface_Data; __bounce_horiz : TEina_Bool);
function bounce_vert(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_bounce_vert(var a : TElm_Scrollable_Smart_Interface_Data; __bounce_vert : TEina_Bool);
function is_mirrored(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_is_mirrored(var a : TElm_Scrollable_Smart_Interface_Data; __is_mirrored : TEina_Bool);
function extern_pan(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_extern_pan(var a : TElm_Scrollable_Smart_Interface_Data; __extern_pan : TEina_Bool);
function bouncemey(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_bouncemey(var a : TElm_Scrollable_Smart_Interface_Data; __bouncemey : TEina_Bool);
function bouncemex(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_bouncemex(var a : TElm_Scrollable_Smart_Interface_Data; __bouncemex : TEina_Bool);
function freeze(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_freeze(var a : TElm_Scrollable_Smart_Interface_Data; __freeze : TEina_Bool);
function freeze_want(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_freeze_want(var a : TElm_Scrollable_Smart_Interface_Data; __freeze_want : TEina_Bool);
function hold(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_hold(var a : TElm_Scrollable_Smart_Interface_Data; __hold : TEina_Bool);
function min_w(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_min_w(var a : TElm_Scrollable_Smart_Interface_Data; __min_w : TEina_Bool);
function min_h(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_min_h(var a : TElm_Scrollable_Smart_Interface_Data; __min_h : TEina_Bool);
function go_left(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_go_left(var a : TElm_Scrollable_Smart_Interface_Data; __go_left : TEina_Bool);
function go_right(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_go_right(var a : TElm_Scrollable_Smart_Interface_Data; __go_right : TEina_Bool);
function go_up(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_go_up(var a : TElm_Scrollable_Smart_Interface_Data; __go_up : TEina_Bool);
function go_down(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_go_down(var a : TElm_Scrollable_Smart_Interface_Data; __go_down : TEina_Bool);
function loop_h(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_loop_h(var a : TElm_Scrollable_Smart_Interface_Data; __loop_h : TEina_Bool);
function loop_v(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
procedure set_loop_v(var a : TElm_Scrollable_Smart_Interface_Data; __loop_v : TEina_Bool);
{$ifdef EFL_BETA_API_SUPPORT}
{xxxxxxxxxx    EINA_DEPRECATED }
procedure elm_pan_gravity_set(para1:PElm_Pan; x:Tdouble; para3:Tdouble);cdecl;external;
(* Const before type ignored *)
{xxxxxxxxxx    EINA_DEPRECATED }procedure elm_pan_gravity_get(para1:PElm_Pan; para2:Pdouble; para3:Pdouble);cdecl;external;
{$endif}
{*
 * @
  }
{$endif}

implementation

function size_adjust_recurse_abort(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  size_adjust_recurse_abort:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_size_adjust_recurse_abort) shr bp_TElm_Scrollable_Smart_Interface_Data_size_adjust_recurse_abort;
end;

procedure set_size_adjust_recurse_abort(var a : TElm_Scrollable_Smart_Interface_Data; __size_adjust_recurse_abort : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__size_adjust_recurse_abort shl bp_TElm_Scrollable_Smart_Interface_Data_size_adjust_recurse_abort) and bm_TElm_Scrollable_Smart_Interface_Data_size_adjust_recurse_abort);
end;

function momentum_animator_disabled(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  momentum_animator_disabled:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_momentum_animator_disabled) shr bp_TElm_Scrollable_Smart_Interface_Data_momentum_animator_disabled;
end;

procedure set_momentum_animator_disabled(var a : TElm_Scrollable_Smart_Interface_Data; __momentum_animator_disabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__momentum_animator_disabled shl bp_TElm_Scrollable_Smart_Interface_Data_momentum_animator_disabled) and bm_TElm_Scrollable_Smart_Interface_Data_momentum_animator_disabled);
end;

function bounce_animator_disabled(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  bounce_animator_disabled:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_bounce_animator_disabled) shr bp_TElm_Scrollable_Smart_Interface_Data_bounce_animator_disabled;
end;

procedure set_bounce_animator_disabled(var a : TElm_Scrollable_Smart_Interface_Data; __bounce_animator_disabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__bounce_animator_disabled shl bp_TElm_Scrollable_Smart_Interface_Data_bounce_animator_disabled) and bm_TElm_Scrollable_Smart_Interface_Data_bounce_animator_disabled);
end;

function page_snap_horiz(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  page_snap_horiz:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_page_snap_horiz) shr bp_TElm_Scrollable_Smart_Interface_Data_page_snap_horiz;
end;

procedure set_page_snap_horiz(var a : TElm_Scrollable_Smart_Interface_Data; __page_snap_horiz : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__page_snap_horiz shl bp_TElm_Scrollable_Smart_Interface_Data_page_snap_horiz) and bm_TElm_Scrollable_Smart_Interface_Data_page_snap_horiz);
end;

function page_snap_vert(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  page_snap_vert:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_page_snap_vert) shr bp_TElm_Scrollable_Smart_Interface_Data_page_snap_vert;
end;

procedure set_page_snap_vert(var a : TElm_Scrollable_Smart_Interface_Data; __page_snap_vert : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__page_snap_vert shl bp_TElm_Scrollable_Smart_Interface_Data_page_snap_vert) and bm_TElm_Scrollable_Smart_Interface_Data_page_snap_vert);
end;

function wheel_disabled(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  wheel_disabled:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_wheel_disabled) shr bp_TElm_Scrollable_Smart_Interface_Data_wheel_disabled;
end;

procedure set_wheel_disabled(var a : TElm_Scrollable_Smart_Interface_Data; __wheel_disabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__wheel_disabled shl bp_TElm_Scrollable_Smart_Interface_Data_wheel_disabled) and bm_TElm_Scrollable_Smart_Interface_Data_wheel_disabled);
end;

function hbar_visible(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  hbar_visible:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_hbar_visible) shr bp_TElm_Scrollable_Smart_Interface_Data_hbar_visible;
end;

procedure set_hbar_visible(var a : TElm_Scrollable_Smart_Interface_Data; __hbar_visible : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__hbar_visible shl bp_TElm_Scrollable_Smart_Interface_Data_hbar_visible) and bm_TElm_Scrollable_Smart_Interface_Data_hbar_visible);
end;

function vbar_visible(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  vbar_visible:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_vbar_visible) shr bp_TElm_Scrollable_Smart_Interface_Data_vbar_visible;
end;

procedure set_vbar_visible(var a : TElm_Scrollable_Smart_Interface_Data; __vbar_visible : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__vbar_visible shl bp_TElm_Scrollable_Smart_Interface_Data_vbar_visible) and bm_TElm_Scrollable_Smart_Interface_Data_vbar_visible);
end;

function bounce_horiz(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  bounce_horiz:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_bounce_horiz) shr bp_TElm_Scrollable_Smart_Interface_Data_bounce_horiz;
end;

procedure set_bounce_horiz(var a : TElm_Scrollable_Smart_Interface_Data; __bounce_horiz : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__bounce_horiz shl bp_TElm_Scrollable_Smart_Interface_Data_bounce_horiz) and bm_TElm_Scrollable_Smart_Interface_Data_bounce_horiz);
end;

function bounce_vert(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  bounce_vert:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_bounce_vert) shr bp_TElm_Scrollable_Smart_Interface_Data_bounce_vert;
end;

procedure set_bounce_vert(var a : TElm_Scrollable_Smart_Interface_Data; __bounce_vert : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__bounce_vert shl bp_TElm_Scrollable_Smart_Interface_Data_bounce_vert) and bm_TElm_Scrollable_Smart_Interface_Data_bounce_vert);
end;

function is_mirrored(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  is_mirrored:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_is_mirrored) shr bp_TElm_Scrollable_Smart_Interface_Data_is_mirrored;
end;

procedure set_is_mirrored(var a : TElm_Scrollable_Smart_Interface_Data; __is_mirrored : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__is_mirrored shl bp_TElm_Scrollable_Smart_Interface_Data_is_mirrored) and bm_TElm_Scrollable_Smart_Interface_Data_is_mirrored);
end;

function extern_pan(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  extern_pan:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_extern_pan) shr bp_TElm_Scrollable_Smart_Interface_Data_extern_pan;
end;

procedure set_extern_pan(var a : TElm_Scrollable_Smart_Interface_Data; __extern_pan : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__extern_pan shl bp_TElm_Scrollable_Smart_Interface_Data_extern_pan) and bm_TElm_Scrollable_Smart_Interface_Data_extern_pan);
end;

function bouncemey(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  bouncemey:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_bouncemey) shr bp_TElm_Scrollable_Smart_Interface_Data_bouncemey;
end;

procedure set_bouncemey(var a : TElm_Scrollable_Smart_Interface_Data; __bouncemey : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__bouncemey shl bp_TElm_Scrollable_Smart_Interface_Data_bouncemey) and bm_TElm_Scrollable_Smart_Interface_Data_bouncemey);
end;

function bouncemex(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  bouncemex:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_bouncemex) shr bp_TElm_Scrollable_Smart_Interface_Data_bouncemex;
end;

procedure set_bouncemex(var a : TElm_Scrollable_Smart_Interface_Data; __bouncemex : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__bouncemex shl bp_TElm_Scrollable_Smart_Interface_Data_bouncemex) and bm_TElm_Scrollable_Smart_Interface_Data_bouncemex);
end;

function freeze(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  freeze:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_freeze) shr bp_TElm_Scrollable_Smart_Interface_Data_freeze;
end;

procedure set_freeze(var a : TElm_Scrollable_Smart_Interface_Data; __freeze : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__freeze shl bp_TElm_Scrollable_Smart_Interface_Data_freeze) and bm_TElm_Scrollable_Smart_Interface_Data_freeze);
end;

function freeze_want(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  freeze_want:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_freeze_want) shr bp_TElm_Scrollable_Smart_Interface_Data_freeze_want;
end;

procedure set_freeze_want(var a : TElm_Scrollable_Smart_Interface_Data; __freeze_want : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__freeze_want shl bp_TElm_Scrollable_Smart_Interface_Data_freeze_want) and bm_TElm_Scrollable_Smart_Interface_Data_freeze_want);
end;

function hold(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  hold:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_hold) shr bp_TElm_Scrollable_Smart_Interface_Data_hold;
end;

procedure set_hold(var a : TElm_Scrollable_Smart_Interface_Data; __hold : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__hold shl bp_TElm_Scrollable_Smart_Interface_Data_hold) and bm_TElm_Scrollable_Smart_Interface_Data_hold);
end;

function min_w(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  min_w:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_min_w) shr bp_TElm_Scrollable_Smart_Interface_Data_min_w;
end;

procedure set_min_w(var a : TElm_Scrollable_Smart_Interface_Data; __min_w : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__min_w shl bp_TElm_Scrollable_Smart_Interface_Data_min_w) and bm_TElm_Scrollable_Smart_Interface_Data_min_w);
end;

function min_h(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  min_h:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_min_h) shr bp_TElm_Scrollable_Smart_Interface_Data_min_h;
end;

procedure set_min_h(var a : TElm_Scrollable_Smart_Interface_Data; __min_h : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__min_h shl bp_TElm_Scrollable_Smart_Interface_Data_min_h) and bm_TElm_Scrollable_Smart_Interface_Data_min_h);
end;

function go_left(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  go_left:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_go_left) shr bp_TElm_Scrollable_Smart_Interface_Data_go_left;
end;

procedure set_go_left(var a : TElm_Scrollable_Smart_Interface_Data; __go_left : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__go_left shl bp_TElm_Scrollable_Smart_Interface_Data_go_left) and bm_TElm_Scrollable_Smart_Interface_Data_go_left);
end;

function go_right(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  go_right:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_go_right) shr bp_TElm_Scrollable_Smart_Interface_Data_go_right;
end;

procedure set_go_right(var a : TElm_Scrollable_Smart_Interface_Data; __go_right : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__go_right shl bp_TElm_Scrollable_Smart_Interface_Data_go_right) and bm_TElm_Scrollable_Smart_Interface_Data_go_right);
end;

function go_up(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  go_up:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_go_up) shr bp_TElm_Scrollable_Smart_Interface_Data_go_up;
end;

procedure set_go_up(var a : TElm_Scrollable_Smart_Interface_Data; __go_up : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__go_up shl bp_TElm_Scrollable_Smart_Interface_Data_go_up) and bm_TElm_Scrollable_Smart_Interface_Data_go_up);
end;

function go_down(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  go_down:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_go_down) shr bp_TElm_Scrollable_Smart_Interface_Data_go_down;
end;

procedure set_go_down(var a : TElm_Scrollable_Smart_Interface_Data; __go_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__go_down shl bp_TElm_Scrollable_Smart_Interface_Data_go_down) and bm_TElm_Scrollable_Smart_Interface_Data_go_down);
end;

function loop_h(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  loop_h:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_loop_h) shr bp_TElm_Scrollable_Smart_Interface_Data_loop_h;
end;

procedure set_loop_h(var a : TElm_Scrollable_Smart_Interface_Data; __loop_h : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__loop_h shl bp_TElm_Scrollable_Smart_Interface_Data_loop_h) and bm_TElm_Scrollable_Smart_Interface_Data_loop_h);
end;

function loop_v(var a : TElm_Scrollable_Smart_Interface_Data) : TEina_Bool;
begin
  loop_v:=(a.flag0 and bm_TElm_Scrollable_Smart_Interface_Data_loop_v) shr bp_TElm_Scrollable_Smart_Interface_Data_loop_v;
end;

procedure set_loop_v(var a : TElm_Scrollable_Smart_Interface_Data; __loop_v : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__loop_v shl bp_TElm_Scrollable_Smart_Interface_Data_loop_v) and bm_TElm_Scrollable_Smart_Interface_Data_loop_v);
end;


end.
