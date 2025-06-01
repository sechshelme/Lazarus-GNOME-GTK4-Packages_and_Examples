
unit elm_slider_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_slider_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_slider_common.h
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
Pslider_func_full_type  = ^slider_func_full_type;
Pslider_func_type  = ^slider_func_type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @addtogroup Elm_Slider
 *
 * @
  }
type
  Pslider_func_type = ^Tslider_func_type;
  Tslider_func_type = function (para1:Tdouble):Pchar;cdecl;

  Pslider_func_full_type = ^Tslider_func_full_type;
  Tslider_func_full_type = function (para1:Tdouble; para2:pointer):Pchar;cdecl;

  Tslider_freefunc_type = procedure (para1:Pchar);cdecl;
{*
 * @
  }

implementation


end.
