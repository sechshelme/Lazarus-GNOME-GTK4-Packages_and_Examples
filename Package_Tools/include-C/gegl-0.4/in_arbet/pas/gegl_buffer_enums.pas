unit gegl_buffer_enums;

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
 * Copyright 2011 Michael Muré <batolettre@gmail.com>
 *
  }
{ This file holds public enums from GEGL
 *
 * !!!!!!!!!!!! NOTE !!!!!!!!!!!!!!
 *
 * Normally, gegl-enums.c file would be be generated my glib-mkenums,
 * but we use the enum values' registered names for translatable,
 * human readable labels for the GUI, so gegl-enums.c is maintained
 * manually.
 *
 * DON'T FORGET TO UPDATE gegl-enums.c AFTER CHANGING THIS HEADER
 *
 * !!!!!!!!!!!! NOTE !!!!!!!!!!!!!!
  }
{$ifndef __GEGL_BUFFER_ENUMS_H__}
{$define __GEGL_BUFFER_ENUMS_H__}
{ this enum should be renamed GeglBufferFlags, since it contains
   * multiple flags - and possibly more in the future
    }
{ XXX: API tidying of the following would be to make them be
   *      GEGL_BUFFER_EDGE_NONE or GEGL_BUFFER_REPEAT_NONE instead.
   }
{ auto gives bilinear for scales <1.0 box for <2.0 and nearest above  }
type
  PGeglAbyssPolicy = ^TGeglAbyssPolicy;
  TGeglAbyssPolicy =  Longint;
  Const
    GEGL_ABYSS_NONE = 0;
    GEGL_ABYSS_CLAMP = 1;
    GEGL_ABYSS_LOOP = 2;
    GEGL_ABYSS_BLACK = 3;
    GEGL_ABYSS_WHITE = 4;
    GEGL_BUFFER_FILTER_AUTO = 0;
    GEGL_BUFFER_FILTER_BILINEAR = 16;
    GEGL_BUFFER_FILTER_NEAREST = 32;
    GEGL_BUFFER_FILTER_BOX = 48;
    GEGL_BUFFER_FILTER_ALL = (GEGL_BUFFER_FILTER_BILINEAR or GEGL_BUFFER_FILTER_NEAREST) or GEGL_BUFFER_FILTER_BOX;
;

function gegl_abyss_policy_get_type:TGType;cdecl;external libgegl;
{ was #define dname def_expr }
function GEGL_TYPE_ABYSS_POLICY : longint; { return type might be wrong }

type
  PGeglAccessMode = ^TGeglAccessMode;
  TGeglAccessMode =  Longint;
  Const
    GEGL_ACCESS_READ = 1 shl 0;
    GEGL_ACCESS_WRITE = 1 shl 1;
    GEGL_ACCESS_READWRITE = GEGL_ACCESS_READ or GEGL_ACCESS_WRITE;
;

function gegl_access_mode_get_type:TGType;cdecl;external libgegl;
{ was #define dname def_expr }
function GEGL_TYPE_ACCESS_MODE : longint; { return type might be wrong }

type
  PGeglSamplerType = ^TGeglSamplerType;
  TGeglSamplerType =  Longint;
  Const
    GEGL_SAMPLER_NEAREST = 0;
    GEGL_SAMPLER_LINEAR = 1;
    GEGL_SAMPLER_CUBIC = 2;
    GEGL_SAMPLER_NOHALO = 3;
    GEGL_SAMPLER_LOHALO = 4;
;

function gegl_sampler_type_get_type:TGType;cdecl;external libgegl;
{ was #define dname def_expr }
function GEGL_TYPE_SAMPLER_TYPE : longint; { return type might be wrong }

type
  PGeglRectangleAlignment = ^TGeglRectangleAlignment;
  TGeglRectangleAlignment =  Longint;
  Const
    GEGL_RECTANGLE_ALIGNMENT_SUBSET = 0;
    GEGL_RECTANGLE_ALIGNMENT_SUPERSET = 1;
    GEGL_RECTANGLE_ALIGNMENT_NEAREST = 2;
;

function gegl_rectangle_alignment_get_type:TGType;cdecl;external libgegl;
{ was #define dname def_expr }
function GEGL_TYPE_RECTANGLE_ALIGNMENT : longint; { return type might be wrong }

{$endif}
{ __GEGL_ENUMS_H__  }

// === Konventiert am: 12-8-26 14:31:03 ===


implementation


{ was #define dname def_expr }
function GEGL_TYPE_ABYSS_POLICY : longint; { return type might be wrong }
  begin
    GEGL_TYPE_ABYSS_POLICY:=gegl_abyss_policy_get_type;
  end;

{ was #define dname def_expr }
function GEGL_TYPE_ACCESS_MODE : longint; { return type might be wrong }
  begin
    GEGL_TYPE_ACCESS_MODE:=gegl_access_mode_get_type;
  end;

{ was #define dname def_expr }
function GEGL_TYPE_SAMPLER_TYPE : longint; { return type might be wrong }
  begin
    GEGL_TYPE_SAMPLER_TYPE:=gegl_sampler_type_get_type;
  end;

{ was #define dname def_expr }
function GEGL_TYPE_RECTANGLE_ALIGNMENT : longint; { return type might be wrong }
  begin
    GEGL_TYPE_RECTANGLE_ALIGNMENT:=gegl_rectangle_alignment_get_type;
  end;


end.
