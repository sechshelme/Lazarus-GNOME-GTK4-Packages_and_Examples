
unit canvas_cf;
interface

{
  Automatically converted by H2Pas 1.0.0 from canvas_cf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    canvas_cf.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Pdouble  = ^double;
Pdword  = ^dword;
PFILE  = ^FILE;
Plongint  = ^longint;
PmglDataA  = ^mglDataA;
PmglNum  = ^mglNum;
Pmreal  = ^mreal;
Puintptr_t  = ^uintptr_t;
Pwchar_t  = ^wchar_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{**************************************************************************
 * canvas_cf.h is part of Math Graphic Library
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
{$ifndef MGL_CANVAS_CF_H}
{$define MGL_CANVAS_CF_H}
{$include "mgl2/abstract.h"}
{----------------------------------------------------------------------------- }
{/ Create HMGL object with specified sizes }

function mgl_create_graph(width:longint; height:longint):THMGL;cdecl;external;
function mgl_create_graph_(width:Plongint; height:Plongint):Tuintptr_t;cdecl;external;
{/ Delete HMGL object }
procedure mgl_delete_graph(gr:THMGL);cdecl;external;
procedure mgl_delete_graph_(gr:Puintptr_t);cdecl;external;
{/ Return pointer to built-in (default) HMGL object }
function mgl_default_graph:THMGL;cdecl;external;
function mgl_default_graph_:Tuintptr_t;cdecl;external;
{/ Set size of frame in pixels. Normally this function is called internally. }
procedure mgl_set_size(gr:THMGL; width:longint; height:longint);cdecl;external;
procedure mgl_set_size_(gr:Puintptr_t; width:Plongint; height:Plongint);cdecl;external;
{/ Set size of frame in pixels, but don't erase primitives }
procedure mgl_scale_size(gr:THMGL; width:longint; height:longint);cdecl;external;
procedure mgl_scale_size_(gr:Puintptr_t; width:Plongint; height:Plongint);cdecl;external;
{/ Scaling for all further set size calls. }
procedure mgl_set_size_scl(scl:Tdouble);cdecl;external;
procedure mgl_set_size_scl_(scl:Pdouble);cdecl;external;
{/ Set default parameters for plotting }
procedure mgl_set_def_param(gr:THMGL);cdecl;external;
procedure mgl_set_def_param_(gr:Puintptr_t);cdecl;external;
{/ Combine plots from 2 canvases. Result will be saved into gr }
procedure mgl_combine_gr(gr:THMGL; gr2:THMGL);cdecl;external;
procedure mgl_combine_gr_(gr:Puintptr_t; gr2:Puintptr_t);cdecl;external;
{/ Force preparing the image. It can be useful for OpenGL mode mostly. }
procedure mgl_finish(gr:THMGL);cdecl;external;
procedure mgl_finish_(gr:Puintptr_t);cdecl;external;
{/ Force preparing the image and save result into background one. }
procedure mgl_rasterize(gr:THMGL);cdecl;external;
procedure mgl_rasterize_(gr:Puintptr_t);cdecl;external;
{/ Set boundary box for export graphics into 2D file formats. }
{* If x2<0 (y2<0) then full width (height) will be used.
 *  If x1<0 or y1<0 or x1>=x2|Width or y1>=y2|Height then cropping will be disabled.  }
procedure mgl_set_bbox(gr:THMGL; x1:longint; y1:longint; x2:longint; y2:longint);cdecl;external;
procedure mgl_set_bbox_(gr:Puintptr_t; x1:Plongint; y1:Plongint; x2:Plongint; y2:Plongint);cdecl;external;
{/ Set the size of semi-transparent area around lines, marks, glyphs, ... Default is 1. }
procedure mgl_pen_delta(gr:THMGL; d:Tdouble);cdecl;external;
procedure mgl_pen_delta_(gr:Puintptr_t; d:Pdouble);cdecl;external;
{/ Set tick length }
procedure mgl_set_tick_len(gr:THMGL; len:Tdouble; stt:Tdouble);cdecl;external;
procedure mgl_set_tick_len_(gr:Puintptr_t; len:Pmreal; stt:Pmreal);cdecl;external;
{/ Set axis and ticks style }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_set_axis_stl(gr:THMGL; stl:Pchar; tck:Pchar; sub:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_set_axis_stl_(gr:Puintptr_t; stl:Pchar; tck:Pchar; sub:Pchar; para5:longint; 
            para6:longint; para7:longint);cdecl;external;
{/ Auto adjust ticks }
(* Const before type ignored *)
procedure mgl_adjust_ticks(gr:THMGL; dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_adjust_ticks_(gr:Puintptr_t; dir:Pchar; para3:longint);cdecl;external;
{/ Auto adjust ticks and set ticks format ("+E0123456789-fF") }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_adjust_ticks_ext(gr:THMGL; dir:Pchar; stl:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_adjust_ticks_ext_(gr:Puintptr_t; dir:Pchar; stl:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Set the ticks parameters }
procedure mgl_set_ticks(gr:THMGL; dir:char; d:Tdouble; ns:longint; org:Tdouble);cdecl;external;
procedure mgl_set_ticks_(gr:Puintptr_t; dir:Pchar; d:Pmreal; ns:Plongint; org:Pmreal; 
            para6:longint);cdecl;external;
{/ Set the ticks parameters and specify ticks factor string }
(* Const before type ignored *)
procedure mgl_set_ticks_fact(gr:THMGL; dir:char; d:Tdouble; ns:longint; org:Tdouble; 
            fact:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_set_ticks_factw(gr:THMGL; dir:char; d:Tdouble; ns:longint; org:Tdouble; 
            fact:Pwchar_t);cdecl;external;
(* Const before type ignored *)
procedure mgl_set_ticks_fact_(gr:Puintptr_t; dir:Pchar; d:Pdouble; ns:Plongint; org:Pdouble; 
            fact:Pchar; para7:longint; para8:longint);cdecl;external;
{/ Set manual ticks text (\n separated). Use "" to disable this feature. }
(* Const before type ignored *)
procedure mgl_set_ticks_str(gr:THMGL; dir:char; lbl:Pchar; add:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_set_ticks_str_(gr:Puintptr_t; dir:Pchar; lbl:Pchar; add:Plongint; para5:longint; 
            para6:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_set_ticks_wcs(gr:THMGL; dir:char; lbl:Pwchar_t; add:longint);cdecl;external;
{/ Set manual ticks position and text (\n separated). Use "" to disable this feature. }
(* Const before type ignored *)
procedure mgl_set_ticks_val(gr:THMGL; dir:char; val:THCDT; lbl:Pchar; add:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_set_ticks_val_(gr:Puintptr_t; dir:Pchar; val:Puintptr_t; lbl:Pchar; add:Plongint; 
            para6:longint; para7:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_set_ticks_valw(gr:THMGL; dir:char; val:THCDT; lbl:Pwchar_t; add:longint);cdecl;external;
{/ Add manual tick at given position. Use "" to disable this feature. }
(* Const before type ignored *)
procedure mgl_add_tick(gr:THMGL; dir:char; val:Tdouble; lbl:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_add_tick_(gr:Puintptr_t; dir:Pchar; val:Pmreal; lbl:Pchar; para5:longint; 
            para6:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_add_tickw(gr:THMGL; dir:char; val:Tdouble; lbl:Pwchar_t);cdecl;external;
{/ Tune ticks (tune|1 for common multiplier, tune|2 for common component) }
procedure mgl_tune_ticks(gr:THMGL; tune:longint; fact_pos:Tdouble);cdecl;external;
procedure mgl_tune_ticks_(gr:Puintptr_t; tune:Plongint; fact_pos:Pmreal);cdecl;external;
{/ Set templates for ticks }
(* Const before type ignored *)
procedure mgl_set_tick_templ(gr:THMGL; dir:char; templ:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_set_tick_templ_(gr:Puintptr_t; dir:Pchar; templ:Pchar; para4:longint; para5:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_set_tick_templw(gr:THMGL; dir:char; templ:Pwchar_t);cdecl;external;
{/ Set time templates for ticks }
(* Const before type ignored *)
procedure mgl_set_ticks_time(gr:THMGL; dir:char; d:Tdouble; t:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_set_ticks_time_(gr:Puintptr_t; dir:Pchar; d:Pmreal; t:Pchar; para5:longint; 
            para6:longint);cdecl;external;
{/ Set additional shift of tick labels }
procedure mgl_set_tick_shift(gr:THMGL; sx:Tdouble; sy:Tdouble; sz:Tdouble; sc:Tdouble);cdecl;external;
procedure mgl_set_tick_shift_(gr:Puintptr_t; sx:Pmreal; sy:Pmreal; sz:Pmreal; sc:Pmreal);cdecl;external;
{/ Draws bounding box outside the plotting volume }
procedure mgl_box(gr:THMGL);cdecl;external;
procedure mgl_box_(gr:Puintptr_t);cdecl;external;
{/ Draws bounding box outside the plotting volume with color c }
{* Style ‘@’ produce filled back faces.  }
(* Const before type ignored *)
procedure mgl_box_str(gr:THMGL; col:Pchar; ticks:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_box_str_(gr:Puintptr_t; col:Pchar; ticks:Plongint; para4:longint);cdecl;external;
{/ Draw axises with ticks in direction(s) dir. }
{* Parameter \a dir may contain:
 *	‘xyzt’for drawing axis in corresponding direction;
 *	‘XYZT’ for drawing axis in corresponding direction but with inverted positions of labels;
 *	‘~’, ‘_’ for disabling tick labels;
 *	‘U’ for disabling rotation of tick labels;
 *	‘^’ for inverting default axis origin;
 *	‘!’ for disabling ticks tuning;
 *	‘AKDTVISO’ for drawing arrow at the end of axis;
 *	‘a’ for forced adjusting of axis ticks;
 *	‘f’ for printing ticks labels in fixed format;
 *	‘E’ for using ‘E’ instead of ‘e’ in ticks labels;
 *	‘F’ for printing ticks labels in LaTeX format;
 *	‘+’ for printing ‘+’ for positive ticks;
 *	‘-’ for printing usual ‘-’ in ticks labels;
 *	‘0123456789’ for precision at printing ticks labels.
 *	 Option "value" set the manual rotation angle for the ticks. }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_axis(gr:THMGL; dir:Pchar; stl:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_axis_(gr:Puintptr_t; dir:Pchar; stl:Pchar; opt:Pchar; para5:longint; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw grid lines perpendicular to direction(s) dir. }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_axis_grid(gr:THMGL; dir:Pchar; pen:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_axis_grid_(gr:Puintptr_t; dir:Pchar; pen:Pchar; opt:Pchar; para5:longint; 
            para6:longint; para7:longint);cdecl;external;
{/ Print the label text for axis dir. }
{* Option "value" set additional shifting of the label.  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_label(gr:THMGL; dir:char; text:Pchar; pos:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_label_(gr:Puintptr_t; dir:Pchar; text:Pchar; pos:Pmreal; opt:Pchar; 
            para6:longint; para7:longint; para8:longint);cdecl;external;
{/ Print the label text for axis dir. }
{* Option "value" set additional shifting of the label.  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_labelw(gr:THMGL; dir:char; text:Pwchar_t; pos:Tdouble; opt:Pchar);cdecl;external;
{/ Draw colorbar at edge of axis }
{* Parameter \a sch may contain:
 *	 ‘<>^_’ for positioning at left, at right, at top or at bottom correspondingly;
 *	 ‘I’ for positioning near bounding (by default, at edges of subplot);
 *	 ‘A’ for using absolute coordinates;
 *	 ‘~’ for disabling tick labels.
 *	 ‘!’ for disabling ticks tuning;
 *	 ‘f’ for printing ticks labels in fixed format;
 *	 ‘E’ for using ‘E’ instead of ‘e’ in ticks labels;
 *	 ‘F’ for printing ticks labels in LaTeX format;
 *	 ‘+’ for printing ‘+’ for positive ticks;
 *	 ‘-’ for printing usual ‘-’ in ticks labels;
 *	 ‘0123456789’ for precision at printing ticks labels. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_colorbar(gr:THMGL; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_colorbar_(gr:Puintptr_t; sch:Pchar; opt:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Draw colorbar at manual position }
{* Parameter \a sch may contain:
 *	 ‘<>^_’ for positioning at left, at right, at top or at bottom correspondingly;
 *	 ‘I’ for positioning near bounding (by default, at edges of subplot);
 *	 ‘A’ for using absolute coordinates;
 *	 ‘~’ for disabling tick labels.
 *	 ‘!’ for disabling ticks tuning;
 *	 ‘f’ for printing ticks labels in fixed format;
 *	 ‘E’ for using ‘E’ instead of ‘e’ in ticks labels;
 *	 ‘F’ for printing ticks labels in LaTeX format;
 *	 ‘+’ for printing ‘+’ for positive ticks;
 *	 ‘-’ for printing usual ‘-’ in ticks labels;
 *	 ‘0123456789’ for precision at printing ticks labels. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_colorbar_ext(gr:THMGL; sch:Pchar; x:Tdouble; y:Tdouble; w:Tdouble; 
            h:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_colorbar_ext_(gr:Puintptr_t; sch:Pchar; x:Pmreal; y:Pmreal; w:Pmreal; 
            h:Pmreal; opt:Pchar; para8:longint; para9:longint);cdecl;external;
{/ Draw colorbar with manual colors at edge of axis }
{* Parameter \a sch may contain:
 *	 ‘<>^_’ for positioning at left, at right, at top or at bottom correspondingly;
 *	 ‘I’ for positioning near bounding (by default, at edges of subplot);
 *	 ‘A’ for using absolute coordinates;
 *	 ‘~’ for disabling tick labels.
 *	 ‘!’ for disabling ticks tuning;
 *	 ‘f’ for printing ticks labels in fixed format;
 *	 ‘E’ for using ‘E’ instead of ‘e’ in ticks labels;
 *	 ‘F’ for printing ticks labels in LaTeX format;
 *	 ‘+’ for printing ‘+’ for positive ticks;
 *	 ‘-’ for printing usual ‘-’ in ticks labels;
 *	 ‘0123456789’ for precision at printing ticks labels. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_colorbar_val(gr:THMGL; dat:THCDT; sch:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_colorbar_val_(gr:Puintptr_t; dat:Puintptr_t; sch:Pchar; opt:Pchar; para5:longint; 
            para6:longint);cdecl;external;
{/ Draw colorbar with manual colors at manual position }
{* Parameter \a sch may contain:
 *	 ‘<>^_’ for positioning at left, at right, at top or at bottom correspondingly;
 *	 ‘I’ for positioning near bounding (by default, at edges of subplot);
 *	 ‘A’ for using absolute coordinates;
 *	 ‘~’ for disabling tick labels.
 *	 ‘!’ for disabling ticks tuning;
 *	 ‘f’ for printing ticks labels in fixed format;
 *	 ‘E’ for using ‘E’ instead of ‘e’ in ticks labels;
 *	 ‘F’ for printing ticks labels in LaTeX format;
 *	 ‘+’ for printing ‘+’ for positive ticks;
 *	 ‘-’ for printing usual ‘-’ in ticks labels;
 *	 ‘0123456789’ for precision at printing ticks labels. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_colorbar_val_ext(gr:THMGL; dat:THCDT; sch:Pchar; x:Tdouble; y:Tdouble; 
            w:Tdouble; h:Tdouble; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_colorbar_val_ext_(gr:Puintptr_t; dat:Puintptr_t; sch:Pchar; x:Pmreal; y:Pmreal; 
            w:Pmreal; h:Pmreal; opt:Pchar; para9:longint; para10:longint);cdecl;external;
{/ Add string to legend }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_add_legend(gr:THMGL; text:Pchar; style:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_add_legend_(gr:Puintptr_t; text:Pchar; style:Pchar; para4:longint; para5:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_add_legendw(gr:THMGL; text:Pwchar_t; style:Pchar);cdecl;external;
{/ Clear saved legend string }
procedure mgl_clear_legend(gr:THMGL);cdecl;external;
procedure mgl_clear_legend_(gr:Puintptr_t);cdecl;external;
{/ Draw legend of accumulated strings at position x,y }
{* Parameter fnt may contain:
 *	 font style for legend text;
 *	 colors for background (first one), border (second one) and text (last one);
 *	 ‘A’ for positioning in absolute coordinates;
 *	 ‘^’ for positioning outside of specified point;
 *	 ‘-’ for arranging entries horizontally;
 *	 ‘#’ for drawing box around legend.
 * Option value set the space between line samples and text (default is 0.1). }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_legend_pos(gr:THMGL; x:Tdouble; y:Tdouble; font:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_legend_pos_(gr:Puintptr_t; x:Pmreal; y:Pmreal; font:Pchar; opt:Pchar; 
            para6:longint; para7:longint);cdecl;external;
{/ Draw legend of accumulated strings }
{* Parameter fnt may contain:
 *	 font style for legend text;
 *	 colors for background (first one), border (second one) and text (last one);
 *	 ‘A’ for positioning in absolute coordinates;
 *	 ‘^’ for positioning outside of specified point;
 *	 ‘-’ for arranging entries horizontally;
 *	 ‘#’ for drawing box around legend.
 * Option value set the space between line samples and text (default is 0.1).
 * Parameter \a where sets position: 0 at bottom-left, 1 at bottom-right, 2 at top-left, 3 at top-right (default). }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_legend(gr:THMGL; where:longint; font:Pchar; opt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_legend_(gr:Puintptr_t; where:Plongint; font:Pchar; opt:Pchar; para5:longint; 
            para6:longint);cdecl;external;
{/ Set number of marks in legend sample }
procedure mgl_set_legend_marks(gr:THMGL; num:longint);cdecl;external;
procedure mgl_set_legend_marks_(gr:Puintptr_t; num:Plongint);cdecl;external;
{/ Show current image }
(* Const before type ignored *)
procedure mgl_show_image(gr:THMGL; viewer:Pchar; keep:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_show_image_(gr:Puintptr_t; viewer:Pchar; keep:Plongint; para4:longint);cdecl;external;
{/ Write the frame in file (depending extension, write current frame if fname is empty) }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_frame(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_frame_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Write the frame in file using BMP format }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_tga(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_tga_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Write the frame in file using BMP format }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_bmp(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_bmp_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Write the frame in file using JPEG format }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_jpg(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_jpg_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Write the frame in file using PNG format with transparency }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_png(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_png_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Write the frame in file using PNG format without transparency }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_png_solid(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_png_solid_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Write the frame in file using PostScript format as bitmap }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_bps(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_bps_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Write the frame in file using PostScript format }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_eps(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_eps_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Write the frame in file using SVG format }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_svg(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_svg_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Write the frame in file using LaTeX format }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_tex(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_tex_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Write the frame in file using OBJ format }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_obj(gr:THMGL; fname:Pchar; descr:Pchar; use_png:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_obj_(gr:Puintptr_t; fname:Pchar; descr:Pchar; use_png:Plongint; para5:longint; 
            para6:longint);cdecl;external;
{/ Write the frame in file using OBJ format (old version) }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_obj_old(gr:THMGL; fname:Pchar; descr:Pchar; use_png:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_obj_old_(gr:Puintptr_t; fname:Pchar; descr:Pchar; use_png:Plongint; para5:longint; 
            para6:longint);cdecl;external;
{/ Write the frame in file using STL format (faces only) }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_stl(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_stl_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Write the frame in file using OFF format }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_off(gr:THMGL; fname:Pchar; descr:Pchar; colored:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_off_(gr:Puintptr_t; fname:Pchar; descr:Pchar; colored:Plongint; para5:longint; 
            para6:longint);cdecl;external;
{/ Write the frame in file using XYZ format }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_xyz(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_xyz_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
{void  mgl_write_x3d(HMGL gr, const char *fname,const char *descr);
void  mgl_write_x3d_(uintptr_t *gr, const char *fname,const char *descr,int,int);
void  mgl_write_wgl(HMGL gr, const char *fname,const char *descr);
void  mgl_write_wgl_(uintptr_t *gr, const char *fname,const char *descr,int,int); }
{/ Write the frame in file using PRC format }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_prc(gr:THMGL; fname:Pchar; descr:Pchar; make_pdf:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_prc_(gr:Puintptr_t; fname:Pchar; descr:Pchar; make_pdf:Plongint; para5:longint; 
            para6:longint);cdecl;external;
{/ Write the frame in file using GIF format (only for current frame!) }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_gif(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_gif_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Start write frames to cinema using GIF format }
(* Const before type ignored *)
procedure mgl_start_gif(gr:THMGL; fname:Pchar; ms:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_start_gif_(gr:Puintptr_t; fname:Pchar; ms:Plongint; para4:longint);cdecl;external;
{/ Stop writing cinema using GIF format }
procedure mgl_close_gif(gr:THMGL);cdecl;external;
procedure mgl_close_gif_(gr:Puintptr_t);cdecl;external;
{/ Export points and primitives in file using MGLD format }
(* Const before type ignored *)
(* Const before type ignored *)
procedure _mgld(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure _mgld_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
{/ Import points and primitives from file using MGLD format }
(* Const before type ignored *)
procedure mgl_import_mgld(gr:THMGL; fname:Pchar; add:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_import_mgld_(gr:Puintptr_t; fname:Pchar; add:Plongint; para4:longint);cdecl;external;
{/ Export in JSON format suitable for later drawing by JavaScript }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_json(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_json_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_json_z(gr:THMGL; fname:Pchar; descr:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_write_json_z_(gr:Puintptr_t; fname:Pchar; descr:Pchar; para4:longint; para5:longint);cdecl;external;
(* Const before type ignored *)
function mgl_get_json(gr:THMGL):Pchar;cdecl;external;
{/ Get RGB values of current bitmap }
{* Position of element i,j is [3*i + 3*Width*j].  }
(* Const before type ignored *)
function mgl_get_rgb(gr:THMGL):Pbyte;cdecl;external;
(* Const before type ignored *)
function mgl_get_rgb_(gr:Puintptr_t):Pbyte;cdecl;external;
{/ Get RGBA values of current bitmap }
{* Position of element i,j is [4*i + 4*Width*j].  }
(* Const before type ignored *)
function mgl_get_rgba(gr:THMGL):Pbyte;cdecl;external;
(* Const before type ignored *)
function mgl_get_rgba_(gr:Puintptr_t):Pbyte;cdecl;external;
{/ Get RGBA values of background image }
{* Position of element i,j is [4*i + 4*Width*j].  }
(* Const before type ignored *)
function mgl_get_background(gr:THMGL):Pbyte;cdecl;external;
(* Const before type ignored *)
function mgl_get_background_(gr:Puintptr_t):Pbyte;cdecl;external;
{/ Set object/subplot id }
procedure mgl_set_obj_id(gr:THMGL; id:longint);cdecl;external;
procedure mgl_set_obj_id_(gr:Puintptr_t; id:Plongint);cdecl;external;
{/ Get object id }
function mgl_get_obj_id(gr:THMGL; x:longint; y:longint):longint;cdecl;external;
function mgl_get_obj_id_(gr:Puintptr_t; x:Plongint; y:Plongint):longint;cdecl;external;
{/ Get subplot id }
function mgl_get_spl_id(gr:THMGL; x:longint; y:longint):longint;cdecl;external;
function mgl_get_spl_id_(gr:Puintptr_t; x:Plongint; y:Plongint):longint;cdecl;external;
{/ Get width of the image }
function mgl_get_width(gr:THMGL):longint;cdecl;external;
function mgl_get_width_(gr:Puintptr_t):longint;cdecl;external;
{/ Get height of the image }
function mgl_get_height(gr:THMGL):longint;cdecl;external;
function mgl_get_height_(gr:Puintptr_t):longint;cdecl;external;
{/ Calculate 3D coordinate x,y,z for screen point xs,ys }
procedure mgl_calc_xyz(gr:THMGL; xs:longint; ys:longint; x:Pmreal; y:Pmreal; 
            z:Pmreal);cdecl;external;
procedure mgl_calc_xyz_(gr:Puintptr_t; xs:Plongint; ys:Plongint; x:Pmreal; y:Pmreal; 
            z:Pmreal);cdecl;external;
{/ Calculate screen point xs,ys for 3D coordinate x,y,z }
procedure mgl_calc_scr(gr:THMGL; x:Tdouble; y:Tdouble; z:Tdouble; xs:Plongint; 
            ys:Plongint);cdecl;external;
procedure mgl_calc_scr_(gr:Puintptr_t; x:Pmreal; y:Pmreal; z:Pmreal; xs:Plongint; 
            ys:Plongint);cdecl;external;
{/ Check if xs,ys is close to active point with accuracy d, and return its position or -1 }
function mgl_is_active(gr:THMGL; xs:longint; ys:longint; d:longint):longint;cdecl;external;
function mgl_is_active_(gr:Puintptr_t; xs:Plongint; ys:Plongint; d:Plongint):longint;cdecl;external;
{/ Create new frame. }
function mgl_new_frame(gr:THMGL):longint;cdecl;external;
function mgl_new_frame_(gr:Puintptr_t):longint;cdecl;external;
{/ Finish frame drawing }
procedure mgl_end_frame(gr:THMGL);cdecl;external;
procedure mgl_end_frame_(gr:Puintptr_t);cdecl;external;
{/ Get the number of created frames }
function mgl_get_num_frame(gr:THMGL):longint;cdecl;external;
function mgl_get_num_frame_(gr:Puintptr_t):longint;cdecl;external;
{/ Reset frames counter (start it from zero) }
procedure mgl_reset_frames(gr:THMGL);cdecl;external;
procedure mgl_reset_frames_(gr:Puintptr_t);cdecl;external;
{/ Get drawing data for i-th frame (work if MGL_VECT_FRAME is set on) }
procedure mgl_get_frame(gr:THMGL; i:longint);cdecl;external;
procedure mgl_get_frame_(gr:Puintptr_t; i:Plongint);cdecl;external;
{/ Set drawing data for i-th frame (work if MGL_VECT_FRAME is set on) }
procedure mgl_set_frame(gr:THMGL; i:longint);cdecl;external;
procedure mgl_set_frame_(gr:Puintptr_t; i:Plongint);cdecl;external;
{/ Append drawing data from i-th frame (work if MGL_VECT_FRAME is set on) }
procedure mgl_show_frame(gr:THMGL; i:longint);cdecl;external;
procedure mgl_show_frame_(gr:Puintptr_t; i:Plongint);cdecl;external;
{/ Delete primitives for i-th frame (work if MGL_VECT_FRAME is set on) }
procedure mgl_del_frame(gr:THMGL; i:longint);cdecl;external;
procedure mgl_del_frame_(gr:Puintptr_t; i:Plongint);cdecl;external;
{/ Clear list of primitives for current drawing }
procedure mgl_clear_frame(gr:THMGL);cdecl;external;
procedure mgl_clear_frame_(gr:Puintptr_t);cdecl;external;
{/ Set the transparency type (0 - usual, 1 - glass, 2 - lamp) }
procedure mgl_set_transp_type(gr:THMGL; kind:longint);cdecl;external;
procedure mgl_set_transp_type_(gr:Puintptr_t; kind:Plongint);cdecl;external;
{/ Set the transparency on/off. }
procedure mgl_set_alpha(gr:THMGL; enable:longint);cdecl;external;
procedure mgl_set_alpha_(gr:Puintptr_t; enable:Plongint);cdecl;external;
{/ Set the gray-scale mode on/off. }
procedure mgl_set_gray(gr:THMGL; enable:longint);cdecl;external;
procedure mgl_set_gray_(gr:Puintptr_t; enable:Plongint);cdecl;external;
{/ Set the fog distance or switch it off (if d=0). }
procedure mgl_set_fog(gr:THMGL; d:Tdouble; dz:Tdouble);cdecl;external;
procedure mgl_set_fog_(gr:Puintptr_t; dist:Pmreal; dz:Pmreal);cdecl;external;
{/ Set the using of light on/off. }
procedure mgl_set_light(gr:THMGL; enable:longint);cdecl;external;
procedure mgl_set_light_(gr:Puintptr_t; enable:Plongint);cdecl;external;
{/ Switch on/off the specified light source. }
procedure mgl_set_light_n(gr:THMGL; n:longint; enable:longint);cdecl;external;
procedure mgl_set_light_n_(gr:Puintptr_t; n:Plongint; enable:Plongint);cdecl;external;
{/ Set to attach light settings to inplot. }
procedure mgl_set_attach_light(gr:THMGL; enable:longint);cdecl;external;
procedure mgl_set_attach_light_(gr:Puintptr_t; enable:Plongint);cdecl;external;
{/ Add white light source at infinity. }
procedure mgl_add_light(gr:THMGL; n:longint; x:Tdouble; y:Tdouble; z:Tdouble);cdecl;external;
procedure mgl_add_light_(gr:Puintptr_t; n:Plongint; x:Pmreal; y:Pmreal; z:Pmreal);cdecl;external;
{/ Add light source at infinity (more settings). }
procedure mgl_add_light_ext(gr:THMGL; n:longint; x:Tdouble; y:Tdouble; z:Tdouble; 
            c:char; br:Tdouble; ap:Tdouble);cdecl;external;
procedure mgl_add_light_ext_(gr:Puintptr_t; n:Plongint; x:Pmreal; y:Pmreal; z:Pmreal; 
            c:Pchar; br:Pmreal; ap:Pmreal; para9:longint);cdecl;external;
{/ Add local light source. }
procedure mgl_add_light_loc(gr:THMGL; n:longint; x:Tdouble; y:Tdouble; z:Tdouble; 
            dx:Tdouble; dy:Tdouble; dz:Tdouble; c:char; br:Tdouble; 
            ap:Tdouble);cdecl;external;
procedure mgl_add_light_loc_(gr:Puintptr_t; n:Plongint; x:Pmreal; y:Pmreal; z:Pmreal; 
            dx:Pmreal; dy:Pmreal; dz:Pmreal; c:Pchar; br:Pmreal; 
            ap:Pmreal; para12:longint);cdecl;external;
{/ Pop transformation matrix from stack }
procedure mgl_mat_pop(gr:THMGL);cdecl;external;
procedure mgl_mat_pop_(gr:Puintptr_t);cdecl;external;
{/ Push transformation matrix into stack }
procedure mgl_mat_push(gr:THMGL);cdecl;external;
procedure mgl_mat_push_(gr:Puintptr_t);cdecl;external;
{/ Clear up the frame }
procedure mgl_clf(gr:THMGL);cdecl;external;
procedure mgl_clf_(gr:Puintptr_t);cdecl;external;
{/ Clear up the frame but keep fog settings }
procedure mgl_clf_nfog(gr:THMGL);cdecl;external;
procedure mgl_clf_nfog_(gr:Puintptr_t);cdecl;external;
{/ Clear up the frame and fill background by specified color }
procedure mgl_clf_rgb(gr:THMGL; r:Tdouble; g:Tdouble; b:Tdouble);cdecl;external;
procedure mgl_clf_rgba(gr:THMGL; r:Tdouble; g:Tdouble; b:Tdouble; a:Tdouble);cdecl;external;
procedure mgl_clf_rgb_(gr:Puintptr_t; r:Pmreal; g:Pmreal; b:Pmreal);cdecl;external;
procedure mgl_clf_rgba_(gr:Puintptr_t; r:Pmreal; g:Pmreal; b:Pmreal; a:Pmreal);cdecl;external;
{/ Clear up the frame and fill background by specified color }
procedure mgl_clf_chr(gr:THMGL; col:char);cdecl;external;
(* Const before type ignored *)
procedure mgl_clf_chr_(gr:Puintptr_t; col:Pchar; para3:longint);cdecl;external;
{/ Clear up the frame and fill background by specified color with manual transparency }
(* Const before type ignored *)
procedure mgl_clf_str(gr:THMGL; col:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_clf_str_(gr:Puintptr_t; col:Pchar; para3:longint);cdecl;external;
{/ Load background image }
(* Const before type ignored *)
procedure mgl_load_background(gr:THMGL; fname:Pchar; alpha:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure mgl_load_background_(gr:Puintptr_t; fname:Pchar; alpha:Pmreal; para4:longint);cdecl;external;
{/ Load background image }
{* Parameter 'how' can be:
	*   'a' for filling current subplot only;
	*   's' for scaling (resizing) image to whole area;
	*   'c' for centering image;
	*   'm' for tessellate image as mosaic.  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_load_background_ext(gr:THMGL; fname:Pchar; how:Pchar; alpha:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_load_background_ext_(gr:Puintptr_t; fname:Pchar; how:Pchar; alpha:Pmreal; para5:longint; 
            para6:longint);cdecl;external;
{/ Fill background by specified color. Colors r,g,b should be in range [0,1]. }
procedure mgl_fill_background(gr:THMGL; r:Tdouble; g:Tdouble; b:Tdouble; a:Tdouble);cdecl;external;
procedure mgl_fill_background_(gr:Puintptr_t; r:Pdouble; g:Pdouble; b:Pdouble; a:Pdouble);cdecl;external;
{/ Put further plotting in m-th cell of nx*ny grid of the image. }
{* String \a style may contain:
 *  '<' for reserving space at left
 *  '>' for reserving space at right
 *  '^' for reserving space at top
 *  '_' for reserving space at bottom
 *  '#' for using whole region.  }
(* Const before type ignored *)
procedure mgl_subplot(gr:THMGL; nx:longint; ny:longint; m:longint; style:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_subplot_(gr:Puintptr_t; nx:Plongint; ny:Plongint; m:Plongint; s:Pchar; 
            para6:longint);cdecl;external;
{/ Put further plotting in m-th cell of nx*ny grid of the image and shift it by distance dx,dy. }
{* String \a style may contain:
 *  '<' for reserving space at left
 *  '>' for reserving space at right
 *  '^' for reserving space at top
 *  '_' for reserving space at bottom
 *  '#' for using whole region.  }
(* Const before type ignored *)
procedure mgl_subplot_d(gr:THMGL; nx:longint; ny:longint; m:longint; style:Pchar; 
            dx:Tdouble; dy:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure mgl_subplot_d_(gr:Puintptr_t; nx:Plongint; ny:Plongint; m:Plongint; style:Pchar; 
            dx:Pmreal; dy:Pmreal; l:longint);cdecl;external;
{/ Put further plotting in rectangle of dx*dy cells starting from m-th cell of nx*ny grid of the image. }
{* String \a style may contain:
 *  '<' for reserving space at left
 *  '>' for reserving space at right
 *  '^' for reserving space at top
 *  '_' for reserving space at bottom
 *  '#' for using whole region.  }
(* Const before type ignored *)
procedure mgl_multiplot(gr:THMGL; nx:longint; ny:longint; m:longint; dx:longint; 
            dy:longint; style:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_multiplot_(gr:Puintptr_t; nx:Plongint; ny:Plongint; m:Plongint; dx:Plongint; 
            dy:Plongint; s:Pchar; para8:longint);cdecl;external;
{/ Put further plotting in rectangle of dx*dy cells starting from m-th cell of nx*ny grid of the image and shift it by distance sx,sy.. }
{* String \a style may contain:
 *  '<' for reserving space at left
 *  '>' for reserving space at right
 *  '^' for reserving space at top
 *  '_' for reserving space at bottom
 *  '#' for using whole region.  }
(* Const before type ignored *)
procedure mgl_multiplot_d(gr:THMGL; nx:longint; ny:longint; m:longint; dx:longint; 
            dy:longint; style:Pchar; sx:Tdouble; sy:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure mgl_multiplot_d_(gr:Puintptr_t; nx:Plongint; ny:Plongint; m:Plongint; dx:Plongint; 
            dy:Plongint; s:Pchar; sx:Pmreal; sy:Pmreal; para10:longint);cdecl;external;
{/ Put further plotting in a region [x1,x2]*[y1,y2] of the image (x1,x2,y1,y2 in range [0, 1]). }
procedure mgl_inplot(gr:THMGL; x1:Tdouble; x2:Tdouble; y1:Tdouble; y2:Tdouble);cdecl;external;
procedure mgl_inplot_(gr:Puintptr_t; x1:Pmreal; x2:Pmreal; y1:Pmreal; y2:Pmreal);cdecl;external;
{/ Put further plotting in a region [x1,x2]*[y1,y2] of the subplot (x1,x2,y1,y2 in range [0, 1]). }
procedure mgl_relplot(gr:THMGL; x1:Tdouble; x2:Tdouble; y1:Tdouble; y2:Tdouble);cdecl;external;
procedure mgl_relplot_(gr:Puintptr_t; x1:Pmreal; x2:Pmreal; y1:Pmreal; y2:Pmreal);cdecl;external;
{/ Put further plotting in column cell of previous subplot/inplot. }
procedure mgl_columnplot(gr:THMGL; num:longint; ind:longint; d:Tdouble);cdecl;external;
procedure mgl_columnplot_(gr:Puintptr_t; num:Plongint; i:Plongint; d:Pmreal);cdecl;external;
{/ Put further plotting in matrix cell of previous subplot/inplot. }
procedure mgl_gridplot(gr:THMGL; nx:longint; ny:longint; m:longint; d:Tdouble);cdecl;external;
procedure mgl_gridplot_(gr:Puintptr_t; nx:Plongint; ny:Plongint; m:Plongint; d:Pmreal);cdecl;external;
{/ Put further plotting in cell of stick rotated on angles tet, phi. }
procedure mgl_stickplot(gr:THMGL; num:longint; ind:longint; tet:Tdouble; phi:Tdouble);cdecl;external;
procedure mgl_stickplot_(gr:Puintptr_t; num:Plongint; i:Plongint; tet:Pmreal; phi:Pmreal);cdecl;external;
{/ Put further plotting in cell of stick sheared on sx, sy. }
procedure mgl_shearplot(gr:THMGL; num:longint; ind:longint; sx:Tdouble; sy:Tdouble; 
            xd:Tdouble; yd:Tdouble);cdecl;external;
procedure mgl_shearplot_(gr:Puintptr_t; num:Plongint; i:Plongint; sy:Pmreal; sx:Pmreal; 
            xd:Pmreal; yd:Pmreal);cdecl;external;
{/ Add title for current subplot/inplot. }
{* Style '#' draw box around the title.  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_title(gr:THMGL; title:Pchar; stl:Pchar; size:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_title_(gr:Puintptr_t; title:Pchar; stl:Pchar; size:Pmreal; para5:longint; 
            para6:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_titlew(gr:THMGL; title:Pwchar_t; stl:Pchar; size:Tdouble);cdecl;external;
{/ Set factor of plot size }
procedure mgl_set_plotfactor(gr:THMGL; val:Tdouble);cdecl;external;
procedure mgl_set_plotfactor_(gr:Puintptr_t; val:Pmreal);cdecl;external;
{/ Set aspect ratio for further plotting. }
procedure mgl_aspect(gr:THMGL; Ax:Tdouble; Ay:Tdouble; Az:Tdouble);cdecl;external;
procedure mgl_aspect_(gr:Puintptr_t; Ax:Pmreal; Ay:Pmreal; Az:Pmreal);cdecl;external;
{/ Set aspect ratio for further plotting. }
procedure mgl_shear(gr:THMGL; Sx:Tdouble; Sz:Tdouble);cdecl;external;
procedure mgl_shear_(gr:Puintptr_t; Sx:Pmreal; Sy:Pmreal);cdecl;external;
{/ Rotate a further plotting. }
procedure mgl_rotate(gr:THMGL; TetX:Tdouble; TetZ:Tdouble; TetY:Tdouble);cdecl;external;
procedure mgl_rotate_(gr:Puintptr_t; TetX:Pmreal; TetZ:Pmreal; TetY:Pmreal);cdecl;external;
{/ Rotate a further plotting around vector x,y,z. }
procedure mgl_rotate_vector(gr:THMGL; Tet:Tdouble; x:Tdouble; y:Tdouble; z:Tdouble);cdecl;external;
procedure mgl_rotate_vector_(gr:Puintptr_t; Tet:Pmreal; x:Pmreal; y:Pmreal; z:Pmreal);cdecl;external;
{/ Set perspective (in range [0,1)) for plot. Set to zero for switching off. }
procedure mgl_perspective(gr:THMGL; val:Tdouble);cdecl;external;
procedure mgl_perspective_(gr:Puintptr_t; val:Pmreal);cdecl;external;
{/ Ask to set perspective (in range [0,1)) for plot. Set to zero for switching off. }
procedure mgl_ask_perspective(gr:THMGL; val:Tdouble);cdecl;external;
procedure mgl_ask_perspective_(gr:Puintptr_t; val:Pmreal);cdecl;external;
{/ Set angle of view independently from Rotate(). }
procedure mgl_view(gr:THMGL; TetX:Tdouble; TetZ:Tdouble; TetY:Tdouble);cdecl;external;
procedure mgl_view_(gr:Puintptr_t; TetX:Pmreal; TetZ:Pmreal; TetY:Pmreal);cdecl;external;
{/ Zoom in/out a part of picture (use mgl_zoom(0, 0, 1, 1) for restore default) }
procedure mgl_zoom(gr:THMGL; x1:Tdouble; y1:Tdouble; x2:Tdouble; y2:Tdouble);cdecl;external;
procedure mgl_zoom_(gr:Puintptr_t; x1:Pmreal; y1:Pmreal; x2:Pmreal; y2:Pmreal);cdecl;external;
{----------------------------------------------------------------------------- }
{/ Create HMPR object for parsing MGL scripts }
function mgl_create_parser:THMPR;cdecl;external;
function mgl_create_parser_:Tuintptr_t;cdecl;external;
{/ Change counter of HMPR uses (for advanced users only). Non-zero counter prevent automatic object removing. }
function mgl_use_parser(p:THMPR; inc:longint):longint;cdecl;external;
function mgl_use_parser_(para1:Puintptr_t; inc:Plongint):longint;cdecl;external;
{/ Delete HMPR object }
procedure mgl_delete_parser(p:THMPR);cdecl;external;
procedure mgl_delete_parser_(p:Puintptr_t);cdecl;external;
{/ Set value for parameter $N }
(* Const before type ignored *)
procedure mgl_parser_add_param(p:THMPR; id:longint; str:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_parser_add_param_(p:Puintptr_t; id:Plongint; str:Pchar; para4:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_parser_add_paramw(p:THMPR; id:longint; str:Pwchar_t);cdecl;external;
{/ Find variable with given name or add a new one }
{/ NOTE !!! You must not delete obtained data arrays !!! }
(* Const before type ignored *)
function mgl_parser_add_var(p:THMPR; name:Pchar):PmglDataA;cdecl;external;
(* Const before type ignored *)
function mgl_parser_add_var_(p:Puintptr_t; name:Pchar; para3:longint):Tuintptr_t;cdecl;external;
(* Const before type ignored *)
function mgl_parser_add_varw(p:THMPR; name:Pwchar_t):PmglDataA;cdecl;external;
{/ Find variable with given name or return NULL if no one }
{/ NOTE !!! You must not delete obtained data arrays !!! }
(* Const before type ignored *)
function mgl_parser_find_var(p:THMPR; name:Pchar):PmglDataA;cdecl;external;
(* Const before type ignored *)
function mgl_parser_find_var_(p:Puintptr_t; name:Pchar; para3:longint):Tuintptr_t;cdecl;external;
(* Const before type ignored *)
function mgl_parser_find_varw(p:THMPR; name:Pwchar_t):PmglDataA;cdecl;external;
{/ Get variable with given id }
{/ NOTE !!! You must not delete obtained data arrays !!! }
function mgl_parser_get_var(p:THMPR; id:dword):PmglDataA;cdecl;external;
function mgl_parser_get_var_(p:Puintptr_t; id:Pdword):Tuintptr_t;cdecl;external;
{/ Get number of variables }
function mgl_parser_num_var(p:THMPR):longint;cdecl;external;
function mgl_parser_num_var_(p:Puintptr_t):longint;cdecl;external;
{/ Get constant with given id }
{/ NOTE !!! You must not delete obtained data arrays !!! }
function mgl_parser_get_const(p:THMPR; id:dword):PmglNum;cdecl;external;
function mgl_parser_get_const_(p:Puintptr_t; id:Pdword):Tuintptr_t;cdecl;external;
{/ Get number of constants }
function mgl_parser_num_const(p:THMPR):longint;cdecl;external;
function mgl_parser_num_const_(p:Puintptr_t):longint;cdecl;external;
{/ Delete variable with name }
(* Const before type ignored *)
procedure mgl_parser_del_var(p:THMPR; name:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_parser_del_var_(p:Puintptr_t; name:Pchar; para3:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_parser_del_varw(p:THMPR; name:Pwchar_t);cdecl;external;
{/ Delete all data variables }
procedure mgl_parser_del_all(p:THMPR);cdecl;external;
procedure mgl_parser_del_all_(p:Puintptr_t);cdecl;external;
{/ Load new commands from external dynamic Library (must have "const mglCommand *mgl_cmd_extra" variable) }
(* Const before type ignored *)
procedure mgl_parser_load(pr:THMPR; dll_name:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_parser_load_(pr:Puintptr_t; dll_name:Pchar; para3:longint);cdecl;external;
{/ Apply one step for equation d vars[i]/dt = eqs[i] using Runge-Kutta method }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_rk_step(pr:THMPR; eqs:Pchar; vars:Pchar; dt:Tmreal);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_rk_step_w(pr:THMPR; eqs:Pwchar_t; vars:Pwchar_t; dt:Tmreal);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_rk_step_(p:Puintptr_t; eqs:Pchar; vars:Pchar; dt:Pdouble; para5:longint; 
            para6:longint);cdecl;external;
{ Open all data arrays from HDF file and assign it as variables of parser p }
(* Const before type ignored *)
procedure mgl_parser_openhdf(p:THMPR; fname:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_parser_openhdf_(p:Puintptr_t; fname:Pchar; l:longint);cdecl;external;
{/ Parse and draw single line of the MGL script }
(* Const before type ignored *)
function mgl_parse_line(gr:THMGL; p:THMPR; str:Pchar; pos:longint):longint;cdecl;external;
(* Const before type ignored *)
function mgl_parse_line_(gr:Puintptr_t; p:Puintptr_t; str:Pchar; pos:Plongint; para5:longint):longint;cdecl;external;
(* Const before type ignored *)
function mgl_parse_linew(gr:THMGL; p:THMPR; str:Pwchar_t; pos:longint):longint;cdecl;external;
{/ Execute and draw script from the file }
procedure mgl_parse_file(gr:THMGL; p:THMPR; fp:PFILE; print:longint);cdecl;external;
{/ Execute MGL script text with '\n' separated lines }
(* Const before type ignored *)
procedure mgl_parse_text(gr:THMGL; p:THMPR; str:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_parse_text_(gr:Puintptr_t; p:Puintptr_t; str:Pchar; para4:longint);cdecl;external;
(* Const before type ignored *)
procedure mgl_parse_textw(gr:THMGL; p:THMPR; str:Pwchar_t);cdecl;external;
{/ Restore once flag }
procedure mgl_parser_restore_once(p:THMPR);cdecl;external;
procedure mgl_parser_restore_once_(p:Puintptr_t);cdecl;external;
{/ Allow changing size of the picture }
procedure mgl_parser_allow_setsize(p:THMPR; a:longint);cdecl;external;
procedure mgl_parser_allow_setsize_(p:Puintptr_t; a:Plongint);cdecl;external;
{/ Allow reading/saving files }
procedure mgl_parser_allow_file_io(p:THMPR; a:longint);cdecl;external;
procedure mgl_parser_allow_file_io_(p:Puintptr_t; a:Plongint);cdecl;external;
{/ Allow loading commands from external libraries }
procedure mgl_parser_allow_dll_call(p:THMPR; a:longint);cdecl;external;
procedure mgl_parser_allow_dll_call_(p:Puintptr_t; a:Plongint);cdecl;external;
{/ Set flag to stop script parsing }
procedure mgl_parser_stop(p:THMPR);cdecl;external;
procedure mgl_parser_stop_(p:Puintptr_t);cdecl;external;
{/ Set variant of argument(s) separated by '?' to be used }
procedure mgl_parser_variant(p:THMPR; var:longint);cdecl;external;
procedure mgl_parser_variant_(p:Puintptr_t; var:Plongint);cdecl;external;
{/ Set starting object ID }
procedure mgl_parser_start_id(p:THMPR; id:longint);cdecl;external;
procedure mgl_parser_start_id_(p:Puintptr_t; id:Plongint);cdecl;external;
{/ Return type of command: 0 - not found, 1 - data plot, 2 - other plot, }
{/		3 - setup, 4 - data handle, 5 - data create, 6 - subplot, 7 - program }
{/		8 - 1d plot, 9 - 2d plot, 10 - 3d plot, 11 - dd plot, 12 - vector plot }
{/		13 - axis, 14 - primitives, 15 - axis setup, 16 - text/legend, 17 - data transform }
(* Const before type ignored *)
function mgl_parser_cmd_type(pr:THMPR; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mgl_parser_cmd_type_(p:Puintptr_t; name:Pchar; para3:longint):longint;cdecl;external;
{/ Return description of MGL command }
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_parser_cmd_desc(pr:THMPR; name:Pchar):Pchar;cdecl;external;
{/ Return string of command format (command name and its argument[s]) }
(* Const before type ignored *)
(* Const before type ignored *)
function mgl_parser_cmd_frmt(pr:THMPR; name:Pchar):Pchar;cdecl;external;
{/ Get name of command with number n }
(* Const before type ignored *)
function mgl_parser_cmd_name(pr:THMPR; id:longint):Pchar;cdecl;external;
{/ Get number of defined commands }
function mgl_parser_cmd_num(pr:THMPR):longint;cdecl;external;
{/ Return result of formula evaluation }
(* Const before type ignored *)
function mgl_parser_calc(pr:THMPR; formula:Pchar):THMDT;cdecl;external;
(* Const before type ignored *)
function mgl_parser_calc_(pr:Puintptr_t; formula:Pchar; para3:longint):Tuintptr_t;cdecl;external;
(* Const before type ignored *)
function mgl_parser_calcw(pr:THMPR; formula:Pwchar_t):THMDT;cdecl;external;
{/ Return result of formula evaluation as complex data }
(* Const before type ignored *)
function mgl_parser_calc_complex(pr:THMPR; formula:Pchar):THADT;cdecl;external;
(* Const before type ignored *)
function mgl_parser_calc_complex_(pr:Puintptr_t; formula:Pchar; para3:longint):Tuintptr_t;cdecl;external;
(* Const before type ignored *)
function mgl_parser_calc_complexw(pr:THMPR; formula:Pwchar_t):THADT;cdecl;external;
{----------------------------------------------------------------------------- }
{$endif}

implementation


end.
