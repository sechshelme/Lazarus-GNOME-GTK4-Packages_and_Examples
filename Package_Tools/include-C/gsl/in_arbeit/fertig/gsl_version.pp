
unit gsl_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_version.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __GSL_VERSION_H__}
{$define __GSL_VERSION_H__}
{$include <gsl/gsl_types.h>}

const
  GSL_VERSION = '2.7.1';  
  GSL_MAJOR_VERSION = 2;  
  GSL_MINOR_VERSION = 7;  
(* Const before type ignored *)
  var
    gsl_version : Pchar;cvar;external;
{$endif}
{ __GSL_VERSION_H__  }

implementation


end.
