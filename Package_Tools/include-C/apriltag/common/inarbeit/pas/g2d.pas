unit g2d;

interface

uses
  fp_apriltag;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 2013-2016, The Regents of The University of Michigan.
All rights reserved.
This software was developed in the APRIL Robotics Lab under the
direction of Edwin Olson, ebolson@umich.edu. This software may be
available under alternative licensing terms; contact the address above.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the Regents of The University of Michigan.
 }
(** unsupported pragma#pragma once*)
{ C++ extern C conditionnal removed }
{$include "zarray.h"}
{ This library tries to avoid needless proliferation of types. }
{ }
{ A point is a double[2]. (Note that when passing a double[2] as an }
{ argument, it is passed by pointer, not by value.) }
{ }
{ A polygon is a zarray_t of double[2]. (Note that in this case, the }
{ zarray contains the actual vertex data, and not merely a pointer to }
{ some other data. IMPORTANT: A polygon must be specified in CCW }
{ order.  It is implicitly closed (do not list the same point at the }
{ beginning at the end. }
{ }
{ Where sensible, it is assumed that objects should be allocated }
{ sparingly; consequently "init" style methods, rather than "create" }
{ methods are used. }
{////////////////////////////////////////////////////////////////// }
{ Lines }
{ Internal representation: a point that the line goes through (p) and }
{ the direction of the line (u). }
{ always a unit vector }
type
  Pg2d_line_t = ^Tg2d_line_t;
  Tg2d_line_t = record
      p : array[0..1] of Tdouble;
      u : array[0..1] of Tdouble;
    end;
{ initialize a line object. }

procedure g2d_line_init_from_points(line:Pg2d_line_t; p0:array[0..1] of Tdouble; p1:array[0..1] of Tdouble);cdecl;external libapriltag;
{ The line defines a one-dimensional coordinate system whose origin }
{ is p. Where is q? (If q is not on the line, the point nearest q is }
{ returned. }
function g2d_line_get_coordinate(line:Pg2d_line_t; q:array[0..1] of Tdouble):Tdouble;cdecl;external libapriltag;
{ Intersect two lines. The intersection, if it exists, is written to }
{ p (if not NULL), and 1 is returned. Else, zero is returned. }
function g2d_line_intersect_line(linea:Pg2d_line_t; lineb:Pg2d_line_t; p:Pdouble):longint;cdecl;external libapriltag;
{////////////////////////////////////////////////////////////////// }
{ Line Segments. line.p is always one endpoint; p1 is the other }
{ endpoint. }
type
  Pg2d_line_segment_t = ^Tg2d_line_segment_t;
  Tg2d_line_segment_t = record
      line : Tg2d_line_t;
      p1 : array[0..1] of Tdouble;
    end;

procedure g2d_line_segment_init_from_points(seg:Pg2d_line_segment_t; p0:array[0..1] of Tdouble; p1:array[0..1] of Tdouble);cdecl;external libapriltag;
{ Intersect two segments. The intersection, if it exists, is written }
{ to p (if not NULL), and 1 is returned. Else, zero is returned. }
function g2d_line_segment_intersect_segment(sega:Pg2d_line_segment_t; segb:Pg2d_line_segment_t; p:Pdouble):longint;cdecl;external libapriltag;
procedure g2d_line_segment_closest_point(seg:Pg2d_line_segment_t; q:Pdouble; p:Pdouble);cdecl;external libapriltag;
function g2d_line_segment_closest_point_distance(seg:Pg2d_line_segment_t; q:Pdouble):Tdouble;cdecl;external libapriltag;
{////////////////////////////////////////////////////////////////// }
{ Polygons }
function g2d_polygon_create_data(v:Parray[0..1] of Tdouble; sz:longint):Pzarray_t;cdecl;external libapriltag;
function g2d_polygon_create_zeros(sz:longint):Pzarray_t;cdecl;external libapriltag;
function g2d_polygon_create_empty:Pzarray_t;cdecl;external libapriltag;
procedure g2d_polygon_add(poly:Pzarray_t; v:array[0..1] of Tdouble);cdecl;external libapriltag;
{ Takes a polygon in either CW or CCW and modifies it (if necessary) }
{ to be CCW. }
procedure g2d_polygon_make_ccw(poly:Pzarray_t);cdecl;external libapriltag;
{ Return 1 if point q lies within poly. }
function g2d_polygon_contains_point(poly:Pzarray_t; q:array[0..1] of Tdouble):longint;cdecl;external libapriltag;
{ Do the edges of the polygons cross? (Does not test for containment). }
function g2d_polygon_intersects_polygon(polya:Pzarray_t; polyb:Pzarray_t):longint;cdecl;external libapriltag;
{ Does polya completely contain polyb? }
function g2d_polygon_contains_polygon(polya:Pzarray_t; polyb:Pzarray_t):longint;cdecl;external libapriltag;
{ Is there some point which is in both polya and polyb? }
function g2d_polygon_overlaps_polygon(polya:Pzarray_t; polyb:Pzarray_t):longint;cdecl;external libapriltag;
{ returns the number of points written to x. see comments. }
function g2d_polygon_rasterize(poly:Pzarray_t; y:Tdouble; x:Pdouble):longint;cdecl;external libapriltag;
{ C++ end of extern C conditionnal removed }

// === Konventiert am: 12-9-26 17:14:25 ===


implementation



end.
