
unit endianness;
interface

{
  Automatically converted by H2Pas 1.0.0 from endianness.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    endianness.h
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


{$if !defined (L_BIG_ENDIAN) && !defined (L_LITTLE_ENDIAN)}
{$if 0}
{$ifdef __BIG_ENDIAN__}
{$define L_BIG_ENDIAN}
{$else}
{$define L_LITTLE_ENDIAN}
{$endif}
{$else}
{$define L_LITTLE_ENDIAN}
{$endif}
{$endif}

implementation


end.
