unit gvcjob;

interface

uses
  fp_graphviz, geom, color, gvcext;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pgvdevice_engine_t = type Pointer;
  Pgvformatter_engine_t = type Pointer;
  Pgvrender_engine_t = type Pointer;
  Pgvlayout_engine_t = type Pointer;
  Pgvtextlayout_engine_t = type Pointer;
  Pgvloadimage_engine_t = type Pointer;

type
  Ppen_type = ^Tpen_type;
  Tpen_type = longint;

const
  PEN_NONE = 0;
  PEN_DASHED = 1;
  PEN_DOTTED = 2;
  PEN_SOLID = 3;

type
  Pfill_type = ^Tfill_type;
  Tfill_type = longint;

const
  FILL_NONE = 0;
  FILL_SOLID = 1;
  FILL_LINEAR = 2;
  FILL_RADIAL = 3;

type
  Pfont_type = ^Tfont_type;
  Tfont_type = longint;

const
  FONT_REGULAR = 0;
  FONT_BOLD = 1;
  FONT_ITALIC = 2;

type
  Plabel_type = ^Tlabel_type;
  Tlabel_type = longint;

const
  LABEL_PLAIN = 0;
  LABEL_HTML = 1;

type
  Pgvattr_t = ^Tgvattr_t;
  Tgvattr_t = longint;

const
  GVATTR_STRING = 0;
  GVATTR_BOOL = 1;
  GVATTR_COLOR = 2;

const
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

type
  Tgvrender_features_t = record
    flags: longint;
    default_pad: double;
    knowncolors: ^pchar;
    sz_knowncolors: longint;
    color_type: Tcolor_type_t;
  end;
  Pgvrender_features_t = ^Tgvrender_features_t;

  Tgvdevice_features_t = record
    flags: longint;
    default_margin: Tpointf;
    default_pagesize: Tpointf;
    default_dpi: Tpointf;
  end;
  Pgvdevice_features_t = ^Tgvdevice_features_t;

const
  LAYOUT_USES_RANKDIR = 1 shl 0;

type
  Pgvplugin_active_device_t = type Pointer;
  Pgvplugin_active_render_t = type Pointer;

  Tgvplugin_active_loadimage_t = record
    engine: Pgvloadimage_engine_t;
    id: longint;
    _type: pchar;
  end;
  Pgvplugin_active_loadimage_t = ^Tgvplugin_active_loadimage_t;

  Pgv_argvlist_t = type Pointer;
  Pgvdevice_callbacks_t = type Pointer;
  Tgvevent_key_callback_t = function(job: PGVJ_t): longint; cdecl;

  Pgvevent_key_binding_t = type Pointer;

type
  Pmap_shape_t = ^Tmap_shape_t;
  Tmap_shape_t = longint;

const
  MAP_RECTANGLE = 0;
  MAP_CIRCLE = 1;
  MAP_POLYGON = 2;

type
  Pobj_type = ^Tobj_type;
  Tobj_type = longint;

const
  ROOTGRAPH_OBJTYPE = 0;
  CLUSTER_OBJTYPE = 1;
  NODE_OBJTYPE = 2;
  EDGE_OBJTYPE = 3;

type
  Pemit_state_t = ^Temit_state_t;
  Temit_state_t = longint;

const
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

type
  Pobj_state_t = type Pointer;

  // === Konventiert am: 3-12-25 15:08:08 ===


implementation



end.
