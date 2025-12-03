
unit xdot;
interface

{
  Automatically converted by H2Pas 1.0.0 from xdot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xdot.h
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
Pdrawfunc_t  = ^drawfunc_t;
PFILE  = ^FILE;
Pxdot  = ^xdot;
Pxdot_align  = ^xdot_align;
Pxdot_color  = ^xdot_color;
Pxdot_color_stop  = ^xdot_color_stop;
Pxdot_font  = ^xdot_font;
Pxdot_grad_type  = ^xdot_grad_type;
Pxdot_image  = ^xdot_image;
Pxdot_kind  = ^xdot_kind;
Pxdot_linear_grad  = ^xdot_linear_grad;
Pxdot_op  = ^xdot_op;
Pxdot_point  = ^xdot_point;
Pxdot_polyline  = ^xdot_polyline;
Pxdot_radial_grad  = ^xdot_radial_grad;
Pxdot_rect  = ^xdot_rect;
Pxdot_stats  = ^xdot_stats;
Pxdot_text  = ^xdot_text;
Pxop_kind  = ^xop_kind;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


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
{$ifndef XDOT_H}
{$define XDOT_H}
{$include <stdio.h>}
{$ifdef _WIN32}
{$include <windows.h>}
{$endif}
{ C++ extern C conditionnal removed }

const
  INITIAL_XDOT_CAPACITY = 512;  
type
  Pxdot_grad_type = ^Txdot_grad_type;
  Txdot_grad_type =  Longint;
  Const
    xd_none = 0;
    xd_linear = 1;
    xd_radial = 2;
;
type
  Pxdot_color_stop = ^Txdot_color_stop;
  Txdot_color_stop = record
      frac : single;
      color : Pchar;
    end;

  Pxdot_linear_grad = ^Txdot_linear_grad;
  Txdot_linear_grad = record
      x0 : Tdouble;
      y0 : Tdouble;
      x1 : Tdouble;
      y1 : Tdouble;
      n_stops : longint;
      stops : Pxdot_color_stop;
    end;

  Pxdot_radial_grad = ^Txdot_radial_grad;
  Txdot_radial_grad = record
      x0 : Tdouble;
      y0 : Tdouble;
      r0 : Tdouble;
      x1 : Tdouble;
      y1 : Tdouble;
      r1 : Tdouble;
      n_stops : longint;
      stops : Pxdot_color_stop;
    end;

  Pxdot_color = ^Txdot_color;
  Txdot_color = record
      _type : Txdot_grad_type;
      u : record
          case longint of
            0 : ( clr : Pchar );
            1 : ( ling : Txdot_linear_grad );
            2 : ( ring : Txdot_radial_grad );
          end;
    end;

  Pxdot_align = ^Txdot_align;
  Txdot_align =  Longint;
  Const
    xd_left = 0;
    xd_center = 1;
    xd_right = 2;
;
type
  Pxdot_point = ^Txdot_point;
  Txdot_point = record
      x : Tdouble;
      y : Tdouble;
      z : Tdouble;
    end;

  Pxdot_rect = ^Txdot_rect;
  Txdot_rect = record
      x : Tdouble;
      y : Tdouble;
      w : Tdouble;
      h : Tdouble;
    end;

  Pxdot_polyline = ^Txdot_polyline;
  Txdot_polyline = record
      cnt : longint;
      pts : Pxdot_point;
    end;

  Pxdot_text = ^Txdot_text;
  Txdot_text = record
      x : Tdouble;
      y : Tdouble;
      align : Txdot_align;
      width : Tdouble;
      text : Pchar;
    end;

  Pxdot_image = ^Txdot_image;
  Txdot_image = record
      pos : Txdot_rect;
      name : Pchar;
    end;

  Pxdot_font = ^Txdot_font;
  Txdot_font = record
      size : Tdouble;
      name : Pchar;
    end;

  Pxdot_kind = ^Txdot_kind;
  Txdot_kind =  Longint;
  Const
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
;
type
  Pxop_kind = ^Txop_kind;
  Txop_kind =  Longint;
  Const
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
;
type

  Tdrawfunc_t = procedure (para1:Pxdot_op; para2:longint);cdecl;

  Tfreefunc_t = procedure (para1:Pxdot_op);cdecl;
{ xd_filled_ellipse, xd_unfilled_ellipse  }
{ xd_filled_polygon, xd_unfilled_polygon  }
{ xd_polyline  }
{ xd_filled_bezier,  xd_unfilled_bezier  }
{ xd_text  }
{ xd_image  }
{ xd_fill_color, xd_pen_color  }
{ xd_grad_fill_color, xd_grad_pen_color  }
{ xd_font  }
{ xd_style  }
{ xd_fontchar  }
  Pxdot_op = ^Txdot_op;
  Txdot_op = record
      kind : Txdot_kind;cdecl;
      u : record
          case longint of
            0 : ( ellipse : Txdot_rect );
            1 : ( polygon : Txdot_polyline );
            2 : ( polyline : Txdot_polyline );
            3 : ( bezier : Txdot_polyline );
            4 : ( text : Txdot_text );
            5 : ( image : Txdot_image );
            6 : ( color : Pchar );
            7 : ( grad_color : Txdot_color );
            8 : ( font : Txdot_font );
            9 : ( style : Pchar );
            10 : ( fontchar : dword );
          end;
      drawfunc : Tdrawfunc_t;
    end;


const
  XDOT_PARSE_ERROR = 1;  
{ no. of xdot ops  }
{ sizeof structure containing xdot_op as first field  }
type
  Pxdot = ^Txdot;
  Txdot = record
      cnt : longint;
      sz : longint;
      ops : Pxdot_op;
      freefunc : Tfreefunc_t;
      flags : longint;
    end;
{ no. of xdot ops  }

  Pxdot_stats = ^Txdot_stats;
  Txdot_stats = record
      cnt : longint;
      n_ellipse : longint;
      n_polygon : longint;
      n_polygon_pts : longint;
      n_polyline : longint;
      n_polyline_pts : longint;
      n_bezier : longint;
      n_bezier_pts : longint;
      n_text : longint;
      n_font : longint;
      n_style : longint;
      n_color : longint;
      n_image : longint;
      n_gradcolor : longint;
      n_fontchar : longint;
    end;
{ ops are indexed by xop_kind  }

function parseXDotF(para1:Pchar; opfns:Pdrawfunc_t; sz:longint):Pxdot;cdecl;external;
function parseXDotFOn(para1:Pchar; opfns:Pdrawfunc_t; sz:longint; para4:Pxdot):Pxdot;cdecl;external;
function parseXDot(para1:Pchar):Pxdot;cdecl;external;
function sprintXDot(para1:Pxdot):Pchar;cdecl;external;
procedure fprintXDot(para1:PFILE; para2:Pxdot);cdecl;external;
procedure jsonXDot(para1:PFILE; para2:Pxdot);cdecl;external;
procedure freeXDot(para1:Pxdot);cdecl;external;
function statXDot(para1:Pxdot; para2:Pxdot_stats):longint;cdecl;external;
function colorTypeXDot(para1:Pchar):Txdot_grad_type;cdecl;external;
function parseXDotColor(cp:Pchar; clr:Pxdot_color):Pchar;cdecl;external;
procedure freeXDotColor(para1:Pxdot_color);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
