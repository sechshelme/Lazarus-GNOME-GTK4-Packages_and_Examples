
unit gvcommon;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvcommon.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvcommon.h
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
PGVCOMMON_s  = ^GVCOMMON_s;
PGVCOMMON_t  = ^GVCOMMON_t;
Plt_symlist_t  = ^lt_symlist_t;
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
{$ifndef GVCOMMON_H}
{$define GVCOMMON_H}
{ C++ extern C conditionnal removed }
(* Const before type ignored *)
(* Const before type ignored *)
{ emit code for correct box coordinates  }
(* Const before type ignored *)
{ rendering state  }
{ current view - 1 based count of views,
			    all pages in all layers  }
(* Const before type ignored *)
type
  PGVCOMMON_s = ^TGVCOMMON_s;
  TGVCOMMON_s = record
      info : ^Pchar;
      cmdname : Pchar;
      verbose : longint;
      config : Tboolean;
      auto_outfile_names : Tboolean;
      errorfn : procedure (fmt:Pchar; args:array of const);cdecl;
      show_boxes : ^Pchar;
      lib : ^Pchar;
      viewNum : longint;
      builtins : Plt_symlist_t;
      demand_loading : longint;
    end;
  TGVCOMMON_t = TGVCOMMON_s;
  PGVCOMMON_t = ^TGVCOMMON_t;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GVCOMMON_H  }

implementation


end.
