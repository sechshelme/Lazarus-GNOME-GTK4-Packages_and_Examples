
unit sokol_glue;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_glue.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_glue.h
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



function sglue_environment:Tsg_environment;cdecl;external;
function sglue_swapchain:Tsg_swapchain;cdecl;external;

implementation


end.
