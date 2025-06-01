
unit elm_widget_dayselector;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_dayselector.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_dayselector.h
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
PEina_List  = ^Eina_List;
PElm_Dayselector_Data  = ^Elm_Dayselector_Data;
PElm_Dayselector_Item_Data  = ^Elm_Dayselector_Item_Data;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_DAYSELECTOR_H}
{$define ELM_WIDGET_DAYSELECTOR_H}
{$include "Elementary.h"}
{$include "elm_dayselector_item_eo.h"}
{$include "elm_dayselector_eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-dayselector-class The Elementary Dayselector Class
 *
 * Elementary, besides having the @ref Dayselector widget, exposes its
 * foundation -- the Elementary Dayselector Class -- in order to create other
 * widgets which are a dayselector with some more logic on top.
  }
{*
 * Base layout smart data extended with dayselector instance data.
  }
type
  PElm_Dayselector_Data = ^TElm_Dayselector_Data;
  TElm_Dayselector_Data = record
      items : PEina_List;
      week_start : TElm_Dayselector_Day;
      weekend_start : TElm_Dayselector_Day;
      weekend_len : dword;
      flag0 : word;
    end;


const
  bm_TElm_Dayselector_Data_weekdays_names_set = $1;
  bp_TElm_Dayselector_Data_weekdays_names_set = 0;

function weekdays_names_set(var a : TElm_Dayselector_Data) : TEina_Bool;
procedure set_weekdays_names_set(var a : TElm_Dayselector_Data; __weekdays_names_set : TEina_Bool);
type
(* Const before type ignored *)
  PElm_Dayselector_Item_Data = ^TElm_Dayselector_Item_Data;
  TElm_Dayselector_Item_Data = record
      base : PElm_Widget_Item_Data;
      day : TElm_Dayselector_Day;
      day_style : Pchar;
    end;

{*
 * @
  }

implementation

function weekdays_names_set(var a : TElm_Dayselector_Data) : TEina_Bool;
begin
  weekdays_names_set:=(a.flag0 and bm_TElm_Dayselector_Data_weekdays_names_set) shr bp_TElm_Dayselector_Data_weekdays_names_set;
end;

procedure set_weekdays_names_set(var a : TElm_Dayselector_Data; __weekdays_names_set : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__weekdays_names_set shl bp_TElm_Dayselector_Data_weekdays_names_set) and bm_TElm_Dayselector_Data_weekdays_names_set);
end;


end.
