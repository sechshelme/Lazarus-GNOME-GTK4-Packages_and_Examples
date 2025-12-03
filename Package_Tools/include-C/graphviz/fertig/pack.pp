
unit pack;
interface

{
  Automatically converted by H2Pas 1.0.0 from pack.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pack.h
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
PAgraph_t  = ^Agraph_t;
Pboolean  = ^boolean;
Pboxf  = ^boxf;
Pchar  = ^char;
Plongint  = ^longint;
Ppack_info  = ^pack_info;
Ppack_mode  = ^pack_mode;
Ppackval_t  = ^packval_t;
Ppoint  = ^point;
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
{$ifndef _PACK_H}

const
  _PACK_H = 1;  
{ C++ extern C conditionnal removed }
{$include "types.h"}
{ Type indicating granularity and method 
 *  l_undef    - unspecified
 *  l_node     - polyomino using nodes and edges
 *  l_clust    - polyomino using nodes and edges and top-level clusters
 *               (assumes ND_clust(n) unused by application)
 *  l_graph    - polyomino using computer graph bounding box
 *  l_array    - array based on graph bounding boxes
 *  l_aspect   - tiling based on graph bounding boxes preserving aspect ratio
 *  l_hull     - polyomino using convex hull (unimplemented)
 *  l_tile     - tiling using graph bounding box (unimplemented)
 *  l_bisect   - alternate bisection using graph bounding box (unimplemented)
  }
type
  Ppack_mode = ^Tpack_mode;
  Tpack_mode =  Longint;
  Const
    l_undef = 0;
    l_clust = 1;
    l_node = 2;
    l_graph = 3;
    l_array = 4;
    l_aspect = 5;
;
  PK_COL_MAJOR = 1 shl 0;  
  PK_USER_VALS = 1 shl 1;  
  PK_LEFT_ALIGN = 1 shl 2;  
  PK_RIGHT_ALIGN = 1 shl 3;  
  PK_TOP_ALIGN = 1 shl 4;  
  PK_BOT_ALIGN = 1 shl 5;  
  PK_INPUT_ORDER = 1 shl 6;  
type
  Ppackval_t = ^Tpackval_t;
  Tpackval_t = dword;
{ desired aspect ratio  }
{ row/column size size  }
{ margin left around objects, in points  }
{ use splines in constructing graph shape  }
{ granularity and method  }
{ fixed[i] == true implies g[i] should not be moved  }
{ for arrays, sort numbers  }

  Ppack_info = ^Tpack_info;
  Tpack_info = record
      aspect : single;
      sz : longint;
      margin : dword;
      doSplines : longint;
      mode : Tpack_mode;
      fixed : Pboolean;
      vals : Ppackval_t;
      flags : longint;
    end;
{visual studio }
{end visual studio }

function putRects(ng:longint; bbs:Pboxf; pinfo:Ppack_info):Ppoint;cdecl;external;
function packRects(ng:longint; bbs:Pboxf; pinfo:Ppack_info):longint;cdecl;external;
function putGraphs(para1:longint; para2:PPAgraph_t; para3:PAgraph_t; para4:Ppack_info):Ppoint;cdecl;external;
function packGraphs(para1:longint; para2:PPAgraph_t; para3:PAgraph_t; para4:Ppack_info):longint;cdecl;external;
function packSubgraphs(para1:longint; para2:PPAgraph_t; para3:PAgraph_t; para4:Ppack_info):longint;cdecl;external;
function pack_graph(ng:longint; gs:PPAgraph_t; root:PAgraph_t; fixed:Pboolean):longint;cdecl;external;
function shiftGraphs(para1:longint; para2:PPAgraph_t; para3:Ppoint; para4:PAgraph_t; para5:longint):longint;cdecl;external;
function getPackMode(g:PAgraph_t; dflt:Tpack_mode):Tpack_mode;cdecl;external;
function getPack(para1:PAgraph_t; not_def:longint; dflt:longint):longint;cdecl;external;
function getPackInfo(g:PAgraph_t; dflt:Tpack_mode; dfltMargin:longint; para4:Ppack_info):Tpack_mode;cdecl;external;
function getPackModeInfo(g:PAgraph_t; dflt:Tpack_mode; para3:Ppack_info):Tpack_mode;cdecl;external;
function parsePackModeInfo(p:Pchar; dflt:Tpack_mode; pinfo:Ppack_info):Tpack_mode;cdecl;external;
function isConnected(para1:PAgraph_t):longint;cdecl;external;
function ccomps(para1:PAgraph_t; para2:Plongint; para3:Pchar):^PAgraph_t;cdecl;external;
function cccomps(para1:PAgraph_t; para2:Plongint; para3:Pchar):^PAgraph_t;cdecl;external;
function pccomps(para1:PAgraph_t; para2:Plongint; para3:Pchar; para4:Pboolean):^PAgraph_t;cdecl;external;
function nodeInduce(para1:PAgraph_t):longint;cdecl;external;
function mapClust(para1:PAgraph_t):PAgraph_t;cdecl;external;
{$undef extern}
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
