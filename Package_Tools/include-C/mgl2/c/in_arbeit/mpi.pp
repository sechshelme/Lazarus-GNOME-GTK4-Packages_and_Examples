
unit mpi;
interface

{
  Automatically converted by H2Pas 1.0.0 from mpi.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mpi.h
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



procedure mgl_mpi_send(gr:THMGL; id:longint);cdecl;external;
procedure mgl_mpi_recv(gr:THMGL; id:longint);cdecl;external;

implementation


end.
