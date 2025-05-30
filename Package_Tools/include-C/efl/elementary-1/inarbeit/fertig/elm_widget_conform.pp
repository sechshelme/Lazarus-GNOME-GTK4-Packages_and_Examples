
unit elm_widget_conform;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_conform.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_conform.h
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
PConformant_Part_Type  = ^Conformant_Part_Type;
PEcore_Animator  = ^Ecore_Animator;
PEcore_Event_Handler  = ^Ecore_Event_Handler;
PEcore_Job  = ^Ecore_Job;
PEcore_Timer  = ^Ecore_Timer;
PElm_Conformant_Data  = ^Elm_Conformant_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_CONFORMANT_H}
{$define ELM_WIDGET_CONFORMANT_H}
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
 * @section elm-conformant-class The Elementary Conformant Class
 *
 * Elementary, besides having the @ref Conformant widget, exposes its
 * foundation -- the Elementary Conformant Class -- in order to create other
 * widgets which are a conformant with some more logic on top.
  }
{*
 * Base layout smart data extended with conformant instance data.
  }
type
{$ifdef HAVE_ELEMENTARY_X}
{$endif}
{ animation timer }
{ time started }
{ desired delta }
{ current delta }
type
  PElm_Conformant_Data = ^TElm_Conformant_Data;
  TElm_Conformant_Data = record
      win : PEvas_Object;
      portrait_indicator : PEvas_Object;
      landscape_indicator : PEvas_Object;
      softkey : PEvas_Object;
      virtualkeypad : PEvas_Object;
      clipboard : PEvas_Object;
      scroller : PEvas_Object;
      prop_hdl : PEcore_Event_Handler;
      vkb_state : TEcore_X_Virtual_Keyboard_State;
      clipboard_state : TEcore_X_Illume_Clipboard_State;
      delta : record
          animator : PEcore_Animator;
          start : Tdouble;
          auto_x : TEvas_Coord;
          auto_y : TEvas_Coord;
          x : TEvas_Coord;
          y : TEvas_Coord;
        end;
      show_region_job : PEcore_Job;
      indmode : TElm_Win_Indicator_Mode;
      ind_o_mode : TElm_Win_Indicator_Opacity_Mode;
      land_indi_timer : PEcore_Timer;
      port_indi_timer : PEcore_Timer;
      rot : longint;
      win_hidden : TEina_Bool;
    end;

{ Enum to identify conformant swallow parts  }

  PConformant_Part_Type = ^TConformant_Part_Type;
  TConformant_Part_Type = TConformant_Part_Type;
  TConformant_Part_Type =  Longint;
  Const
    ELM_CONFORMANT_INDICATOR_PART = 1;
    ELM_CONFORMANT_SOFTKEY_PART = 2;
    ELM_CONFORMANT_VIRTUAL_KEYPAD_PART = 4;
    ELM_CONFORMANT_CLIPBOARD_PART = 8;

{*
 * @
  }

implementation


end.
