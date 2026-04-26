
unit region;
interface

{
  Automatically converted by H2Pas 1.0.0 from region.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    region.h
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
PGThread  = ^GThread;
Psize_t  = ^size_t;
PVipsBuffer  = ^VipsBuffer;
PVipsImage  = ^VipsImage;
PVipsPel  = ^VipsPel;
PVipsRect  = ^VipsRect;
PVipsRegion  = ^VipsRegion;
PVipsRegionClass  = ^VipsRegionClass;
PVipsRegionShrink  = ^VipsRegionShrink;
PVipsWindow  = ^VipsWindow;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Definitions for partial image regions.
 *
 * J.Cupitt, 8/4/93
 *
 * 2/3/11
 * 	- move to GObject
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
{$ifndef VIPS_REGION_H}
{$define VIPS_REGION_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <vips/object.h>}
{$include <vips/image.h>}
{$include <vips/rect.h>}
{$include <vips/private.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }

{ was #define dname def_expr }
function VIPS_TYPE_REGION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_REGION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_REGION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_REGION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_REGION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_REGION_GET_CLASS(obj : longint) : longint;

{*
 * VipsRegionShrink:
 * @VIPS_REGION_SHRINK_MEAN: use the average
 * @VIPS_REGION_SHRINK_MEDIAN: use the median
 * @VIPS_REGION_SHRINK_MODE: use the mode
 * @VIPS_REGION_SHRINK_MAX: use the maximum
 * @VIPS_REGION_SHRINK_MIN: use the minimum
 * @VIPS_REGION_SHRINK_NEAREST: use the top-left pixel
 *
 * How to calculate the output pixels when shrinking a 2x2 region.
  }
type
  PVipsRegionShrink = ^TVipsRegionShrink;
  TVipsRegionShrink =  Longint;
  Const
    VIPS_REGION_SHRINK_MEAN = 0;
    VIPS_REGION_SHRINK_MEDIAN = 1;
    VIPS_REGION_SHRINK_MODE = 2;
    VIPS_REGION_SHRINK_MAX = 3;
    VIPS_REGION_SHRINK_MIN = 4;
    VIPS_REGION_SHRINK_NEAREST = 5;
    VIPS_REGION_SHRINK_LAST = 6;
;
{ Sub-area of image.
 *
 * Matching typedef in basic.h.
  }
{< public > }
{ Users may read these two fields.
	  }
{ Link back to parent image  }
{ Area of parent we can see  }
{ The rest of VipsRegion is private.
	  }
{< private > }
{ What kind of attachment  }
{ Off here to get data  }
{ Bytes-per-line for data  }
{ Sequence we are using to fill region  }
{ The thread that made this region. Used to assert() test that
	 * regions are not being shared between threads.
	  }
{ Ref to the window we use for this region, if any.
	  }
{ Ref to the buffer we use for this region, if any.
	  }
{ The image this region is on has changed and caches need to be
	 * dropped.
	  }
type
  PVipsRegion = ^TVipsRegion;
  TVipsRegion = record
      parent_object : TVipsObject;
      im : PVipsImage;
      valid : TVipsRect;
      _type : TRegionType;
      data : PVipsPel;
      bpl : longint;
      seq : pointer;
      thread : PGThread;
      window : PVipsWindow;
      buffer : PVipsBuffer;
      invalid : Tgboolean;
    end;


  PVipsRegionClass = ^TVipsRegionClass;
  TVipsRegionClass = record
      parent_class : TVipsObjectClass;
    end;
{ Don't put spaces around void here, it breaks gtk-doc.
  }

function vips_region_get_type:TGType;cdecl;external;
function vips_region_new(image:PVipsImage):PVipsRegion;cdecl;external;
(* Const before type ignored *)
function vips_region_buffer(reg:PVipsRegion; r:PVipsRect):longint;cdecl;external;
(* Const before type ignored *)
function vips_region_image(reg:PVipsRegion; r:PVipsRect):longint;cdecl;external;
(* Const before type ignored *)
function vips_region_region(reg:PVipsRegion; dest:PVipsRegion; r:PVipsRect; x:longint; y:longint):longint;cdecl;external;
function vips_region_equalsregion(reg1:PVipsRegion; reg2:PVipsRegion):longint;cdecl;external;
function vips_region_position(reg:PVipsRegion; x:longint; y:longint):longint;cdecl;external;
(* Const before type ignored *)
procedure vips_region_paint(reg:PVipsRegion; r:PVipsRect; value:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips_region_paint_pel(reg:PVipsRegion; r:PVipsRect; ink:PVipsPel);cdecl;external;
procedure vips_region_black(reg:PVipsRegion);cdecl;external;
(* Const before type ignored *)
procedure vips_region_copy(reg:PVipsRegion; dest:PVipsRegion; r:PVipsRect; x:longint; y:longint);cdecl;external;
(* Const before type ignored *)
function vips_region_shrink_method(from:PVipsRegion; to:PVipsRegion; target:PVipsRect; method:TVipsRegionShrink):longint;cdecl;external;
(* Const before type ignored *)
function vips_region_shrink(from:PVipsRegion; to:PVipsRegion; target:PVipsRect):longint;cdecl;external;
(* Const before type ignored *)
function vips_region_prepare(reg:PVipsRegion; r:PVipsRect):longint;cdecl;external;
(* Const before type ignored *)
function vips_region_prepare_to(reg:PVipsRegion; dest:PVipsRegion; r:PVipsRect; x:longint; y:longint):longint;cdecl;external;
function vips_region_fetch(region:PVipsRegion; left:longint; top:longint; width:longint; height:longint; 
           len:Psize_t):PVipsPel;cdecl;external;
function vips_region_width(region:PVipsRegion):longint;cdecl;external;
function vips_region_height(region:PVipsRegion):longint;cdecl;external;
procedure vips_region_invalidate(reg:PVipsRegion);cdecl;external;
{ Use this to count pixels passing through key points. Handy for spotting bad
 * overcomputation.
  }
{ If DEBUG is defined, add bounds checking.
  }
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_REGION_H }

implementation

{ was #define dname def_expr }
function VIPS_TYPE_REGION : longint; { return type might be wrong }
  begin
    VIPS_TYPE_REGION:=vips_region_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_REGION(obj : longint) : longint;
begin
  VIPS_REGION:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_REGION,VipsRegion);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_REGION_CLASS(klass : longint) : longint;
begin
  VIPS_REGION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_REGION,VipsRegionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_REGION(obj : longint) : longint;
begin
  VIPS_IS_REGION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_REGION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_REGION_CLASS(klass : longint) : longint;
begin
  VIPS_IS_REGION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_REGION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_REGION_GET_CLASS(obj : longint) : longint;
begin
  VIPS_REGION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_REGION,VipsRegionClass);
end;


end.
