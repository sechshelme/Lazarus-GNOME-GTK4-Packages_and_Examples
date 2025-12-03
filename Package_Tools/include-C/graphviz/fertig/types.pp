
unit types;
interface

{
  Automatically converted by H2Pas 1.0.0 from types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    types.h
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
Padjmatrix_t  = ^adjmatrix_t;
PAgedgeinfo_t  = ^Agedgeinfo_t;
PAgnodeinfo_t  = ^Agnodeinfo_t;
PAgraphinfo_t  = ^Agraphinfo_t;
Pbezier  = ^bezier;
Pboolean  = ^boolean;
Pboxf  = ^boxf;
Pchar  = ^char;
Pdouble  = ^double;
Pedge_t  = ^edge_t;
Pelist  = ^elist;
Pfield_t  = ^field_t;
Pfontname_kind  = ^fontname_kind;
Pgraph_t  = ^graph_t;
PGVC_t  = ^GVC_t;
PGVJ_t  = ^GVJ_t;
Pgvlayout_features_t  = ^gvlayout_features_t;
Phtmllabel_t  = ^htmllabel_t;
Pinside_t  = ^inside_t;
Playout_t  = ^layout_t;
Plongint  = ^longint;
Pnlist_t  = ^nlist_t;
Pnode_t  = ^node_t;
Pnodequeue  = ^nodequeue;
Ppath  = ^path;
Ppathend_t  = ^pathend_t;
Ppointf  = ^pointf;
Ppolygon_t  = ^polygon_t;
Pport  = ^port;
Prank_t  = ^rank_t;
Pratio_t  = ^ratio_t;
Pshape_desc  = ^shape_desc;
Pshape_functions  = ^shape_functions;
Pshape_kind  = ^shape_kind;
Pshape_t  = ^shape_t;
PsplineInfo  = ^splineInfo;
Psplines  = ^splines;
Pstroke_t  = ^stroke_t;
Ptextlabel_t  = ^textlabel_t;
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
{$ifndef GV_TYPES_H}
{$define GV_TYPES_H}
{ Define if you want CGRAPH  }

const
  WITH_CGRAPH = 1;  
{$include <stdio.h>}
{$include <assert.h>}
{$include <signal.h>}
type
  Pboolean = ^Tboolean;
  Tboolean = byte;
{$ifndef NOT}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function NOT(v : longint) : longint;

{$endif}
{$ifndef FALSE}

const
  FALSE = 0;  
{$endif}
{$ifndef TRUE}

{ was #define dname def_expr }
function TRUE : longint; { return type might be wrong }

{$endif}
{$include "geom.h"}
{$include "gvcext.h"}
{$include "pathgeom.h"}
{$include "textspan.h"}
{$include "cgraph.h"}
{ C++ extern C conditionnal removed }
(* Const before type ignored *)
(* Const before type ignored *)
type

  Tqsort_cmpf = function (para1:pointer; para2:pointer):longint;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  Tbsearch_cmpf = function (para1:pointer; para2:pointer):longint;cdecl;
  TAgraph_s = Tgraph_t;
  TAgnode_s = Tnode_t;
  TAgedge_s = Tedge_t;
  TAgsym_s = Tattrsym_t;

const
  TAIL_ID = 'tailport';  
  HEAD_ID = 'headport';  
type

  Pinside_t = ^Tinside_t;
  Tinside_t = record
      case longint of
        0 : ( a : record
            p : Ppointf;
            r : Pdouble;
          end );
        1 : ( s : record
            n : Pnode_t;
            bp : Pboxf;
          end );
      end;
{ internal edge endpoint specification  }
{ aiming point relative to node center  }
{ slope in radians  }
{ if not null, points to bbox of
				 * rectangular area that is port target
				  }
{ if true, edge has port info at this end  }
{ if true, constraints such as theta are set  }
{ if true, clip end to node/port shape  }
{ if true, assign compass point dynamically  }
{ for mincross  }
{ if port is on perimeter of node, this
                                 * contains the bitwise OR of the sides (TOP,
                                 * BOTTOM, etc.) it is on.
                                  }
{ port name, if it was explicitly given, otherwise NULL  }

  Pport = ^Tport;
  Tport = record
      p : Tpointf;
      theta : Tdouble;
      bp : Pboxf;
      defined : Tboolean;
      constrained : Tboolean;
      clip : Tboolean;
      dyna : Tboolean;
      order : byte;
      side : byte;
      name : Pchar;
    end;
{ Should head and tail be swapped?  }
{ Is n a node in the middle of an edge?  }
{ Test for swapped edges if false  }
{ Orthogonal routing used  }

  PsplineInfo = ^TsplineInfo;
  TsplineInfo = record
      swapEnds : function (e:Pedge_t):Tboolean;cdecl;
      splineMerge : function (n:Pnode_t):Tboolean;cdecl;
      ignoreSwap : Tboolean;
      isOrtho : Tboolean;
    end;
{ the node box  }
{ node port  }

  Ppathend_t = ^Tpathend_t;
  Tpathend_t = record
      nb : Tboxf;
      np : Tpointf;
      sidemask : longint;
      boxn : longint;
      boxes : array[0..19] of Tboxf;
    end;
{ internal specification for an edge spline  }
{ number of subdivisions  }
{ rectangular regions of subdivision  }

  Ppath = ^Tpath;
  Tpath = record
      start : Tport;
      end : Tport;
      nbox : longint;
      boxes : Pboxf;
      data : pointer;
    end;

  Pbezier = ^Tbezier;
  Tbezier = record
      list : Ppointf;
      size : longint;
      sflag : longint;
      eflag : longint;
      sp : Tpointf;
      ep : Tpointf;
    end;

  Psplines = ^Tsplines;
  Tsplines = record
      list : Pbezier;
      size : longint;
      bb : Tboxf;
    end;
{ the diagonal size of the label (estimated by layout)  }
{ the diagonal size of the space for the label  }
{   the rendered label is aligned in this box  }
{   space does not include pad or margin  }
{ the center of the space for the label  }
{ 't' 'c' 'b'  }
{ true if position is set  }
{ true if html label  }

  Ptextlabel_t = ^Ttextlabel_t;
  Ttextlabel_t = record
      text : Pchar;
      fontname : Pchar;
      fontcolor : Pchar;
      charset : longint;
      fontsize : Tdouble;
      dimen : Tpointf;
      space : Tpointf;
      pos : Tpointf;
      u : record
          case longint of
            0 : ( txt : record
                span : Ptextspan_t;
                nspans : smallint;
              end );
            1 : ( html : Phtmllabel_t );
          end;
      valign : char;
      set : Tboolean;
      html : Tboolean;
    end;
{ mutable shape information for a node  }
{ true for symmetric shapes  }
{ number of periphery lines  }
{ number of sides  }
{ orientation of shape (+ve degrees)  }
{ distortion factor - as in trapezium  }
{ skew factor - as in parallelogram  }
{ ROUNDED, DIAGONAL corners, etc.  }
{ array of vertex points  }

  Ppolygon_t = ^Tpolygon_t;
  Tpolygon_t = record
      regular : longint;
      peripheries : longint;
      sides : longint;
      orientation : Tdouble;
      distortion : Tdouble;
      skew : Tdouble;
      option : longint;
      vertices : Ppointf;
    end;
{ information about a single stroke  }
{ we would have called it a path if that term wasn't already used  }
{ number of points in the stroke  }
{ stroke style flags  }
{ array of vertex points  }

  Pstroke_t = ^Tstroke_t;
  Tstroke_t = record
      nvertices : longint;
      flags : longint;
      vertices : Ppointf;
    end;
{ flag definitions for stroke_t  }

const
  STROKE_CLOSED = 1 shl 0;  
  STROKE_FILLED = 1 shl 1;  
  STROKE_PENDOWN = 1 shl 2;  
  STROKE_VERTICES_ALLOCATED = 1 shl 3;  
{ mutable shape information for a node  }
{ number of strokes in array  }
{ array of strokes  }
{ The last stroke must always be closed, but can be pen_up.
	 * It is used as the clipping path  }
type
  Pshape_t = ^Tshape_t;
  Tshape_t = record
      nstrokes : longint;
      strokes : Pstroke_t;
    end;
{ read-only shape functions  }
{ initializes shape from node u.shape_info structure  }
{ frees  shape from node u.shape_info structure  }
{ finds aiming point and slope of port  }
{ clips incident gvc->e spline on shape of gvc->n  }
{ finds box path to reach port  }
{ emits graphics code for node  }

  Pshape_functions = ^Tshape_functions;
  Tshape_functions = record
      initfn : procedure (para1:Pnode_t);cdecl;
      freefn : procedure (para1:Pnode_t);cdecl;
      portfn : function (para1:Pnode_t; para2:Pchar; para3:Pchar):Tport;cdecl;
      insidefn : function (inside_context:Pinside_t; para2:Tpointf):Tboolean;cdecl;
      pboxfn : function (n:Pnode_t; p:Pport; side:longint; rv:Pboxf; kptr:Plongint):longint;cdecl;
      codefn : procedure (job:PGVJ_t; n:Pnode_t);cdecl;
    end;

  Pshape_kind = ^Tshape_kind;
  Tshape_kind =  Longint;
  Const
    SH_UNSET = 0;
    SH_POLY = 1;
    SH_RECORD = 2;
    SH_POINT = 3;
    SH_EPSF = 4;
;
{ read-only shape descriptor  }
{ as read from graph file  }
{ base polygon info  }
type
  Pshape_desc = ^Tshape_desc;
  Tshape_desc = record
      name : Pchar;
      fns : Pshape_functions;
      polygon : Ppolygon_t;
      usershape : Tboolean;
    end;
{$include "usershape.h"		/* usershapes needed by gvc */}
type
  Pnodequeue = ^Tnodequeue;
  Tnodequeue = record
      store : ^Pnode_t;
      limit : ^Pnode_t;
      head : ^Pnode_t;
      tail : ^Pnode_t;
    end;

  Padjmatrix_t = ^Tadjmatrix_t;
  Tadjmatrix_t = record
      nrows : longint;
      ncols : longint;
      data : Pchar;
    end;
{ number of nodes in this rank   }
{ ordered list of nodes in rank     }
{ globally allocated number of nodes    }
{ allocated list of nodes in rank   }
{ height below/above centerline     }
{ height below/above centerline     }
{ as above, but only primitive nodes    }
{ as above, but only primitive nodes    }
{ for transpose ()  }
{ caches number of crossings  }

  Prank_t = ^Trank_t;
  Trank_t = record
      n : longint;
      v : ^Pnode_t;
      an : longint;
      av : ^Pnode_t;
      ht1 : Tdouble;
      ht2 : Tdouble;
      pht1 : Tdouble;
      pht2 : Tdouble;
      candidate : Tboolean;
      valid : Tboolean;
      cache_nc : longint;
      flat : Padjmatrix_t;
    end;

  Pratio_t = ^Tratio_t;
  Tratio_t =  Longint;
  Const
    R_NONE = 0;
    R_VALUE = 1;
    R_FILL = 2;
    R_COMPRESS = 3;
    R_AUTO = 4;
    R_EXPAND = 5;
;
{ set only if ratio_kind == R_VALUE  }
type
  Playout_t = ^Tlayout_t;
  Tlayout_t = record
      quantum : Tdouble;
      scale : Tdouble;
      ratio : Tdouble;
      dpi : Tdouble;
      margin : Tpointf;
      page : Tpointf;
      size : Tpointf;
      filled : Tboolean;
      landscape : Tboolean;
      centered : Tboolean;
      ratio_kind : Tratio_t;
      xdots : pointer;
      id : Pchar;
    end;
{ for "record" shapes  }
{ its dimension  }
{ its placement in node's coordinates  }
{ n_flds == 0  }
{ n_flds > 0  }
{ user's identifier  }
{ if box list is horizontal (left to right)  }
{ sides of node exposed to field  }

  Pfield_t = ^Tfield_t;
  Tfield_t = record
      size : Tpointf;
      b : Tboxf;
      n_flds : longint;
      lp : Ptextlabel_t;
      fld : ^Pfield_t;
      id : Pchar;
      LR : byte;
      sides : byte;
    end;

  Pnlist_t = ^Tnlist_t;
  Tnlist_t = record
      list : ^Pnode_t;
      size : longint;
    end;

  Pelist = ^Telist;
  Telist = record
      list : ^Pedge_t;
      size : longint;
    end;

const
  GUI_STATE_ACTIVE = 1 shl 0;  
  GUI_STATE_SELECTED = 1 shl 1;  
  GUI_STATE_VISITED = 1 shl 2;  
  GUI_STATE_DELETED = 1 shl 3;  
type
  Pfontname_kind = ^Tfontname_kind;
  Tfontname_kind =  Longint;
  Const
    NATIVEFONTS = 0;
    PSFONTS = 1;
    SVGFONTS = 2;
;
{ to generate code  }
{ if the cluster has a title  }
{ bounding box  }
{ sizes of margins for graph labels  }
{ Graph state for GUI ops  }
{ input character set  }
{ below and above extremal ranks  }
{ below and above extremal ranks  }
{ context for "globals" over multiple graphs  }
{ function to deallocate layout-specific data  }
{$ifndef DOT_ONLY}
{ to place nodes  }
{$endif}
{$ifndef NEATO_ONLY}
{ to have subgraphs  }
{ clusters are in clust[1..n_cluster] !!!  }
{ containing cluster (not parent subgraph)  }
{ cluster nesting level (not node level!)  }
{ set leaders for min and max rank  }
{ set leaders for min and max rank  }
{ fast graph node list  }
{ connected components  }
{ set leaders  }
{ set leaders  }
{ includes virtual  }
{ various flags  }
{ to override mangling in SVG  }
{ left nodes of bounding box  }
{ right nodes of bounding box  }
{ for clusters  }
{$endif}
type
  PAgraphinfo_t = ^TAgraphinfo_t;
  TAgraphinfo_t = record
      hdr : TAgrec_t;
      drawing : Playout_t;
      _label : Ptextlabel_t;
      bb : Tboxf;
      border : array[0..3] of Tpointf;
      gui_state : byte;
      has_labels : byte;
      has_images : Tboolean;
      charset : byte;
      rankdir : longint;
      ht1 : Tdouble;
      ht2 : Tdouble;
      flags : word;
      alg : pointer;
      gvc : PGVC_t;
      cleanup : procedure (g:Pgraph_t);cdecl;
      neato_nlist : ^Pnode_t;
      move : longint;
      dist : ^Pdouble;
      spring : ^Pdouble;
      sum_t : ^Pdouble;
      t : ^^Pdouble;
      ndim : word;
      odim : word;
      n_cluster : longint;
      clust : ^Pgraph_t;
      dotroot : Pgraph_t;
      nlist : Pnode_t;
      rank : Prank_t;
      parent : Pgraph_t;
      level : longint;
      minrep : Pnode_t;
      maxrep : Pnode_t;
      comp : Tnlist_t;
      minset : Pnode_t;
      maxset : Pnode_t;
      n_nodes : longint;
      minrank : smallint;
      maxrank : smallint;
      has_flat_edges : Tboolean;
      has_sourcerank : Tboolean;
      has_sinkrank : Tboolean;
      showboxes : byte;
      fontnames : Tfontname_kind;
      nodesep : longint;
      ranksep : longint;
      ln : Pnode_t;
      rn : Pnode_t;
      leader : Pnode_t;
      rankleader : ^Pnode_t;
      expanded : Tboolean;
      installed : char;
      set_type : char;
      label_pos : char;
      exact_ranksep : Tboolean;
    end;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GD_parent(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_level(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_drawing(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_bb(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_gvc(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_cleanup(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_dist(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_alg(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_border(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_cl_cnt(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_clust(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_dotroot(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_comp(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_exact_ranksep(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_expanded(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_flags(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_gui_state(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_charset(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_has_labels(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_has_images(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_has_flat_edges(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_has_sourcerank(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_has_sinkrank(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_ht1(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_ht2(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_inleaf(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_installed(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_label(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_leader(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_rankdir2(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_rankdir(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_flip(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_realrankdir(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_realflip(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_ln(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_maxrank(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_maxset(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_minrank(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_minset(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_minrep(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_maxrep(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_move(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_n_cluster(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_n_nodes(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_ndim(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_odim(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_neato_nlist(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_nlist(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_nodesep(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_outleaf(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_rank(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_rankleader(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_ranksep(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_rn(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_set_type(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_label_pos(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_showboxes(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_fontnames(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_spring(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_sum_t(g : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_t(g : longint) : longint;

{ inches  }
{ inches  }
{ Node state for GUI ops  }
{$ifndef DOT_ONLY}
{$endif}
{$ifndef NEATO_ONLY}
{ fast graph  }
{ for union-find and collapsing nodes  }
{ for placing nodes  }
{ initially, order = 1 for ordered edges  }
{ for network-simplex  }
{$endif}
type
  PAgnodeinfo_t = ^TAgnodeinfo_t;
  TAgnodeinfo_t = record
      hdr : TAgrec_t;
      shape : Pshape_desc;
      shape_info : pointer;
      coord : Tpointf;
      width : Tdouble;
      height : Tdouble;
      bb : Tboxf;
      ht : Tdouble;
      lw : Tdouble;
      rw : Tdouble;
      _label : Ptextlabel_t;
      xlabel : Ptextlabel_t;
      alg : pointer;
      state : char;
      gui_state : byte;
      clustnode : Tboolean;
      pinned : byte;
      id : longint;
      heapindex : longint;
      hops : longint;
      pos : Pdouble;
      dist : Tdouble;
      showboxes : byte;
      has_port : Tboolean;
      rep : Pnode_t;
      set : Pnode_t;
      node_type : char;
      mark : char;
      onstack : char;
      ranktype : char;
      weight_class : char;
      next : Pnode_t;
      prev : Pnode_t;
      in : Telist;
      out : Telist;
      flat_out : Telist;
      flat_in : Telist;
      other : Telist;
      clust : Pgraph_t;
      UF_size : longint;
      UF_parent : Pnode_t;
      inleaf : Pnode_t;
      outleaf : Pnode_t;
      rank : longint;
      order : longint;
      mval : Tdouble;
      save_in : Telist;
      save_out : Telist;
      tree_in : Telist;
      tree_out : Telist;
      par : Pedge_t;
      low : longint;
      lim : longint;
      priority : longint;
      pad : array[0..0] of Tdouble;
    end;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ND_id(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_alg(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_UF_parent(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_set(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_UF_size(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_bb(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_clust(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_coord(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_dist(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_flat_in(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_flat_out(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_gui_state(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_has_port(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_rep(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_heapindex(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_height(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_hops(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_ht(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_in(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_inleaf(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_label(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_xlabel(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_lim(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_low(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_lw(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_mark(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_mval(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_n_cluster(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_next(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_node_type(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_onstack(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_order(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_other(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_out(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_outleaf(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_par(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_pinned(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_pos(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_prev(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_priority(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_rank(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_ranktype(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_rw(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_save_in(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_save_out(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_shape(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_shape_info(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_showboxes(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_state(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_clustnode(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_tree_in(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_tree_out(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_weight_class(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_width(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_xsize(n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_ysize(n : longint) : longint;

{ true for flat edge with adjacent nodes  }
{ Edge state for GUI ops  }
{ for dot's shapes.c     }
{$ifndef DOT_ONLY}
{$endif}
{$ifndef NEATO_ONLY}
{$endif}
type
  PAgedgeinfo_t = ^TAgedgeinfo_t;
  TAgedgeinfo_t = record
      hdr : TAgrec_t;
      spl : Psplines;
      tail_port : Tport;
      head_port : Tport;
      _label : Ptextlabel_t;
      head_label : Ptextlabel_t;
      tail_label : Ptextlabel_t;
      xlabel : Ptextlabel_t;
      edge_type : char;
      compound : char;
      adjacent : char;
      label_ontop : char;
      gui_state : byte;
      to_orig : Pedge_t;
      alg : pointer;
      factor : Tdouble;
      dist : Tdouble;
      path : TPpolyline_t;
      showboxes : byte;
      conc_opp_flag : Tboolean;
      xpenalty : smallint;
      weight : longint;
      cutvalue : longint;
      tree_index : longint;
      count : smallint;
      minlen : word;
      to_virt : Pedge_t;
    end;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ED_alg(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_conc_opp_flag(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_count(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_cutvalue(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_edge_type(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_compound(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_adjacent(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_factor(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_gui_state(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_head_label(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_head_port(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_label(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_xlabel(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_label_ontop(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_minlen(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_path(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_showboxes(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_spl(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_tail_label(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_tail_port(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_to_orig(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_to_virt(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_tree_index(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_xpenalty(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_dist(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_weight(e : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ag_xget(x,a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SET_RANKDIR(g,rd : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function agfindedge(g,t,h : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function agfindnode(g,n : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function agfindgraphattr(g,a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function agfindnodeattr(g,a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function agfindedgeattr(g,a : longint) : longint;

type
  Pgvlayout_features_t = ^Tgvlayout_features_t;
  Tgvlayout_features_t = record
      flags : longint;
    end;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NOT(v : longint) : longint;
begin
  NOT:= not (v);
end;

{ was #define dname def_expr }
function TRUE : longint; { return type might be wrong }
  begin
    _TRUE:=NOT(_FALSE);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_parent(g : longint) : longint;
begin
  GD_parent:=(PAgraphinfo_t(AGDATA(g)))^.parent;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_level(g : longint) : longint;
begin
  GD_level:=(PAgraphinfo_t(AGDATA(g)))^.level;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_drawing(g : longint) : longint;
begin
  GD_drawing:=(PAgraphinfo_t(AGDATA(g)))^.drawing;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_bb(g : longint) : longint;
begin
  GD_bb:=(PAgraphinfo_t(AGDATA(g)))^.bb;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_gvc(g : longint) : longint;
begin
  GD_gvc:=(PAgraphinfo_t(AGDATA(g)))^.gvc;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_cleanup(g : longint) : longint;
begin
  GD_cleanup:=(PAgraphinfo_t(AGDATA(g)))^.cleanup;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_dist(g : longint) : longint;
begin
  GD_dist:=(PAgraphinfo_t(AGDATA(g)))^.dist;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_alg(g : longint) : longint;
begin
  GD_alg:=(PAgraphinfo_t(AGDATA(g)))^.alg;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_border(g : longint) : longint;
begin
  GD_border:=(PAgraphinfo_t(AGDATA(g)))^.border;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_cl_cnt(g : longint) : longint;
begin
  GD_cl_cnt:=(PAgraphinfo_t(AGDATA(g)))^.cl_nt;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_clust(g : longint) : longint;
begin
  GD_clust:=(PAgraphinfo_t(AGDATA(g)))^.clust;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_dotroot(g : longint) : longint;
begin
  GD_dotroot:=(PAgraphinfo_t(AGDATA(g)))^.dotroot;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_comp(g : longint) : longint;
begin
  GD_comp:=(PAgraphinfo_t(AGDATA(g)))^.comp;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_exact_ranksep(g : longint) : longint;
begin
  GD_exact_ranksep:=(PAgraphinfo_t(AGDATA(g)))^.exact_ranksep;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_expanded(g : longint) : longint;
begin
  GD_expanded:=(PAgraphinfo_t(AGDATA(g)))^.expanded;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_flags(g : longint) : longint;
begin
  GD_flags:=(PAgraphinfo_t(AGDATA(g)))^.flags;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_gui_state(g : longint) : longint;
begin
  GD_gui_state:=(PAgraphinfo_t(AGDATA(g)))^.gui_state;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_charset(g : longint) : longint;
begin
  GD_charset:=(PAgraphinfo_t(AGDATA(g)))^.charset;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_has_labels(g : longint) : longint;
begin
  GD_has_labels:=(PAgraphinfo_t(AGDATA(g)))^.has_labels;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_has_images(g : longint) : longint;
begin
  GD_has_images:=(PAgraphinfo_t(AGDATA(g)))^.has_images;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_has_flat_edges(g : longint) : longint;
begin
  GD_has_flat_edges:=(PAgraphinfo_t(AGDATA(g)))^.has_flat_edges;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_has_sourcerank(g : longint) : longint;
begin
  GD_has_sourcerank:=(PAgraphinfo_t(AGDATA(g)))^.has_sourcerank;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_has_sinkrank(g : longint) : longint;
begin
  GD_has_sinkrank:=(PAgraphinfo_t(AGDATA(g)))^.has_sinkrank;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_ht1(g : longint) : longint;
begin
  GD_ht1:=(PAgraphinfo_t(AGDATA(g)))^.ht1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_ht2(g : longint) : longint;
begin
  GD_ht2:=(PAgraphinfo_t(AGDATA(g)))^.ht2;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_inleaf(g : longint) : longint;
begin
  GD_inleaf:=(PAgraphinfo_t(AGDATA(g)))^.inleaf;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_installed(g : longint) : longint;
begin
  GD_installed:=(PAgraphinfo_t(AGDATA(g)))^.installed;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_label(g : longint) : longint;
begin
  GD_label:=(PAgraphinfo_t(AGDATA(g)))^._label;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_leader(g : longint) : longint;
begin
  GD_leader:=(PAgraphinfo_t(AGDATA(g)))^.leader;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_rankdir2(g : longint) : longint;
begin
  GD_rankdir2:=(PAgraphinfo_t(AGDATA(g)))^.rankdir;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_rankdir(g : longint) : longint;
begin
  GD_rankdir:=((PAgraphinfo_t(AGDATA(g)))^.rankdir) and $3;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_flip(g : longint) : longint;
begin
  GD_flip:=(GD_rankdir(g)) and 1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_realrankdir(g : longint) : longint;
begin
  GD_realrankdir:=((PAgraphinfo_t(AGDATA(g)))^.rankdir) shr 2;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_realflip(g : longint) : longint;
begin
  GD_realflip:=(GD_realrankdir(g)) and 1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_ln(g : longint) : longint;
begin
  GD_ln:=(PAgraphinfo_t(AGDATA(g)))^.ln;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_maxrank(g : longint) : longint;
begin
  GD_maxrank:=(PAgraphinfo_t(AGDATA(g)))^.maxrank;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_maxset(g : longint) : longint;
begin
  GD_maxset:=(PAgraphinfo_t(AGDATA(g)))^.maxset;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_minrank(g : longint) : longint;
begin
  GD_minrank:=(PAgraphinfo_t(AGDATA(g)))^.minrank;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_minset(g : longint) : longint;
begin
  GD_minset:=(PAgraphinfo_t(AGDATA(g)))^.minset;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_minrep(g : longint) : longint;
begin
  GD_minrep:=(PAgraphinfo_t(AGDATA(g)))^.minrep;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_maxrep(g : longint) : longint;
begin
  GD_maxrep:=(PAgraphinfo_t(AGDATA(g)))^.maxrep;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_move(g : longint) : longint;
begin
  GD_move:=(PAgraphinfo_t(AGDATA(g)))^.move;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_n_cluster(g : longint) : longint;
begin
  GD_n_cluster:=(PAgraphinfo_t(AGDATA(g)))^.n_cluster;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_n_nodes(g : longint) : longint;
begin
  GD_n_nodes:=(PAgraphinfo_t(AGDATA(g)))^.n_nodes;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_ndim(g : longint) : longint;
begin
  GD_ndim:=(PAgraphinfo_t(AGDATA(g)))^.ndim;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_odim(g : longint) : longint;
begin
  GD_odim:=(PAgraphinfo_t(AGDATA(g)))^.odim;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_neato_nlist(g : longint) : longint;
begin
  GD_neato_nlist:=(PAgraphinfo_t(AGDATA(g)))^.neato_nlist;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_nlist(g : longint) : longint;
begin
  GD_nlist:=(PAgraphinfo_t(AGDATA(g)))^.nlist;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_nodesep(g : longint) : longint;
begin
  GD_nodesep:=(PAgraphinfo_t(AGDATA(g)))^.nodesep;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_outleaf(g : longint) : longint;
begin
  GD_outleaf:=(PAgraphinfo_t(AGDATA(g)))^.outleaf;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_rank(g : longint) : longint;
begin
  GD_rank:=(PAgraphinfo_t(AGDATA(g)))^.rank;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_rankleader(g : longint) : longint;
begin
  GD_rankleader:=(PAgraphinfo_t(AGDATA(g)))^.rankleader;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_ranksep(g : longint) : longint;
begin
  GD_ranksep:=(PAgraphinfo_t(AGDATA(g)))^.ranksep;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_rn(g : longint) : longint;
begin
  GD_rn:=(PAgraphinfo_t(AGDATA(g)))^.rn;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_set_type(g : longint) : longint;
begin
  GD_set_type:=(PAgraphinfo_t(AGDATA(g)))^.set_type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_label_pos(g : longint) : longint;
begin
  GD_label_pos:=(PAgraphinfo_t(AGDATA(g)))^.label_pos;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_showboxes(g : longint) : longint;
begin
  GD_showboxes:=(PAgraphinfo_t(AGDATA(g)))^.showboxes;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_fontnames(g : longint) : longint;
begin
  GD_fontnames:=(PAgraphinfo_t(AGDATA(g)))^.fontnames;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_spring(g : longint) : longint;
begin
  GD_spring:=(PAgraphinfo_t(AGDATA(g)))^.spring;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_sum_t(g : longint) : longint;
begin
  GD_sum_t:=(PAgraphinfo_t(AGDATA(g)))^.sum_t;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GD_t(g : longint) : longint;
begin
  GD_t:=(PAgraphinfo_t(AGDATA(g)))^.t;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_id(n : longint) : longint;
begin
  ND_id:=(PAgnodeinfo_t(AGDATA(n)))^.id;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_alg(n : longint) : longint;
begin
  ND_alg:=(PAgnodeinfo_t(AGDATA(n)))^.alg;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_UF_parent(n : longint) : longint;
begin
  ND_UF_parent:=(PAgnodeinfo_t(AGDATA(n)))^.UF_parent;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_set(n : longint) : longint;
begin
  ND_set:=(PAgnodeinfo_t(AGDATA(n)))^.set;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_UF_size(n : longint) : longint;
begin
  ND_UF_size:=(PAgnodeinfo_t(AGDATA(n)))^.UF_size;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_bb(n : longint) : longint;
begin
  ND_bb:=(PAgnodeinfo_t(AGDATA(n)))^.bb;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_clust(n : longint) : longint;
begin
  ND_clust:=(PAgnodeinfo_t(AGDATA(n)))^.clust;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_coord(n : longint) : longint;
begin
  ND_coord:=(PAgnodeinfo_t(AGDATA(n)))^.coord;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_dist(n : longint) : longint;
begin
  ND_dist:=(PAgnodeinfo_t(AGDATA(n)))^.dist;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_flat_in(n : longint) : longint;
begin
  ND_flat_in:=(PAgnodeinfo_t(AGDATA(n)))^.flat_in;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_flat_out(n : longint) : longint;
begin
  ND_flat_out:=(PAgnodeinfo_t(AGDATA(n)))^.flat_out;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_gui_state(n : longint) : longint;
begin
  ND_gui_state:=(PAgnodeinfo_t(AGDATA(n)))^.gui_state;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_has_port(n : longint) : longint;
begin
  ND_has_port:=(PAgnodeinfo_t(AGDATA(n)))^.has_port;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_rep(n : longint) : longint;
begin
  ND_rep:=(PAgnodeinfo_t(AGDATA(n)))^.rep;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_heapindex(n : longint) : longint;
begin
  ND_heapindex:=(PAgnodeinfo_t(AGDATA(n)))^.heapindex;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_height(n : longint) : longint;
begin
  ND_height:=(PAgnodeinfo_t(AGDATA(n)))^.height;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_hops(n : longint) : longint;
begin
  ND_hops:=(PAgnodeinfo_t(AGDATA(n)))^.hops;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_ht(n : longint) : longint;
begin
  ND_ht:=(PAgnodeinfo_t(AGDATA(n)))^.ht;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_in(n : longint) : longint;
begin
  ND_in:=(PAgnodeinfo_t(AGDATA(n)))^.in;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_inleaf(n : longint) : longint;
begin
  ND_inleaf:=(PAgnodeinfo_t(AGDATA(n)))^.inleaf;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_label(n : longint) : longint;
begin
  ND_label:=(PAgnodeinfo_t(AGDATA(n)))^._label;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_xlabel(n : longint) : longint;
begin
  ND_xlabel:=(PAgnodeinfo_t(AGDATA(n)))^.xlabel;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_lim(n : longint) : longint;
begin
  ND_lim:=(PAgnodeinfo_t(AGDATA(n)))^.lim;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_low(n : longint) : longint;
begin
  ND_low:=(PAgnodeinfo_t(AGDATA(n)))^.low;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_lw(n : longint) : longint;
begin
  ND_lw:=(PAgnodeinfo_t(AGDATA(n)))^.lw;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_mark(n : longint) : longint;
begin
  ND_mark:=(PAgnodeinfo_t(AGDATA(n)))^.mark;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_mval(n : longint) : longint;
begin
  ND_mval:=(PAgnodeinfo_t(AGDATA(n)))^.mval;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_n_cluster(n : longint) : longint;
begin
  ND_n_cluster:=(PAgnodeinfo_t(AGDATA(n)))^.n_cluster;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_next(n : longint) : longint;
begin
  ND_next:=(PAgnodeinfo_t(AGDATA(n)))^.next;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_node_type(n : longint) : longint;
begin
  ND_node_type:=(PAgnodeinfo_t(AGDATA(n)))^.node_type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_onstack(n : longint) : longint;
begin
  ND_onstack:=(PAgnodeinfo_t(AGDATA(n)))^.onstack;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_order(n : longint) : longint;
begin
  ND_order:=(PAgnodeinfo_t(AGDATA(n)))^.order;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_other(n : longint) : longint;
begin
  ND_other:=(PAgnodeinfo_t(AGDATA(n)))^.other;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_out(n : longint) : longint;
begin
  ND_out:=(PAgnodeinfo_t(AGDATA(n)))^.out;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_outleaf(n : longint) : longint;
begin
  ND_outleaf:=(PAgnodeinfo_t(AGDATA(n)))^.outleaf;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_par(n : longint) : longint;
begin
  ND_par:=(PAgnodeinfo_t(AGDATA(n)))^.par;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_pinned(n : longint) : longint;
begin
  ND_pinned:=(PAgnodeinfo_t(AGDATA(n)))^.pinned;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_pos(n : longint) : longint;
begin
  ND_pos:=(PAgnodeinfo_t(AGDATA(n)))^.pos;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_prev(n : longint) : longint;
begin
  ND_prev:=(PAgnodeinfo_t(AGDATA(n)))^.prev;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_priority(n : longint) : longint;
begin
  ND_priority:=(PAgnodeinfo_t(AGDATA(n)))^.priority;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_rank(n : longint) : longint;
begin
  ND_rank:=(PAgnodeinfo_t(AGDATA(n)))^.rank;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_ranktype(n : longint) : longint;
begin
  ND_ranktype:=(PAgnodeinfo_t(AGDATA(n)))^.ranktype;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_rw(n : longint) : longint;
begin
  ND_rw:=(PAgnodeinfo_t(AGDATA(n)))^.rw;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_save_in(n : longint) : longint;
begin
  ND_save_in:=(PAgnodeinfo_t(AGDATA(n)))^.save_in;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_save_out(n : longint) : longint;
begin
  ND_save_out:=(PAgnodeinfo_t(AGDATA(n)))^.save_out;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_shape(n : longint) : longint;
begin
  ND_shape:=(PAgnodeinfo_t(AGDATA(n)))^.shape;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_shape_info(n : longint) : longint;
begin
  ND_shape_info:=(PAgnodeinfo_t(AGDATA(n)))^.shape_info;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_showboxes(n : longint) : longint;
begin
  ND_showboxes:=(PAgnodeinfo_t(AGDATA(n)))^.showboxes;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_state(n : longint) : longint;
begin
  ND_state:=(PAgnodeinfo_t(AGDATA(n)))^.state;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_clustnode(n : longint) : longint;
begin
  ND_clustnode:=(PAgnodeinfo_t(AGDATA(n)))^.clustnode;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_tree_in(n : longint) : longint;
begin
  ND_tree_in:=(PAgnodeinfo_t(AGDATA(n)))^.tree_in;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_tree_out(n : longint) : longint;
begin
  ND_tree_out:=(PAgnodeinfo_t(AGDATA(n)))^.tree_out;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_weight_class(n : longint) : longint;
begin
  ND_weight_class:=(PAgnodeinfo_t(AGDATA(n)))^.weight_class;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_width(n : longint) : longint;
begin
  ND_width:=(PAgnodeinfo_t(AGDATA(n)))^.width;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_xsize(n : longint) : longint;
begin
  ND_xsize:=(ND_lw(n))+(ND_rw(n));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ND_ysize(n : longint) : longint;
begin
  ND_ysize:=ND_ht(n);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_alg(e : longint) : longint;
begin
  ED_alg:=(PAgedgeinfo_t(AGDATA(e)))^.alg;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_conc_opp_flag(e : longint) : longint;
begin
  ED_conc_opp_flag:=(PAgedgeinfo_t(AGDATA(e)))^.conc_opp_flag;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_count(e : longint) : longint;
begin
  ED_count:=(PAgedgeinfo_t(AGDATA(e)))^.count;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_cutvalue(e : longint) : longint;
begin
  ED_cutvalue:=(PAgedgeinfo_t(AGDATA(e)))^.cutvalue;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_edge_type(e : longint) : longint;
begin
  ED_edge_type:=(PAgedgeinfo_t(AGDATA(e)))^.edge_type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_compound(e : longint) : longint;
begin
  ED_compound:=(PAgedgeinfo_t(AGDATA(e)))^.compound;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_adjacent(e : longint) : longint;
begin
  ED_adjacent:=(PAgedgeinfo_t(AGDATA(e)))^.adjacent;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_factor(e : longint) : longint;
begin
  ED_factor:=(PAgedgeinfo_t(AGDATA(e)))^.factor;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_gui_state(e : longint) : longint;
begin
  ED_gui_state:=(PAgedgeinfo_t(AGDATA(e)))^.gui_state;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_head_label(e : longint) : longint;
begin
  ED_head_label:=(PAgedgeinfo_t(AGDATA(e)))^.head_label;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_head_port(e : longint) : longint;
begin
  ED_head_port:=(PAgedgeinfo_t(AGDATA(e)))^.head_port;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_label(e : longint) : longint;
begin
  ED_label:=(PAgedgeinfo_t(AGDATA(e)))^._label;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_xlabel(e : longint) : longint;
begin
  ED_xlabel:=(PAgedgeinfo_t(AGDATA(e)))^.xlabel;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_label_ontop(e : longint) : longint;
begin
  ED_label_ontop:=(PAgedgeinfo_t(AGDATA(e)))^.label_ontop;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_minlen(e : longint) : longint;
begin
  ED_minlen:=(PAgedgeinfo_t(AGDATA(e)))^.minlen;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_path(e : longint) : longint;
begin
  ED_path:=(PAgedgeinfo_t(AGDATA(e)))^.path;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_showboxes(e : longint) : longint;
begin
  ED_showboxes:=(PAgedgeinfo_t(AGDATA(e)))^.showboxes;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_spl(e : longint) : longint;
begin
  ED_spl:=(PAgedgeinfo_t(AGDATA(e)))^.spl;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_tail_label(e : longint) : longint;
begin
  ED_tail_label:=(PAgedgeinfo_t(AGDATA(e)))^.tail_label;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_tail_port(e : longint) : longint;
begin
  ED_tail_port:=(PAgedgeinfo_t(AGDATA(e)))^.tail_port;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_to_orig(e : longint) : longint;
begin
  ED_to_orig:=(PAgedgeinfo_t(AGDATA(e)))^.to_orig;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_to_virt(e : longint) : longint;
begin
  ED_to_virt:=(PAgedgeinfo_t(AGDATA(e)))^.to_virt;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_tree_index(e : longint) : longint;
begin
  ED_tree_index:=(PAgedgeinfo_t(AGDATA(e)))^.tree_index;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_xpenalty(e : longint) : longint;
begin
  ED_xpenalty:=(PAgedgeinfo_t(AGDATA(e)))^.xpenalty;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_dist(e : longint) : longint;
begin
  ED_dist:=(PAgedgeinfo_t(AGDATA(e)))^.dist;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ED_weight(e : longint) : longint;
begin
  ED_weight:=(PAgedgeinfo_t(AGDATA(e)))^.weight;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ag_xget(x,a : longint) : longint;
begin
  ag_xget:=agxget(x,a);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SET_RANKDIR(g,rd : longint) : longint;
begin
  SET_RANKDIR:=(GD_rankdir2(g)):=rd;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function agfindedge(g,t,h : longint) : longint;
begin
  agfindedge:=agedge(g,t,h,NULL,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function agfindnode(g,n : longint) : longint;
begin
  agfindnode:=agnode(g,n,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function agfindgraphattr(g,a : longint) : longint;
begin
  agfindgraphattr:=agattr(g,AGRAPH,a,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function agfindnodeattr(g,a : longint) : longint;
begin
  agfindnodeattr:=agattr(g,AGNODE,a,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function agfindedgeattr(g,a : longint) : longint;
begin
  agfindedgeattr:=agattr(g,AGEDGE,a,NULL);
end;


end.
