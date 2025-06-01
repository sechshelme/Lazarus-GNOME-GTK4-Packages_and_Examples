
unit elm_widget_player;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_player.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_player.h
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
PElm_Player_Data  = ^Elm_Player_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_PLAYER_H}
{$define ELM_WIDGET_PLAYER_H}
{$include "Elementary.h"}
{$include "elm_player_eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-player-class The Elementary Player Class
 *
 * Elementary, besides having the @ref Player widget, exposes its
 * foundation -- the Elementary Player Class -- in order to create other
 * widgets which are a player with some more logic on top.
  }
{*
 * Base layout smart data extended with player instance data.
  }
type
{ tracking those to ease disabling/enabling them back  }
  PElm_Player_Data = ^TElm_Player_Data;
  TElm_Player_Data = record
      video : PEvas_Object;
      emotion : PEvas_Object;
      forward : PEvas_Object;
      info : PEvas_Object;
      next : PEvas_Object;
      pause : PEvas_Object;
      play : PEvas_Object;
      prev : PEvas_Object;
      rewind : PEvas_Object;
      stop : PEvas_Object;
      eject : PEvas_Object;
      volume : PEvas_Object;
      mute : PEvas_Object;
      slider : PEvas_Object;
      vslider : PEvas_Object;
      flag0 : word;
    end;


const
  bm_TElm_Player_Data_dragging = $1;
  bp_TElm_Player_Data_dragging = 0;

function dragging(var a : TElm_Player_Data) : TEina_Bool;
procedure set_dragging(var a : TElm_Player_Data; __dragging : TEina_Bool);
{*
 * @
  }

implementation

function dragging(var a : TElm_Player_Data) : TEina_Bool;
begin
  dragging:=(a.flag0 and bm_TElm_Player_Data_dragging) shr bp_TElm_Player_Data_dragging;
end;

procedure set_dragging(var a : TElm_Player_Data; __dragging : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__dragging shl bp_TElm_Player_Data_dragging) and bm_TElm_Player_Data_dragging);
end;


end.
