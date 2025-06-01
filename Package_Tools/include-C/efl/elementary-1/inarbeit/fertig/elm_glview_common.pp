
unit elm_glview_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_glview_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_glview_common.h
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
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @addtogroup Elm_Glview_Group
 *
 * @
  }
type

  TElm_GLView_Func_Cb = procedure (obj:PEvas_Object);cdecl;
{*
 * @
  }

implementation


end.
