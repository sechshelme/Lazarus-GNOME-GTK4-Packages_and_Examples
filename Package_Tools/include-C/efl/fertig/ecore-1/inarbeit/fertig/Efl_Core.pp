
unit Efl_Core;
interface

{
  Automatically converted by H2Pas 1.0.0 from Efl_Core.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Efl_Core.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CORE_H}
{$define _EFL_CORE_H}
{$include <Efl_Config.h>}
{$include <Eina.h>}
{$include <Eo.h>}
{$include <Efl.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{$include <sys/types.h>}
{ C++ extern C conditionnal removed }
  var
    _efl_startup_time : Tdouble;cvar;external;
{$include "Ecore_Common.h"}
{$include "Ecore_Eo.h"}
{ C++ end of extern C conditionnal removed }
{$endif}
{ We are including efl_general.h again, just in case Efl_Core.h was already included before this }
{ and the __EFL_*_IS_REQUIRED changed since then. }
{$include "efl_general.h"}

implementation


end.
