
unit elm_progressbar_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_progressbar_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    elm_progressbar_common.h
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
Pprogressbar_func_full_type  = ^progressbar_func_full_type;
Pprogressbar_func_type  = ^progressbar_func_type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @addtogroup Elm_Progressbar
 *
 * @
  }
type
  Pprogressbar_func_type = ^Tprogressbar_func_type;
  Tprogressbar_func_type = function (para1:Tdouble):Pchar;cdecl;

  Pprogressbar_func_full_type = ^Tprogressbar_func_full_type;
  Tprogressbar_func_full_type = function (para1:Tdouble; para2:pointer):Pchar;cdecl;

  Tprogressbar_freefunc_type = procedure (para1:Pchar);cdecl;
{*
 * @
  }

implementation


end.
