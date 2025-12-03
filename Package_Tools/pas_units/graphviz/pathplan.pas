unit pathplan;

interface

uses
  ctypes;

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

function Pshortestpath(boundary:PPpoly_t; endpoints:array[0..1] of TPpoint_t; output_route:PPpolyline_t):longint;cdecl;external libxxx;
{ fit a spline to an input polyline, without touching barrier segments  }
function Proutespline(barriers:PPedge_t; n_barriers:longint; input_route:TPpolyline_t; endpoint_slopes:array[0..1] of TPvector_t; output_route:PPpolyline_t):longint;cdecl;external libxxx;
{ utility function to convert from a set of polygonal obstacles to barriers  }
function Ppolybarriers(polys:PPPpoly_t; npolys:longint; barriers:PPPedge_t; n_barriers:Plongint):longint;cdecl;external libxxx;
{ function to convert a polyline into a spline representation  }
procedure make_polyline(line:TPpolyline_t; sline:PPpolyline_t);cdecl;external libxxx;
{$undef extern}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 3-12-25 15:07:33 ===


implementation



end.
