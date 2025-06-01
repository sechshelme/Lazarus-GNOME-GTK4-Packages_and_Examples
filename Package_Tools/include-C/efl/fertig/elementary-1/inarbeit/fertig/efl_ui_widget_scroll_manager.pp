
unit efl_ui_widget_scroll_manager;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_widget_scroll_manager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_widget_scroll_manager.h
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
PEcore_Idle_Enterer  = ^Ecore_Idle_Enterer;
PEcore_Timer  = ^Ecore_Timer;
PEfl_Ui_Scroll_Manager_Data  = ^Efl_Ui_Scroll_Manager_Data;
PEvas_Object  = ^Evas_Object;
PInterpType  = ^InterpType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_WIDGET_SCROLL_MANAGER_H}
{$define EFL_UI_WIDGET_SCROLL_MANAGER_H}
{$include "Elementary.h"}
type

  TInterpolator = function (data:pointer; progress:Tdouble):Tdouble;cdecl;

  PInterpType = ^TInterpType;
  TInterpType =  Longint;
  Const
    INTERP_LINEAR = 0;
    INTERP_ACCEL = 1;
    INTERP_DECEL = 2;
;
{*< Last "wanted" geometry  }
type
  PEfl_Ui_Scroll_Manager_Data = ^TEfl_Ui_Scroll_Manager_Data;
  TEfl_Ui_Scroll_Manager_Data = record
      x : TEvas_Coord;
      y : TEvas_Coord;
      w : TEvas_Coord;
      h : TEvas_Coord;
      wx : TEvas_Coord;
      wy : TEvas_Coord;
      ww : TEvas_Coord;
      wh : TEvas_Coord;
      obj : PEvas_Object;
      pan_obj : PEvas_Object;
      event_rect : PEvas_Object;
      parent : PEvas_Object;
      hbar_mode : TEfl_Ui_Scrollbar_Mode;
      vbar_mode : TEfl_Ui_Scrollbar_Mode;
      hbar_timer : PEcore_Timer;
      vbar_timer : PEcore_Timer;
      block : TEfl_Ui_Layout_Orientation;
      down : record
          x : TEvas_Coord;
          y : TEvas_Coord;
          sx : TEvas_Coord;
          sy : TEvas_Coord;
          history : array[0..59] of record
              x : TEvas_Coord;
              y : TEvas_Coord;
              timestamp : Tdouble;
            end;
          est_timestamp_diff : Tdouble;
          onhold_vx : Tdouble;
          onhold_vy : Tdouble;
          onhold_vxe : Tdouble;
          onhold_vye : Tdouble;
          onhold_tlast : Tdouble;
          last_time_x_wheel : Tdouble;
          last_time_y_wheel : Tdouble;
          hdir : longint;
          vdir : longint;
          hold_x : TEvas_Coord;
          hold_y : TEvas_Coord;
          hold_enterer : PEcore_Idle_Enterer;
          dragged_began_timestamp : Tdouble;
          flag0 : word;
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
      scrollto : record
          x : record
              start : TEvas_Coord;
              end : TEvas_Coord;
              animator : TEina_Bool;
              interp : TInterpolator;
              start_t : Tdouble;
              dur : Tdouble;
            end;
          y : record
              start : TEvas_Coord;
              end : TEvas_Coord;
              animator : TEina_Bool;
              interp : TInterpolator;
              start_t : Tdouble;
              dur : Tdouble;
            end;
        end;
      bounce : record
          x : record
              p0 : TEvas_Coord;
              p1 : TEvas_Coord;
              p2 : TEvas_Coord;
              vel : Tdouble;
              animator : TEina_Bool;
              start_t : Tdouble;
              t01 : Tdouble;
              t12 : Tdouble;
            end;
          y : record
              p0 : TEvas_Coord;
              p1 : TEvas_Coord;
              p2 : TEvas_Coord;
              vel : Tdouble;
              animator : TEina_Bool;
              start_t : Tdouble;
              t01 : Tdouble;
              t12 : Tdouble;
            end;
        end;
      last_wheel_mul : Tdouble;
      last_wheel : dword;
      event_info : pointer;
      gravity_x : Tdouble;
      gravity_y : Tdouble;
      prev_cw : TEvas_Coord;
      prev_ch : TEvas_Coord;
      flag0 : word;
    end;

const
  bm__Efl_Ui_Scroll_Manager_Data_dragged = $1;
  bp__Efl_Ui_Scroll_Manager_Data_dragged = 0;
  bm__Efl_Ui_Scroll_Manager_Data_dragged_began = $2;
  bp__Efl_Ui_Scroll_Manager_Data_dragged_began = 1;
  bm__Efl_Ui_Scroll_Manager_Data_hold_animator = $4;
  bp__Efl_Ui_Scroll_Manager_Data_hold_animator = 2;
  bm__Efl_Ui_Scroll_Manager_Data_onhold_animator = $8;
  bp__Efl_Ui_Scroll_Manager_Data_onhold_animator = 3;
  bm__Efl_Ui_Scroll_Manager_Data_last_hold_x_wheel = $10;
  bp__Efl_Ui_Scroll_Manager_Data_last_hold_x_wheel = 4;
  bm__Efl_Ui_Scroll_Manager_Data_last_hold_y_wheel = $20;
  bp__Efl_Ui_Scroll_Manager_Data_last_hold_y_wheel = 5;
  bm__Efl_Ui_Scroll_Manager_Data_dir_x = $40;
  bp__Efl_Ui_Scroll_Manager_Data_dir_x = 6;
  bm__Efl_Ui_Scroll_Manager_Data_dir_y = $80;
  bp__Efl_Ui_Scroll_Manager_Data_dir_y = 7;
  bm__Efl_Ui_Scroll_Manager_Data_scroll = $100;
  bp__Efl_Ui_Scroll_Manager_Data_scroll = 8;
  bm__Efl_Ui_Scroll_Manager_Data_hold = $200;
  bp__Efl_Ui_Scroll_Manager_Data_hold = 9;
  bm__Efl_Ui_Scroll_Manager_Data_now = $400;
  bp__Efl_Ui_Scroll_Manager_Data_now = 10;
  bm__Efl_Ui_Scroll_Manager_Data_want_reset = $800;
  bp__Efl_Ui_Scroll_Manager_Data_want_reset = 11;
  bm__Efl_Ui_Scroll_Manager_Data_resized = $1;
  bp__Efl_Ui_Scroll_Manager_Data_resized = 0;
  bm__Efl_Ui_Scroll_Manager_Data_hbar_visible = $1;
  bp__Efl_Ui_Scroll_Manager_Data_hbar_visible = 0;
  bm__Efl_Ui_Scroll_Manager_Data_vbar_visible = $2;
  bp__Efl_Ui_Scroll_Manager_Data_vbar_visible = 1;
  bm__Efl_Ui_Scroll_Manager_Data_bounce_horiz = $4;
  bp__Efl_Ui_Scroll_Manager_Data_bounce_horiz = 2;
  bm__Efl_Ui_Scroll_Manager_Data_bounce_vert = $8;
  bp__Efl_Ui_Scroll_Manager_Data_bounce_vert = 3;
  bm__Efl_Ui_Scroll_Manager_Data_is_mirrored = $10;
  bp__Efl_Ui_Scroll_Manager_Data_is_mirrored = 4;
  bm__Efl_Ui_Scroll_Manager_Data_bouncemey = $20;
  bp__Efl_Ui_Scroll_Manager_Data_bouncemey = 5;
  bm__Efl_Ui_Scroll_Manager_Data_bouncemex = $40;
  bp__Efl_Ui_Scroll_Manager_Data_bouncemex = 6;
  bm__Efl_Ui_Scroll_Manager_Data_freeze = $80;
  bp__Efl_Ui_Scroll_Manager_Data_freeze = 7;
  bm__Efl_Ui_Scroll_Manager_Data_freeze_want = $100;
  bp__Efl_Ui_Scroll_Manager_Data_freeze_want = 8;
  bm__Efl_Ui_Scroll_Manager_Data_hold = $200;
  bp__Efl_Ui_Scroll_Manager_Data_hold = 9;
  bm__Efl_Ui_Scroll_Manager_Data_match_content_w = $400;
  bp__Efl_Ui_Scroll_Manager_Data_match_content_w = 10;
  bm__Efl_Ui_Scroll_Manager_Data_match_content_h = $800;
  bp__Efl_Ui_Scroll_Manager_Data_match_content_h = 11;
  bm__Efl_Ui_Scroll_Manager_Data_loop_h = $1000;
  bp__Efl_Ui_Scroll_Manager_Data_loop_h = 12;
  bm__Efl_Ui_Scroll_Manager_Data_loop_v = $2000;
  bp__Efl_Ui_Scroll_Manager_Data_loop_v = 13;
  bm__Efl_Ui_Scroll_Manager_Data_scrolling = $4000;
  bp__Efl_Ui_Scroll_Manager_Data_scrolling = 14;

function hbar_visible(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_hbar_visible(var a : _Efl_Ui_Scroll_Manager_Data; __hbar_visible : TEina_Bool);
function vbar_visible(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_vbar_visible(var a : _Efl_Ui_Scroll_Manager_Data; __vbar_visible : TEina_Bool);
function bounce_horiz(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_bounce_horiz(var a : _Efl_Ui_Scroll_Manager_Data; __bounce_horiz : TEina_Bool);
function bounce_vert(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_bounce_vert(var a : _Efl_Ui_Scroll_Manager_Data; __bounce_vert : TEina_Bool);
function is_mirrored(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_is_mirrored(var a : _Efl_Ui_Scroll_Manager_Data; __is_mirrored : TEina_Bool);
function bouncemey(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_bouncemey(var a : _Efl_Ui_Scroll_Manager_Data; __bouncemey : TEina_Bool);
function bouncemex(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_bouncemex(var a : _Efl_Ui_Scroll_Manager_Data; __bouncemex : TEina_Bool);
function freeze(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_freeze(var a : _Efl_Ui_Scroll_Manager_Data; __freeze : TEina_Bool);
function freeze_want(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_freeze_want(var a : _Efl_Ui_Scroll_Manager_Data; __freeze_want : TEina_Bool);
function hold(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_hold(var a : _Efl_Ui_Scroll_Manager_Data; __hold : TEina_Bool);
function match_content_w(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_match_content_w(var a : _Efl_Ui_Scroll_Manager_Data; __match_content_w : TEina_Bool);
function match_content_h(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_match_content_h(var a : _Efl_Ui_Scroll_Manager_Data; __match_content_h : TEina_Bool);
function loop_h(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_loop_h(var a : _Efl_Ui_Scroll_Manager_Data; __loop_h : TEina_Bool);
function loop_v(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_loop_v(var a : _Efl_Ui_Scroll_Manager_Data; __loop_v : TEina_Bool);
function scrolling(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
procedure set_scrolling(var a : _Efl_Ui_Scroll_Manager_Data; __scrolling : TEina_Bool);
{$endif}

implementation

function hbar_visible(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  hbar_visible:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_hbar_visible) shr bp__Efl_Ui_Scroll_Manager_Data_hbar_visible;
end;

procedure set_hbar_visible(var a : _Efl_Ui_Scroll_Manager_Data; __hbar_visible : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__hbar_visible shl bp__Efl_Ui_Scroll_Manager_Data_hbar_visible) and bm__Efl_Ui_Scroll_Manager_Data_hbar_visible);
end;

function vbar_visible(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  vbar_visible:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_vbar_visible) shr bp__Efl_Ui_Scroll_Manager_Data_vbar_visible;
end;

procedure set_vbar_visible(var a : _Efl_Ui_Scroll_Manager_Data; __vbar_visible : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__vbar_visible shl bp__Efl_Ui_Scroll_Manager_Data_vbar_visible) and bm__Efl_Ui_Scroll_Manager_Data_vbar_visible);
end;

function bounce_horiz(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  bounce_horiz:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_bounce_horiz) shr bp__Efl_Ui_Scroll_Manager_Data_bounce_horiz;
end;

procedure set_bounce_horiz(var a : _Efl_Ui_Scroll_Manager_Data; __bounce_horiz : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__bounce_horiz shl bp__Efl_Ui_Scroll_Manager_Data_bounce_horiz) and bm__Efl_Ui_Scroll_Manager_Data_bounce_horiz);
end;

function bounce_vert(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  bounce_vert:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_bounce_vert) shr bp__Efl_Ui_Scroll_Manager_Data_bounce_vert;
end;

procedure set_bounce_vert(var a : _Efl_Ui_Scroll_Manager_Data; __bounce_vert : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__bounce_vert shl bp__Efl_Ui_Scroll_Manager_Data_bounce_vert) and bm__Efl_Ui_Scroll_Manager_Data_bounce_vert);
end;

function is_mirrored(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  is_mirrored:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_is_mirrored) shr bp__Efl_Ui_Scroll_Manager_Data_is_mirrored;
end;

procedure set_is_mirrored(var a : _Efl_Ui_Scroll_Manager_Data; __is_mirrored : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__is_mirrored shl bp__Efl_Ui_Scroll_Manager_Data_is_mirrored) and bm__Efl_Ui_Scroll_Manager_Data_is_mirrored);
end;

function bouncemey(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  bouncemey:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_bouncemey) shr bp__Efl_Ui_Scroll_Manager_Data_bouncemey;
end;

procedure set_bouncemey(var a : _Efl_Ui_Scroll_Manager_Data; __bouncemey : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__bouncemey shl bp__Efl_Ui_Scroll_Manager_Data_bouncemey) and bm__Efl_Ui_Scroll_Manager_Data_bouncemey);
end;

function bouncemex(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  bouncemex:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_bouncemex) shr bp__Efl_Ui_Scroll_Manager_Data_bouncemex;
end;

procedure set_bouncemex(var a : _Efl_Ui_Scroll_Manager_Data; __bouncemex : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__bouncemex shl bp__Efl_Ui_Scroll_Manager_Data_bouncemex) and bm__Efl_Ui_Scroll_Manager_Data_bouncemex);
end;

function freeze(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  freeze:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_freeze) shr bp__Efl_Ui_Scroll_Manager_Data_freeze;
end;

procedure set_freeze(var a : _Efl_Ui_Scroll_Manager_Data; __freeze : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__freeze shl bp__Efl_Ui_Scroll_Manager_Data_freeze) and bm__Efl_Ui_Scroll_Manager_Data_freeze);
end;

function freeze_want(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  freeze_want:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_freeze_want) shr bp__Efl_Ui_Scroll_Manager_Data_freeze_want;
end;

procedure set_freeze_want(var a : _Efl_Ui_Scroll_Manager_Data; __freeze_want : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__freeze_want shl bp__Efl_Ui_Scroll_Manager_Data_freeze_want) and bm__Efl_Ui_Scroll_Manager_Data_freeze_want);
end;

function hold(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  hold:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_hold) shr bp__Efl_Ui_Scroll_Manager_Data_hold;
end;

procedure set_hold(var a : _Efl_Ui_Scroll_Manager_Data; __hold : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__hold shl bp__Efl_Ui_Scroll_Manager_Data_hold) and bm__Efl_Ui_Scroll_Manager_Data_hold);
end;

function match_content_w(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  match_content_w:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_match_content_w) shr bp__Efl_Ui_Scroll_Manager_Data_match_content_w;
end;

procedure set_match_content_w(var a : _Efl_Ui_Scroll_Manager_Data; __match_content_w : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__match_content_w shl bp__Efl_Ui_Scroll_Manager_Data_match_content_w) and bm__Efl_Ui_Scroll_Manager_Data_match_content_w);
end;

function match_content_h(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  match_content_h:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_match_content_h) shr bp__Efl_Ui_Scroll_Manager_Data_match_content_h;
end;

procedure set_match_content_h(var a : _Efl_Ui_Scroll_Manager_Data; __match_content_h : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__match_content_h shl bp__Efl_Ui_Scroll_Manager_Data_match_content_h) and bm__Efl_Ui_Scroll_Manager_Data_match_content_h);
end;

function loop_h(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  loop_h:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_loop_h) shr bp__Efl_Ui_Scroll_Manager_Data_loop_h;
end;

procedure set_loop_h(var a : _Efl_Ui_Scroll_Manager_Data; __loop_h : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__loop_h shl bp__Efl_Ui_Scroll_Manager_Data_loop_h) and bm__Efl_Ui_Scroll_Manager_Data_loop_h);
end;

function loop_v(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  loop_v:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_loop_v) shr bp__Efl_Ui_Scroll_Manager_Data_loop_v;
end;

procedure set_loop_v(var a : _Efl_Ui_Scroll_Manager_Data; __loop_v : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__loop_v shl bp__Efl_Ui_Scroll_Manager_Data_loop_v) and bm__Efl_Ui_Scroll_Manager_Data_loop_v);
end;

function scrolling(var a : _Efl_Ui_Scroll_Manager_Data) : TEina_Bool;
begin
  scrolling:=(a.flag0 and bm__Efl_Ui_Scroll_Manager_Data_scrolling) shr bp__Efl_Ui_Scroll_Manager_Data_scrolling;
end;

procedure set_scrolling(var a : _Efl_Ui_Scroll_Manager_Data; __scrolling : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scrolling shl bp__Efl_Ui_Scroll_Manager_Data_scrolling) and bm__Efl_Ui_Scroll_Manager_Data_scrolling);
end;


end.
