
unit gvplugin_loadimage;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvplugin_loadimage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvplugin_loadimage.h
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
PGVJ_t  = ^GVJ_t;
Pgvloadimage_engine_s  = ^gvloadimage_engine_s;
Pusershape_t  = ^usershape_t;
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
{$ifndef GVPLUGIN_IMAGELOAD_H}
{$define GVPLUGIN_IMAGELOAD_H}
{$include "types.h"}
{$include "gvplugin.h"}
{$include "gvcjob.h"}
{ C++ extern C conditionnal removed }

function gvusershape_file_access(us:Pusershape_t):Tboolean;cdecl;external;
procedure gvusershape_file_release(us:Pusershape_t);cdecl;external;
type
  Pgvloadimage_engine_s = ^Tgvloadimage_engine_s;
  Tgvloadimage_engine_s = record
      loadimage : procedure (job:PGVJ_t; us:Pusershape_t; b:Tboxf; filled:Tboolean);cdecl;
    end;

{$ifdef extern}
{$undef extern}
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}
{ GVPLUGIN_IMAGELOAD_H  }

implementation


end.
