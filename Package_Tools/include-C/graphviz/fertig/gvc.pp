
unit gvc;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvc.h
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
Pdword  = ^dword;
PFILE  = ^FILE;
Pgraph_t  = ^graph_t;
PGVC_t  = ^GVC_t;
Pgvplugin_library_t  = ^gvplugin_library_t;
Plongint  = ^longint;
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
{$ifndef			GVC_H}
{$define GVC_H}
{$include "types.h"}
{$include "gvplugin.h"}
{ C++ extern C conditionnal removed }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LAYOUT_DONE(g : longint) : longint;

{ misc  }
{ FIXME - this needs eliminating or renaming  }
procedure gvToggle(para1:longint);cdecl;external;
{ set up a graphviz context  }
(* Const before type ignored *)
function gvNEWcontext(builtins:Plt_symlist_t; demand_loading:longint):PGVC_t;cdecl;external;
{  set up a graphviz context - and init graph - retaining old API  }
function gvContext:PGVC_t;cdecl;external;
{  set up a graphviz context - and init graph - with builtins  }
(* Const before type ignored *)
function gvContextPlugins(builtins:Plt_symlist_t; demand_loading:longint):PGVC_t;cdecl;external;
{ get information associated with a graphviz context  }
function gvcInfo(para1:PGVC_t):^Pchar;cdecl;external;
function gvcVersion(para1:PGVC_t):Pchar;cdecl;external;
function gvcBuildDate(para1:PGVC_t):Pchar;cdecl;external;
{ parse command line args - minimally argv[0] sets layout engine  }
function gvParseArgs(gvc:PGVC_t; argc:longint; argv:PPchar):longint;cdecl;external;
function gvNextInputGraph(gvc:PGVC_t):Pgraph_t;cdecl;external;
function gvPluginsGraph(gvc:PGVC_t):Pgraph_t;cdecl;external;
{ Compute a layout using a specified engine  }
(* Const before type ignored *)
function gvLayout(gvc:PGVC_t; g:Pgraph_t; engine:Pchar):longint;cdecl;external;
{ Compute a layout using layout engine from command line args  }
function gvLayoutJobs(gvc:PGVC_t; g:Pgraph_t):longint;cdecl;external;
{ Render layout into string attributes of the graph  }
procedure attach_attrs(g:Pgraph_t);cdecl;external;
{ Render layout in a specified format to an open FILE  }
(* Const before type ignored *)
function gvRender(gvc:PGVC_t; g:Pgraph_t; format:Pchar; out:PFILE):longint;cdecl;external;
{ Render layout in a specified format to a file with the given name  }
(* Const before type ignored *)
(* Const before type ignored *)
function gvRenderFilename(gvc:PGVC_t; g:Pgraph_t; format:Pchar; filename:Pchar):longint;cdecl;external;
{ Render layout in a specified format to an external context  }
(* Const before type ignored *)
function gvRenderContext(gvc:PGVC_t; g:Pgraph_t; format:Pchar; context:pointer):longint;cdecl;external;
{ Render layout in a specified format to a malloc'ed string  }
(* Const before type ignored *)
function gvRenderData(gvc:PGVC_t; g:Pgraph_t; format:Pchar; result:PPchar; length:Pdword):longint;cdecl;external;
{ Free memory allocated and pointed to by *result in gvRenderData  }
procedure gvFreeRenderData(data:Pchar);cdecl;external;
{ Render layout according to -T and -o options found by gvParseArgs  }
function gvRenderJobs(gvc:PGVC_t; g:Pgraph_t):longint;cdecl;external;
{ Clean up layout data structures - layouts are not nestable (yet)  }
function gvFreeLayout(gvc:PGVC_t; g:Pgraph_t):longint;cdecl;external;
{ Clean up graphviz context  }
procedure gvFinalize(gvc:PGVC_t);cdecl;external;
function gvFreeContext(gvc:PGVC_t):longint;cdecl;external;
{ Return list of plugins of type kind.
 * kind would normally be "render" "layout" "textlayout" "device" "loadimage"
 * The size of the list is stored in sz.
 * The caller is responsible for freeing the storage. This involves
 * freeing each item, then the list.
 * Returns NULL on error, or if there are no plugins.
 * In the former case, sz is unchanged; in the latter, sz = 0.
 *
 * At present, the str argument is unused, but may be used to modify
 * the search as in gvplugin_list above.
  }
(* Const before type ignored *)
function gvPluginList(gvc:PGVC_t; kind:Pchar; sz:Plongint; para4:Pchar):^Pchar;cdecl;external;
{* Add a library from your user application
 * @param gvc Graphviz context to add library to
 * @param lib library to add
  }
procedure gvAddLibrary(gvc:PGVC_t; lib:Pgvplugin_library_t);cdecl;external;
{* Perform a Transitive Reduction on a graph
 * @param g  graph to be transformed.
  }
function gvToolTred(g:Pgraph_t):longint;cdecl;external;
{$undef extern}
{ C++ end of extern C conditionnal removed }
{$endif}
{ GVC_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LAYOUT_DONE(g : longint) : longint;
begin
  LAYOUT_DONE:=(agbindrec(g,'Agraphinfo_t',0,_TRUE)) and (@(GD_drawing(g)));
end;


end.
