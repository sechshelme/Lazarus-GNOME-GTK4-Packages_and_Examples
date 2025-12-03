
unit gvconfig;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvconfig.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvconfig.h
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
PGVC_t  = ^GVC_t;
Pgvplugin_library_t  = ^gvplugin_library_t;
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
{ Header used by plugins  }
{$ifndef GVCONFIG_H}
{$define GVCONFIG_H}
{$include "gvplugin.h"}
{ C++ extern C conditionnal removed }

procedure gvconfig_plugin_install_from_library(gvc:PGVC_t; path:Pchar; library:Pgvplugin_library_t);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GVCONFIG_H  }

implementation


end.
