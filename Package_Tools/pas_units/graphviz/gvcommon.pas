unit gvcommon;

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
{$ifndef GVCOMMON_H}
{$define GVCOMMON_H}
{ C++ extern C conditionnal removed }
{ emit code for correct box coordinates  }
{ rendering state  }
{ current view - 1 based count of views,
			    all pages in all layers  }
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

// === Konventiert am: 3-12-25 15:08:04 ===


implementation



end.
