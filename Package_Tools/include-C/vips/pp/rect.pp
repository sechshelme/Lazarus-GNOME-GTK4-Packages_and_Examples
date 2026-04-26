
unit rect;
interface

{
  Automatically converted by H2Pas 1.0.0 from rect.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rect.h
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
PVipsRect  = ^VipsRect;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Simple rectangle algebra.
  }
{

	This file is part of VIPS.

	VIPS is free software; you can redistribute it and/or modify
	it under the terms of the GNU Lesser General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
	02110-1301  USA

  }
{

	These files are distributed with VIPS - http://www.vips.ecs.soton.ac.uk

  }
{$ifndef VIPS_RECT_H}
{$define VIPS_RECT_H}
{$include <glib.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }
{< public > }
type
  PVipsRect = ^TVipsRect;
  TVipsRect = record
      left : longint;
      top : longint;
      width : longint;
      height : longint;
    end;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function VIPS_RECT_RIGHT(R : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_RECT_BOTTOM(R : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_RECT_HCENTRE(R : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_RECT_VCENTRE(R : longint) : longint;

(* Const before type ignored *)
function vips_rect_isempty(r:PVipsRect):Tgboolean;cdecl;external;
(* Const before type ignored *)
function vips_rect_includespoint(r:PVipsRect; x:longint; y:longint):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_rect_includesrect(r1:PVipsRect; r2:PVipsRect):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_rect_equalsrect(r1:PVipsRect; r2:PVipsRect):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_rect_overlapsrect(r1:PVipsRect; r2:PVipsRect):Tgboolean;cdecl;external;
procedure vips_rect_marginadjust(r:PVipsRect; n:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips_rect_intersectrect(r1:PVipsRect; r2:PVipsRect; out:PVipsRect);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips_rect_unionrect(r1:PVipsRect; r2:PVipsRect; out:PVipsRect);cdecl;external;
(* Const before type ignored *)
function vips_rect_dup(r:PVipsRect):PVipsRect;cdecl;external;
procedure vips_rect_normalise(r:PVipsRect);cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_RECT_H }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_RECT_RIGHT(R : longint) : longint;
begin
  VIPS_RECT_RIGHT:=(R^.left)+(R^.width);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_RECT_BOTTOM(R : longint) : longint;
begin
  VIPS_RECT_BOTTOM:=(R^.top)+(R^.height);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_RECT_HCENTRE(R : longint) : longint;
begin
  VIPS_RECT_HCENTRE:=(R^.left)+((R^.width)/2);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_RECT_VCENTRE(R : longint) : longint;
begin
  VIPS_RECT_VCENTRE:=(R^.top)+((R^.height)/2);
end;


end.
