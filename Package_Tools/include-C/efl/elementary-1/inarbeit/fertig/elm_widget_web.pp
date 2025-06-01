
unit elm_widget_web;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_web.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_web.h
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
PElm_Web_Callback_Proxy_Context  = ^Elm_Web_Callback_Proxy_Context;
PElm_Web_Data  = ^Elm_Web_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_WEB_H}
{$define ELM_WIDGET_WEB_H}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-web-class The Elementary Web Class
 *
 * Elementary, besides having the @ref Web widget, exposes its
 * foundation -- the Elementary Web Class -- in order to create other
 * widgets which are a web view with some more logic on top.
  }
{*
 * Base widget smart data extended with web instance data.
  }
type
  PElm_Web_Data = ^TElm_Web_Data;
  TElm_Web_Data = record
      obj : PEvas_Object;
    end;

(* Const before type ignored *)
  PElm_Web_Callback_Proxy_Context = ^TElm_Web_Callback_Proxy_Context;
  TElm_Web_Callback_Proxy_Context = record
      name : Pchar;
      obj : PEvas_Object;
    end;


implementation


end.
