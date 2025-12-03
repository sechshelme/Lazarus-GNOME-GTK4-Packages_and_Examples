unit gvplugin_render;

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
{$ifndef GVPLUGIN_RENDER_H}
{$define GVPLUGIN_RENDER_H}
{$include "types.h"}
{$include "gvplugin.h"}
{$include "gvcjob.h"}
{ C++ extern C conditionnal removed }
type
  Pgvrender_engine_s = ^Tgvrender_engine_s;
  Tgvrender_engine_s = record
      begin_job : procedure (job:PGVJ_t);cdecl;
      end_job : procedure (job:PGVJ_t);cdecl;
      begin_graph : procedure (job:PGVJ_t);cdecl;
      end_graph : procedure (job:PGVJ_t);cdecl;
      begin_layer : procedure (job:PGVJ_t; layername:Pchar; layerNum:longint; numLayers:longint);cdecl;
      end_layer : procedure (job:PGVJ_t);cdecl;
      begin_page : procedure (job:PGVJ_t);cdecl;
      end_page : procedure (job:PGVJ_t);cdecl;
      begin_cluster : procedure (job:PGVJ_t);cdecl;
      end_cluster : procedure (job:PGVJ_t);cdecl;
      begin_nodes : procedure (job:PGVJ_t);cdecl;
      end_nodes : procedure (job:PGVJ_t);cdecl;
      begin_edges : procedure (job:PGVJ_t);cdecl;
      end_edges : procedure (job:PGVJ_t);cdecl;
      begin_node : procedure (job:PGVJ_t);cdecl;
      end_node : procedure (job:PGVJ_t);cdecl;
      begin_edge : procedure (job:PGVJ_t);cdecl;
      end_edge : procedure (job:PGVJ_t);cdecl;
      begin_anchor : procedure (job:PGVJ_t; href:Pchar; tooltip:Pchar; target:Pchar; id:Pchar);cdecl;
      end_anchor : procedure (job:PGVJ_t);cdecl;
      begin_label : procedure (job:PGVJ_t; _type:Tlabel_type);cdecl;
      end_label : procedure (job:PGVJ_t);cdecl;
      textspan : procedure (job:PGVJ_t; p:Tpointf; span:Ptextspan_t);cdecl;
      resolve_color : procedure (job:PGVJ_t; color:Pgvcolor_t);cdecl;
      ellipse : procedure (job:PGVJ_t; A:Ppointf; filled:longint);cdecl;
      polygon : procedure (job:PGVJ_t; A:Ppointf; n:longint; filled:longint);cdecl;
      beziercurve : procedure (job:PGVJ_t; A:Ppointf; n:longint; arrow_at_start:longint; arrow_at_end:longint; 
                    para6:longint);cdecl;
      polyline : procedure (job:PGVJ_t; A:Ppointf; n:longint);cdecl;
      comment : procedure (job:PGVJ_t; comment:Pchar);cdecl;
      library_shape : procedure (job:PGVJ_t; name:Pchar; A:Ppointf; n:longint; filled:longint);cdecl;
    end;

{ C++ end of extern C conditionnal removed }
{$endif}
{ GVPLUGIN_RENDER_H  }

// === Konventiert am: 3-12-25 15:07:47 ===


implementation



end.
