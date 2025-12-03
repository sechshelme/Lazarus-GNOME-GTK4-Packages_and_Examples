unit gvconfig;

interface

uses
  ctypes;

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

procedure gvconfig_plugin_install_from_library(gvc:PGVC_t; path:Pchar; library:Pgvplugin_library_t);cdecl;external libxxx;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GVCONFIG_H  }

// === Konventiert am: 3-12-25 15:08:01 ===


implementation



end.
