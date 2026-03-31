
unit csa;
interface

{
  Automatically converted by H2Pas 1.0.0 from csa.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    csa.h
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
Pcsa  = ^csa;
Ppoint  = ^point;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{-------------------------------------------------------------------------- }
{ }
{ File:           csa.h }
{ }
{ Created:        16/10/2002 }
{ }
{ Author:         Pavel Sakov }
{                 CSIRO Marine Research }
{ }
{ Purpose:        A header for csa library (2D data approximation with }
{                 bivariate C1 cubic spline) }
{ }
{ Revisions:      None }
{ }
{-------------------------------------------------------------------------- }
{$if !defined ( _CSA_H )}
{$define _CSA_H}
{ include header file for dll definitions }
{$include "csadll.h"}
{$if _MSC_VER > 1309}

const
  hypot = _hypot;  
{$endif}
{$if !defined ( _POINT_STRUCT )}
{$define _POINT_STRUCT}
type
  Ppoint = ^Tpoint;
  Tpoint = record
      x : Tdouble;
      y : Tdouble;
      z : Tdouble;
    end;
{$endif}
  var
    csa_verbose : longint;cvar;external;
(* Const before type ignored *)
    csa_version : Pchar;cvar;external;
type
  Pcsa = ^Tcsa;
  Tcsa = record
      {undefined structure}
    end;


function csa_create:Pcsa;cdecl;external;
procedure csa_destroy(a:Pcsa);cdecl;external;
procedure csa_addpoints(a:Pcsa; n:longint; points:Ppoint);cdecl;external;
procedure csa_calculatespline(a:Pcsa);cdecl;external;
procedure csa_approximate_point(a:Pcsa; p:Ppoint);cdecl;external;
procedure csa_approximate_points(a:Pcsa; n:longint; points:Ppoint);cdecl;external;
procedure csa_setnpmin(a:Pcsa; npmin:longint);cdecl;external;
procedure csa_setnpmax(a:Pcsa; npmax:longint);cdecl;external;
procedure csa_setk(a:Pcsa; k:longint);cdecl;external;
procedure csa_setnpps(a:Pcsa; npps:Tdouble);cdecl;external;
{$endif}

implementation


end.
