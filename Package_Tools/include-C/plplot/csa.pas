unit csa;

interface

uses
  fp_plplot;

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
    csa_verbose : longint;cvar;external libplplot;
    csa_version : Pchar;cvar;external libplplot;
type
  Pcsa = ^Tcsa;
  Tcsa = record
      {undefined structure}
    end;


function csa_create:Pcsa;cdecl;external libplplot;
procedure csa_destroy(a:Pcsa);cdecl;external libplplot;
procedure csa_addpoints(a:Pcsa; n:longint; points:Ppoint);cdecl;external libplplot;
procedure csa_calculatespline(a:Pcsa);cdecl;external libplplot;
procedure csa_approximate_point(a:Pcsa; p:Ppoint);cdecl;external libplplot;
procedure csa_approximate_points(a:Pcsa; n:longint; points:Ppoint);cdecl;external libplplot;
procedure csa_setnpmin(a:Pcsa; npmin:longint);cdecl;external libplplot;
procedure csa_setnpmax(a:Pcsa; npmax:longint);cdecl;external libplplot;
procedure csa_setk(a:Pcsa; k:longint);cdecl;external libplplot;
procedure csa_setnpps(a:Pcsa; npps:Tdouble);cdecl;external libplplot;
{$endif}

// === Konventiert am: 31-3-26 20:04:58 ===


implementation



end.
