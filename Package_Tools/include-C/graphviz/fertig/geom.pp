
unit geom;
interface

{
  Automatically converted by H2Pas 1.0.0 from geom.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    geom.h
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
Pbox  = ^box;
Pboxf  = ^boxf;
Ppoint  = ^point;
Ppointf  = ^pointf;
Ppointf_s  = ^pointf_s;
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
{ geometric types and macros (e.g. points and boxes) with application to, but
 * no specific dependence on graphs  }
{$ifndef GV_GEOM_H}
{$define GV_GEOM_H}
{$include "arith.h"}
{ C++ extern C conditionnal removed }
type
  Ppoint = ^Tpoint;
  Tpoint = record
      x : longint;
      y : longint;
    end;

  Ppointf_s = ^Tpointf_s;
  Tpointf_s = record
      x : Tdouble;
      y : Tdouble;
    end;
  Tpointf = Tpointf_s;
  Ppointf = ^Tpointf;
{ tell pathplan/pathgeom.h  }
{$define HAVE_POINTF_S}

  Pbox = ^Tbox;
  Tbox = record
      LL : Tpoint;
      UR : Tpoint;
    end;

  Pboxf = ^Tboxf;
  Tboxf = record
      LL : Tpointf;
      UR : Tpointf;
    end;
{ some common tolerance values  }

const
  MILLIPOINT = 0.001;  
  MICROPOINT = 0.000001;  
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
