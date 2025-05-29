
unit elm_widget_colorselector;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_colorselector.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_colorselector.h
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
PColor_Bar_Data  = ^Color_Bar_Data;
PColor_Type  = ^Color_Type;
PEcore_Event_Handler  = ^Ecore_Event_Handler;
PEcore_Timer  = ^Ecore_Timer;
PEina_List  = ^Eina_List;
PElm_Color_Item_Data  = ^Elm_Color_Item_Data;
PElm_Color_Name  = ^Elm_Color_Name;
PElm_Color_RGBA  = ^Elm_Color_RGBA;
PElm_Colorselector_Data  = ^Elm_Colorselector_Data;
PElm_Object_Item  = ^Elm_Object_Item;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_COLORSELECTOR_H}
{$define ELM_WIDGET_COLORSELECTOR_H}
{$include "Elementary.h"}
{$include "elm_color_item_eo.h"}
{$include "elm_colorselector_eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-colorselector-class The Elementary Colorselector Class
 *
 * Elementary, besides having the @ref Colorselector widget, exposes its
 * foundation -- the Elementary Colorselector Class -- in order to create other
 * widgets which are a colorselector with some more logic on top.
  }
type
{*
 * Base layout smart data extended with colorselector instance data.
  }
{ for the 3 displaying modes of the widget  }
{$ifdef HAVE_ELEMENTARY_X}
{$endif}
{ focus support data  }
(* Const before type ignored *)
{ color components  }
type
  PElm_Colorselector_Data = ^TElm_Colorselector_Data;
  TElm_Colorselector_Data = record
      col_bars_area : PEvas_Object;
      palette_box : PEvas_Object;
      picker : PEvas_Object;
      picker_display : PEvas_Object;
      spinners : array[0..3] of PEvas_Object;
      button : PEvas_Object;
      grab : record
          x : longint;
          y : longint;
          in : TEina_Bool;
          xroot : TEcore_X_Window;
          mouse_motion : PEcore_Event_Handler;
          key_up : PEcore_Event_Handler;
          mouse_up : PEcore_Event_Handler;
        end;
      focused_item : PElm_Object_Item;
      focus_items : PEina_List;
      items : PEina_List;
      selected : PEina_List;
      cb_data : array[0..3] of PColor_Bar_Data;
      longpress_timer : PEcore_Timer;
      palette_name : Pchar;
      _x : TEvas_Coord;
      _y : TEvas_Coord;
      _w : TEvas_Coord;
      _h : TEvas_Coord;
      r : longint;
      g : longint;
      b : longint;
      a : longint;
      er : longint;
      eg : longint;
      eb : longint;
      h : Tdouble;
      s : Tdouble;
      l : Tdouble;
      mode : TElm_Colorselector_Mode;
      focused : TElm_Colorselector_Mode;
      sel_color_type : longint;
      flag0 : word;
    end;


const
  bm_TElm_Colorselector_Data_config_load = $1;
  bp_TElm_Colorselector_Data_config_load = 0;

function config_load(var a : TElm_Colorselector_Data) : TEina_Bool;
procedure set_config_load(var a : TElm_Colorselector_Data; __config_load : TEina_Bool);
type
  PColor_Type = ^TColor_Type;
  TColor_Type =  Longint;
  Const
    HUE = 0;
    SATURATION = 1;
    LIGHTNESS = 2;
    ALPHA = 3;
;
type
  PColor_Bar_Data = ^TColor_Bar_Data;
  TColor_Bar_Data = record
      parent : PEvas_Object;
      colorbar : PEvas_Object;
      bar : PEvas_Object;
      lbt : PEvas_Object;
      rbt : PEvas_Object;
      bg_rect : PEvas_Object;
      arrow : PEvas_Object;
      touch_area : PEvas_Object;
      access_obj : PEvas_Object;
      color_type : TColor_Type;
    end;

  PElm_Color_Item_Data = ^TElm_Color_Item_Data;
  TElm_Color_Item_Data = record
      base : PElm_Widget_Item_Data;
      color_obj : PEvas_Object;
      color : PElm_Color_RGBA;
      flag0 : word;
    end;


const
  bm_TElm_Color_Item_Data_still_in = $1;
  bp_TElm_Color_Item_Data_still_in = 0;

function still_in(var a : TElm_Color_Item_Data) : TEina_Bool;
procedure set_still_in(var a : TElm_Color_Item_Data; __still_in : TEina_Bool);
type
(* Const before type ignored *)
  PElm_Color_Name = ^TElm_Color_Name;
  TElm_Color_Name = record
      color : TElm_Color_RGBA;
      name : Pchar;
    end;

{*
 * @
  }

implementation

function config_load(var a : TElm_Colorselector_Data) : TEina_Bool;
begin
  config_load:=(a.flag0 and bm_TElm_Colorselector_Data_config_load) shr bp_TElm_Colorselector_Data_config_load;
end;

procedure set_config_load(var a : TElm_Colorselector_Data; __config_load : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__config_load shl bp_TElm_Colorselector_Data_config_load) and bm_TElm_Colorselector_Data_config_load);
end;

function still_in(var a : TElm_Color_Item_Data) : TEina_Bool;
begin
  still_in:=(a.flag0 and bm_TElm_Color_Item_Data_still_in) shr bp_TElm_Color_Item_Data_still_in;
end;

procedure set_still_in(var a : TElm_Color_Item_Data; __still_in : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__still_in shl bp_TElm_Color_Item_Data_still_in) and bm_TElm_Color_Item_Data_still_in);
end;


end.
