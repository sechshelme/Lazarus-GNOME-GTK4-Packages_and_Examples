
unit gvplugin_device;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvplugin_device.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvplugin_device.h
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
Pgvdevice_engine_s  = ^gvdevice_engine_s;
PGVJ_t  = ^GVJ_t;
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
{$ifndef GVDEVICE_PLUGIN_H}
{$define GVDEVICE_PLUGIN_H}
{$include "types.h"}
{$include "gvplugin.h"}
{$include "gvcjob.h"}
{ C++ extern C conditionnal removed }
type
  Pgvdevice_engine_s = ^Tgvdevice_engine_s;
  Tgvdevice_engine_s = record
      initialize : procedure (firstjob:PGVJ_t);cdecl;
      format : procedure (firstjob:PGVJ_t);cdecl;
      finalize : procedure (firstjob:PGVJ_t);cdecl;
    end;

{ C++ end of extern C conditionnal removed }
{$endif}
{ GVDEVICE_PLUGIN_H  }

implementation


end.
