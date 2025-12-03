
unit gvpr;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvpr.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvpr.h
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
Pchar  = ^char;
Pgvprbinding  = ^gvprbinding;
Pgvpropts  = ^gvpropts;
Pssize_t  = ^ssize_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ $Id$Revision:  }
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
{ C++ extern C conditionnal removed }
{$ifndef GVPR_H}
{$define GVPR_H}
{$include "cgraph.h"}
{$ifdef _MSC_VER}
type
  Pssize_t = ^Tssize_t;
  Tssize_t = longint;
{$endif}
{ Bits for flags variable in gvprstate_t.
 * Included here so that calling programs can use the first
 * two in gvpropts.flags
  }
{ If set, gvpr calls exit() on errors  }

const
  GV_USE_EXIT = 1;  
{ If set, gvpr stores output graphs in gvpropts  }
  GV_USE_OUTGRAPH = 2;  
{ Use longjmp to return to top-level call in gvpr  }
  GV_USE_JUMP = 4;  
{ $tvnext has been set but not used  }
  GV_NEXT_SET = 8;  
(* Const before type ignored *)
type

  Tgvprwr = function (para1:pointer; buf:Pchar; nbyte:Tsize_t; para4:pointer):Tssize_t;cdecl;

  Tgvpruserfn = function (para1:Pchar):longint;cdecl;

  Pgvprbinding = ^Tgvprbinding;
  Tgvprbinding = record
      name : Pchar;
      fn : Tgvpruserfn;
    end;
{ NULL-terminated array of input graphs  }
{ if GV_USE_OUTGRAPH set, output graphs  }
{ write function for stdout  }
{ write function for stderr  }
{ array of bindings, terminated with NULL,NULL  }

  Pgvpropts = ^Tgvpropts;
  Tgvpropts = record
      ingraphs : ^PAgraph_t;
      n_outgraphs : longint;
      outgraphs : ^PAgraph_t;
      out : Tgvprwr;
      err : Tgvprwr;
      flags : longint;
      bindings : Pgvprbinding;
    end;

function gvpr(argc:longint; argv:PPchar; opts:Pgvpropts):longint;cdecl;external;
{$endif}
{ C++ end of extern C conditionnal removed }

implementation


end.
