
unit elm_widget_combobox;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_combobox.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_combobox.h
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
PEfl_Class  = ^Efl_Class;
PElm_Combobox_Data  = ^Elm_Combobox_Data;
PElm_Object_Item  = ^Elm_Object_Item;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_COMBOBOX_H}
{$define ELM_WIDGET_COMBOBOX_H}
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
 * @section elm-combobox-class The Elementary Combobox Class
 *
 * Elementary, besides having the @ref Combobox widget, exposes its
 * foundation -- the Elementary Combobox Class -- in order to create other
 * widgets which are a combobox with some more logic on top.
  }
{*
 * Base button smart data extended with combobox instance data.
  }
type
{ aggregates a hover  }
(* Const before type ignored *)
(* Const before type ignored *)
  PElm_Combobox_Data = ^TElm_Combobox_Data;
  TElm_Combobox_Data = record
      hover : PEvas_Object;
      hover_parent : PEvas_Object;
      genlist : PEvas_Object;
      entry : PEvas_Object;
      tbl : PEvas_Object;
      spacer : PEvas_Object;
      item : PElm_Object_Item;
      style : Pchar;
      best_location : Pchar;
      count : longint;
      item_height : longint;
      flag0 : word;
    end;


const
  bm_TElm_Combobox_Data_expanded = $1;
  bp_TElm_Combobox_Data_expanded = 0;
  bm_TElm_Combobox_Data_first_filter = $2;
  bp_TElm_Combobox_Data_first_filter = 1;

function expanded(var a : TElm_Combobox_Data) : TEina_Bool;
procedure set_expanded(var a : TElm_Combobox_Data; __expanded : TEina_Bool);
function first_filter(var a : TElm_Combobox_Data) : TEina_Bool;
procedure set_first_filter(var a : TElm_Combobox_Data; __first_filter : TEina_Bool);
{*
 * @
  }

{ was #define dname def_expr }
function ELM_COMBOBOX_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function elm_combobox_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

function expanded(var a : TElm_Combobox_Data) : TEina_Bool;
begin
  expanded:=(a.flag0 and bm_TElm_Combobox_Data_expanded) shr bp_TElm_Combobox_Data_expanded;
end;

procedure set_expanded(var a : TElm_Combobox_Data; __expanded : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__expanded shl bp_TElm_Combobox_Data_expanded) and bm_TElm_Combobox_Data_expanded);
end;

function first_filter(var a : TElm_Combobox_Data) : TEina_Bool;
begin
  first_filter:=(a.flag0 and bm_TElm_Combobox_Data_first_filter) shr bp_TElm_Combobox_Data_first_filter;
end;

procedure set_first_filter(var a : TElm_Combobox_Data; __first_filter : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__first_filter shl bp_TElm_Combobox_Data_first_filter) and bm_TElm_Combobox_Data_first_filter);
end;

{ was #define dname def_expr }
function ELM_COMBOBOX_CLASS : longint; { return type might be wrong }
  begin
    ELM_COMBOBOX_CLASS:=elm_combobox_class_get;
  end;


end.
