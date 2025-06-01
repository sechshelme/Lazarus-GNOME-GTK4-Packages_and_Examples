
unit efl_ui_widget_image;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_widget_image.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_widget_image.h
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
PEcore_Thread  = ^Ecore_Thread;
PEcore_Timer  = ^Ecore_Timer;
PEfl_Ui_Image_Data  = ^Efl_Ui_Image_Data;
PEfl_Ui_Image_Preload_Status  = ^Efl_Ui_Image_Preload_Status;
PEina_Binbuf  = ^Eina_Binbuf;
PEina_Stringshare  = ^Eina_Stringshare;
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_WIDGET_IMAGE_H}
{$define EFL_UI_WIDGET_IMAGE_H}
{$include "Elementary.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
type
  PEfl_Ui_Image_Preload_Status = ^TEfl_Ui_Image_Preload_Status;
  TEfl_Ui_Image_Preload_Status =  Longint;
  Const
    EFL_UI_IMAGE_PRELOAD_ENABLED = 0;
    EFL_UI_IMAGE_PRELOADING = 1;
    EFL_UI_IMAGE_PRELOADED = 2;
    EFL_UI_IMAGE_PRELOAD_DISABLED = 3;
;
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-image-class The Elementary Image Class
 *
 * This class defines a common interface for @b image objects having
 * an image as their basic graphics. This interface is so that one can
 * tune various properties of the image, like:
 * - smooth scaling,
 * - orientation,
 * - aspect ratio during resizes, etc.
 *
 * Image files may be set via memory buffers, image files, EET files
 * with image data or Edje files. On the last case (which is
 * exceptional), most of the properties cited above will @b not be
 * changeable anymore.
  }
{*
 * Base widget smart data extended with image instance data.
  }
type
(* Const before type ignored *)
{ to support extern }
{ only for file_get() }
{ opaque internal }
(* Const before type ignored *)
  PEfl_Ui_Image_Data = ^TEfl_Ui_Image_Data;
  TEfl_Ui_Image_Data = record
      self : PEo;
      hit_rect : PEvas_Object;
      img : PEvas_Object;
      prev_img : PEvas_Object;
      anim_timer : PEcore_Timer;
      remote : record
          copier : PEo;
          binbuf : PEina_Binbuf;
          key : Pchar;
        end;
      scale : Tdouble;
      frame_duration : Tdouble;
      playback_speed : Tdouble;
      align_x : Tdouble;
      align_y : Tdouble;
      load_size : TEina_Size2D;
      frame_count : longint;
      cur_frame : longint;
      image_orient : TElm_Image_Orient;
      orient : TEfl_Gfx_Image_Orientation;
      async : record
          th : PEcore_Thread;
          file : PEina_Stringshare;
          key : PEina_Stringshare;
          todo : pointer;
        end;
      preload_status : TEfl_Ui_Image_Preload_Status;
      scale_type : TEfl_Gfx_Image_Scale_Method;
      stdicon : Pchar;
      _property : record
          file : PEina_Stringshare;
          key : PEina_Stringshare;
          flag0 : word;
        end;
      freedesktop : record
          requested_size : longint;
          flag0 : word;
        end;
      flag0 : longint;
    end;


const
  bm_TEfl_Ui_Image_Data_icon = $1;
  bp_TEfl_Ui_Image_Data_icon = 0;
  bm_TEfl_Ui_Image_Data_use = $1;
  bp_TEfl_Ui_Image_Data_use = 0;
  bm_TEfl_Ui_Image_Data_aspect_fixed = $1;
  bp_TEfl_Ui_Image_Data_aspect_fixed = 0;
  bm_TEfl_Ui_Image_Data_fill_inside = $2;
  bp_TEfl_Ui_Image_Data_fill_inside = 1;
  bm_TEfl_Ui_Image_Data_no_scale = $4;
  bp_TEfl_Ui_Image_Data_no_scale = 2;
  bm_TEfl_Ui_Image_Data_smooth = $8;
  bp_TEfl_Ui_Image_Data_smooth = 3;
  bm_TEfl_Ui_Image_Data_show = $10;
  bp_TEfl_Ui_Image_Data_show = 4;
  bm_TEfl_Ui_Image_Data_edit = $20;
  bp_TEfl_Ui_Image_Data_edit = 5;
  bm_TEfl_Ui_Image_Data_edje = $40;
  bp_TEfl_Ui_Image_Data_edje = 6;
  bm_TEfl_Ui_Image_Data_anim = $80;
  bp_TEfl_Ui_Image_Data_anim = 7;
  bm_TEfl_Ui_Image_Data_autoplay = $100;
  bp_TEfl_Ui_Image_Data_autoplay = 8;
  bm_TEfl_Ui_Image_Data_playback_loop = $200;
  bp_TEfl_Ui_Image_Data_playback_loop = 9;
  bm_TEfl_Ui_Image_Data_paused = $400;
  bp_TEfl_Ui_Image_Data_paused = 10;
  bm_TEfl_Ui_Image_Data_async_enable = $800;
  bp_TEfl_Ui_Image_Data_async_enable = 11;
  bm_TEfl_Ui_Image_Data_scale_up = $1000;
  bp_TEfl_Ui_Image_Data_scale_up = 12;
  bm_TEfl_Ui_Image_Data_scale_down = $2000;
  bp_TEfl_Ui_Image_Data_scale_down = 13;
  bm_TEfl_Ui_Image_Data_legacy_align = $4000;
  bp_TEfl_Ui_Image_Data_legacy_align = 14;
  bm_TEfl_Ui_Image_Data_property_watch = $8000;
  bp_TEfl_Ui_Image_Data_property_watch = 15;
  bm_TEfl_Ui_Image_Data_in_calc = $10000;
  bp_TEfl_Ui_Image_Data_in_calc = 16;

function aspect_fixed(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_aspect_fixed(var a : TEfl_Ui_Image_Data; __aspect_fixed : TEina_Bool);
function fill_inside(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_fill_inside(var a : TEfl_Ui_Image_Data; __fill_inside : TEina_Bool);
function no_scale(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_no_scale(var a : TEfl_Ui_Image_Data; __no_scale : TEina_Bool);
function smooth(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_smooth(var a : TEfl_Ui_Image_Data; __smooth : TEina_Bool);
function show(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_show(var a : TEfl_Ui_Image_Data; __show : TEina_Bool);
function edit(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_edit(var a : TEfl_Ui_Image_Data; __edit : TEina_Bool);
function edje(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_edje(var a : TEfl_Ui_Image_Data; __edje : TEina_Bool);
function anim(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_anim(var a : TEfl_Ui_Image_Data; __anim : TEina_Bool);
function autoplay(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_autoplay(var a : TEfl_Ui_Image_Data; __autoplay : TEina_Bool);
function playback_loop(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_playback_loop(var a : TEfl_Ui_Image_Data; __playback_loop : TEina_Bool);
function paused(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_paused(var a : TEfl_Ui_Image_Data; __paused : TEina_Bool);
function async_enable(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_async_enable(var a : TEfl_Ui_Image_Data; __async_enable : TEina_Bool);
function scale_up(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_scale_up(var a : TEfl_Ui_Image_Data; __scale_up : TEina_Bool);
function scale_down(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_scale_down(var a : TEfl_Ui_Image_Data; __scale_down : TEina_Bool);
function legacy_align(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_legacy_align(var a : TEfl_Ui_Image_Data; __legacy_align : TEina_Bool);
function property_watch(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_property_watch(var a : TEfl_Ui_Image_Data; __property_watch : TEina_Bool);
function in_calc(var a : TEfl_Ui_Image_Data) : TEina_Bool;
procedure set_in_calc(var a : TEfl_Ui_Image_Data; __in_calc : TEina_Bool);
{*
 * @
  }

implementation

function aspect_fixed(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  aspect_fixed:=(a.flag0 and bm_TEfl_Ui_Image_Data_aspect_fixed) shr bp_TEfl_Ui_Image_Data_aspect_fixed;
end;

procedure set_aspect_fixed(var a : TEfl_Ui_Image_Data; __aspect_fixed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__aspect_fixed shl bp_TEfl_Ui_Image_Data_aspect_fixed) and bm_TEfl_Ui_Image_Data_aspect_fixed);
end;

function fill_inside(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  fill_inside:=(a.flag0 and bm_TEfl_Ui_Image_Data_fill_inside) shr bp_TEfl_Ui_Image_Data_fill_inside;
end;

procedure set_fill_inside(var a : TEfl_Ui_Image_Data; __fill_inside : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__fill_inside shl bp_TEfl_Ui_Image_Data_fill_inside) and bm_TEfl_Ui_Image_Data_fill_inside);
end;

function no_scale(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  no_scale:=(a.flag0 and bm_TEfl_Ui_Image_Data_no_scale) shr bp_TEfl_Ui_Image_Data_no_scale;
end;

procedure set_no_scale(var a : TEfl_Ui_Image_Data; __no_scale : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__no_scale shl bp_TEfl_Ui_Image_Data_no_scale) and bm_TEfl_Ui_Image_Data_no_scale);
end;

function smooth(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  smooth:=(a.flag0 and bm_TEfl_Ui_Image_Data_smooth) shr bp_TEfl_Ui_Image_Data_smooth;
end;

procedure set_smooth(var a : TEfl_Ui_Image_Data; __smooth : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__smooth shl bp_TEfl_Ui_Image_Data_smooth) and bm_TEfl_Ui_Image_Data_smooth);
end;

function show(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  show:=(a.flag0 and bm_TEfl_Ui_Image_Data_show) shr bp_TEfl_Ui_Image_Data_show;
end;

procedure set_show(var a : TEfl_Ui_Image_Data; __show : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__show shl bp_TEfl_Ui_Image_Data_show) and bm_TEfl_Ui_Image_Data_show);
end;

function edit(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  edit:=(a.flag0 and bm_TEfl_Ui_Image_Data_edit) shr bp_TEfl_Ui_Image_Data_edit;
end;

procedure set_edit(var a : TEfl_Ui_Image_Data; __edit : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__edit shl bp_TEfl_Ui_Image_Data_edit) and bm_TEfl_Ui_Image_Data_edit);
end;

function edje(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  edje:=(a.flag0 and bm_TEfl_Ui_Image_Data_edje) shr bp_TEfl_Ui_Image_Data_edje;
end;

procedure set_edje(var a : TEfl_Ui_Image_Data; __edje : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__edje shl bp_TEfl_Ui_Image_Data_edje) and bm_TEfl_Ui_Image_Data_edje);
end;

function anim(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  anim:=(a.flag0 and bm_TEfl_Ui_Image_Data_anim) shr bp_TEfl_Ui_Image_Data_anim;
end;

procedure set_anim(var a : TEfl_Ui_Image_Data; __anim : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__anim shl bp_TEfl_Ui_Image_Data_anim) and bm_TEfl_Ui_Image_Data_anim);
end;

function autoplay(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  autoplay:=(a.flag0 and bm_TEfl_Ui_Image_Data_autoplay) shr bp_TEfl_Ui_Image_Data_autoplay;
end;

procedure set_autoplay(var a : TEfl_Ui_Image_Data; __autoplay : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__autoplay shl bp_TEfl_Ui_Image_Data_autoplay) and bm_TEfl_Ui_Image_Data_autoplay);
end;

function playback_loop(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  playback_loop:=(a.flag0 and bm_TEfl_Ui_Image_Data_playback_loop) shr bp_TEfl_Ui_Image_Data_playback_loop;
end;

procedure set_playback_loop(var a : TEfl_Ui_Image_Data; __playback_loop : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__playback_loop shl bp_TEfl_Ui_Image_Data_playback_loop) and bm_TEfl_Ui_Image_Data_playback_loop);
end;

function paused(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  paused:=(a.flag0 and bm_TEfl_Ui_Image_Data_paused) shr bp_TEfl_Ui_Image_Data_paused;
end;

procedure set_paused(var a : TEfl_Ui_Image_Data; __paused : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__paused shl bp_TEfl_Ui_Image_Data_paused) and bm_TEfl_Ui_Image_Data_paused);
end;

function async_enable(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  async_enable:=(a.flag0 and bm_TEfl_Ui_Image_Data_async_enable) shr bp_TEfl_Ui_Image_Data_async_enable;
end;

procedure set_async_enable(var a : TEfl_Ui_Image_Data; __async_enable : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__async_enable shl bp_TEfl_Ui_Image_Data_async_enable) and bm_TEfl_Ui_Image_Data_async_enable);
end;

function scale_up(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  scale_up:=(a.flag0 and bm_TEfl_Ui_Image_Data_scale_up) shr bp_TEfl_Ui_Image_Data_scale_up;
end;

procedure set_scale_up(var a : TEfl_Ui_Image_Data; __scale_up : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scale_up shl bp_TEfl_Ui_Image_Data_scale_up) and bm_TEfl_Ui_Image_Data_scale_up);
end;

function scale_down(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  scale_down:=(a.flag0 and bm_TEfl_Ui_Image_Data_scale_down) shr bp_TEfl_Ui_Image_Data_scale_down;
end;

procedure set_scale_down(var a : TEfl_Ui_Image_Data; __scale_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scale_down shl bp_TEfl_Ui_Image_Data_scale_down) and bm_TEfl_Ui_Image_Data_scale_down);
end;

function legacy_align(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  legacy_align:=(a.flag0 and bm_TEfl_Ui_Image_Data_legacy_align) shr bp_TEfl_Ui_Image_Data_legacy_align;
end;

procedure set_legacy_align(var a : TEfl_Ui_Image_Data; __legacy_align : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__legacy_align shl bp_TEfl_Ui_Image_Data_legacy_align) and bm_TEfl_Ui_Image_Data_legacy_align);
end;

function property_watch(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  property_watch:=(a.flag0 and bm_TEfl_Ui_Image_Data_property_watch) shr bp_TEfl_Ui_Image_Data_property_watch;
end;

procedure set_property_watch(var a : TEfl_Ui_Image_Data; __property_watch : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__property_watch shl bp_TEfl_Ui_Image_Data_property_watch) and bm_TEfl_Ui_Image_Data_property_watch);
end;

function in_calc(var a : TEfl_Ui_Image_Data) : TEina_Bool;
begin
  in_calc:=(a.flag0 and bm_TEfl_Ui_Image_Data_in_calc) shr bp_TEfl_Ui_Image_Data_in_calc;
end;

procedure set_in_calc(var a : TEfl_Ui_Image_Data; __in_calc : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__in_calc shl bp_TEfl_Ui_Image_Data_in_calc) and bm_TEfl_Ui_Image_Data_in_calc);
end;


end.
