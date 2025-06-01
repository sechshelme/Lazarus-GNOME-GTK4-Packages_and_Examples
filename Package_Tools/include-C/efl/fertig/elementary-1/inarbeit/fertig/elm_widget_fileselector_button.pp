
unit elm_widget_fileselector_button;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_fileselector_button.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_fileselector_button.h
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
PEfl_Model  = ^Efl_Model;
PElm_Fileselector_Button_Data  = ^Elm_Fileselector_Button_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_FILESELECTOR_BUTTON_H}
{$define ELM_WIDGET_FILESELECTOR_BUTTON_H}
{$include "Elementary.h"}
{$include <Eio.h>}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-fileselector-button-class The Elementary Fileselector Button Class
 *
 * Elementary, besides having the @ref Fileselector_Button widget,
 * exposes its foundation -- the Elementary Fileselector Button Class
 * -- in order to create other widgets which are a fileselector_button
 * with some more logic on top.
  }
{*
 * Base button smart data extended with fileselector_button instance data.
  }
type
{ the object itself }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PElm_Fileselector_Button_Data = ^TElm_Fileselector_Button_Data;
  TElm_Fileselector_Button_Data = record
      obj : PEvas_Object;
      fs : PEvas_Object;
      fsw : PEvas_Object;
      window_title : Pchar;
      w : TEvas_Coord;
      h : TEvas_Coord;
      fsd : record
          model : PEfl_Model;
          path : Pchar;
          selection : PEfl_Model;
          selection_path : Pchar;
          current_name : Pchar;
          thumbnail_size : TEvas_Coord_Size;
          mode : TElm_Fileselector_Mode;
          sort_type : TElm_Fileselector_Sort;
          flag0 : word;
        end;
      flag0 : word;
    end;


const
  bm_TElm_Fileselector_Button_Data_expandable = $1;
  bp_TElm_Fileselector_Button_Data_expandable = 0;
  bm_TElm_Fileselector_Button_Data_folder_only = $2;
  bp_TElm_Fileselector_Button_Data_folder_only = 1;
  bm_TElm_Fileselector_Button_Data_is_save = $4;
  bp_TElm_Fileselector_Button_Data_is_save = 2;
  bm_TElm_Fileselector_Button_Data_multi = $8;
  bp_TElm_Fileselector_Button_Data_multi = 3;
  bm_TElm_Fileselector_Button_Data_hidden_visible = $10;
  bp_TElm_Fileselector_Button_Data_hidden_visible = 4;
  bm_TElm_Fileselector_Button_Data_inwin_mode = $1;
  bp_TElm_Fileselector_Button_Data_inwin_mode = 0;

function inwin_mode(var a : TElm_Fileselector_Button_Data) : TEina_Bool;
procedure set_inwin_mode(var a : TElm_Fileselector_Button_Data; __inwin_mode : TEina_Bool);
{*
 * @
  }

implementation

function inwin_mode(var a : TElm_Fileselector_Button_Data) : TEina_Bool;
begin
  inwin_mode:=(a.flag0 and bm_TElm_Fileselector_Button_Data_inwin_mode) shr bp_TElm_Fileselector_Button_Data_inwin_mode;
end;

procedure set_inwin_mode(var a : TElm_Fileselector_Button_Data; __inwin_mode : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__inwin_mode shl bp_TElm_Fileselector_Button_Data_inwin_mode) and bm_TElm_Fileselector_Button_Data_inwin_mode);
end;


end.
