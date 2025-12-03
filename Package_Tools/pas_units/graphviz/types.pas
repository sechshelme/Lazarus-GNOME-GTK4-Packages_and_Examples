unit types;

interface

uses
  geom, textspan, gvcext, cgraph;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Pboolean = ^Tboolean;
  Tboolean = byte;

type
  Tqsort_cmpf = function (para1:pointer; para2:pointer):longint;cdecl;

  Tbsearch_cmpf = function (para1:pointer; para2:pointer):longint;cdecl;
   Pgraph_t=type Pointer;
   Pnode_t=type Pointer;
   Pedge_t=type Pointer;
  Pattrsym_t=type Pointer;
  Phtmllabel_t=type Pointer;

const
  TAIL_ID = 'tailport';  
  HEAD_ID = 'headport';  
type
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
  Pinside_t = ^Tinside_t;

  Tport = record
      p : Tpointf;
      theta : double;
      bp : Pboxf;
      defined : Tboolean;
      constrained : Tboolean;
      clip : Tboolean;
      dyna : Tboolean;
      order : byte;
      side : byte;
      name : Pchar;
    end;
  Pport = ^Tport;

  TsplineInfo = record
      swapEnds : function (e:Pedge_t):Tboolean;cdecl;
      splineMerge : function (n:Pnode_t):Tboolean;cdecl;
      ignoreSwap : Tboolean;
      isOrtho : Tboolean;
    end;
  PsplineInfo = ^TsplineInfo;

  Tpathend_t = record
      nb : Tboxf;
      np : Tpointf;
      sidemask : longint;
      boxn : longint;
      boxes : array[0..19] of Tboxf;
    end;
  Ppathend_t = ^Tpathend_t;

  Tpath = record
      start : Tport;
      end_ : Tport;
      nbox : longint;
      boxes : Pboxf;
      data : pointer;
    end;
    Ppath = ^Tpath;

  Tbezier = record
      list : Ppointf;
      size : longint;
      sflag : longint;
      eflag : longint;
      sp : Tpointf;
      ep : Tpointf;
    end;
  Pbezier = ^Tbezier;

  Tsplines = record
      list : Pbezier;
      size : longint;
      bb : Tboxf;
    end;
  Psplines = ^Tsplines;

  Ttextlabel_t = record
      text : Pchar;
      fontname : Pchar;
      fontcolor : Pchar;
      charset : longint;
      fontsize : double;
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
      set_ : Tboolean;
      html : Tboolean;
    end;
  Ptextlabel_t = ^Ttextlabel_t;

  Tpolygon_t = record
      regular : longint;
      peripheries : longint;
      sides : longint;
      orientation : double;
      distortion : double;
      skew : double;
      option : longint;
      vertices : Ppointf;
    end;
  Ppolygon_t = ^Tpolygon_t;

  Tstroke_t = record
      nvertices : longint;
      flags : longint;
      vertices : Ppointf;
    end;
  Pstroke_t = ^Tstroke_t;

const
  STROKE_CLOSED = 1 shl 0;  
  STROKE_FILLED = 1 shl 1;  
  STROKE_PENDOWN = 1 shl 2;  
  STROKE_VERTICES_ALLOCATED = 1 shl 3;  
type
  Tshape_t = record
      nstrokes : longint;
      strokes : Pstroke_t;
    end;
  Pshape_t = ^Tshape_t;

  Tshape_functions = record
      initfn : procedure (para1:Pnode_t);cdecl;
      freefn : procedure (para1:Pnode_t);cdecl;
      portfn : function (para1:Pnode_t; para2:Pchar; para3:Pchar):Tport;cdecl;
      insidefn : function (inside_context:Pinside_t; para2:Tpointf):Tboolean;cdecl;
      pboxfn : function (n:Pnode_t; p:Pport; side:longint; rv:Pboxf; kptr:Plongint):longint;cdecl;
      codefn : procedure (job:PGVJ_t; n:Pnode_t);cdecl;
    end;
  Pshape_functions = ^Tshape_functions;
type
  Pshape_kind = ^Tshape_kind;
  Tshape_kind =  Longint;
  Const
    SH_UNSET = 0;
    SH_POLY = 1;
    SH_RECORD = 2;
    SH_POINT = 3;
    SH_EPSF = 4;
type
  Tshape_desc = record
      name : Pchar;
      fns : Pshape_functions;
      polygon : Ppolygon_t;
      usershape : Tboolean;
    end;
  Pshape_desc = ^Tshape_desc;
type
  Tnodequeue = record
      store : ^Pnode_t;
      limit : ^Pnode_t;
      head : ^Pnode_t;
      tail : ^Pnode_t;
    end;
  Pnodequeue = ^Tnodequeue;

  Tadjmatrix_t = record
      nrows : longint;
      ncols : longint;
      data : Pchar;
    end;
  Padjmatrix_t = ^Tadjmatrix_t;

  Trank_t = record
      n : longint;
      v : ^Pnode_t;
      an : longint;
      av : ^Pnode_t;
      ht1 : double;
      ht2 : double;
      pht1 : double;
      pht2 : double;
      candidate : Tboolean;
      valid : Tboolean;
      cache_nc : longint;
      flat : Padjmatrix_t;
    end;
  Prank_t = ^Trank_t;
type
  Pratio_t = ^Tratio_t;
  Tratio_t =  Longint;
  Const
    R_NONE = 0;
    R_VALUE = 1;
    R_FILL = 2;
    R_COMPRESS = 3;
    R_AUTO = 4;
    R_EXPAND = 5;
type
  Tlayout_t = record
      quantum : double;
      scale : double;
      ratio : double;
      dpi : double;
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
  Playout_t = ^Tlayout_t;

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
  Pfield_t = ^Tfield_t;

  Tnlist_t = record
      list : ^Pnode_t;
      size : longint;
    end;
  Pnlist_t = ^Tnlist_t;

  Telist = record
      list : ^Pedge_t;
      size : longint;
    end;
  Pelist = ^Telist;

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
type
  PAgraphinfo_t = type Pointer;
  PAgnodeinfo_t = type Pointer;
  PAgedgeinfo_t = type Pointer;


// === Konventiert am: 3-12-25 15:07:27 ===


implementation



end.
