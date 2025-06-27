
unit mgl_cf;
interface

{
  Automatically converted by H2Pas 1.0.0 from mgl_cf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mgl_cf.h
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



function mgl_create_graph_gl:THMGL;cdecl;external;

implementation


end.
