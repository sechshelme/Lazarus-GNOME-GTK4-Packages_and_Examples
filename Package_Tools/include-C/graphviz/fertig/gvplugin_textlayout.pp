
unit gvplugin_textlayout;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvplugin_textlayout.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvplugin_textlayout.h
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
Pgvtextlayout_engine_s  = ^gvtextlayout_engine_s;
Ptextspan_t  = ^textspan_t;
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
{$ifndef GVPLUGIN_TEXTLAYOUT_H}
{$define GVPLUGIN_TEXTLAYOUT_H}
{$include "types.h"}
{$include "gvplugin.h"}
{$include "gvcjob.h"}
{$include "gvcommon.h"}
{ C++ extern C conditionnal removed }
type
  Pgvtextlayout_engine_s = ^Tgvtextlayout_engine_s;
  Tgvtextlayout_engine_s = record
      textlayout : function (span:Ptextspan_t; fontpath:PPchar):Tboolean;cdecl;
    end;

{ C++ end of extern C conditionnal removed }
{$endif}
{ GVPLUGIN_TEXTLAYOUT_H  }

implementation


end.
