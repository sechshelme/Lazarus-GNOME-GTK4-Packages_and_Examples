
unit efl_ui_image_zoomable_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_image_zoomable_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_image_zoomable_private.h
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
PEcore_Job  = ^Ecore_Job;
PEcore_Timer  = ^Ecore_Timer;
PEfl_Ui_Image_Zoomable_Data  = ^Efl_Ui_Image_Zoomable_Data;
PEfl_Ui_Image_Zoomable_Grid  = ^Efl_Ui_Image_Zoomable_Grid;
PEfl_Ui_Image_Zoomable_Grid_Item  = ^Efl_Ui_Image_Zoomable_Grid_Item;
PEfl_Ui_Image_Zoomable_Pan_Data  = ^Efl_Ui_Image_Zoomable_Pan_Data;
PEina_Binbuf  = ^Eina_Binbuf;
PEina_File  = ^Eina_File;
PEina_List  = ^Eina_List;
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_IMAGE_ZOOMABLE_PRIVATE_H}
{$define EFL_UI_IMAGE_ZOOMABLE_PRIVATE_H}
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
 * @section elm-photocam-class The Elementary Photocam Class
 *
 * Elementary, besides having the @ref Photocam widget, exposes its
 * foundation -- the Elementary Photocam Class -- in order to create
 * other widgets which are a photocam with some more logic on top.
  }
{*
 * Base widget smart data extended with photocam instance data.
  }
type
  PEfl_Ui_Image_Zoomable_Grid_Item = ^TEfl_Ui_Image_Zoomable_Grid_Item;
  TEfl_Ui_Image_Zoomable_Grid_Item = record
      obj : PEvas_Object;
      sd : PEfl_Ui_Image_Zoomable_Data;
      img : PEvas_Object;
      src : record
          x : longint;
          y : longint;
          w : longint;
          h : longint;
        end;
      out : record
          x : longint;
          y : longint;
          w : longint;
          h : longint;
        end;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Image_Zoomable_Grid_Item_want = $1;
  bp_TEfl_Ui_Image_Zoomable_Grid_Item_want = 0;
  bm_TEfl_Ui_Image_Zoomable_Grid_Item_have = $2;
  bp_TEfl_Ui_Image_Zoomable_Grid_Item_have = 1;

function want(var a : TEfl_Ui_Image_Zoomable_Grid_Item) : TEina_Bool;
procedure set_want(var a : TEfl_Ui_Image_Zoomable_Grid_Item; __want : TEina_Bool);
function have(var a : TEfl_Ui_Image_Zoomable_Grid_Item) : TEina_Bool;
procedure set_have(var a : TEfl_Ui_Image_Zoomable_Grid_Item; __have : TEina_Bool);
{ size of tile (tsize x tsize pixels)  }
{ zoom level tiles want for optimal
                                  * display (1, 2, 4, 8)  }
{ size of image in pixels  }
{ size of grid image in pixels
                                  * (represented by grid)  }
{ size of grid in tiles  }
{ the grid (gw * gh items)  }
{ old grid. will die as soon as anim is
                                      * over  }
type
  PEfl_Ui_Image_Zoomable_Grid = ^TEfl_Ui_Image_Zoomable_Grid;
  TEfl_Ui_Image_Zoomable_Grid = record
      tsize : longint;
      zoom : longint;
      iw : longint;
      ih : longint;
      w : longint;
      h : longint;
      gw : longint;
      gh : longint;
      grid : PEfl_Ui_Image_Zoomable_Grid_Item;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Image_Zoomable_Grid_dead = $1;
  bp_TEfl_Ui_Image_Zoomable_Grid_dead = 0;

function dead(var a : TEfl_Ui_Image_Zoomable_Grid) : TEina_Bool;
procedure set_dead(var a : TEfl_Ui_Image_Zoomable_Grid; __dead : TEina_Bool);
(* Const before type ignored *)
{ low res version of image (scale down == 8)  }
(* Const before type ignored *)
type
  PEfl_Ui_Image_Zoomable_Data = ^TEfl_Ui_Image_Zoomable_Data;
  TEfl_Ui_Image_Zoomable_Data = record
      smanager : PEo;
      pan_obj : PEo;
      g_layer : PEvas_Object;
      pan_x : TEvas_Coord;
      pan_y : TEvas_Coord;
      minw : TEvas_Coord;
      minh : TEvas_Coord;
      g_layer_start : Tdouble;
      zoom : Tdouble;
      mode : TElm_Photocam_Zoom_Mode;
      pvx : TEvas_Coord;
      pvy : TEvas_Coord;
      px : TEvas_Coord;
      py : TEvas_Coord;
      zoom_point_x : TEvas_Coord;
      zoom_point_y : TEvas_Coord;
      g_layer_zoom : record
          imx : longint;
          imy : longint;
          bounce : record
              x_start : longint;
              y_start : longint;
              x_end : longint;
              y_end : longint;
              t_start : Tdouble;
              t_end : Tdouble;
            end;
        end;
      file : Pchar;
      f : PEina_File;
      remote : record
          copier : PEo;
          binbuf : PEina_Binbuf;
        end;
      calc_job : PEcore_Job;
      scr_timer : PEcore_Timer;
      long_timer : PEcore_Timer;
      t_start : Tdouble;
      t_end : Tdouble;
      size : record
          imw : longint;
          imh : longint;
          w : longint;
          h : longint;
          ow : longint;
          oh : longint;
          nw : longint;
          nh : longint;
          spos : record
              x : Tdouble;
              y : Tdouble;
            end;
        end;
      show : TEina_Rect;
      tsize : longint;
      img : PEvas_Object;
      no_smooth : longint;
      preload_num : longint;
      freedesktop : record
          requested_size : longint;
          flag0 : word;
        end;
      edje : PEvas_Object;
      stdicon : Pchar;
      anim_timer : PEcore_Timer;
      frame_duration : Tdouble;
      playback_speed : Tdouble;
      cur_frame : longint;
      frame_count : longint;
      grids : PEina_List;
      orient : TEfl_Gfx_Image_Orientation;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Image_Zoomable_Data_use = $1;
  bp_TEfl_Ui_Image_Zoomable_Data_use = 0;
  bm_TEfl_Ui_Image_Zoomable_Data_main_load_pending = $1;
  bp_TEfl_Ui_Image_Zoomable_Data_main_load_pending = 0;
  bm_TEfl_Ui_Image_Zoomable_Data_longpressed = $2;
  bp_TEfl_Ui_Image_Zoomable_Data_longpressed = 1;
  bm_TEfl_Ui_Image_Zoomable_Data_do_gesture = $4;
  bp_TEfl_Ui_Image_Zoomable_Data_do_gesture = 2;
  bm_TEfl_Ui_Image_Zoomable_Data_do_region = $8;
  bp_TEfl_Ui_Image_Zoomable_Data_do_region = 3;
  bm_TEfl_Ui_Image_Zoomable_Data_zoom_g_layer = $10;
  bp_TEfl_Ui_Image_Zoomable_Data_zoom_g_layer = 4;
  bm_TEfl_Ui_Image_Zoomable_Data_resized = $20;
  bp_TEfl_Ui_Image_Zoomable_Data_resized = 5;
  bm_TEfl_Ui_Image_Zoomable_Data_on_hold = $40;
  bp_TEfl_Ui_Image_Zoomable_Data_on_hold = 6;
  bm_TEfl_Ui_Image_Zoomable_Data_paused = $80;
  bp_TEfl_Ui_Image_Zoomable_Data_paused = 7;
  bm_TEfl_Ui_Image_Zoomable_Data_orientation_changed = $100;
  bp_TEfl_Ui_Image_Zoomable_Data_orientation_changed = 8;
  bm_TEfl_Ui_Image_Zoomable_Data_anim = $200;
  bp_TEfl_Ui_Image_Zoomable_Data_anim = 9;
  bm_TEfl_Ui_Image_Zoomable_Data_autoplay = $400;
  bp_TEfl_Ui_Image_Zoomable_Data_autoplay = 10;
  bm_TEfl_Ui_Image_Zoomable_Data_playback_loop = $800;
  bp_TEfl_Ui_Image_Zoomable_Data_playback_loop = 11;
  bm_TEfl_Ui_Image_Zoomable_Data_freeze_want = $1000;
  bp_TEfl_Ui_Image_Zoomable_Data_freeze_want = 12;
  bm_TEfl_Ui_Image_Zoomable_Data_show_item = $2000;
  bp_TEfl_Ui_Image_Zoomable_Data_show_item = 13;

function main_load_pending(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
procedure set_main_load_pending(var a : TEfl_Ui_Image_Zoomable_Data; __main_load_pending : TEina_Bool);
function longpressed(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
procedure set_longpressed(var a : TEfl_Ui_Image_Zoomable_Data; __longpressed : TEina_Bool);
function do_gesture(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
procedure set_do_gesture(var a : TEfl_Ui_Image_Zoomable_Data; __do_gesture : TEina_Bool);
function do_region(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
procedure set_do_region(var a : TEfl_Ui_Image_Zoomable_Data; __do_region : TEina_Bool);
function zoom_g_layer(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
procedure set_zoom_g_layer(var a : TEfl_Ui_Image_Zoomable_Data; __zoom_g_layer : TEina_Bool);
function resized(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
procedure set_resized(var a : TEfl_Ui_Image_Zoomable_Data; __resized : TEina_Bool);
function on_hold(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
procedure set_on_hold(var a : TEfl_Ui_Image_Zoomable_Data; __on_hold : TEina_Bool);
function paused(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
procedure set_paused(var a : TEfl_Ui_Image_Zoomable_Data; __paused : TEina_Bool);
function orientation_changed(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
procedure set_orientation_changed(var a : TEfl_Ui_Image_Zoomable_Data; __orientation_changed : TEina_Bool);
function anim(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
procedure set_anim(var a : TEfl_Ui_Image_Zoomable_Data; __anim : TEina_Bool);
function autoplay(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
procedure set_autoplay(var a : TEfl_Ui_Image_Zoomable_Data; __autoplay : TEina_Bool);
function playback_loop(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
procedure set_playback_loop(var a : TEfl_Ui_Image_Zoomable_Data; __playback_loop : TEina_Bool);
function freeze_want(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
procedure set_freeze_want(var a : TEfl_Ui_Image_Zoomable_Data; __freeze_want : TEina_Bool);
function show_item(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
procedure set_show_item(var a : TEfl_Ui_Image_Zoomable_Data; __show_item : TEina_Bool);
type
  PEfl_Ui_Image_Zoomable_Pan_Data = ^TEfl_Ui_Image_Zoomable_Pan_Data;
  TEfl_Ui_Image_Zoomable_Pan_Data = record
      wobj : PEo;
      wsd : PEfl_Ui_Image_Zoomable_Data;
    end;

{*
 * @
  }

implementation

function want(var a : TEfl_Ui_Image_Zoomable_Grid_Item) : TEina_Bool;
begin
  want:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Grid_Item_want) shr bp_TEfl_Ui_Image_Zoomable_Grid_Item_want;
end;

procedure set_want(var a : TEfl_Ui_Image_Zoomable_Grid_Item; __want : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__want shl bp_TEfl_Ui_Image_Zoomable_Grid_Item_want) and bm_TEfl_Ui_Image_Zoomable_Grid_Item_want);
end;

function have(var a : TEfl_Ui_Image_Zoomable_Grid_Item) : TEina_Bool;
begin
  have:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Grid_Item_have) shr bp_TEfl_Ui_Image_Zoomable_Grid_Item_have;
end;

procedure set_have(var a : TEfl_Ui_Image_Zoomable_Grid_Item; __have : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__have shl bp_TEfl_Ui_Image_Zoomable_Grid_Item_have) and bm_TEfl_Ui_Image_Zoomable_Grid_Item_have);
end;

function dead(var a : TEfl_Ui_Image_Zoomable_Grid) : TEina_Bool;
begin
  dead:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Grid_dead) shr bp_TEfl_Ui_Image_Zoomable_Grid_dead;
end;

procedure set_dead(var a : TEfl_Ui_Image_Zoomable_Grid; __dead : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__dead shl bp_TEfl_Ui_Image_Zoomable_Grid_dead) and bm_TEfl_Ui_Image_Zoomable_Grid_dead);
end;

function main_load_pending(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
begin
  main_load_pending:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Data_main_load_pending) shr bp_TEfl_Ui_Image_Zoomable_Data_main_load_pending;
end;

procedure set_main_load_pending(var a : TEfl_Ui_Image_Zoomable_Data; __main_load_pending : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__main_load_pending shl bp_TEfl_Ui_Image_Zoomable_Data_main_load_pending) and bm_TEfl_Ui_Image_Zoomable_Data_main_load_pending);
end;

function longpressed(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
begin
  longpressed:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Data_longpressed) shr bp_TEfl_Ui_Image_Zoomable_Data_longpressed;
end;

procedure set_longpressed(var a : TEfl_Ui_Image_Zoomable_Data; __longpressed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__longpressed shl bp_TEfl_Ui_Image_Zoomable_Data_longpressed) and bm_TEfl_Ui_Image_Zoomable_Data_longpressed);
end;

function do_gesture(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
begin
  do_gesture:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Data_do_gesture) shr bp_TEfl_Ui_Image_Zoomable_Data_do_gesture;
end;

procedure set_do_gesture(var a : TEfl_Ui_Image_Zoomable_Data; __do_gesture : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__do_gesture shl bp_TEfl_Ui_Image_Zoomable_Data_do_gesture) and bm_TEfl_Ui_Image_Zoomable_Data_do_gesture);
end;

function do_region(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
begin
  do_region:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Data_do_region) shr bp_TEfl_Ui_Image_Zoomable_Data_do_region;
end;

procedure set_do_region(var a : TEfl_Ui_Image_Zoomable_Data; __do_region : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__do_region shl bp_TEfl_Ui_Image_Zoomable_Data_do_region) and bm_TEfl_Ui_Image_Zoomable_Data_do_region);
end;

function zoom_g_layer(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
begin
  zoom_g_layer:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Data_zoom_g_layer) shr bp_TEfl_Ui_Image_Zoomable_Data_zoom_g_layer;
end;

procedure set_zoom_g_layer(var a : TEfl_Ui_Image_Zoomable_Data; __zoom_g_layer : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__zoom_g_layer shl bp_TEfl_Ui_Image_Zoomable_Data_zoom_g_layer) and bm_TEfl_Ui_Image_Zoomable_Data_zoom_g_layer);
end;

function resized(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
begin
  resized:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Data_resized) shr bp_TEfl_Ui_Image_Zoomable_Data_resized;
end;

procedure set_resized(var a : TEfl_Ui_Image_Zoomable_Data; __resized : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__resized shl bp_TEfl_Ui_Image_Zoomable_Data_resized) and bm_TEfl_Ui_Image_Zoomable_Data_resized);
end;

function on_hold(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
begin
  on_hold:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Data_on_hold) shr bp_TEfl_Ui_Image_Zoomable_Data_on_hold;
end;

procedure set_on_hold(var a : TEfl_Ui_Image_Zoomable_Data; __on_hold : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__on_hold shl bp_TEfl_Ui_Image_Zoomable_Data_on_hold) and bm_TEfl_Ui_Image_Zoomable_Data_on_hold);
end;

function paused(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
begin
  paused:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Data_paused) shr bp_TEfl_Ui_Image_Zoomable_Data_paused;
end;

procedure set_paused(var a : TEfl_Ui_Image_Zoomable_Data; __paused : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__paused shl bp_TEfl_Ui_Image_Zoomable_Data_paused) and bm_TEfl_Ui_Image_Zoomable_Data_paused);
end;

function orientation_changed(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
begin
  orientation_changed:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Data_orientation_changed) shr bp_TEfl_Ui_Image_Zoomable_Data_orientation_changed;
end;

procedure set_orientation_changed(var a : TEfl_Ui_Image_Zoomable_Data; __orientation_changed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__orientation_changed shl bp_TEfl_Ui_Image_Zoomable_Data_orientation_changed) and bm_TEfl_Ui_Image_Zoomable_Data_orientation_changed);
end;

function anim(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
begin
  anim:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Data_anim) shr bp_TEfl_Ui_Image_Zoomable_Data_anim;
end;

procedure set_anim(var a : TEfl_Ui_Image_Zoomable_Data; __anim : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__anim shl bp_TEfl_Ui_Image_Zoomable_Data_anim) and bm_TEfl_Ui_Image_Zoomable_Data_anim);
end;

function autoplay(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
begin
  autoplay:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Data_autoplay) shr bp_TEfl_Ui_Image_Zoomable_Data_autoplay;
end;

procedure set_autoplay(var a : TEfl_Ui_Image_Zoomable_Data; __autoplay : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__autoplay shl bp_TEfl_Ui_Image_Zoomable_Data_autoplay) and bm_TEfl_Ui_Image_Zoomable_Data_autoplay);
end;

function playback_loop(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
begin
  playback_loop:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Data_playback_loop) shr bp_TEfl_Ui_Image_Zoomable_Data_playback_loop;
end;

procedure set_playback_loop(var a : TEfl_Ui_Image_Zoomable_Data; __playback_loop : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__playback_loop shl bp_TEfl_Ui_Image_Zoomable_Data_playback_loop) and bm_TEfl_Ui_Image_Zoomable_Data_playback_loop);
end;

function freeze_want(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
begin
  freeze_want:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Data_freeze_want) shr bp_TEfl_Ui_Image_Zoomable_Data_freeze_want;
end;

procedure set_freeze_want(var a : TEfl_Ui_Image_Zoomable_Data; __freeze_want : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__freeze_want shl bp_TEfl_Ui_Image_Zoomable_Data_freeze_want) and bm_TEfl_Ui_Image_Zoomable_Data_freeze_want);
end;

function show_item(var a : TEfl_Ui_Image_Zoomable_Data) : TEina_Bool;
begin
  show_item:=(a.flag0 and bm_TEfl_Ui_Image_Zoomable_Data_show_item) shr bp_TEfl_Ui_Image_Zoomable_Data_show_item;
end;

procedure set_show_item(var a : TEfl_Ui_Image_Zoomable_Data; __show_item : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__show_item shl bp_TEfl_Ui_Image_Zoomable_Data_show_item) and bm_TEfl_Ui_Image_Zoomable_Data_show_item);
end;


end.
