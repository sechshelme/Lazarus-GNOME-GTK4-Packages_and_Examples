unit pathgeom;

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
{$ifndef _PATHGEOM_INCLUDE}
{$define _PATHGEOM_INCLUDE}
{ C++ extern C conditionnal removed }
{$ifdef HAVE_POINTF_S}
type
  Tpointf_s = TPpoint_t;
  Tpointf_s = TPvector_t;
{$else}
type
  PPxy_t = ^TPxy_t;
  TPxy_t = record
      x : Tdouble;
      y : Tdouble;
    end;
  TPxy_t = TPpoint_t;
  TPxy_t = TPvector_t;
{$endif}
type
  PPpoly_t = ^TPpoly_t;
  TPpoly_t = record
      ps : PPpoint_t;
      pn : longint;
    end;

  PPpolyline_t = ^TPpolyline_t;
  TPpolyline_t = TPpoly_t;

  PPedge_t = ^TPedge_t;
  TPedge_t = record
      a : TPpoint_t;
      b : TPpoint_t;
    end;
{ opaque state handle for visibility graph operations  }
  Tvconfig_s = Tvconfig_t;

procedure freePath(p:PPpolyline_t);cdecl;external libxxx;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 3-12-25 15:07:35 ===


implementation



end.
