
unit array;
interface

{
  Automatically converted by H2Pas 1.0.0 from array.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    array.h
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
Pcfp_api  = ^cfp_api;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef CFP_ARRAY_H}
{$define CFP_ARRAY_H}
{$include <stddef.h>}
{$include "zfp/internal/cfp/header.h"}
{$include "zfp/internal/cfp/array1f.h"}
{$include "zfp/internal/cfp/array1d.h"}
{$include "zfp/internal/cfp/array2f.h"}
{$include "zfp/internal/cfp/array2d.h"}
{$include "zfp/internal/cfp/array3f.h"}
{$include "zfp/internal/cfp/array3d.h"}
{$include "zfp/internal/cfp/array4f.h"}
{$include "zfp/internal/cfp/array4d.h"}
type
  Pcfp_api = ^Tcfp_api;
  Tcfp_api = record
      array1f : Tcfp_array1f_api;
      array1d : Tcfp_array1d_api;
      array2f : Tcfp_array2f_api;
      array2d : Tcfp_array2d_api;
      array3f : Tcfp_array3f_api;
      array3d : Tcfp_array3d_api;
      array4f : Tcfp_array4f_api;
      array4d : Tcfp_array4d_api;
    end;
{$ifndef CFP_NAMESPACE}

const
  CFP_NAMESPACE = cfp;  
{$endif}
(* Const before type ignored *)
  var
    CFP_NAMESPACE : Tcfp_api;cvar;external;
{$endif}

implementation


end.
