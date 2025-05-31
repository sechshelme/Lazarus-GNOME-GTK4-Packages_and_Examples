
unit efl_ui_bg_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_bg_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_bg_private.h
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
PEfl_Ui_Bg_Data  = ^Efl_Ui_Bg_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_BG_H}
{$define ELM_WIDGET_BG_H}
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
 * @section elm-bg-class The Elementary Bg Class
 *
 * Elementary, besides having the @ref Bg widget, exposes its
 * foundation -- the Elementary Bg Class -- in order to create other
 * widgets which are a bg with some more logic on top.
  }
{*
 * Base layout smart data extended with bg instance data.
  }
type
{<< Used for elm_bg_color_set(): elm.swallow.rectangle  }
{<< Used for elm_bg_file_set(): elm.swallow.content  }
(* Const before type ignored *)
{<< Used for elm_bg_file_set() with legacy widget  }
(* Const before type ignored *)
{<< Used for elm_bg_file_set() with legacy widget  }
  PEfl_Ui_Bg_Data = ^TEfl_Ui_Bg_Data;
  TEfl_Ui_Bg_Data = record
      rect : PEvas_Object;
      img : PEvas_Object;
      file : Pchar;
      key : Pchar;
    end;

{*
 * @
  }

implementation


end.
