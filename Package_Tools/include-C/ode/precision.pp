
unit precision;
interface

{
  Automatically converted by H2Pas 1.0.0 from precision.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    precision.h
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


{$ifndef _ODE_PRECISION_H_}
{$define _ODE_PRECISION_H_}
{ Define dSINGLE for single precision, dDOUBLE for double precision,
 * but never both!
  }
{$if defined(dIDESINGLE)}
{$define dSINGLE}
(*** was #elif ****){$else defined(dIDEDOUBLE)}
{$define dDOUBLE}
{$else}
{$define dDOUBLE}
{$endif}
{$endif}

implementation


end.
