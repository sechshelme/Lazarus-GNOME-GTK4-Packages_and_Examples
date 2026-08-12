
unit gegl_graph_debug;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_graph_debug.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_graph_debug.h
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
PGeglNode  = ^GeglNode;
PGeglRectangle  = ^GeglRectangle;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2013 Daniel Sabo
  }
{$ifndef __GEGL_GRAPH_DEBUG_H__}
{$define __GEGL_GRAPH_DEBUG_H__}
{*
 * gegl_graph_dump_outputs:
 * @node: The final node of the graph
 *
 * Dump the bounds and format of each node in the graph to stdout.
  }

procedure gegl_graph_dump_outputs(node:PGeglNode);cdecl;external;
{*
 * gegl_graph_dump_request:
 * @node: The final node of the graph
 * @roi: The request rectangle
 *
 * Dump the region that will be rendered for each node to fulfill
 * the request.
  }
(* Const before type ignored *)
procedure gegl_graph_dump_request(node:PGeglNode; roi:PGeglRectangle);cdecl;external;
{$endif}
{ __GEGL_GRAPH_DEBUG_H__  }

implementation


end.
