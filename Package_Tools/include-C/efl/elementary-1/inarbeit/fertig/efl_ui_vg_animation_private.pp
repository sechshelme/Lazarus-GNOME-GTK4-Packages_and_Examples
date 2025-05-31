
unit efl_ui_vg_animation_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_vg_animation_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_vg_animation_private.h
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
PEfl_Ui_Vg_Animation_Data  = ^Efl_Ui_Vg_Animation_Data;
PEina_List  = ^Eina_List;
PEina_Stringshare  = ^Eina_Stringshare;
PElm_Transit  = ^Elm_Transit;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_VG_ANIMATION_PRIVATE_H}
{$define EFL_UI_VG_ANIMATION_PRIVATE_H}
{$include "Elementary.h"}
{$include "efl_ui_vg_animation.eo.h"}
type
{Evas_Object_Vg }
  PEfl_Ui_Vg_Animation_Data = ^TEfl_Ui_Vg_Animation_Data;
  TEfl_Ui_Vg_Animation_Data = record
      vg : PEo;
      state : TEfl_Ui_Vg_Animation_State;
      transit : PElm_Transit;
      file : PEina_Stringshare;
      playback_speed : Tdouble;
      progress : Tdouble;
      frame_cnt : Tdouble;
      repeat_times : longint;
      frame_duration : Tdouble;
      min_progress : Tdouble;
      max_progress : Tdouble;
      vp_list : PEina_List;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Vg_Animation_Data_playing_reverse = $1;
  bp_TEfl_Ui_Vg_Animation_Data_playing_reverse = 0;
  bm_TEfl_Ui_Vg_Animation_Data_autoplay = $2;
  bp_TEfl_Ui_Vg_Animation_Data_autoplay = 1;
  bm_TEfl_Ui_Vg_Animation_Data_autoplay_pause = $4;
  bp_TEfl_Ui_Vg_Animation_Data_autoplay_pause = 2;
  bm_TEfl_Ui_Vg_Animation_Data_loop = $8;
  bp_TEfl_Ui_Vg_Animation_Data_loop = 3;
  bm_TEfl_Ui_Vg_Animation_Data_playback_direction_changed = $10;
  bp_TEfl_Ui_Vg_Animation_Data_playback_direction_changed = 4;

function playing_reverse(var a : TEfl_Ui_Vg_Animation_Data) : TEina_Bool;
procedure set_playing_reverse(var a : TEfl_Ui_Vg_Animation_Data; __playing_reverse : TEina_Bool);
function autoplay(var a : TEfl_Ui_Vg_Animation_Data) : TEina_Bool;
procedure set_autoplay(var a : TEfl_Ui_Vg_Animation_Data; __autoplay : TEina_Bool);
function autoplay_pause(var a : TEfl_Ui_Vg_Animation_Data) : TEina_Bool;
procedure set_autoplay_pause(var a : TEfl_Ui_Vg_Animation_Data; __autoplay_pause : TEina_Bool);
function loop(var a : TEfl_Ui_Vg_Animation_Data) : TEina_Bool;
procedure set_loop(var a : TEfl_Ui_Vg_Animation_Data; __loop : TEina_Bool);
function playback_direction_changed(var a : TEfl_Ui_Vg_Animation_Data) : TEina_Bool;
procedure set_playback_direction_changed(var a : TEfl_Ui_Vg_Animation_Data; __playback_direction_changed : TEina_Bool);

implementation

function playing_reverse(var a : TEfl_Ui_Vg_Animation_Data) : TEina_Bool;
begin
  playing_reverse:=(a.flag0 and bm_TEfl_Ui_Vg_Animation_Data_playing_reverse) shr bp_TEfl_Ui_Vg_Animation_Data_playing_reverse;
end;

procedure set_playing_reverse(var a : TEfl_Ui_Vg_Animation_Data; __playing_reverse : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__playing_reverse shl bp_TEfl_Ui_Vg_Animation_Data_playing_reverse) and bm_TEfl_Ui_Vg_Animation_Data_playing_reverse);
end;

function autoplay(var a : TEfl_Ui_Vg_Animation_Data) : TEina_Bool;
begin
  autoplay:=(a.flag0 and bm_TEfl_Ui_Vg_Animation_Data_autoplay) shr bp_TEfl_Ui_Vg_Animation_Data_autoplay;
end;

procedure set_autoplay(var a : TEfl_Ui_Vg_Animation_Data; __autoplay : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__autoplay shl bp_TEfl_Ui_Vg_Animation_Data_autoplay) and bm_TEfl_Ui_Vg_Animation_Data_autoplay);
end;

function autoplay_pause(var a : TEfl_Ui_Vg_Animation_Data) : TEina_Bool;
begin
  autoplay_pause:=(a.flag0 and bm_TEfl_Ui_Vg_Animation_Data_autoplay_pause) shr bp_TEfl_Ui_Vg_Animation_Data_autoplay_pause;
end;

procedure set_autoplay_pause(var a : TEfl_Ui_Vg_Animation_Data; __autoplay_pause : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__autoplay_pause shl bp_TEfl_Ui_Vg_Animation_Data_autoplay_pause) and bm_TEfl_Ui_Vg_Animation_Data_autoplay_pause);
end;

function loop(var a : TEfl_Ui_Vg_Animation_Data) : TEina_Bool;
begin
  loop:=(a.flag0 and bm_TEfl_Ui_Vg_Animation_Data_loop) shr bp_TEfl_Ui_Vg_Animation_Data_loop;
end;

procedure set_loop(var a : TEfl_Ui_Vg_Animation_Data; __loop : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__loop shl bp_TEfl_Ui_Vg_Animation_Data_loop) and bm_TEfl_Ui_Vg_Animation_Data_loop);
end;

function playback_direction_changed(var a : TEfl_Ui_Vg_Animation_Data) : TEina_Bool;
begin
  playback_direction_changed:=(a.flag0 and bm_TEfl_Ui_Vg_Animation_Data_playback_direction_changed) shr bp_TEfl_Ui_Vg_Animation_Data_playback_direction_changed;
end;

procedure set_playback_direction_changed(var a : TEfl_Ui_Vg_Animation_Data; __playback_direction_changed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__playback_direction_changed shl bp_TEfl_Ui_Vg_Animation_Data_playback_direction_changed) and bm_TEfl_Ui_Vg_Animation_Data_playback_direction_changed);
end;


end.
