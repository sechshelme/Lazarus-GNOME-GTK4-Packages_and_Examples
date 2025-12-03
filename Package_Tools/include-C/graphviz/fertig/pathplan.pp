
unit pathplan;
interface

{
  Automatically converted by H2Pas 1.0.0 from pathplan.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pathplan.h
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
Plongint  = ^longint;
PPedge_t  = ^Pedge_t;
PPpoly_t  = ^Ppoly_t;
PPpolyline_t  = ^Ppolyline_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ $Id$ $Revision$  }
{ vim:set shiftwidth=4 ts=8:  }
{************************************************************************
 * Copyright (c) 2011 AT&T Intellectual Property 
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors: See CVS logs. Details at http://www.graphviz.org/
 ************************************************************************ }
{$ifndef _PATH_INCLUDE}
{$define _PATH_INCLUDE}
{$include "pathgeom.h"}
{ C++ extern C conditionnal removed }
{ find shortest euclidean path within a simple polygon  }

function Pshortestpath(boundary:PPpoly_t; endpoints:array[0..1] of TPpoint_t; output_route:PPpolyline_t):longint;cdecl;external;
{ fit a spline to an input polyline, without touching barrier segments  }
function Proutespline(barriers:PPedge_t; n_barriers:longint; input_route:TPpolyline_t; endpoint_slopes:array[0..1] of TPvector_t; output_route:PPpolyline_t):longint;cdecl;external;
{ utility function to convert from a set of polygonal obstacles to barriers  }
function Ppolybarriers(polys:PPPpoly_t; npolys:longint; barriers:PPPedge_t; n_barriers:Plongint):longint;cdecl;external;
{ function to convert a polyline into a spline representation  }
procedure make_polyline(line:TPpolyline_t; sline:PPpolyline_t);cdecl;external;
{$undef extern}
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
