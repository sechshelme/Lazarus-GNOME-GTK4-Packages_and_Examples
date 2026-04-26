
unit basic;
interface

{
  Automatically converted by H2Pas 1.0.0 from basic.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    basic.h
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
PVipsBuf  = ^VipsBuf;
PVipsImage  = ^VipsImage;
PVipsPel  = ^VipsPel;
PVipsPrecision  = ^VipsPrecision;
PVipsRegion  = ^VipsRegion;
PVipsSListFold2Fn  = ^VipsSListFold2Fn;
PVipsSListMap2Fn  = ^VipsSListMap2Fn;
PVipsSListMap4Fn  = ^VipsSListMap4Fn;
PVipsSource  = ^VipsSource;
PVipsTarget  = ^VipsTarget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ A few basic types needed everywhere.
 *
 * 27/10/11
 * 	- from type.h
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
{*
 * VipsPel:
 *
 * A picture element. Cast this to whatever the associated VipsBandFormat says
 * to get the value.
  }
type
  PVipsPel = ^TVipsPel;
  TVipsPel = byte;
{ Also used for eg. vips_local() and friends.
  }

  TVipsCallbackFn = function (a:pointer; b:pointer):longint;cdecl;
{ Like GFunc, but return a value.
  }

  PVipsSListMap2Fn = ^TVipsSListMap2Fn;
  TVipsSListMap2Fn = function (item:pointer; a:pointer; b:pointer):pointer;cdecl;

  PVipsSListMap4Fn = ^TVipsSListMap4Fn;
  TVipsSListMap4Fn = function (item:pointer; a:pointer; b:pointer; c:pointer; d:pointer):pointer;cdecl;

  PVipsSListFold2Fn = ^TVipsSListFold2Fn;
  TVipsSListFold2Fn = function (item:pointer; a:pointer; b:pointer; c:pointer):pointer;cdecl;

  PVipsPrecision = ^TVipsPrecision;
  TVipsPrecision =  Longint;
  Const
    VIPS_PRECISION_INTEGER = 0;
    VIPS_PRECISION_FLOAT = 1;
    VIPS_PRECISION_APPROXIMATE = 2;
    VIPS_PRECISION_LAST = 3;
;
{ Just for testing.
  }
(* Const before type ignored *)

function vips_path_filename7(path:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function vips_path_mode7(path:Pchar):Pchar;cdecl;external;
type
  PVipsImage = ^TVipsImage;
  TVipsImage = record
      {undefined structure}
    end;

  PVipsRegion = ^TVipsRegion;
  TVipsRegion = record
      {undefined structure}
    end;

  PVipsBuf = ^TVipsBuf;
  TVipsBuf = record
      {undefined structure}
    end;

  PVipsSource = ^TVipsSource;
  TVipsSource = record
      {undefined structure}
    end;

  PVipsTarget = ^TVipsTarget;
  TVipsTarget = record
      {undefined structure}
    end;

{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_BASIC_H }

implementation


end.
