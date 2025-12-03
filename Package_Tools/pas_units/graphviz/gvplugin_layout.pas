unit gvplugin_layout;

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
{$ifndef GVPLUGIN_LAYOUT_H}
{$define GVPLUGIN_LAYOUT_H}
{$include "types.h"}
{$include "gvplugin.h"}
{$include "gvcjob.h"}
{ C++ extern C conditionnal removed }
type
  Pgvlayout_engine_s = ^Tgvlayout_engine_s;
  Tgvlayout_engine_s = record
      layout : procedure (g:Pgraph_t);cdecl;
      cleanup : procedure (g:Pgraph_t);cdecl;
    end;

{ C++ end of extern C conditionnal removed }
{$endif}
{ GVPLUGIN_LAYOUT_H  }

// === Konventiert am: 3-12-25 15:07:53 ===


implementation



end.
