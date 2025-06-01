
unit efl_ui_widget_frame;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_widget_frame.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_widget_frame.h
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
PEfl_Ui_Frame_Data  = ^Efl_Ui_Frame_Data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_WIDGET_FRAME_H}
{$define EFL_UI_WIDGET_FRAME_H}
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
 * @section elm-frame-class The Elementary Frame Class
 *
 * Elementary, besides having the @ref Frame widget, exposes its
 * foundation -- the Elementary Frame Class -- in order to create other
 * widgets which are a frame with some more logic on top.
  }
{*
 * Base layout smart data extended with frame instance data.
  }
type
  PEfl_Ui_Frame_Data = ^TEfl_Ui_Frame_Data;
  TEfl_Ui_Frame_Data = record
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Frame_Data_collapsed = $1;
  bp_TEfl_Ui_Frame_Data_collapsed = 0;
  bm_TEfl_Ui_Frame_Data_collapsible = $2;
  bp_TEfl_Ui_Frame_Data_collapsible = 1;
  bm_TEfl_Ui_Frame_Data_anim = $4;
  bp_TEfl_Ui_Frame_Data_anim = 2;

function collapsed(var a : TEfl_Ui_Frame_Data) : TEina_Bool;
procedure set_collapsed(var a : TEfl_Ui_Frame_Data; __collapsed : TEina_Bool);
function collapsible(var a : TEfl_Ui_Frame_Data) : TEina_Bool;
procedure set_collapsible(var a : TEfl_Ui_Frame_Data; __collapsible : TEina_Bool);
function anim(var a : TEfl_Ui_Frame_Data) : TEina_Bool;
procedure set_anim(var a : TEfl_Ui_Frame_Data; __anim : TEina_Bool);
{*
 * @
  }

implementation

function collapsed(var a : TEfl_Ui_Frame_Data) : TEina_Bool;
begin
  collapsed:=(a.flag0 and bm_TEfl_Ui_Frame_Data_collapsed) shr bp_TEfl_Ui_Frame_Data_collapsed;
end;

procedure set_collapsed(var a : TEfl_Ui_Frame_Data; __collapsed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__collapsed shl bp_TEfl_Ui_Frame_Data_collapsed) and bm_TEfl_Ui_Frame_Data_collapsed);
end;

function collapsible(var a : TEfl_Ui_Frame_Data) : TEina_Bool;
begin
  collapsible:=(a.flag0 and bm_TEfl_Ui_Frame_Data_collapsible) shr bp_TEfl_Ui_Frame_Data_collapsible;
end;

procedure set_collapsible(var a : TEfl_Ui_Frame_Data; __collapsible : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__collapsible shl bp_TEfl_Ui_Frame_Data_collapsible) and bm_TEfl_Ui_Frame_Data_collapsible);
end;

function anim(var a : TEfl_Ui_Frame_Data) : TEina_Bool;
begin
  anim:=(a.flag0 and bm_TEfl_Ui_Frame_Data_anim) shr bp_TEfl_Ui_Frame_Data_anim;
end;

procedure set_anim(var a : TEfl_Ui_Frame_Data; __anim : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__anim shl bp_TEfl_Ui_Frame_Data_anim) and bm_TEfl_Ui_Frame_Data_anim);
end;


end.
