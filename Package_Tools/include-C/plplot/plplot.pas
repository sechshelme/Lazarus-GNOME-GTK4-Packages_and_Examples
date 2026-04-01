unit plplot;

interface

uses
  fp_plplot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PPLFLT = ^TPLFLT;
  TPLFLT = double;

const
  PLFLT_MAX = MaxDouble;
  PLFLT_MIN = MinDouble;
  PLFLT_HUGE_VAL = Infinity;

type
  PPLUINT = ^TPLUINT;
  TPLUINT = Tuint32_t;

  PPLINT = ^TPLINT;
  TPLINT = Tint32_t;

  PPLINT64 = ^TPLINT64;
  TPLINT64 = Tint64_t;

const
  PLINT_MIN = Low(int32);
  PLINT_MAX = High(int32);

type
  PPLUNICODE = ^TPLUNICODE;
  TPLUNICODE = TPLUINT;

  PPLBOOL = ^TPLBOOL;
  TPLBOOL = Boolean32;

  PPLPointer = ^TPLPointer;
  TPLPointer = pointer;

  PPLFLT_NC_FE_POINTER = ^TPLFLT_NC_FE_POINTER;
  TPLFLT_NC_FE_POINTER = PPLFLT;

  PPLFLT_FE_POINTER = ^TPLFLT_FE_POINTER;
  TPLFLT_FE_POINTER = PPLFLT;

  PPLINT_NC_SCALAR = ^TPLINT_NC_SCALAR;
  TPLINT_NC_SCALAR = PPLINT;

  PPLBOOL_NC_SCALAR = ^TPLBOOL_NC_SCALAR;
  TPLBOOL_NC_SCALAR = PPLBOOL;

  PPLUNICODE_NC_SCALAR = ^TPLUNICODE_NC_SCALAR;
  TPLUNICODE_NC_SCALAR = PPLUNICODE;

  PPLCHAR_NC_SCALAR = ^TPLCHAR_NC_SCALAR;
  TPLCHAR_NC_SCALAR = pchar;

  PPLFLT_NC_SCALAR = ^TPLFLT_NC_SCALAR;
  TPLFLT_NC_SCALAR = PPLFLT;

  PPLINT_NC_VECTOR = ^TPLINT_NC_VECTOR;
  TPLINT_NC_VECTOR = PPLINT;

  PPLCHAR_NC_VECTOR = ^TPLCHAR_NC_VECTOR;
  TPLCHAR_NC_VECTOR = pchar;

  PPLFLT_NC_VECTOR = ^TPLFLT_NC_VECTOR;
  TPLFLT_NC_VECTOR = PPLFLT;

  PPLINT_VECTOR = ^TPLINT_VECTOR;
  TPLINT_VECTOR = PPLINT;

  PPLBOOL_VECTOR = ^TPLBOOL_VECTOR;
  TPLBOOL_VECTOR = PPLBOOL;

  PPPLCHAR_VECTOR = ^PPLCHAR_VECTOR;
  PPLCHAR_VECTOR = ^TPLCHAR_VECTOR;
  TPLCHAR_VECTOR = pchar;

  PPLFLT_VECTOR = ^TPLFLT_VECTOR;
  TPLFLT_VECTOR = PPLFLT;

  PPLCHAR_NC_MATRIX = ^TPLCHAR_NC_MATRIX;
  TPLCHAR_NC_MATRIX = ^pchar;

  PPLFLT_NC_MATRIX = ^TPLFLT_NC_MATRIX;
  TPLFLT_NC_MATRIX = ^PPLFLT;

  PPLCHAR_MATRIX = ^TPLCHAR_MATRIX;
  TPLCHAR_MATRIX = ^pchar;

  PPLFLT_MATRIX = ^TPLFLT_MATRIX;
  TPLFLT_MATRIX = ^PPLFLT;

  TPLMAPFORM_callback = procedure(n: TPLINT; x: TPLFLT_NC_VECTOR; y: TPLFLT_NC_VECTOR); cdecl;
  TPLTRANSFORM_callback = procedure(x: TPLFLT; y: TPLFLT; xp: TPLFLT_NC_SCALAR; yp: TPLFLT_NC_SCALAR; data: TPLPointer); cdecl;
  TPLLABEL_FUNC_callback = procedure(axis: TPLINT; value: TPLFLT; _label: TPLCHAR_NC_VECTOR; length: TPLINT; data: TPLPointer); cdecl;
  TPLF2EVAL_callback = function(ix: TPLINT; iy: TPLINT; data: TPLPointer): TPLFLT; cdecl;
  TPLFILL_callback = procedure(n: TPLINT; x: TPLFLT_VECTOR; y: TPLFLT_VECTOR); cdecl;
  TPLDEFINED_callback = function(x: TPLFLT; y: TPLFLT): TPLINT; cdecl;

const
  PLESC_SET_RGB = 1;
  PLESC_ALLOC_NCOL = 2;
  PLESC_SET_LPB = 3;
  PLESC_EXPOSE = 4;
  PLESC_RESIZE = 5;
  PLESC_REDRAW = 6;
  PLESC_TEXT = 7;
  PLESC_GRAPH = 8;
  PLESC_FILL = 9;
  PLESC_DI = 10;
  PLESC_FLUSH = 11;
  PLESC_EH = 12;
  PLESC_GETC = 13;
  PLESC_SWIN = 14;
  PLESC_DOUBLEBUFFERING = 15;
  PLESC_XORMOD = 16;
  PLESC_SET_COMPRESSION = 17;
  PLESC_CLEAR = 18;
  PLESC_DASH = 19;
  PLESC_HAS_TEXT = 20;
  PLESC_IMAGE = 21;
  PLESC_IMAGEOPS = 22;
  PLESC_PL2DEVCOL = 23;
  PLESC_DEV2PLCOL = 24;
  PLESC_SETBGFG = 25;
  PLESC_DEVINIT = 26;
  PLESC_GETBACKEND = 27;
  PLESC_BEGIN_TEXT = 28;
  PLESC_TEXT_CHAR = 29;
  PLESC_CONTROL_CHAR = 30;
  PLESC_END_TEXT = 31;
  PLESC_START_RASTERIZE = 32;
  PLESC_END_RASTERIZE = 33;
  PLESC_ARC = 34;
  PLESC_GRADIENT = 35;
  PLESC_MODESET = 36;
  PLESC_MODEGET = 37;
  PLESC_FIXASPECT = 38;
  PLESC_IMPORT_BUFFER = 39;
  PLESC_APPEND_BUFFER = 40;
  PLESC_FLUSH_REMAINING_BUFFER = 41;
  PLTEXT_FONTCHANGE = 0;
  PLTEXT_SUPERSCRIPT = 1;
  PLTEXT_SUBSCRIPT = 2;
  PLTEXT_BACKCHAR = 3;
  PLTEXT_OVERLINE = 4;
  PLTEXT_UNDERLINE = 5;

  ZEROW2B = 1;
  ZEROW2D = 2;
  ONEW2B = 3;
  ONEW2D = 4;

  PLSWIN_DEVICE = 1;
  PLSWIN_WORLD = 2;

  PL_X_AXIS = 1;
  PL_Y_AXIS = 2;
  PL_Z_AXIS = 3;

  PL_OPT_ENABLED = $0001;
  PL_OPT_ARG = $0002;
  PL_OPT_NODELETE = $0004;
  PL_OPT_INVISIBLE = $0008;
  PL_OPT_DISABLED = $0010;
  PL_OPT_FUNC = $0100;
  PL_OPT_BOOL = $0200;
  PL_OPT_INT = $0400;
  PL_OPT_FLOAT = $0800;
  PL_OPT_STRING = $1000;
  PL_PARSE_PARTIAL = $0000;
  PL_PARSE_FULL = $0001;
  PL_PARSE_QUIET = $0002;
  PL_PARSE_NODELETE = $0004;
  PL_PARSE_SHOWALL = $0008;
  PL_PARSE_OVERRIDE = $0010;
  PL_PARSE_NOPROGRAM = $0020;
  PL_PARSE_NODASH = $0040;
  PL_PARSE_SKIP = $0080;
  PL_FCI_MARK = $80000000;
  PL_FCI_IMPOSSIBLE = $00000000;

  PL_FCI_HEXDIGIT_MASK = $f;
  PL_FCI_HEXPOWER_MASK = $7;
  PL_FCI_HEXPOWER_IMPOSSIBLE = $f;

  PL_FCI_FAMILY = $0;
  PL_FCI_STYLE = $1;
  PL_FCI_WEIGHT = $2;

  PL_FCI_SANS = $0;
  PL_FCI_SERIF = $1;
  PL_FCI_MONO = $2;
  PL_FCI_SCRIPT = $3;
  PL_FCI_SYMBOL = $4;

  PL_FCI_UPRIGHT = $0;
  PL_FCI_ITALIC = $1;
  PL_FCI_OBLIQUE = $2;

  PL_FCI_MEDIUM = $0;
  PL_FCI_BOLD = $1;

type
  TPLOptionTable = record
    opt: TPLCHAR_VECTOR;
    handler: function(para1: TPLCHAR_VECTOR; para2: TPLCHAR_VECTOR; para3: TPLPointer): longint; cdecl;
    client_data: TPLPointer;
    var_: TPLPointer;
    mode: longint;
    syntax: TPLCHAR_VECTOR;
    desc: TPLCHAR_VECTOR;
  end;
  PPLOptionTable = ^TPLOptionTable;

const
  PL_MAXKEY = 16;

  PL_MASK_SHIFT = $1;
  PL_MASK_CAPS = $2;
  PL_MASK_CONTROL = $4;
  PL_MASK_ALT = $8;
  PL_MASK_NUM = $10;
  PL_MASK_ALTGR = $20;
  PL_MASK_WIN = $40;
  PL_MASK_SCROLL = $80;
  PL_MASK_BUTTON1 = $100;
  PL_MASK_BUTTON2 = $200;
  PL_MASK_BUTTON3 = $400;
  PL_MASK_BUTTON4 = $800;
  PL_MASK_BUTTON5 = $1000;

type
  TPLGraphicsIn = record
    _type: longint;
    state: dword;
    keysym: dword;
    button: dword;
    subwindow: TPLINT;
    _string: array[0..(PL_MAXKEY) - 1] of char;
    pX: longint;
    pY: longint;
    dX: TPLFLT;
    dY: TPLFLT;
    wX: TPLFLT;
    wY: TPLFLT;
  end;
  PPLGraphicsIn = ^TPLGraphicsIn;

const
  PL_MAXWINDOWS = 64;

type
  TPLWindow = record
    dxmi: TPLFLT;
    dxma: TPLFLT;
    dymi: TPLFLT;
    dyma: TPLFLT;
    wxmi: TPLFLT;
    wxma: TPLFLT;
    wymi: TPLFLT;
    wyma: TPLFLT;
  end;
  PPLWindow = ^TPLWindow;

  TPLDisplay = record
    x: dword;
    y: dword;
    width: dword;
    height: dword;
  end;
  PPLDisplay = ^TPLDisplay;

const
  PL_NOTSET = -(42);

type
  TPLfGrid = record
    f: TPLFLT_FE_POINTER;
    nx: TPLINT;
    ny: TPLINT;
    nz: TPLINT;
  end;
  PPLfGrid = ^TPLfGrid;

  TPLfGrid2 = record
    f: TPLFLT_NC_MATRIX;
    nx: TPLINT;
    ny: TPLINT;
  end;
  PPLfGrid2 = ^TPLfGrid2;

  TPLcGrid = record
    xg: TPLFLT_NC_FE_POINTER;
    yg: TPLFLT_NC_FE_POINTER;
    zg: TPLFLT_NC_FE_POINTER;
    nx: TPLINT;
    ny: TPLINT;
    nz: TPLINT;
  end;
  PPLcGrid = ^TPLcGrid;

  TPLcGrid2 = record
    xg: TPLFLT_NC_MATRIX;
    yg: TPLFLT_NC_MATRIX;
    zg: TPLFLT_NC_MATRIX;
    nx: TPLINT;
    ny: TPLINT;
  end;
  PPLcGrid2 = ^TPLcGrid2;

const
  PL_DEFAULT_NCOL0 = 16;
  PL_DEFAULT_NCOL1 = 128;

  MIN_PLINT_RGB = 0;
  MAX_PLINT_RGB = 255;

  MIN_PLFLT_CMAP1 = 0.0;
  MAX_PLFLT_CMAP1 = 1.0;

  MIN_PLFLT_ALPHA = 0.0;
  MAX_PLFLT_ALPHA = 1.0;

type
  TPLColor = record
    r: byte;
    g: byte;
    b: byte;
    a: TPLFLT;
    name: TPLCHAR_VECTOR;
  end;
  PPLColor = ^TPLColor;

  TPLControlPt = record
    c1: TPLFLT;
    c2: TPLFLT;
    c3: TPLFLT;
    p: TPLFLT;
    a: TPLFLT;
    alt_hue_path: longint;
  end;
  PPLControlPt = ^TPLControlPt;

  TPLBufferingCB = record
    cmd: TPLINT;
    result: TPLINT;
  end;
  PPLBufferingCB = ^TPLBufferingCB;

const
  PLESC_DOUBLEBUFFERING_ENABLE = 1;
  PLESC_DOUBLEBUFFERING_DISABLE = 2;
  PLESC_DOUBLEBUFFERING_QUERY = 3;

type
  TPLLabelDefaults = record
    exp_label_disp: TPLFLT;
    exp_label_pos: TPLFLT;
    exp_label_just: TPLFLT;
  end;
  PPLLabelDefaults = ^TPLLabelDefaults;

  Tplf2ops_t = record
    get: function(p: TPLPointer; ix: TPLINT; iy: TPLINT): TPLFLT; cdecl;
    set_: function(p: TPLPointer; ix: TPLINT; iy: TPLINT; z: TPLFLT): TPLFLT; cdecl;
    add: function(p: TPLPointer; ix: TPLINT; iy: TPLINT; z: TPLFLT): TPLFLT; cdecl;
    sub: function(p: TPLPointer; ix: TPLINT; iy: TPLINT; z: TPLFLT): TPLFLT; cdecl;
    mul: function(p: TPLPointer; ix: TPLINT; iy: TPLINT; z: TPLFLT): TPLFLT; cdecl;
    div_: function(p: TPLPointer; ix: TPLINT; iy: TPLINT; z: TPLFLT): TPLFLT; cdecl;
    is_nan: function(p: TPLPointer; ix: TPLINT; iy: TPLINT): TPLINT; cdecl;
    minmax: procedure(p: TPLPointer; nx: TPLINT; ny: TPLINT; zmin: TPLFLT_NC_SCALAR; zmax: TPLFLT_NC_SCALAR); cdecl;
    f2eval: function(ix: TPLINT; iy: TPLINT; p: TPLPointer): TPLFLT; cdecl;
  end;
  Pplf2ops_t = ^Tplf2ops_t;

  PPLF2OPS = ^TPLF2OPS;
  TPLF2OPS = Pplf2ops_t;

  Tplbuffer = record
    size: Tsize_t;
    buffer: TPLPointer;
  end;
  Pplbuffer = ^Tplbuffer;

procedure c_pl_setcontlabelformat(lexp: TPLINT; sigdig: TPLINT); cdecl; external libplplot;
procedure c_pl_setcontlabelparam(offset: TPLFLT; size: TPLFLT; spacing: TPLFLT; active: TPLINT); cdecl; external libplplot;
procedure c_pladv(page: TPLINT); cdecl; external libplplot;
procedure c_plarc(x: TPLFLT; y: TPLFLT; a: TPLFLT; b: TPLFLT; angle1: TPLFLT; angle2: TPLFLT; rotate: TPLFLT; fill: TPLBOOL); cdecl; external libplplot;
procedure c_plaxes(x0: TPLFLT; y0: TPLFLT; xopt: TPLCHAR_VECTOR; xtick: TPLFLT; nxsub: TPLINT; yopt: TPLCHAR_VECTOR; ytick: TPLFLT; nysub: TPLINT); cdecl; external libplplot;

const
  PL_BIN_DEFAULT = $0;
  PL_BIN_CENTRED = $1;
  PL_BIN_NOEXPAND = $2;
  PL_BIN_NOEMPTY = $4;

procedure c_plbin(nbin: TPLINT; x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; opt: TPLINT); cdecl; external libplplot;
procedure c_plbtime(year: TPLINT_NC_SCALAR; month: TPLINT_NC_SCALAR; day: TPLINT_NC_SCALAR; hour: TPLINT_NC_SCALAR; min: TPLINT_NC_SCALAR; sec: TPLFLT_NC_SCALAR; ctime: TPLFLT); cdecl; external libplplot;
procedure c_plbop; cdecl; external libplplot;
procedure c_plbox(xopt: TPLCHAR_VECTOR; xtick: TPLFLT; nxsub: TPLINT; yopt: TPLCHAR_VECTOR; ytick: TPLFLT; nysub: TPLINT); cdecl; external libplplot;
procedure c_plbox3(xopt: TPLCHAR_VECTOR; xlabel: TPLCHAR_VECTOR; xtick: TPLFLT; nxsub: TPLINT; yopt: TPLCHAR_VECTOR;
  ylabel: TPLCHAR_VECTOR; ytick: TPLFLT; nysub: TPLINT; zopt: TPLCHAR_VECTOR; zlabel: TPLCHAR_VECTOR;
  ztick: TPLFLT; nzsub: TPLINT); cdecl; external libplplot;
procedure c_plcalc_world(rx: TPLFLT; ry: TPLFLT; wx: TPLFLT_NC_SCALAR; wy: TPLFLT_NC_SCALAR; window: TPLINT_NC_SCALAR); cdecl; external libplplot;
procedure c_plclear; cdecl; external libplplot;
procedure c_plcol0(icol0: TPLINT); cdecl; external libplplot;
procedure c_plcol1(col1: TPLFLT); cdecl; external libplplot;
procedure c_plconfigtime(scale: TPLFLT; offset1: TPLFLT; offset2: TPLFLT; ccontrol: TPLINT; ifbtime_offset: TPLBOOL;
  year: TPLINT; month: TPLINT; day: TPLINT; hour: TPLINT; min: TPLINT;
  sec: TPLFLT); cdecl; external libplplot;
procedure c_plcont(f: TPLFLT_MATRIX; nx: TPLINT; ny: TPLINT; kx: TPLINT; lx: TPLINT;
  ky: TPLINT; ly: TPLINT; clevel: TPLFLT_VECTOR; nlevel: TPLINT; pltr: TPLTRANSFORM_callback;
  pltr_data: TPLPointer); cdecl; external libplplot;
procedure plfcont(f2eval: TPLF2EVAL_callback; f2eval_data: TPLPointer; nx: TPLINT; ny: TPLINT; kx: TPLINT;
  lx: TPLINT; ky: TPLINT; ly: TPLINT; clevel: TPLFLT_VECTOR; nlevel: TPLINT;
  pltr: TPLTRANSFORM_callback; pltr_data: TPLPointer); cdecl; external libplplot;
procedure c_plcpstrm(iplsr: TPLINT; flags: TPLBOOL); cdecl; external libplplot;
procedure c_plctime(year: TPLINT; month: TPLINT; day: TPLINT; hour: TPLINT; min: TPLINT;
  sec: TPLFLT; ctime: TPLFLT_NC_SCALAR); cdecl; external libplplot;
procedure pldid2pc(xmin: TPLFLT_NC_SCALAR; ymin: TPLFLT_NC_SCALAR; xmax: TPLFLT_NC_SCALAR; ymax: TPLFLT_NC_SCALAR); cdecl; external libplplot;
procedure pldip2dc(xmin: TPLFLT_NC_SCALAR; ymin: TPLFLT_NC_SCALAR; xmax: TPLFLT_NC_SCALAR; ymax: TPLFLT_NC_SCALAR); cdecl; external libplplot;
procedure c_plend; cdecl; external libplplot;
procedure c_plend1; cdecl; external libplplot;
procedure c_plenv(xmin: TPLFLT; xmax: TPLFLT; ymin: TPLFLT; ymax: TPLFLT; just: TPLINT;
  axis: TPLINT); cdecl; external libplplot;
procedure c_plenv0(xmin: TPLFLT; xmax: TPLFLT; ymin: TPLFLT; ymax: TPLFLT; just: TPLINT;
  axis: TPLINT); cdecl; external libplplot;
procedure c_pleop; cdecl; external libplplot;
procedure c_plerrx(n: TPLINT; xmin: TPLFLT_VECTOR; xmax: TPLFLT_VECTOR; y: TPLFLT_VECTOR); cdecl; external libplplot;
procedure c_plerry(n: TPLINT; x: TPLFLT_VECTOR; ymin: TPLFLT_VECTOR; ymax: TPLFLT_VECTOR); cdecl; external libplplot;
procedure c_plfamadv; cdecl; external libplplot;
procedure c_plfill(n: TPLINT; x: TPLFLT_VECTOR; y: TPLFLT_VECTOR); cdecl; external libplplot;
procedure c_plfill3(n: TPLINT; x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; z: TPLFLT_VECTOR); cdecl; external libplplot;
procedure c_plflush; cdecl; external libplplot;
procedure c_plfont(ifont: TPLINT); cdecl; external libplplot;
procedure c_plfontld(fnt: TPLINT); cdecl; external libplplot;
procedure c_plgchr(p_def: TPLFLT_NC_SCALAR; p_ht: TPLFLT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgcmap1_range(min_color: TPLFLT_NC_SCALAR; max_color: TPLFLT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgcol0(icol0: TPLINT; r: TPLINT_NC_SCALAR; g: TPLINT_NC_SCALAR; b: TPLINT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgcol0a(icol0: TPLINT; r: TPLINT_NC_SCALAR; g: TPLINT_NC_SCALAR; b: TPLINT_NC_SCALAR; alpha: TPLFLT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgcolbg(r: TPLINT_NC_SCALAR; g: TPLINT_NC_SCALAR; b: TPLINT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgcolbga(r: TPLINT_NC_SCALAR; g: TPLINT_NC_SCALAR; b: TPLINT_NC_SCALAR; alpha: TPLFLT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgcompression(compression: TPLINT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgdev(p_dev: TPLCHAR_NC_VECTOR); cdecl; external libplplot;
procedure c_plgdidev(p_mar: TPLFLT_NC_SCALAR; p_aspect: TPLFLT_NC_SCALAR; p_jx: TPLFLT_NC_SCALAR; p_jy: TPLFLT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgdiori(p_rot: TPLFLT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgdiplt(p_xmin: TPLFLT_NC_SCALAR; p_ymin: TPLFLT_NC_SCALAR; p_xmax: TPLFLT_NC_SCALAR; p_ymax: TPLFLT_NC_SCALAR); cdecl; external libplplot;
function c_plgdrawmode: TPLINT; cdecl; external libplplot;
procedure c_plgfci(p_fci: TPLUNICODE_NC_SCALAR); cdecl; external libplplot;
procedure c_plgfam(p_fam: TPLINT_NC_SCALAR; p_num: TPLINT_NC_SCALAR; p_bmax: TPLINT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgfnam(fnam: TPLCHAR_NC_VECTOR); cdecl; external libplplot;
procedure c_plgfont(p_family: TPLINT_NC_SCALAR; p_style: TPLINT_NC_SCALAR; p_weight: TPLINT_NC_SCALAR); cdecl; external libplplot;
procedure c_plglevel(p_level: TPLINT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgpage(p_xp: TPLFLT_NC_SCALAR; p_yp: TPLFLT_NC_SCALAR; p_xleng: TPLINT_NC_SCALAR; p_yleng: TPLINT_NC_SCALAR; p_xoff: TPLINT_NC_SCALAR; p_yoff: TPLINT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgra; cdecl; external libplplot;
procedure c_plgradient(n: TPLINT; x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; angle: TPLFLT); cdecl; external libplplot;
procedure c_plgriddata(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; z: TPLFLT_VECTOR; npts: TPLINT; xg: TPLFLT_VECTOR;
  nptsx: TPLINT; yg: TPLFLT_VECTOR; nptsy: TPLINT; zg: TPLFLT_NC_MATRIX; _type: TPLINT;
  data: TPLFLT); cdecl; external libplplot;
procedure plfgriddata(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; z: TPLFLT_VECTOR; npts: TPLINT; xg: TPLFLT_VECTOR;
  nptsx: TPLINT; yg: TPLFLT_VECTOR; nptsy: TPLINT; zops: TPLF2OPS; zgp: TPLPointer;
  _type: TPLINT; data: TPLFLT); cdecl; external libplplot;

const
  GRID_CSA = 1;
  GRID_DTLI = 2;
  GRID_NNI = 3;
  GRID_NNIDW = 4;
  GRID_NNLI = 5;
  GRID_NNAIDW = 6;

procedure c_plgspa(xmin: TPLFLT_NC_SCALAR; xmax: TPLFLT_NC_SCALAR; ymin: TPLFLT_NC_SCALAR; ymax: TPLFLT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgstrm(p_strm: TPLINT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgver(p_ver: TPLCHAR_NC_VECTOR); cdecl; external libplplot;
procedure c_plgvpd(p_xmin: TPLFLT_NC_SCALAR; p_xmax: TPLFLT_NC_SCALAR; p_ymin: TPLFLT_NC_SCALAR; p_ymax: TPLFLT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgvpw(p_xmin: TPLFLT_NC_SCALAR; p_xmax: TPLFLT_NC_SCALAR; p_ymin: TPLFLT_NC_SCALAR; p_ymax: TPLFLT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgxax(p_digmax: TPLINT_NC_SCALAR; p_digits: TPLINT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgyax(p_digmax: TPLINT_NC_SCALAR; p_digits: TPLINT_NC_SCALAR); cdecl; external libplplot;
procedure c_plgzax(p_digmax: TPLINT_NC_SCALAR; p_digits: TPLINT_NC_SCALAR); cdecl; external libplplot;

const
  PL_HIST_DEFAULT = $00;
  PL_HIST_NOSCALING = $01;
  PL_HIST_IGNORE_OUTLIERS = $02;
  PL_HIST_NOEXPAND = $08;
  PL_HIST_NOEMPTY = $10;

procedure c_plhist(n: TPLINT; data: TPLFLT_VECTOR; datmin: TPLFLT; datmax: TPLFLT; nbin: TPLINT;
  opt: TPLINT); cdecl; external libplplot;
procedure c_plhlsrgb(h: TPLFLT; l: TPLFLT; s: TPLFLT; p_r: TPLFLT_NC_SCALAR; p_g: TPLFLT_NC_SCALAR;
  p_b: TPLFLT_NC_SCALAR); cdecl; external libplplot;
procedure c_plinit; cdecl; external libplplot;
procedure c_pljoin(x1: TPLFLT; y1: TPLFLT; x2: TPLFLT; y2: TPLFLT); cdecl; external libplplot;
procedure c_pllab(xlabel: TPLCHAR_VECTOR; ylabel: TPLCHAR_VECTOR; tlabel: TPLCHAR_VECTOR); cdecl; external libplplot;

const
  PL_POSITION_NULL = $0;
  PL_POSITION_LEFT = $1;
  PL_POSITION_RIGHT = $2;
  PL_POSITION_TOP = $4;
  PL_POSITION_BOTTOM = $8;
  PL_POSITION_INSIDE = $10;
  PL_POSITION_OUTSIDE = $20;
  PL_POSITION_VIEWPORT = $40;
  PL_POSITION_SUBPAGE = $80;

  PL_LEGEND_NULL = $0;
  PL_LEGEND_NONE = $1;
  PL_LEGEND_COLOR_BOX = $2;
  PL_LEGEND_LINE = $4;
  PL_LEGEND_SYMBOL = $8;
  PL_LEGEND_TEXT_LEFT = $10;
  PL_LEGEND_BACKGROUND = $20;
  PL_LEGEND_BOUNDING_BOX = $40;
  PL_LEGEND_ROW_MAJOR = $80;

  PL_COLORBAR_NULL = $0;
  PL_COLORBAR_LABEL_LEFT = $1;
  PL_COLORBAR_LABEL_RIGHT = $2;
  PL_COLORBAR_LABEL_TOP = $4;
  PL_COLORBAR_LABEL_BOTTOM = $8;
  PL_COLORBAR_IMAGE = $10;
  PL_COLORBAR_SHADE = $20;
  PL_COLORBAR_GRADIENT = $40;
  PL_COLORBAR_CAP_NONE = $80;
  PL_COLORBAR_CAP_LOW = $100;
  PL_COLORBAR_CAP_HIGH = $200;
  PL_COLORBAR_SHADE_LABEL = $400;
  PL_COLORBAR_ORIENT_RIGHT = $800;
  PL_COLORBAR_ORIENT_TOP = $1000;
  PL_COLORBAR_ORIENT_LEFT = $2000;
  PL_COLORBAR_ORIENT_BOTTOM = $4000;
  PL_COLORBAR_BACKGROUND = $8000;
  PL_COLORBAR_BOUNDING_BOX = $10000;

  PL_DRAWMODE_UNKNOWN = $0;
  PL_DRAWMODE_DEFAULT = $1;
  PL_DRAWMODE_REPLACE = $2;
  PL_DRAWMODE_XOR = $4;

procedure c_pllegend(p_legend_width: TPLFLT_NC_SCALAR; p_legend_height: TPLFLT_NC_SCALAR; opt: TPLINT; position: TPLINT; x: TPLFLT;
  y: TPLFLT; plot_width: TPLFLT; bg_color: TPLINT; bb_color: TPLINT; bb_style: TPLINT;
  nrow: TPLINT; ncolumn: TPLINT; nlegend: TPLINT; opt_array: TPLINT_VECTOR; text_offset: TPLFLT;
  text_scale: TPLFLT; text_spacing: TPLFLT; text_justification: TPLFLT; text_colors: TPLINT_VECTOR; text: TPLCHAR_MATRIX;
  box_colors: TPLINT_VECTOR; box_patterns: TPLINT_VECTOR; box_scales: TPLFLT_VECTOR; box_line_widths: TPLFLT_VECTOR; line_colors: TPLINT_VECTOR;
  line_styles: TPLINT_VECTOR; line_widths: TPLFLT_VECTOR; symbol_colors: TPLINT_VECTOR; symbol_scales: TPLFLT_VECTOR; symbol_numbers: TPLINT_VECTOR;
  symbols: TPLCHAR_MATRIX); cdecl; external libplplot;
procedure c_plcolorbar(p_colorbar_width: TPLFLT_NC_SCALAR; p_colorbar_height: TPLFLT_NC_SCALAR; opt: TPLINT; position: TPLINT; x: TPLFLT;
  y: TPLFLT; x_length: TPLFLT; y_length: TPLFLT; bg_color: TPLINT; bb_color: TPLINT;
  bb_style: TPLINT; low_cap_color: TPLFLT; high_cap_color: TPLFLT; cont_color: TPLINT; cont_width: TPLFLT;
  n_labels: TPLINT; label_opts: TPLINT_VECTOR; labels: TPLCHAR_MATRIX; n_axes: TPLINT; axis_opts: TPLCHAR_MATRIX;
  ticks: TPLFLT_VECTOR; sub_ticks: TPLINT_VECTOR; n_values: TPLINT_VECTOR; values: TPLFLT_MATRIX); cdecl; external libplplot;
procedure c_pllightsource(x: TPLFLT; y: TPLFLT; z: TPLFLT); cdecl; external libplplot;
procedure c_plline(n: TPLINT; x: TPLFLT_VECTOR; y: TPLFLT_VECTOR); cdecl; external libplplot;
procedure c_plline3(n: TPLINT; x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; z: TPLFLT_VECTOR); cdecl; external libplplot;
procedure c_pllsty(lin: TPLINT); cdecl; external libplplot;
procedure c_plmap(mapform: TPLMAPFORM_callback; name: TPLCHAR_VECTOR; minx: TPLFLT; maxx: TPLFLT; miny: TPLFLT;
  maxy: TPLFLT); cdecl; external libplplot;
procedure c_plmapline(mapform: TPLMAPFORM_callback; name: TPLCHAR_VECTOR; minx: TPLFLT; maxx: TPLFLT; miny: TPLFLT;
  maxy: TPLFLT; plotentries: TPLINT_VECTOR; nplotentries: TPLINT); cdecl; external libplplot;
procedure c_plmapstring(mapform: TPLMAPFORM_callback; name: TPLCHAR_VECTOR; _string: TPLCHAR_VECTOR; minx: TPLFLT; maxx: TPLFLT;
  miny: TPLFLT; maxy: TPLFLT; plotentries: TPLINT_VECTOR; nplotentries: TPLINT); cdecl; external libplplot;
procedure c_plmaptex(mapform: TPLMAPFORM_callback; name: TPLCHAR_VECTOR; dx: TPLFLT; dy: TPLFLT; just: TPLFLT;
  text: TPLCHAR_VECTOR; minx: TPLFLT; maxx: TPLFLT; miny: TPLFLT; maxy: TPLFLT;
  plotentry: TPLINT); cdecl; external libplplot;
procedure c_plmapfill(mapform: TPLMAPFORM_callback; name: TPLCHAR_VECTOR; minx: TPLFLT; maxx: TPLFLT; miny: TPLFLT;
  maxy: TPLFLT; plotentries: TPLINT_VECTOR; nplotentries: TPLINT); cdecl; external libplplot;
procedure c_plmeridians(mapform: TPLMAPFORM_callback; dlong: TPLFLT; dlat: TPLFLT; minlong: TPLFLT; maxlong: TPLFLT;
  minlat: TPLFLT; maxlat: TPLFLT); cdecl; external libplplot;
procedure c_plmesh(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; z: TPLFLT_MATRIX; nx: TPLINT; ny: TPLINT;
  opt: TPLINT); cdecl; external libplplot;
procedure plfmesh(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; zops: TPLF2OPS; zp: TPLPointer; nx: TPLINT;
  ny: TPLINT; opt: TPLINT); cdecl; external libplplot;
procedure c_plmeshc(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; z: TPLFLT_MATRIX; nx: TPLINT; ny: TPLINT;
  opt: TPLINT; clevel: TPLFLT_VECTOR; nlevel: TPLINT); cdecl; external libplplot;
procedure plfmeshc(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; zops: TPLF2OPS; zp: TPLPointer; nx: TPLINT;
  ny: TPLINT; opt: TPLINT; clevel: TPLFLT_VECTOR; nlevel: TPLINT); cdecl; external libplplot;
procedure c_plmkstrm(p_strm: TPLINT_NC_SCALAR); cdecl; external libplplot;
procedure c_plmtex(side: TPLCHAR_VECTOR; disp: TPLFLT; pos: TPLFLT; just: TPLFLT; text: TPLCHAR_VECTOR); cdecl; external libplplot;
procedure c_plmtex3(side: TPLCHAR_VECTOR; disp: TPLFLT; pos: TPLFLT; just: TPLFLT; text: TPLCHAR_VECTOR); cdecl; external libplplot;
procedure c_plot3d(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; z: TPLFLT_MATRIX; nx: TPLINT; ny: TPLINT;
  opt: TPLINT; side: TPLBOOL); cdecl; external libplplot;
procedure plfplot3d(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; zops: TPLF2OPS; zp: TPLPointer; nx: TPLINT;
  ny: TPLINT; opt: TPLINT; side: TPLBOOL); cdecl; external libplplot;
procedure c_plot3dc(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; z: TPLFLT_MATRIX; nx: TPLINT; ny: TPLINT;
  opt: TPLINT; clevel: TPLFLT_VECTOR; nlevel: TPLINT); cdecl; external libplplot;
procedure plfplot3dc(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; zops: TPLF2OPS; zp: TPLPointer; nx: TPLINT;
  ny: TPLINT; opt: TPLINT; clevel: TPLFLT_VECTOR; nlevel: TPLINT); cdecl; external libplplot;
procedure c_plot3dcl(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; z: TPLFLT_MATRIX; nx: TPLINT; ny: TPLINT;
  opt: TPLINT; clevel: TPLFLT_VECTOR; nlevel: TPLINT; indexxmin: TPLINT; indexxmax: TPLINT;
  indexymin: TPLINT_VECTOR; indexymax: TPLINT_VECTOR); cdecl; external libplplot;
procedure plfplot3dcl(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; zops: TPLF2OPS; zp: TPLPointer; nx: TPLINT;
  ny: TPLINT; opt: TPLINT; clevel: TPLFLT_VECTOR; nlevel: TPLINT; indexxmin: TPLINT;
  indexxmax: TPLINT; indexymin: TPLINT_VECTOR; indexymax: TPLINT_VECTOR); cdecl; external libplplot;

const
  DRAW_LINEX = $001;
  DRAW_LINEY = $002;
  DRAW_LINEXY = $003;
  MAG_COLOR = $004;
  BASE_CONT = $008;
  TOP_CONT = $010;
  SURF_CONT = $020;
  DRAW_SIDES = $040;
  FACETED = $080;
  MESH = $100;

procedure c_plpat(nlin: TPLINT; inc: TPLINT_VECTOR; del: TPLINT_VECTOR); cdecl; external libplplot;
procedure c_plpath(n: TPLINT; x1: TPLFLT; y1: TPLFLT; x2: TPLFLT; y2: TPLFLT); cdecl; external libplplot;
procedure c_plpoin(n: TPLINT; x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; code: TPLINT); cdecl; external libplplot;
procedure c_plpoin3(n: TPLINT; x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; z: TPLFLT_VECTOR; code: TPLINT); cdecl; external libplplot;
procedure c_plpoly3(n: TPLINT; x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; z: TPLFLT_VECTOR; draw: TPLBOOL_VECTOR; ifcc: TPLBOOL); cdecl; external libplplot;
procedure c_plprec(setp: TPLINT; prec: TPLINT); cdecl; external libplplot;
procedure c_plpsty(patt: TPLINT); cdecl; external libplplot;
procedure c_plptex(x: TPLFLT; y: TPLFLT; dx: TPLFLT; dy: TPLFLT; just: TPLFLT;
  text: TPLCHAR_VECTOR); cdecl; external libplplot;
procedure c_plptex3(wx: TPLFLT; wy: TPLFLT; wz: TPLFLT; dx: TPLFLT; dy: TPLFLT;
  dz: TPLFLT; sx: TPLFLT; sy: TPLFLT; sz: TPLFLT; just: TPLFLT;
  text: TPLCHAR_VECTOR); cdecl; external libplplot;
function c_plrandd: TPLFLT; cdecl; external libplplot;
procedure c_plreplot; cdecl; external libplplot;
procedure c_plrgbhls(r: TPLFLT; g: TPLFLT; b: TPLFLT; p_h: TPLFLT_NC_SCALAR; p_l: TPLFLT_NC_SCALAR;
  p_s: TPLFLT_NC_SCALAR); cdecl; external libplplot;
procedure c_plschr(def: TPLFLT; scale: TPLFLT); cdecl; external libplplot;
procedure c_plscmap0(r: TPLINT_VECTOR; g: TPLINT_VECTOR; b: TPLINT_VECTOR; ncol0: TPLINT); cdecl; external libplplot;
procedure c_plscmap0a(r: TPLINT_VECTOR; g: TPLINT_VECTOR; b: TPLINT_VECTOR; alpha: TPLFLT_VECTOR; ncol0: TPLINT); cdecl; external libplplot;
procedure c_plscmap0n(ncol0: TPLINT); cdecl; external libplplot;
procedure c_plscmap1(r: TPLINT_VECTOR; g: TPLINT_VECTOR; b: TPLINT_VECTOR; ncol1: TPLINT); cdecl; external libplplot;
procedure c_plscmap1a(r: TPLINT_VECTOR; g: TPLINT_VECTOR; b: TPLINT_VECTOR; alpha: TPLFLT_VECTOR; ncol1: TPLINT); cdecl; external libplplot;
procedure c_plscmap1l(itype: TPLBOOL; npts: TPLINT; intensity: TPLFLT_VECTOR; coord1: TPLFLT_VECTOR; coord2: TPLFLT_VECTOR;
  coord3: TPLFLT_VECTOR; alt_hue_path: TPLBOOL_VECTOR); cdecl; external libplplot;
procedure c_plscmap1la(itype: TPLBOOL; npts: TPLINT; intensity: TPLFLT_VECTOR; coord1: TPLFLT_VECTOR; coord2: TPLFLT_VECTOR;
  coord3: TPLFLT_VECTOR; alpha: TPLFLT_VECTOR; alt_hue_path: TPLBOOL_VECTOR); cdecl; external libplplot;
procedure c_plscmap1n(ncol1: TPLINT); cdecl; external libplplot;
procedure c_plscmap1_range(min_color: TPLFLT; max_color: TPLFLT); cdecl; external libplplot;
procedure c_plscol0(icol0: TPLINT; r: TPLINT; g: TPLINT; b: TPLINT); cdecl; external libplplot;
procedure c_plscol0a(icol0: TPLINT; r: TPLINT; g: TPLINT; b: TPLINT; alpha: TPLFLT); cdecl; external libplplot;
procedure c_plscolbg(r: TPLINT; g: TPLINT; b: TPLINT); cdecl; external libplplot;
procedure c_plscolbga(r: TPLINT; g: TPLINT; b: TPLINT; alpha: TPLFLT); cdecl; external libplplot;
procedure c_plscolor(color: TPLINT); cdecl; external libplplot;
procedure c_plscompression(compression: TPLINT); cdecl; external libplplot;
procedure c_plsdev(devname: TPLCHAR_VECTOR); cdecl; external libplplot;
procedure c_plsdidev(mar: TPLFLT; aspect: TPLFLT; jx: TPLFLT; jy: TPLFLT); cdecl; external libplplot;
procedure c_plsdimap(dimxmin: TPLINT; dimxmax: TPLINT; dimymin: TPLINT; dimymax: TPLINT; dimxpmm: TPLFLT;
  dimypmm: TPLFLT); cdecl; external libplplot;
procedure c_plsdiori(rot: TPLFLT); cdecl; external libplplot;
procedure c_plsdiplt(xmin: TPLFLT; ymin: TPLFLT; xmax: TPLFLT; ymax: TPLFLT); cdecl; external libplplot;
procedure c_plsdiplz(xmin: TPLFLT; ymin: TPLFLT; xmax: TPLFLT; ymax: TPLFLT); cdecl; external libplplot;
procedure c_plsdrawmode(mode: TPLINT); cdecl; external libplplot;
procedure c_plseed(seed: dword); cdecl; external libplplot;
procedure c_plsesc(esc: char); cdecl; external libplplot;
procedure c_plsfam(fam: TPLINT; num: TPLINT; bmax: TPLINT); cdecl; external libplplot;
procedure c_plsfci(fci: TPLUNICODE); cdecl; external libplplot;
procedure c_plsfnam(fnam: TPLCHAR_VECTOR); cdecl; external libplplot;
procedure c_plsfont(family: TPLINT; style: TPLINT; weight: TPLINT); cdecl; external libplplot;
procedure c_plshade(a: TPLFLT_MATRIX; nx: TPLINT; ny: TPLINT; defined: TPLDEFINED_callback; xmin: TPLFLT;
  xmax: TPLFLT; ymin: TPLFLT; ymax: TPLFLT; shade_min: TPLFLT; shade_max: TPLFLT;
  sh_cmap: TPLINT; sh_color: TPLFLT; sh_width: TPLFLT; min_color: TPLINT; min_width: TPLFLT;
  max_color: TPLINT; max_width: TPLFLT; fill: TPLFILL_callback; rectangular: TPLBOOL; pltr: TPLTRANSFORM_callback;
  pltr_data: TPLPointer); cdecl; external libplplot;
procedure c_plshade1(a: TPLFLT_FE_POINTER; nx: TPLINT; ny: TPLINT; defined: TPLDEFINED_callback; xmin: TPLFLT;
  xmax: TPLFLT; ymin: TPLFLT; ymax: TPLFLT; shade_min: TPLFLT; shade_max: TPLFLT;
  sh_cmap: TPLINT; sh_color: TPLFLT; sh_width: TPLFLT; min_color: TPLINT; min_width: TPLFLT;
  max_color: TPLINT; max_width: TPLFLT; fill: TPLFILL_callback; rectangular: TPLBOOL; pltr: TPLTRANSFORM_callback;
  pltr_data: TPLPointer); cdecl; external libplplot; deprecated;
procedure c_plshades(a: TPLFLT_MATRIX; nx: TPLINT; ny: TPLINT; defined: TPLDEFINED_callback; xmin: TPLFLT;
  xmax: TPLFLT; ymin: TPLFLT; ymax: TPLFLT; clevel: TPLFLT_VECTOR; nlevel: TPLINT;
  fill_width: TPLFLT; cont_color: TPLINT; cont_width: TPLFLT; fill: TPLFILL_callback; rectangular: TPLBOOL;
  pltr: TPLTRANSFORM_callback; pltr_data: TPLPointer); cdecl; external libplplot;
procedure plfshades(zops: TPLF2OPS; zp: TPLPointer; nx: TPLINT; ny: TPLINT; defined: TPLDEFINED_callback;
  xmin: TPLFLT; xmax: TPLFLT; ymin: TPLFLT; ymax: TPLFLT; clevel: TPLFLT_VECTOR;
  nlevel: TPLINT; fill_width: TPLFLT; cont_color: TPLINT; cont_width: TPLFLT; fill: TPLFILL_callback;
  rectangular: TPLINT; pltr: TPLTRANSFORM_callback; pltr_data: TPLPointer); cdecl; external libplplot;
procedure plfshade(f2eval: TPLF2EVAL_callback; f2eval_data: TPLPointer; c2eval: TPLF2EVAL_callback; c2eval_data: TPLPointer; nx: TPLINT;
  ny: TPLINT; left: TPLFLT; right: TPLFLT; bottom: TPLFLT; top: TPLFLT;
  shade_min: TPLFLT; shade_max: TPLFLT; sh_cmap: TPLINT; sh_color: TPLFLT; sh_width: TPLFLT;
  min_color: TPLINT; min_width: TPLFLT; max_color: TPLINT; max_width: TPLFLT; fill: TPLFILL_callback;
  rectangular: TPLBOOL; pltr: TPLTRANSFORM_callback; pltr_data: TPLPointer); cdecl; external libplplot;
procedure plfshade1(zops: TPLF2OPS; zp: TPLPointer; nx: TPLINT; ny: TPLINT; defined: TPLDEFINED_callback;
  xmin: TPLFLT; xmax: TPLFLT; ymin: TPLFLT; ymax: TPLFLT; shade_min: TPLFLT;
  shade_max: TPLFLT; sh_cmap: TPLINT; sh_color: TPLFLT; sh_width: TPLFLT; min_color: TPLINT;
  min_width: TPLFLT; max_color: TPLINT; max_width: TPLFLT; fill: TPLFILL_callback; rectangular: TPLINT;
  pltr: TPLTRANSFORM_callback; pltr_data: TPLPointer); cdecl; external libplplot;
procedure c_plslabelfunc(label_func: TPLLABEL_FUNC_callback; label_data: TPLPointer); cdecl; external libplplot;
procedure c_plsmaj(def: TPLFLT; scale: TPLFLT); cdecl; external libplplot;
procedure c_plsmem(maxx: TPLINT; maxy: TPLINT; plotmem: TPLPointer); cdecl; external libplplot;
procedure c_plsmema(maxx: TPLINT; maxy: TPLINT; plotmem: TPLPointer); cdecl; external libplplot;
procedure c_plsmin(def: TPLFLT; scale: TPLFLT); cdecl; external libplplot;
procedure c_plsori(ori: TPLINT); cdecl; external libplplot;
procedure c_plspage(xp: TPLFLT; yp: TPLFLT; xleng: TPLINT; yleng: TPLINT; xoff: TPLINT; yoff: TPLINT); cdecl; external libplplot;
procedure c_plspal0(filename: TPLCHAR_VECTOR); cdecl; external libplplot;
procedure c_plspal1(filename: TPLCHAR_VECTOR; interpolate: TPLBOOL); cdecl; external libplplot;
procedure c_plspause(pause: TPLBOOL); cdecl; external libplplot;
procedure c_plsstrm(strm: TPLINT); cdecl; external libplplot;
procedure c_plssub(nx: TPLINT; ny: TPLINT); cdecl; external libplplot;
procedure c_plssym(def: TPLFLT; scale: TPLFLT); cdecl; external libplplot;
procedure c_plstar(nx: TPLINT; ny: TPLINT); cdecl; external libplplot;
procedure c_plstart(devname: TPLCHAR_VECTOR; nx: TPLINT; ny: TPLINT); cdecl; external libplplot;
procedure c_plstransform(coordinate_transform: TPLTRANSFORM_callback; coordinate_transform_data: TPLPointer); cdecl; external libplplot;
procedure c_plstring(n: TPLINT; x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; _string: TPLCHAR_VECTOR); cdecl; external libplplot;
procedure c_plstring3(n: TPLINT; x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; z: TPLFLT_VECTOR; _string: TPLCHAR_VECTOR); cdecl; external libplplot;
procedure c_plstripa(id: TPLINT; pen: TPLINT; x: TPLFLT; y: TPLFLT); cdecl; external libplplot;
procedure c_plstripc(id: TPLINT_NC_SCALAR; xspec: TPLCHAR_VECTOR; yspec: TPLCHAR_VECTOR; xmin: TPLFLT; xmax: TPLFLT;
  xjump: TPLFLT; ymin: TPLFLT; ymax: TPLFLT; xlpos: TPLFLT; ylpos: TPLFLT;
  y_ascl: TPLBOOL; acc: TPLBOOL; colbox: TPLINT; collab: TPLINT; colline: TPLINT_VECTOR;
  styline: TPLINT_VECTOR; legline: TPLCHAR_MATRIX; labx: TPLCHAR_VECTOR; laby: TPLCHAR_VECTOR; labtop: TPLCHAR_VECTOR); cdecl; external libplplot;
procedure c_plstripd(id: TPLINT); cdecl; external libplplot;
procedure c_plimagefr(idata: TPLFLT_MATRIX; nx: TPLINT; ny: TPLINT; xmin: TPLFLT; xmax: TPLFLT;
  ymin: TPLFLT; ymax: TPLFLT; zmin: TPLFLT; zmax: TPLFLT; valuemin: TPLFLT;
  valuemax: TPLFLT; pltr: TPLTRANSFORM_callback; pltr_data: TPLPointer); cdecl; external libplplot;
procedure plfimagefr(idataops: TPLF2OPS; idatap: TPLPointer; nx: TPLINT; ny: TPLINT; xmin: TPLFLT;
  xmax: TPLFLT; ymin: TPLFLT; ymax: TPLFLT; zmin: TPLFLT; zmax: TPLFLT;
  valuemin: TPLFLT; valuemax: TPLFLT; pltr: TPLTRANSFORM_callback; pltr_data: TPLPointer); cdecl; external libplplot;
procedure c_plimage(idata: TPLFLT_MATRIX; nx: TPLINT; ny: TPLINT; xmin: TPLFLT; xmax: TPLFLT;
  ymin: TPLFLT; ymax: TPLFLT; zmin: TPLFLT; zmax: TPLFLT; Dxmin: TPLFLT;
  Dxmax: TPLFLT; Dymin: TPLFLT; Dymax: TPLFLT); cdecl; external libplplot;
procedure plfimage(idataops: TPLF2OPS; idatap: TPLPointer; nx: TPLINT; ny: TPLINT; xmin: TPLFLT;
  xmax: TPLFLT; ymin: TPLFLT; ymax: TPLFLT; zmin: TPLFLT; zmax: TPLFLT;
  Dxmin: TPLFLT; Dxmax: TPLFLT; Dymin: TPLFLT; Dymax: TPLFLT); cdecl; external libplplot;
procedure c_plstyl(nms: TPLINT; mark: TPLINT_VECTOR; space: TPLINT_VECTOR); cdecl; external libplplot;
procedure c_plsurf3d(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; z: TPLFLT_MATRIX; nx: TPLINT; ny: TPLINT;
  opt: TPLINT; clevel: TPLFLT_VECTOR; nlevel: TPLINT); cdecl; external libplplot;
procedure plfsurf3d(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; zops: TPLF2OPS; zp: TPLPointer; nx: TPLINT;
  ny: TPLINT; opt: TPLINT; clevel: TPLFLT_VECTOR; nlevel: TPLINT); cdecl; external libplplot;
procedure c_plsurf3dl(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; z: TPLFLT_MATRIX; nx: TPLINT; ny: TPLINT;
  opt: TPLINT; clevel: TPLFLT_VECTOR; nlevel: TPLINT; indexxmin: TPLINT; indexxmax: TPLINT;
  indexymin: TPLINT_VECTOR; indexymax: TPLINT_VECTOR); cdecl; external libplplot;
procedure plfsurf3dl(x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; zops: TPLF2OPS; zp: TPLPointer; nx: TPLINT;
  ny: TPLINT; opt: TPLINT; clevel: TPLFLT_VECTOR; nlevel: TPLINT; indexxmin: TPLINT;
  indexxmax: TPLINT; indexymin: TPLINT_VECTOR; indexymax: TPLINT_VECTOR); cdecl; external libplplot;
procedure c_plsvect(arrowx: TPLFLT_VECTOR; arrowy: TPLFLT_VECTOR; npts: TPLINT; fill: TPLBOOL); cdecl; external libplplot;
procedure c_plsvpa(xmin: TPLFLT; xmax: TPLFLT; ymin: TPLFLT; ymax: TPLFLT); cdecl; external libplplot;
procedure c_plsxax(digmax: TPLINT; digits: TPLINT); cdecl; external libplplot;
procedure plsxwin(window_id: TPLINT); cdecl; external libplplot;
procedure c_plsyax(digmax: TPLINT; digits: TPLINT); cdecl; external libplplot;
procedure c_plsym(n: TPLINT; x: TPLFLT_VECTOR; y: TPLFLT_VECTOR; code: TPLINT); cdecl; external libplplot;
procedure c_plszax(digmax: TPLINT; digits: TPLINT); cdecl; external libplplot;
procedure c_pltext; cdecl; external libplplot;
procedure c_pltimefmt(fmt: TPLCHAR_VECTOR); cdecl; external libplplot;
procedure c_plvasp(aspect: TPLFLT); cdecl; external libplplot;
procedure c_plvect(u: TPLFLT_MATRIX; v: TPLFLT_MATRIX; nx: TPLINT; ny: TPLINT; scale: TPLFLT;
  pltr: TPLTRANSFORM_callback; pltr_data: TPLPointer); cdecl; external libplplot;
procedure plfvect(getuv: TPLF2EVAL_callback; up: TPLPointer; vp: TPLPointer; nx: TPLINT; ny: TPLINT;
  scale: TPLFLT; pltr: TPLTRANSFORM_callback; pltr_data: TPLPointer); cdecl; external libplplot;
procedure c_plvpas(xmin: TPLFLT; xmax: TPLFLT; ymin: TPLFLT; ymax: TPLFLT; aspect: TPLFLT); cdecl; external libplplot;
procedure c_plvpor(xmin: TPLFLT; xmax: TPLFLT; ymin: TPLFLT; ymax: TPLFLT); cdecl; external libplplot;
procedure c_plvsta; cdecl; external libplplot;
procedure c_plw3d(basex: TPLFLT; basey: TPLFLT; height: TPLFLT; xmin: TPLFLT; xmax: TPLFLT;
  ymin: TPLFLT; ymax: TPLFLT; zmin: TPLFLT; zmax: TPLFLT; alt: TPLFLT;
  az: TPLFLT); cdecl; external libplplot;
procedure c_plwidth(width: TPLFLT); cdecl; external libplplot;
procedure c_plwind(xmin: TPLFLT; xmax: TPLFLT; ymin: TPLFLT; ymax: TPLFLT); cdecl; external libplplot;
procedure c_plxormod(mode: TPLBOOL; status: TPLBOOL_NC_SCALAR); cdecl; external libplplot;

procedure plgFileDevs(p_menustr: PPPLCHAR_VECTOR; p_devname: PPPLCHAR_VECTOR; p_ndev: Plongint); cdecl; external libplplot;
procedure plgDevs(p_menustr: PPPLCHAR_VECTOR; p_devname: PPPLCHAR_VECTOR; p_ndev: Plongint); cdecl; external libplplot;

type
  TKeyButtonEH = procedure(para1: PPLGraphicsIn; para2: TPLPointer; para3: Plongint); cdecl;
  TBopEopHandler = procedure(para1: TPLPointer; para2: Plongint); cdecl;
  TExitHandler = function(para1: TPLCHAR_VECTOR): longint; cdecl;
  TAbortHandler = procedure(para1: TPLCHAR_VECTOR); cdecl;

procedure plsKeyEH(KeyEH: TKeyButtonEH; KeyEH_data: TPLPointer); cdecl; external libplplot;
procedure plsButtonEH(ButtonEH: TKeyButtonEH; ButtonEH_data: TPLPointer); cdecl; external libplplot;
procedure plsbopH(handler: TBopEopHandler; handler_data: TPLPointer); cdecl; external libplplot;
procedure plseopH(handler: TBopEopHandler; handler_data: TPLPointer); cdecl; external libplplot;
procedure plsError(errcode: TPLINT_NC_SCALAR; errmsg: TPLCHAR_NC_VECTOR); cdecl; external libplplot;
procedure plsexit(handler: TExitHandler); cdecl; external libplplot;
procedure plsabort(handler: TAbortHandler); cdecl; external libplplot;

procedure pltr0(x: TPLFLT; y: TPLFLT; tx: TPLFLT_NC_SCALAR; ty: TPLFLT_NC_SCALAR; pltr_data: TPLPointer); cdecl; external libplplot;
procedure pltr1(x: TPLFLT; y: TPLFLT; tx: TPLFLT_NC_SCALAR; ty: TPLFLT_NC_SCALAR; pltr_data: TPLPointer); cdecl; external libplplot;
procedure pltr2(x: TPLFLT; y: TPLFLT; tx: TPLFLT_NC_SCALAR; ty: TPLFLT_NC_SCALAR; pltr_data: TPLPointer); cdecl; external libplplot;
procedure pltr2p(x: TPLFLT; y: TPLFLT; tx: TPLFLT_NC_SCALAR; ty: TPLFLT_NC_SCALAR; pltr_data: TPLPointer); cdecl; external libplplot;
procedure pltr2f(x: TPLFLT; y: TPLFLT; tx: TPLFLT_NC_SCALAR; ty: TPLFLT_NC_SCALAR; pltr_data: TPLPointer); cdecl; external libplplot;
function plf2ops_c: TPLF2OPS; cdecl; external libplplot;
function plf2ops_grid_c: TPLF2OPS; cdecl; external libplplot;
function plf2ops_grid_row_major: TPLF2OPS; cdecl; external libplplot;
function plf2ops_grid_col_major: TPLF2OPS; cdecl; external libplplot;
function plf2eval1(ix: TPLINT; iy: TPLINT; plf2eval_data: TPLPointer): TPLFLT; cdecl; external libplplot;
function plf2eval2(ix: TPLINT; iy: TPLINT; plf2eval_data: TPLPointer): TPLFLT; cdecl; external libplplot;
function plf2eval(ix: TPLINT; iy: TPLINT; plf2eval_data: TPLPointer): TPLFLT; cdecl; external libplplot;
function plf2evalr(ix: TPLINT; iy: TPLINT; plf2eval_data: TPLPointer): TPLFLT; cdecl; external libplplot;
procedure plClearOpts; cdecl; external libplplot;
procedure plResetOpts; cdecl; external libplplot;
function plMergeOpts(options: PPLOptionTable; name: TPLCHAR_VECTOR; notes: PPLCHAR_VECTOR): TPLINT; cdecl; external libplplot;
procedure plSetUsage(program_string: TPLCHAR_VECTOR; usage_string: TPLCHAR_VECTOR); cdecl; external libplplot;
function c_plsetopt(opt: TPLCHAR_VECTOR; optarg: TPLCHAR_VECTOR): TPLINT; cdecl; external libplplot;
function c_plparseopts(p_argc: Plongint; argv: TPLCHAR_NC_MATRIX; mode: TPLINT): TPLINT; cdecl; external libplplot;
procedure plOptUsage; cdecl; external libplplot;
procedure plgfile(p_file: PPFILE); cdecl; external libplplot;
procedure plsfile(file_: PFILE); cdecl; external libplplot;
procedure plgesc(p_esc: TPLCHAR_NC_SCALAR); cdecl; external libplplot;
procedure pl_cmd(op: TPLINT; ptr: TPLPointer); cdecl; external libplplot;
function plFindName(p: TPLCHAR_NC_VECTOR): TPLINT; cdecl; external libplplot;
function plFindCommand(fn: TPLCHAR_VECTOR): TPLCHAR_NC_VECTOR; cdecl; external libplplot;
procedure plGetName(dir: TPLCHAR_VECTOR; subdir: TPLCHAR_VECTOR; filename: TPLCHAR_VECTOR; filespec: PPLCHAR_NC_VECTOR); cdecl; external libplplot;
function plGetInt(s: TPLCHAR_VECTOR): TPLINT; cdecl; external libplplot;
function plGetFlt(s: TPLCHAR_VECTOR): TPLFLT; cdecl; external libplplot;
procedure plStatic2dGrid(zIliffe: TPLFLT_NC_MATRIX; zStatic: TPLFLT_VECTOR; nx: TPLINT; ny: TPLINT); cdecl; external libplplot;
procedure plAlloc2dGrid(f: PPLFLT_NC_MATRIX; nx: TPLINT; ny: TPLINT); cdecl; external libplplot;
procedure plFree2dGrid(f: TPLFLT_NC_MATRIX; nx: TPLINT; ny: TPLINT); cdecl; external libplplot;
procedure plMinMax2dGrid(f: TPLFLT_MATRIX; nx: TPLINT; ny: TPLINT; fmax: TPLFLT_NC_SCALAR; fmin: TPLFLT_NC_SCALAR); cdecl; external libplplot;
function plGetCursor(gin: PPLGraphicsIn): TPLINT; cdecl; external libplplot;
function plTranslateCursor(gin: PPLGraphicsIn): TPLINT; cdecl; external libplplot;
procedure plsdevdata(data: TPLPointer); cdecl; external libplplot;

// === Konventiert am: 31-3-26 20:05:13 ===


implementation



end.
