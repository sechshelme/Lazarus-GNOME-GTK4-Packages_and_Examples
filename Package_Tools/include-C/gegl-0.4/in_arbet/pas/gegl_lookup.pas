unit gegl_lookup;

interface

uses
  fp_glib2, fp_gegl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL
 *
 * GEGL is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * GEGL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2009 Øyvind Kolås
  }
{$ifndef __GEGL_LOOKUP_H__}
{$define __GEGL_LOOKUP_H__}
{$ifndef __cplusplus}
type

  TGeglLookupFunction = function (value:Tgfloat; data:Tgpointer):Tgfloat;cdecl;

const
  GEGL_LOOKUP_MAX_ENTRIES = 819200;  
type
  PGeglLookup = ^TGeglLookup;
  TGeglLookup = record
      _function : TGeglLookupFunction;
      data : Tgpointer;
      shift : Tgint;
      positive_min : Tguint32;
      positive_max : Tguint32;
      negative_min : Tguint32;
      negative_max : Tguint32;
      bitmask : array[0..(GEGL_LOOKUP_MAX_ENTRIES/32)-1] of Tguint32;
      table : Pgfloat;
    end;
{*
 * gegl_lookup_new_full: (skip)
 * @function: The function to build a lookup for
 * @data: A user data pointer passed to lookup calls
 * @start: Lower bound of the lookup
 * @end: Upper bound of the lookup
 * @precision: The precision of the lookup table
 *
 * Return value: a #GeglLookup
  }

function gegl_lookup_new_full(_function:TGeglLookupFunction; data:Tgpointer; start:Tgfloat; end:Tgfloat; precision:Tgfloat):PGeglLookup;cdecl;external libgegl;
{*
 * gegl_lookup_new: (skip)
 * @function: The function to build a lookup for
 * @data: A user data pointer passed to lookup calls
 *
 * Return value: a #GeglLookup
  }
function gegl_lookup_new(_function:TGeglLookupFunction; data:Tgpointer):PGeglLookup;cdecl;external libgegl;
{*
 * gegl_lookup_free: (skip)
 * @lookup: #GeglLookup to free
  }
procedure gegl_lookup_free(lookup:PGeglLookup);cdecl;external libgegl;
{$endif}
{ __cplusplus  }
{$endif}

// === Konventiert am: 12-8-26 15:11:58 ===


implementation



end.
