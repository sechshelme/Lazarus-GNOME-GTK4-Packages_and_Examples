unit gvplugin_loadimage;

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
{$ifndef GVPLUGIN_IMAGELOAD_H}
{$define GVPLUGIN_IMAGELOAD_H}
{$include "types.h"}
{$include "gvplugin.h"}
{$include "gvcjob.h"}
{ C++ extern C conditionnal removed }

function gvusershape_file_access(us:Pusershape_t):Tboolean;cdecl;external libxxx;
procedure gvusershape_file_release(us:Pusershape_t);cdecl;external libxxx;
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

// === Konventiert am: 3-12-25 15:07:50 ===


implementation



end.
