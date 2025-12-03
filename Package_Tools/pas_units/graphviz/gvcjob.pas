unit gvcjob;

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
{ Common header used by both clients and plugins  }
{$ifndef GVCJOB_H}
{$define GVCJOB_H}
{ C++ extern C conditionnal removed }
{$include "gvcommon.h"}
{$include "color.h"}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ARRAY_SIZE(A : longint) : longint;

type
  Tgvdevice_engine_s = Tgvdevice_engine_t;
  Tgvformatter_engine_s = Tgvformatter_engine_t;
  Tgvrender_engine_s = Tgvrender_engine_t;
  Tgvlayout_engine_s = Tgvlayout_engine_t;
  Tgvtextlayout_engine_s = Tgvtextlayout_engine_t;
  Tgvloadimage_engine_s = Tgvloadimage_engine_t;

  Ppen_type = ^Tpen_type;
  Tpen_type =  Longint;
  Const
    PEN_NONE = 0;
    PEN_DASHED = 1;
    PEN_DOTTED = 2;
    PEN_SOLID = 3;
;
type
  Pfill_type = ^Tfill_type;
  Tfill_type =  Longint;
  Const
    FILL_NONE = 0;
    FILL_SOLID = 1;
    FILL_LINEAR = 2;
    FILL_RADIAL = 3;
;
type
  Pfont_type = ^Tfont_type;
  Tfont_type =  Longint;
  Const
    FONT_REGULAR = 0;
    FONT_BOLD = 1;
    FONT_ITALIC = 2;
;
type
  Plabel_type = ^Tlabel_type;
  Tlabel_type =  Longint;
  Const
    LABEL_PLAIN = 0;
    LABEL_HTML = 1;
;
type
  Pgvattr_t = ^Tgvattr_t;
  Tgvattr_t =  Longint;
  Const
    GVATTR_STRING = 0;
    GVATTR_BOOL = 1;
    GVATTR_COLOR = 2;
;
{ The -T output formats listed below are examples only, they are not definitive or inclusive,
 other outputs may use the flags now, or in the future 

                   Default emit order is breadth first graph walk order 
 EMIT_SORTED			emits nodes before edges		
 EMIT_COLORS			emits colors before nodes or edge -Tfig 
 EMIT_CLUSTERS_LAST		emits cluster after nodes and edges 	
 EMIT_PREORDER			emit in preorder traversal ???		
 EMIT_EDGE_SORTED		emits edges before nodes		

 GVDEVICE_DOES_PAGES		provides pagination support -Tps	
 GVDEVICE_DOES_LAYERS		provides support for layers -Tps	
 GVDEVICE_EVENTS		supports mouse events -Tgtk, -Txlib	
 GVDEVICE_DOES_TRUECOLOR	supports alpha channel -Tpng, -Tgtk, -Txlib 
 GVDEVICE_BINARY_FORMAT		Suppresses \r\n substitution for linends 
 GVDEVICE_COMPRESSED_FORMAT	controls libz compression		
 GVDEVICE_NO_WRITER		used when gvdevice is not used because device uses its own writer, -Tming, devil outputs   (FIXME seems to overlap OUTPUT_NOT_REQUIRED)

 GVRENDER_Y_GOES_DOWN		device origin top left, y goes down, otherwise
  				device origin lower left, y goes up	
 GVRENDER_DOES_TRANSFORM	device uses scale, translate, rotate to do its own
 				coordinate transformations, otherwise coordinates 
  				are pre-transformed			
 GVRENDER_DOES_ARROWS		renderer has its own idea of arrow shapes (deprecated) 
 GVRENDER_DOES_LABELS		basically, maps don't need labels	
 GVRENDER_DOES_MAPS		renderer encodes mapping information for mouse events -Tcmapx -Tsvg 
 GVRENDER_DOES_MAP_RECTANGLE	supports a 2 coord rectngle optimization 
 GVRENDER_DOES_MAP_CIRCLE	supports a 1 coord + radius circle optimization	
 GVRENDER_DOES_MAP_POLYGON	supports polygons (basically, -Tsvg uses anchors, so doesn't need to support any map shapes) 
 GVRENDER_DOES_MAP_ELLIPSE	supports a 2 coord ellipse optimization	
 GVRENDER_DOES_MAP_BSPLINE	supports mapping of splines		
 GVRENDER_DOES_TOOLTIPS		can represent tooltip info -Tcmapx, -Tsvg		
 GVRENDER_DOES_TARGETS		can represent target info (open link in a new tab or window) 
 GVRENDER_DOES_Z		render support 2.5D representation -Tvrml 
 GVRENDER_NO_WHITE_BG		don't paint white background, assumes white paper -Tps 
 LAYOUT_NOT_REQUIRED 		don't perform layout -Tcanon 		
 OUTPUT_NOT_REQUIRED		don't use gvdevice for output (basically when agwrite() used instead) -Tcanon, -Txdot 
  }
  EMIT_SORTED = 1 shl 0;  
  EMIT_COLORS = 1 shl 1;  
  EMIT_CLUSTERS_LAST = 1 shl 2;  
  EMIT_PREORDER = 1 shl 3;  
  EMIT_EDGE_SORTED = 1 shl 4;  
  GVDEVICE_DOES_PAGES = 1 shl 5;  
  GVDEVICE_DOES_LAYERS = 1 shl 6;  
  GVDEVICE_EVENTS = 1 shl 7;  
  GVDEVICE_DOES_TRUECOLOR = 1 shl 8;  
  GVDEVICE_BINARY_FORMAT = 1 shl 9;  
  GVDEVICE_COMPRESSED_FORMAT = 1 shl 10;  
  GVDEVICE_NO_WRITER = 1 shl 11;  
  GVRENDER_Y_GOES_DOWN = 1 shl 12;  
  GVRENDER_DOES_TRANSFORM = 1 shl 13;  
  GVRENDER_DOES_ARROWS = 1 shl 14;  
  GVRENDER_DOES_LABELS = 1 shl 15;  
  GVRENDER_DOES_MAPS = 1 shl 16;  
  GVRENDER_DOES_MAP_RECTANGLE = 1 shl 17;  
  GVRENDER_DOES_MAP_CIRCLE = 1 shl 18;  
  GVRENDER_DOES_MAP_POLYGON = 1 shl 19;  
  GVRENDER_DOES_MAP_ELLIPSE = 1 shl 20;  
  GVRENDER_DOES_MAP_BSPLINE = 1 shl 21;  
  GVRENDER_DOES_TOOLTIPS = 1 shl 22;  
  GVRENDER_DOES_TARGETS = 1 shl 23;  
  GVRENDER_DOES_Z = 1 shl 24;  
  GVRENDER_NO_WHITE_BG = 1 shl 25;  
  LAYOUT_NOT_REQUIRED = 1 shl 26;  
  OUTPUT_NOT_REQUIRED = 1 shl 27;  
{ graph units  }
type
  Pgvrender_features_t = ^Tgvrender_features_t;
  Tgvrender_features_t = record
      flags : longint;
      default_pad : Tdouble;
      knowncolors : ^Pchar;
      sz_knowncolors : longint;
      color_type : Tcolor_type_t;
    end;
{ left/right, top/bottom - points  }
{ default page width, height - points  }

  Pgvdevice_features_t = ^Tgvdevice_features_t;
  Tgvdevice_features_t = record
      flags : longint;
      default_margin : Tpointf;
      default_pagesize : Tpointf;
      default_dpi : Tpointf;
    end;

const
  LAYOUT_USES_RANKDIR = 1 shl 0;  
type
  Pgvplugin_active_device_s = ^Tgvplugin_active_device_s;
  Tgvplugin_active_device_s = record
      engine : Pgvdevice_engine_t;
      id : longint;
      features : Pgvdevice_features_t;
      _type : Pchar;
    end;
  Tgvplugin_active_device_t = Tgvplugin_active_device_s;
  Pgvplugin_active_device_t = ^Tgvplugin_active_device_t;

  Pgvplugin_active_render_s = ^Tgvplugin_active_render_s;
  Tgvplugin_active_render_s = record
      engine : Pgvrender_engine_t;
      id : longint;
      features : Pgvrender_features_t;
      _type : Pchar;
    end;
  Tgvplugin_active_render_t = Tgvplugin_active_render_s;
  Pgvplugin_active_render_t = ^Tgvplugin_active_render_t;

  Pgvplugin_active_loadimage_t = ^Tgvplugin_active_loadimage_t;
  Tgvplugin_active_loadimage_t = record
      engine : Pgvloadimage_engine_t;
      id : longint;
      _type : Pchar;
    end;

  Pgv_argvlist_s = ^Tgv_argvlist_s;
  Tgv_argvlist_s = record
      argv : ^Pchar;
      argc : longint;
      alloc : longint;
    end;
  Tgv_argvlist_t = Tgv_argvlist_s;
  Pgv_argvlist_t = ^Tgv_argvlist_t;
{ can't use "delete" 'cos C++ stole it  }

  Pgvdevice_callbacks_s = ^Tgvdevice_callbacks_s;
  Tgvdevice_callbacks_s = record
      refresh : procedure (job:PGVJ_t);cdecl;
      button_press : procedure (job:PGVJ_t; button:longint; pointer:Tpointf);cdecl;
      button_release : procedure (job:PGVJ_t; button:longint; pointer:Tpointf);cdecl;
      motion : procedure (job:PGVJ_t; pointer:Tpointf);cdecl;
      modify : procedure (job:PGVJ_t; name:Pchar; value:Pchar);cdecl;
      del : procedure (job:PGVJ_t);cdecl;
      read : procedure (job:PGVJ_t; filename:Pchar; layout:Pchar);cdecl;
      layout : procedure (job:PGVJ_t; layout:Pchar);cdecl;
      render : procedure (job:PGVJ_t; format:Pchar; filename:Pchar);cdecl;
    end;
  Tgvdevice_callbacks_t = Tgvdevice_callbacks_s;
  Pgvdevice_callbacks_t = ^Tgvdevice_callbacks_t;

  Tgvevent_key_callback_t = function (job:PGVJ_t):longint;cdecl;

  Pgvevent_key_binding_s = ^Tgvevent_key_binding_s;
  Tgvevent_key_binding_s = record
      keystring : Pchar;
      callback : Tgvevent_key_callback_t;
    end;
  Tgvevent_key_binding_t = Tgvevent_key_binding_s;
  Pgvevent_key_binding_t = ^Tgvevent_key_binding_t;

  Pmap_shape_t = ^Tmap_shape_t;
  Tmap_shape_t =  Longint;
  Const
    MAP_RECTANGLE = 0;
    MAP_CIRCLE = 1;
    MAP_POLYGON = 2;
;
type
  Pobj_type = ^Tobj_type;
  Tobj_type =  Longint;
  Const
    ROOTGRAPH_OBJTYPE = 0;
    CLUSTER_OBJTYPE = 1;
    NODE_OBJTYPE = 2;
    EDGE_OBJTYPE = 3;
;
{ If this enum is changed, the implementation of xbuf and xbufs in
     * gvrender_core_dot.c will probably need to be changed.
      }
type
  Pemit_state_t = ^Temit_state_t;
  Temit_state_t =  Longint;
  Const
    EMIT_GDRAW = 0;
    EMIT_CDRAW = 1;
    EMIT_TDRAW = 2;
    EMIT_HDRAW = 3;
    EMIT_GLABEL = 4;
    EMIT_CLABEL = 5;
    EMIT_TLABEL = 6;
    EMIT_HLABEL = 7;
    EMIT_NDRAW = 8;
    EMIT_EDRAW = 9;
    EMIT_NLABEL = 10;
    EMIT_ELABEL = 11;
;
type
  Tobj_state_s = Tobj_state_t;
{ z depths for 2.5D renderers such as vrml  }
{ fully substituted text strings  }
{ if GVRENDER_DOES_MAPS  }
{ if GVRENDER_DOES_TOOLTIPS  }
{ if GVRENDER_DOES_TARGETS  }
{ primary mapped region - node shape, edge labels  }
{ number of points for url map if GVRENDER_DOES_MAPS  }
{ additional mapped regions for edges  }
{ number of polygons in url bspline map
					 if GVRENDER_DOES_MAPS && GVRENDER_DOES_MAP_BSPLINES  }
{ array of url_bsplinemap_poly_n ints 
					 of number of points in each polygon  }
{ all the polygon points  }
{ tail end intersection with node  }
{ head end intersection with node  }
  Pobj_state_s = ^Tobj_state_s;
  Tobj_state_s = record
      parent : Pobj_state_t;
      _type : Tobj_type;
      u : record
          case longint of
            0 : ( g : Pgraph_t );
            1 : ( sg : Pgraph_t );
            2 : ( n : Pnode_t );
            3 : ( e : Pedge_t );
          end;
      emit_state : Temit_state_t;
      pencolor : Tgvcolor_t;
      fillcolor : Tgvcolor_t;
      stopcolor : Tgvcolor_t;
      gradient_angle : longint;
      gradient_frac : single;
      pen : Tpen_type;
      fill : Tfill_type;
      penwidth : Tdouble;
      rawstyle : ^Pchar;
      z : Tdouble;
      tail_z : Tdouble;
      head_z : Tdouble;
      _label : Pchar;
      xlabel : Pchar;
      taillabel : Pchar;
      headlabel : Pchar;
      url : Pchar;
      id : Pchar;
      labelurl : Pchar;
      tailurl : Pchar;
      headurl : Pchar;
      tooltip : Pchar;
      labeltooltip : Pchar;
      tailtooltip : Pchar;
      headtooltip : Pchar;
      target : Pchar;
      labeltarget : Pchar;
      tailtarget : Pchar;
      headtarget : Pchar;
      flag0 : word;
      url_map_shape : Tmap_shape_t;
      url_map_n : longint;
      url_map_p : Ppointf;
      url_bsplinemap_poly_n : longint;
      url_bsplinemap_n : Plongint;
      url_bsplinemap_p : Ppointf;
      tailendurl_map_n : longint;
      tailendurl_map_p : Ppointf;
      headendurl_map_n : longint;
      headendurl_map_p : Ppointf;
    end;


const
  bm_Tobj_state_s_explicit_tooltip = $1;
  bp_Tobj_state_s_explicit_tooltip = 0;
  bm_Tobj_state_s_explicit_tailtooltip = $2;
  bp_Tobj_state_s_explicit_tailtooltip = 1;
  bm_Tobj_state_s_explicit_headtooltip = $4;
  bp_Tobj_state_s_explicit_headtooltip = 2;
  bm_Tobj_state_s_explicit_labeltooltip = $8;
  bp_Tobj_state_s_explicit_labeltooltip = 3;
  bm_Tobj_state_s_explicit_tailtarget = $10;
  bp_Tobj_state_s_explicit_tailtarget = 4;
  bm_Tobj_state_s_explicit_headtarget = $20;
  bp_Tobj_state_s_explicit_headtarget = 5;
  bm_Tobj_state_s_explicit_edgetarget = $40;
  bp_Tobj_state_s_explicit_edgetarget = 6;
  bm_Tobj_state_s_explicit_tailurl = $80;
  bp_Tobj_state_s_explicit_tailurl = 7;
  bm_Tobj_state_s_explicit_headurl = $100;
  bp_Tobj_state_s_explicit_headurl = 8;
  bm_Tobj_state_s_labeledgealigned = $200;
  bp_Tobj_state_s_labeledgealigned = 9;

function explicit_tooltip(var a : Tobj_state_s) : longint;
procedure set_explicit_tooltip(var a : Tobj_state_s; __explicit_tooltip : longint);
function explicit_tailtooltip(var a : Tobj_state_s) : longint;
procedure set_explicit_tailtooltip(var a : Tobj_state_s; __explicit_tailtooltip : longint);
function explicit_headtooltip(var a : Tobj_state_s) : longint;
procedure set_explicit_headtooltip(var a : Tobj_state_s; __explicit_headtooltip : longint);
function explicit_labeltooltip(var a : Tobj_state_s) : longint;
procedure set_explicit_labeltooltip(var a : Tobj_state_s; __explicit_labeltooltip : longint);
function explicit_tailtarget(var a : Tobj_state_s) : longint;
procedure set_explicit_tailtarget(var a : Tobj_state_s; __explicit_tailtarget : longint);
function explicit_headtarget(var a : Tobj_state_s) : longint;
procedure set_explicit_headtarget(var a : Tobj_state_s; __explicit_headtarget : longint);
function explicit_edgetarget(var a : Tobj_state_s) : longint;
procedure set_explicit_edgetarget(var a : Tobj_state_s; __explicit_edgetarget : longint);
function explicit_tailurl(var a : Tobj_state_s) : longint;
procedure set_explicit_tailurl(var a : Tobj_state_s; __explicit_tailurl : longint);
function explicit_headurl(var a : Tobj_state_s) : longint;
procedure set_explicit_headurl(var a : Tobj_state_s; __explicit_headurl : longint);
function labeledgealigned(var a : Tobj_state_s) : longint;
procedure set_labeledgealigned(var a : Tobj_state_s; __labeledgealigned : longint);
{ Note on units:
 *     points  - a physical distance (1/72 inch) unaffected by zoom or dpi.
 *     graph units - related to physical distance by zoom.  Equals points at zoom=1
 *     device units - related to physical distance in points by dpi/72
  }
{ parent gvc  }
{ linked list of jobs  }
{ linked list of active jobs (e.g. multiple windows)  }
{ objects can be nested (at least clusters can)
					so keep object state on a stack  }
{ gd or cairo surface  }
{ context belongs to caller  }
{ location of imagedata  }
{ emit_graph flags  }
{ number of layers  }
{ current layer - 1 based }
{ 2D size of page array  }
{ 2D starting corner in  }
{ 2D major increment  }
{ 2D minor increment  }
{ 2D coord of current page - 0,0 based  }
{ number of pages  }
{ graph bb with padding - graph units  }
{ padding around bb - graph units  }
{ clip region in graph units  }
{ current page in graph units  }
{ page size in graph units  }
{ viewport focus - graph units  }
{ viewport zoom factor (points per graph unit)  }
{ viewport rotation (degrees)  0=portrait, 90=landscape  }
{ viewport size - points  }
{ viewport area - points  }
{ job-specific margin - points  }
{ device resolution device-units-per-inch  }
{ device width - device units  }
{ device height - device units  }
{ rotated boundingBox - device units  }
{ cumulative boundingBox over all pages - device units  }
{ composite device to graph units (zoom and dpi)  }
{ composite translation  }
{ composite device to points: dpi, y_goes_down  }
{ active button  }
{ pointer position in device units  }
{ old pointer position in device units  }
{ graph object that pointer is in currently  }
{ graph object that has been selected  }
{ (e.g. button 1 clicked on current obj)  }
{ tooltip of active object - or NULL  }
{ href of selected object - or NULL  }
{ (e.g. "edge" "node3" "e" "->" "node5" "")  }
{ attribute triplets: name, value, type  }
{ e.g. "color", "red", GVATTR_COLOR,
					"style", "filled", GVATTR_BOOL,  }
{ display-specific data for gvrender plugin  }
{ keybindings for keyboard events  }
type
  PGVJ_s = ^TGVJ_s;
  TGVJ_s = record
      gvc : PGVC_t;
      next : PGVJ_t;
      next_active : PGVJ_t;
      common : PGVCOMMON_t;
      obj : Pobj_state_t;
      input_filename : Pchar;
      graph_index : longint;
      layout_type : Pchar;
      output_filename : Pchar;
      output_file : PFILE;
      output_data : Pchar;
      output_data_allocated : dword;
      output_data_position : dword;
      output_langname : Pchar;
      output_lang : longint;
      render : Tgvplugin_active_render_t;
      device : Tgvplugin_active_device_t;
      loadimage : Tgvplugin_active_loadimage_t;
      callbacks : Pgvdevice_callbacks_t;
      device_dpi : Tpointf;
      device_sets_dpi : Tboolean;
      display : pointer;
      screen : longint;
      context : pointer;
      external_context : Tboolean;
      imagedata : Pchar;
      flags : longint;
      numLayers : longint;
      layerNum : longint;
      pagesArraySize : Tpoint;
      pagesArrayFirst : Tpoint;
      pagesArrayMajor : Tpoint;
      pagesArrayMinor : Tpoint;
      pagesArrayElem : Tpoint;
      numPages : longint;
      bb : Tboxf;
      pad : Tpointf;
      clip : Tboxf;
      pageBox : Tboxf;
      pageSize : Tpointf;
      focus : Tpointf;
      zoom : Tdouble;
      rotation : longint;
      view : Tpointf;
      canvasBox : Tboxf;
      margin : Tpointf;
      dpi : Tpointf;
      width : dword;
      height : dword;
      pageBoundingBox : Tbox;
      boundingBox : Tbox;
      scale : Tpointf;
      translation : Tpointf;
      devscale : Tpointf;
      fit_mode : Tboolean;
      needs_refresh : Tboolean;
      click : Tboolean;
      has_grown : Tboolean;
      has_been_rendered : Tboolean;
      button : byte;
      pointer : Tpointf;
      oldpointer : Tpointf;
      current_obj : pointer;
      selected_obj : pointer;
      active_tooltip : Pchar;
      selected_href : Pchar;
      selected_obj_type_name : Tgv_argvlist_t;
      selected_obj_attributes : Tgv_argvlist_t;
      window : pointer;
      keybindings : Pgvevent_key_binding_t;
      numkeys : longint;
      keycodes : pointer;
    end;

{ C++ end of extern C conditionnal removed }
{$endif}
{ GVCJOB_H  }

// === Konventiert am: 3-12-25 15:08:08 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ARRAY_SIZE(A : longint) : longint;
begin
  ARRAY_SIZE:=(sizeof(A))/(sizeof(A[0]));
end;

function explicit_tooltip(var a : Tobj_state_s) : longint;
begin
  explicit_tooltip:=(a.flag0 and bm_Tobj_state_s_explicit_tooltip) shr bp_Tobj_state_s_explicit_tooltip;
end;

procedure set_explicit_tooltip(var a : Tobj_state_s; __explicit_tooltip : longint);
begin
  a.flag0:=a.flag0 or ((__explicit_tooltip shl bp_Tobj_state_s_explicit_tooltip) and bm_Tobj_state_s_explicit_tooltip);
end;

function explicit_tailtooltip(var a : Tobj_state_s) : longint;
begin
  explicit_tailtooltip:=(a.flag0 and bm_Tobj_state_s_explicit_tailtooltip) shr bp_Tobj_state_s_explicit_tailtooltip;
end;

procedure set_explicit_tailtooltip(var a : Tobj_state_s; __explicit_tailtooltip : longint);
begin
  a.flag0:=a.flag0 or ((__explicit_tailtooltip shl bp_Tobj_state_s_explicit_tailtooltip) and bm_Tobj_state_s_explicit_tailtooltip);
end;

function explicit_headtooltip(var a : Tobj_state_s) : longint;
begin
  explicit_headtooltip:=(a.flag0 and bm_Tobj_state_s_explicit_headtooltip) shr bp_Tobj_state_s_explicit_headtooltip;
end;

procedure set_explicit_headtooltip(var a : Tobj_state_s; __explicit_headtooltip : longint);
begin
  a.flag0:=a.flag0 or ((__explicit_headtooltip shl bp_Tobj_state_s_explicit_headtooltip) and bm_Tobj_state_s_explicit_headtooltip);
end;

function explicit_labeltooltip(var a : Tobj_state_s) : longint;
begin
  explicit_labeltooltip:=(a.flag0 and bm_Tobj_state_s_explicit_labeltooltip) shr bp_Tobj_state_s_explicit_labeltooltip;
end;

procedure set_explicit_labeltooltip(var a : Tobj_state_s; __explicit_labeltooltip : longint);
begin
  a.flag0:=a.flag0 or ((__explicit_labeltooltip shl bp_Tobj_state_s_explicit_labeltooltip) and bm_Tobj_state_s_explicit_labeltooltip);
end;

function explicit_tailtarget(var a : Tobj_state_s) : longint;
begin
  explicit_tailtarget:=(a.flag0 and bm_Tobj_state_s_explicit_tailtarget) shr bp_Tobj_state_s_explicit_tailtarget;
end;

procedure set_explicit_tailtarget(var a : Tobj_state_s; __explicit_tailtarget : longint);
begin
  a.flag0:=a.flag0 or ((__explicit_tailtarget shl bp_Tobj_state_s_explicit_tailtarget) and bm_Tobj_state_s_explicit_tailtarget);
end;

function explicit_headtarget(var a : Tobj_state_s) : longint;
begin
  explicit_headtarget:=(a.flag0 and bm_Tobj_state_s_explicit_headtarget) shr bp_Tobj_state_s_explicit_headtarget;
end;

procedure set_explicit_headtarget(var a : Tobj_state_s; __explicit_headtarget : longint);
begin
  a.flag0:=a.flag0 or ((__explicit_headtarget shl bp_Tobj_state_s_explicit_headtarget) and bm_Tobj_state_s_explicit_headtarget);
end;

function explicit_edgetarget(var a : Tobj_state_s) : longint;
begin
  explicit_edgetarget:=(a.flag0 and bm_Tobj_state_s_explicit_edgetarget) shr bp_Tobj_state_s_explicit_edgetarget;
end;

procedure set_explicit_edgetarget(var a : Tobj_state_s; __explicit_edgetarget : longint);
begin
  a.flag0:=a.flag0 or ((__explicit_edgetarget shl bp_Tobj_state_s_explicit_edgetarget) and bm_Tobj_state_s_explicit_edgetarget);
end;

function explicit_tailurl(var a : Tobj_state_s) : longint;
begin
  explicit_tailurl:=(a.flag0 and bm_Tobj_state_s_explicit_tailurl) shr bp_Tobj_state_s_explicit_tailurl;
end;

procedure set_explicit_tailurl(var a : Tobj_state_s; __explicit_tailurl : longint);
begin
  a.flag0:=a.flag0 or ((__explicit_tailurl shl bp_Tobj_state_s_explicit_tailurl) and bm_Tobj_state_s_explicit_tailurl);
end;

function explicit_headurl(var a : Tobj_state_s) : longint;
begin
  explicit_headurl:=(a.flag0 and bm_Tobj_state_s_explicit_headurl) shr bp_Tobj_state_s_explicit_headurl;
end;

procedure set_explicit_headurl(var a : Tobj_state_s; __explicit_headurl : longint);
begin
  a.flag0:=a.flag0 or ((__explicit_headurl shl bp_Tobj_state_s_explicit_headurl) and bm_Tobj_state_s_explicit_headurl);
end;

function labeledgealigned(var a : Tobj_state_s) : longint;
begin
  labeledgealigned:=(a.flag0 and bm_Tobj_state_s_labeledgealigned) shr bp_Tobj_state_s_labeledgealigned;
end;

procedure set_labeledgealigned(var a : Tobj_state_s; __labeledgealigned : longint);
begin
  a.flag0:=a.flag0 or ((__labeledgealigned shl bp_Tobj_state_s_labeledgealigned) and bm_Tobj_state_s_labeledgealigned);
end;


end.
