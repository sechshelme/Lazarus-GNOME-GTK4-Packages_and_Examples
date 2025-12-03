
unit pathgeom;
interface

{
  Automatically converted by H2Pas 1.0.0 from pathgeom.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pathgeom.h
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
PPedge_t  = ^Pedge_t;
PPpoint_t  = ^Ppoint_t;
PPpoly_t  = ^Ppoly_t;
PPpolyline_t  = ^Ppolyline_t;
PPxy_t  = ^Pxy_t;
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

procedure freePath(p:PPpolyline_t);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
