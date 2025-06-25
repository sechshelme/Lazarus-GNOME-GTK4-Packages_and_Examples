
unit plot;
interface

{
  Automatically converted by H2Pas 1.0.0 from plot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    plot.h
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
Pmreal  = ^mreal;
Puintptr_t  = ^uintptr_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{**************************************************************************
 * plot.h is part of Math Graphic Library
 * Copyright (C) 2007-2016 Alexey Balakin <mathgl.abalakin@gmail.ru>       *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU Lesser General Public License  as       *
 *   published by the Free Software Foundation; either version 3 of the    *
 *   License, or (at your option) any later version.                       *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU Lesser General Public     *
 *   License along with this program; if not, write to the                 *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ************************************************************************** }
{$ifndef _MGL_1D_H_}
{$define _MGL_1D_H_}
{$include "mgl2/abstract.h"}
{----------------------------------------------------------------------------- }
{ C++ extern C conditionnal removed }
{/ Draw curve for formula with x in x-axis range }
{* Option "value" set initial number of points.  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

procedure mgl_fplot(gr:THMGL; eqY:Pchar; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_fplot_(gr:Puintptr_t; fy:Pchar; stl:Pchar; opt:Pchar; ly:longint; 
            ls:longint; lo:longint);cdecl;external;
{/ Draw curve for formulas parametrically depended on t in range [0,1] }
{* Option "value" set initial number of points.  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_fplot_xyz(gr:THMGL; eqX:Pchar; eqY:Pchar; eqZ:Pchar; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_fplot_xyz_(gr:Puintptr_t; fx:Pchar; fy:Pchar; fz:Pchar; stl:Pchar; 
            opt:Pchar; lx:longint; ly:longint; lz:longint; ls:longint; 
            lo:longint);cdecl;external;
{/ Draw radar chart (plot in curved coordinates) }
{* Option "value" set the additional shift of data (i.e. the data a+value is used instead of a). }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_radar(graph:THMGL; a:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_radar_(gr:Puintptr_t; a:Puintptr_t; pen:Pchar; opt:Pchar; l:longint; 
            lo:longint);cdecl;external;
{/ Draw usual curve x,y,z }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_plot_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_plot_xyz_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; z:Puintptr_t; pen:Pchar; 
            opt:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Draw usual curve x,y }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_plot_xy(graph:THMGL; x:THCDT; y:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_plot_xy_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw usual curve x,y with x in x-axis range }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_plot(graph:THMGL; y:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_plot_(graph:Puintptr_t; y:Puintptr_t; pen:Pchar; opt:Pchar; para5:longint; 
            para6:longint);cdecl;external;
{/ Draw curve x,y,z which is colored by c (like tension plot) }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tens_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; c:THCDT; 
            pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tens_xyz_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; z:Puintptr_t; c:Puintptr_t; 
            pen:Pchar; opt:Pchar; para8:longint; para9:longint);cdecl;external;
{/ Draw curve x,y which is colored by c (like tension plot) }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tens_xy(graph:THMGL; x:THCDT; y:THCDT; c:THCDT; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tens_xy_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; c:Puintptr_t; pen:Pchar; 
            opt:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Draw curve x,y with x in x-axis range which is colored by c (like tension plot) }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tens(graph:THMGL; y:THCDT; c:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tens_(graph:Puintptr_t; y:Puintptr_t; c:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw tapes which rotates as (bi-)normales of curve x,y,z }
{* The width of tape is proportional to barwidth and can be changed by option "value". }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tape_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tape_xyz_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; z:Puintptr_t; pen:Pchar; 
            opt:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Draw tapes which rotates as (bi-)normales of curve x,y }
{* The width of tape is proportional to barwidth and can be changed by option "value". }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tape_xy(graph:THMGL; x:THCDT; y:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tape_xy_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw tapes which rotates as (bi-)normales of curve x,y with x in x-axis range }
{* The width of tape is proportional to barwidth and can be changed by option "value". }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tape(graph:THMGL; y:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tape_(graph:Puintptr_t; y:Puintptr_t; pen:Pchar; opt:Pchar; para5:longint; 
            para6:longint);cdecl;external;
{/ Draw box-plot (special 5-value plot used in statistic) for data specified parametrically }
{* String \a pen may contain ‘<’, ‘^’, ‘>’ for aligning boxes: at left, centered, at right. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_boxplot_xy(graph:THMGL; x:THCDT; a:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_boxplot_xy_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw box-plot (special 5-value plot used in statistic) }
{* String \a pen may contain ‘<’, ‘^’, ‘>’ for aligning boxes: at left, centered, at right. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_boxplot(graph:THMGL; a:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_boxplot_(graph:Puintptr_t; y:Puintptr_t; pen:Pchar; opt:Pchar; para5:longint; 
            para6:longint);cdecl;external;
{/ Fill area between curve x,y,z and axis plane }
{* Gradient filling is used if number of specified colors is equal to 2*number of curves. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_area_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_area_xyz_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; z:Puintptr_t; pen:Pchar; 
            opt:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Fill area between curve x,y and axis plane }
{* Gradient filling is used if number of specified colors is equal to 2*number of curves. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_area_xy(graph:THMGL; x:THCDT; y:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_area_xy_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Fill area between curve x,y with x in x-axis range and axis plane }
{* Gradient filling is used if number of specified colors is equal to 2*number of curves. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_area(graph:THMGL; y:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_area_(graph:Puintptr_t; y:Puintptr_t; pen:Pchar; opt:Pchar; para5:longint; 
            para6:longint);cdecl;external;
{/ Fill area (draw ribbon) between curves x1,y1,z1 and x2,y2,z2 }
{* Gradient filling is used if number of specified colors is equal to 2*number of curves. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_region_3d(graph:THMGL; x1:THCDT; y1:THCDT; z1:THCDT; x2:THCDT; 
            y2:THCDT; z2:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_region_3d_(graph:Puintptr_t; x1:Puintptr_t; y1:Puintptr_t; z1:Puintptr_t; x2:Puintptr_t; 
            y2:Puintptr_t; z2:Puintptr_t; pen:Pchar; opt:Pchar; para10:longint; 
            para11:longint);cdecl;external;
{/ Fill area between curves x,y1 and x,y2 }
{* Style 'i' will fill area only if y1 < y2.
  * Gradient filling is used if number of specified colors is equal to 2*number of curves. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_region_xy(graph:THMGL; x:THCDT; y1:THCDT; y2:THCDT; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_region_xy_(graph:Puintptr_t; x:Puintptr_t; y1:Puintptr_t; y2:Puintptr_t; pen:Pchar; 
            opt:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Fill area between curves x,y1 and x,y2 with x in x-axis range }
{* Style 'i' will fill area only if y1 < y2.
  * Gradient filling is used if number of specified colors is equal to 2*number of curves. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_region(graph:THMGL; y1:THCDT; y2:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_region_(graph:Puintptr_t; y1:Puintptr_t; y2:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw vertical lines from points x,y,z to axis plane }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_stem_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_stem_xyz_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; z:Puintptr_t; pen:Pchar; 
            opt:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Draw vertical lines from points x,y to axis plane }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_stem_xy(graph:THMGL; x:THCDT; y:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_stem_xy_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw vertical lines from points x,y with x in x-axis range to axis plane }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_stem(graph:THMGL; y:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_stem_(graph:Puintptr_t; y:Puintptr_t; pen:Pchar; opt:Pchar; para5:longint; 
            para6:longint);cdecl;external;
{/ Draw stairs for points in arrays x,y,z }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_step_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_step_xyz_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; z:Puintptr_t; pen:Pchar; 
            opt:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Draw stairs for points in arrays x,y }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_step_xy(graph:THMGL; x:THCDT; y:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_step_xy_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw stairs for points in arrays x,y with x in x-axis range }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_step(graph:THMGL; y:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_step_(graph:Puintptr_t; y:Puintptr_t; pen:Pchar; opt:Pchar; para5:longint; 
            para6:longint);cdecl;external;
{/ Draw vertical bars from points x,y,z to axis plane }
{* String \a pen may contain:
 * ‘a’ for drawing boxes one above another (like summation);
 * ‘f’ for waterfall chart;
 * ‘<’, ‘^’, ‘>’ for aligning boxes: at left, centered, at right.
 * Gradient filling is used if number of specified colors is equal to 2*number of curves. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_bars_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_bars_xyz_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; z:Puintptr_t; pen:Pchar; 
            opt:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Draw vertical bars from points x,y to axis plane }
{* String \a pen may contain:
 * ‘a’ for drawing boxes one above another (like summation);
 * ‘f’ for waterfall chart;
 * ‘<’, ‘^’, ‘>’ for aligning boxes: at left, centered, at right.
 * Gradient filling is used if number of specified colors is equal to 2*number of curves. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_bars_xy(graph:THMGL; x:THCDT; y:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_bars_xy_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw vertical bars from points x,y with x in x-axis range to axis plane }
{* String \a pen may contain:
 * ‘a’ for drawing boxes one above another (like summation);
 * ‘f’ for waterfall chart;
 * ‘<’, ‘^’, ‘>’ for aligning boxes: at left, centered, at right.
 * Gradient filling is used if number of specified colors is equal to 2*number of curves. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_bars(graph:THMGL; y:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_bars_(graph:Puintptr_t; y:Puintptr_t; pen:Pchar; opt:Pchar; para5:longint; 
            para6:longint);cdecl;external;
{/ Draw horizontal bars from points v,y to axis plane }
{* String \a pen may contain:
 * ‘a’ for drawing boxes one above another (like summation);
 * ‘f’ for waterfall chart;
 * ‘<’, ‘^’, ‘>’ for aligning boxes: at left, centered, at right.
 * Gradient filling is used if number of specified colors is equal to 2*number of curves. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_barh_yx(graph:THMGL; y:THCDT; v:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_barh_yx_(graph:Puintptr_t; y:Puintptr_t; v:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw horizontal bars from points v,y with y in y-axis range to axis plane }
{* String \a pen may contain:
 * ‘a’ for drawing boxes one above another (like summation);
 * ‘f’ for waterfall chart;
 * ‘<’, ‘^’, ‘>’ for aligning boxes: at left, centered, at right.
 * Gradient filling is used if number of specified colors is equal to 2*number of curves. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_barh(graph:THMGL; v:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_barh_(graph:Puintptr_t; v:Puintptr_t; pen:Pchar; opt:Pchar; para5:longint; 
            para6:longint);cdecl;external;
{/ Draw Open-High-Low-Close (OHLC) diagram }
{*  Different colors for up and down values are used if number of specified colors is equal to 2*number of curves.  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_ohlc_x(graph:THMGL; x:THCDT; open:THCDT; high:THCDT; low:THCDT; 
            close:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_ohlc_x_(graph:Puintptr_t; x:Puintptr_t; open:Puintptr_t; high:Puintptr_t; low:Puintptr_t; 
            close:Puintptr_t; pen:Pchar; opt:Pchar; para9:longint; para10:longint);cdecl;external;
{/ Draw Open-High-Low-Close (OHLC) diagram with x in x-axis range }
{*  Different colors for up and down values are used if number of specified colors is equal to 2*number of curves.  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_ohlc(graph:THMGL; open:THCDT; high:THCDT; low:THCDT; close:THCDT; 
            pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_ohlc_(graph:Puintptr_t; open:Puintptr_t; high:Puintptr_t; low:Puintptr_t; close:Puintptr_t; 
            pen:Pchar; opt:Pchar; para8:longint; para9:longint);cdecl;external;
{/ Draw chart for data a }
{* Space denote transparent color. Style '#' draw black borders.  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_chart(graph:THMGL; a:THCDT; col:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_chart_(graph:Puintptr_t; a:Puintptr_t; col:Pchar; opt:Pchar; para5:longint; 
            para6:longint);cdecl;external;
{/ Draw error boxes ex,ey at points x,y }
{* Style ‘@’ set to draw large semitransparent mark instead of error box. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_error_exy(graph:THMGL; x:THCDT; y:THCDT; ex:THCDT; ey:THCDT; 
            pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_error_exy_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; ex:Puintptr_t; ey:Puintptr_t; 
            pen:Pchar; opt:Pchar; para8:longint; para9:longint);cdecl;external;
{/ Draw error boxes ey at points x,y }
{* Style ‘@’ set to draw large semitransparent mark instead of error box. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_error_xy(graph:THMGL; x:THCDT; y:THCDT; ey:THCDT; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_error_xy_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; ey:Puintptr_t; pen:Pchar; 
            opt:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Draw error boxes ey at points x,y with x in x-axis range }
{* Style ‘@’ set to draw large semitransparent mark instead of error box. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_error(graph:THMGL; y:THCDT; ey:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_error_(graph:Puintptr_t; y:Puintptr_t; ey:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw marks with size r at points x,y,z }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_mark_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; r:THCDT; 
            pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_mark_xyz_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; z:Puintptr_t; r:Puintptr_t; 
            pen:Pchar; opt:Pchar; para8:longint; para9:longint);cdecl;external;
{/ Draw marks with size r at points x,y }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_mark_xy(graph:THMGL; x:THCDT; y:THCDT; r:THCDT; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_mark_xy_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; r:Puintptr_t; pen:Pchar; 
            opt:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Draw marks with size r at points x,y with x in x-axis range }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_mark_y(graph:THMGL; y:THCDT; r:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_mark_y_(graph:Puintptr_t; y:Puintptr_t; r:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw Poincare map at condition s==0 for curve x,y,z }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_pmap_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; s:THCDT; 
            pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_pmap_xyz_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; z:Puintptr_t; r:Puintptr_t; 
            pen:Pchar; opt:Pchar; para8:longint; para9:longint);cdecl;external;
{/ Draw Poincare map at condition s==0 for curve x,y }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_pmap_xy(graph:THMGL; x:THCDT; y:THCDT; s:THCDT; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_pmap_xy_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; r:Puintptr_t; pen:Pchar; 
            opt:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Draw Poincare map at condition s==0 for curve x,y with x in x-axis range }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_pmap(graph:THMGL; y:THCDT; s:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_pmap_(graph:Puintptr_t; y:Puintptr_t; r:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw tube with variable radius r around curve x,y,z }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tube_xyzr(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; r:THCDT; 
            pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tube_xyzr_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; z:Puintptr_t; r:Puintptr_t; 
            pen:Pchar; opt:Pchar; para8:longint; para9:longint);cdecl;external;
{/ Draw tube with variable radius r around curve x,y }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tube_xyr(graph:THMGL; x:THCDT; y:THCDT; r:THCDT; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tube_xyr_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; r:Puintptr_t; pen:Pchar; 
            opt:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Draw tube with variable radius r around curve x,y with x in x-axis range }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tube_r(graph:THMGL; y:THCDT; r:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tube_r_(graph:Puintptr_t; y:Puintptr_t; r:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw tube with constant radius r around curve x,y,z }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tube_xyz(graph:THMGL; x:THCDT; y:THCDT; z:THCDT; r:Tdouble; 
            pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tube_xyz_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; z:Puintptr_t; r:Pmreal; 
            pen:Pchar; opt:Pchar; para8:longint; para9:longint);cdecl;external;
{/ Draw tube with constant radius r around curve x,y }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tube_xy(graph:THMGL; x:THCDT; y:THCDT; r:Tdouble; penl:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tube_xy_(graph:Puintptr_t; x:Puintptr_t; y:Puintptr_t; r:Pmreal; pen:Pchar; 
            opt:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Draw tube with constant radius r around curve x,y with x in x-axis range }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tube(graph:THMGL; y:THCDT; r:Tdouble; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_tube_(graph:Puintptr_t; y:Puintptr_t; r:Pmreal; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw candle plot for data specified parametrically }
{* Different colors are used for up and down values if 2 colors are specified.
 *  Style ‘#’ force drawing wire candle even for 2-color scheme.  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_candle_xyv(gr:THMGL; x:THCDT; v1:THCDT; v2:THCDT; y1:THCDT; 
            y2:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_candle_xyv_(gr:Puintptr_t; x:Puintptr_t; v1:Puintptr_t; v2:Puintptr_t; y1:Puintptr_t; 
            y2:Puintptr_t; pen:Pchar; opt:Pchar; para9:longint; para10:longint);cdecl;external;
{/ Draw candle plot }
{* Different colors are used for up and down values if 2 colors are specified.
 *  Style ‘#’ force drawing wire candle even for 2-color scheme.  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_candle_yv(gr:THMGL; v1:THCDT; v2:THCDT; y1:THCDT; y2:THCDT; 
            pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_candle_yv_(gr:Puintptr_t; v1:Puintptr_t; v2:Puintptr_t; y1:Puintptr_t; y2:Puintptr_t; 
            pen:Pchar; opt:Pchar; para8:longint; para9:longint);cdecl;external;
{/ Draw candle plot with v1=v[i], v2=v[i+1] }
{* Different colors are used for up and down values if 2 colors are specified.
 *  Style ‘#’ force drawing wire candle even for 2-color scheme.  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_candle(gr:THMGL; v:THCDT; y1:THCDT; y2:THCDT; pen:Pchar; 
            opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_candle_(gr:Puintptr_t; y:Puintptr_t; y1:Puintptr_t; y2:Puintptr_t; pen:Pchar; 
            opt:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Draw lines with arrows between points x1,y1,z1 and x2,y2,z2 }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_lines_xyz(gr:THMGL; x1:THCDT; y1:THCDT; z1:THCDT; x2:THCDT; 
            y2:THCDT; z2:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_lines_xyz_(gr:Puintptr_t; x1:Puintptr_t; y1:Puintptr_t; z1:Puintptr_t; x2:Puintptr_t; 
            y2:Puintptr_t; z2:Puintptr_t; pen:Pchar; opt:Pchar; para10:longint; 
            para11:longint);cdecl;external;
{/ Draw lines with arrows between points x1,y1,zMin and x2,y2,zMin }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_lines_xy(gr:THMGL; x1:THCDT; y1:THCDT; x2:THCDT; y2:THCDT; 
            pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_lines_xy_(gr:Puintptr_t; x1:Puintptr_t; y1:Puintptr_t; x2:Puintptr_t; y2:Puintptr_t; 
            pen:Pchar; opt:Pchar; para8:longint; para9:longint);cdecl;external;
{/ Draw lines with arrows between points x1,y and x2,y with y in y-axis range }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_lines_x(gr:THMGL; x1:THCDT; x2:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_lines_x_(gr:Puintptr_t; x1:Puintptr_t; x2:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw lines lines with arrows between x,y1 and x,y2 with x in x-axis range }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_lines(gr:THMGL; y1:THCDT; y2:THCDT; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_lines_(gr:Puintptr_t; y1:Puintptr_t; y2:Puintptr_t; pen:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{ C++ end of extern C conditionnal removed }
{----------------------------------------------------------------------------- }
{$endif}

implementation


end.
