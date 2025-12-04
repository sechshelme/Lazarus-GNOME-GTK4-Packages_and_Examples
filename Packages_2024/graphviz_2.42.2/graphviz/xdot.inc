{$IFDEF read_interface}


const
  INITIAL_XDOT_CAPACITY = 512;

type
  Pxdot_grad_type = ^Txdot_grad_type;
  Txdot_grad_type = longint;

const
  xd_none = 0;
  xd_linear = 1;
  xd_radial = 2;

type
  Txdot_color_stop = record
    frac: single;
    color: pchar;
  end;
  Pxdot_color_stop = ^Txdot_color_stop;

  Txdot_linear_grad = record
    x0: double;
    y0: double;
    x1: double;
    y1: double;
    n_stops: longint;
    stops: Pxdot_color_stop;
  end;
  Pxdot_linear_grad = ^Txdot_linear_grad;

  Txdot_radial_grad = record
    x0: double;
    y0: double;
    r0: double;
    x1: double;
    y1: double;
    r1: double;
    n_stops: longint;
    stops: Pxdot_color_stop;
  end;
  Pxdot_radial_grad = ^Txdot_radial_grad;

  Txdot_color = record
    _type: Txdot_grad_type;
    u: record
      case longint of
        0: (clr: pchar);
        1: (ling: Txdot_linear_grad);
        2: (ring: Txdot_radial_grad);
      end;
  end;
  Pxdot_color = ^Txdot_color;

type
  Pxdot_align = ^Txdot_align;
  Txdot_align = longint;

const
  xd_left = 0;
  xd_center = 1;
  xd_right = 2;

type
  Txdot_point = record
    x: double;
    y: double;
    z: double;
  end;
  Pxdot_point = ^Txdot_point;

  Txdot_rect = record
    x: double;
    y: double;
    w: double;
    h: double;
  end;
  Pxdot_rect = ^Txdot_rect;

  Txdot_polyline = record
    cnt: longint;
    pts: Pxdot_point;
  end;
  Pxdot_polyline = ^Txdot_polyline;

  Txdot_text = record
    x: double;
    y: double;
    align: Txdot_align;
    width: double;
    text: pchar;
  end;
  Pxdot_text = ^Txdot_text;

  Txdot_image = record
    pos: Txdot_rect;
    name: pchar;
  end;
  Pxdot_image = ^Txdot_image;

  Txdot_font = record
    size: double;
    name: pchar;
  end;
  Pxdot_font = ^Txdot_font;

type
  Pxdot_kind = ^Txdot_kind;
  Txdot_kind = longint;

const
  xd_filled_ellipse = 0;
  xd_unfilled_ellipse = 1;
  xd_filled_polygon = 2;
  xd_unfilled_polygon = 3;
  xd_filled_bezier = 4;
  xd_unfilled_bezier = 5;
  xd_polyline = 6;
  xd_text = 7;
  xd_fill_color = 8;
  xd_pen_color = 9;
  xd_font = 10;
  xd_style = 11;
  xd_image = 12;
  xd_grad_fill_color = 13;
  xd_grad_pen_color = 14;
  xd_fontchar = 15;

type
  Pxop_kind = ^Txop_kind;
  Txop_kind = longint;

const
  xop_ellipse = 0;
  xop_polygon = 1;
  xop_bezier = 2;
  xop_polyline = 3;
  xop_text = 4;
  xop_fill_color = 5;
  xop_pen_color = 6;
  xop_font = 7;
  xop_style = 8;
  xop_image = 9;
  xop_grad_color = 10;
  xop_fontchar = 11;

type
  Pxdot_op = ^Txdot_op;

  Tdrawfunc_t = procedure(para1: Pxdot_op; para2: longint); cdecl;
  Pdrawfunc_t = ^Tdrawfunc_t;
  Tfreefunc_t = procedure(para1: Pxdot_op); cdecl;
  Pfreefunc_t = ^Tfreefunc_t;

  Txdot_op = record
    kind: Txdot_kind;
    u: record
      case longint of
        0: (ellipse: Txdot_rect);
        1: (polygon: Txdot_polyline);
        2: (polyline: Txdot_polyline);
        3: (bezier: Txdot_polyline);
        4: (text: Txdot_text);
        5: (image: Txdot_image);
        6: (color: pchar);
        7: (grad_color: Txdot_color);
        8: (font: Txdot_font);
        9: (style: pchar);
        10: (fontchar: dword);
      end;
    drawfunc: Tdrawfunc_t;
  end;

const
  XDOT_PARSE_ERROR = 1;

type
  Txdot = record
    cnt: longint;
    sz: longint;
    ops: Pxdot_op;
    freefunc: Tfreefunc_t;
    flags: longint;
  end;
  Pxdot = ^Txdot;

  Txdot_stats = record
    cnt: longint;
    n_ellipse: longint;
    n_polygon: longint;
    n_polygon_pts: longint;
    n_polyline: longint;
    n_polyline_pts: longint;
    n_bezier: longint;
    n_bezier_pts: longint;
    n_text: longint;
    n_font: longint;
    n_style: longint;
    n_color: longint;
    n_image: longint;
    n_gradcolor: longint;
    n_fontchar: longint;
  end;
  Pxdot_stats = ^Txdot_stats;

function parseXDotF(para1: pchar; opfns: Pdrawfunc_t; sz: longint): Pxdot; cdecl; external libxdot;
function parseXDotFOn(para1: pchar; opfns: Pdrawfunc_t; sz: longint; para4: Pxdot): Pxdot; cdecl; external libxdot;
function parseXDot(para1: pchar): Pxdot; cdecl; external libxdot;
function sprintXDot(para1: Pxdot): pchar; cdecl; external libxdot;
procedure fprintXDot(para1: PFILE; para2: Pxdot); cdecl; external libxdot;
procedure jsonXDot(para1: PFILE; para2: Pxdot); cdecl; external libxdot;
procedure freeXDot(para1: Pxdot); cdecl; external libxdot;
function statXDot(para1: Pxdot; para2: Pxdot_stats): longint; cdecl; external libxdot;
function colorTypeXDot(para1: pchar): Txdot_grad_type; cdecl; external libxdot;
function parseXDotColor(cp: pchar; clr: Pxdot_color): pchar; cdecl; external libxdot;
procedure freeXDotColor(para1: Pxdot_color); cdecl; external libxdot;

// === Konventiert am: 3-12-25 15:07:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
