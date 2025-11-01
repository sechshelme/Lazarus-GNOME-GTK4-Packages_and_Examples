
unit cd_transform;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_transform.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_transform.h
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
PCdIcc  = ^CdIcc;
PCdTransform  = ^CdTransform;
PCdTransformClass  = ^CdTransformClass;
PCdTransformError  = ^CdTransformError;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2013 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__COLORD_H_INSIDE__) && !defined (CD_COMPILATION)}
{$error "Only <colord.h> can be included directly."}
{$endif}
{$ifndef __CD_TRANSFORM_H}
{$define __CD_TRANSFORM_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include "cd-enum.h"}
{$include "cd-icc.h"}

{ was #define dname def_expr }
function CD_TRANSFORM_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TRANSFORM_TYPE_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_TRANSFORM : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (CdTransform, cd_transform, CD, TRANSFORM, GObject) }
{*
 * CdTransformError:
 * @CD_TRANSFORM_ERROR_FAILED_TO_SETUP_TRANSFORM:	Failed to setup transform
 * @CD_TRANSFORM_ERROR_INVALID_COLORSPACE:		Invalid colorspace
 *
 * The transform error code.
 *
 * Since: 0.1.34
 * }
type
  PCdTransformError = ^TCdTransformError;
  TCdTransformError =  Longint;
  Const
    CD_TRANSFORM_ERROR_FAILED_TO_SETUP_TRANSFORM = 0;
    CD_TRANSFORM_ERROR_INVALID_COLORSPACE = 1;
    CD_TRANSFORM_ERROR_LAST = 2;
;
{< private > }
{ Padding for future expansion  }
type
  PCdTransformClass = ^TCdTransformClass;
  TCdTransformClass = record
      parent_class : TGObjectClass;
      _cd_transform_reserved1 : procedure ;cdecl;
      _cd_transform_reserved2 : procedure ;cdecl;
      _cd_transform_reserved3 : procedure ;cdecl;
      _cd_transform_reserved4 : procedure ;cdecl;
      _cd_transform_reserved5 : procedure ;cdecl;
      _cd_transform_reserved6 : procedure ;cdecl;
      _cd_transform_reserved7 : procedure ;cdecl;
      _cd_transform_reserved8 : procedure ;cdecl;
    end;


function cd_transform_error_quark:TGQuark;cdecl;external;
function cd_transform_new:PCdTransform;cdecl;external;
procedure cd_transform_set_input_icc(transform:PCdTransform; icc:PCdIcc);cdecl;external;
procedure cd_transform_set_input_pixel_format(transform:PCdTransform; pixel_format:TCdPixelFormat);cdecl;external;
function cd_transform_get_input_icc(transform:PCdTransform):PCdIcc;cdecl;external;
function cd_transform_get_input_pixel_format(transform:PCdTransform):TCdPixelFormat;cdecl;external;
procedure cd_transform_set_output_icc(transform:PCdTransform; icc:PCdIcc);cdecl;external;
procedure cd_transform_set_output_pixel_format(transform:PCdTransform; pixel_format:TCdPixelFormat);cdecl;external;
function cd_transform_get_output_icc(transform:PCdTransform):PCdIcc;cdecl;external;
function cd_transform_get_output_pixel_format(transform:PCdTransform):TCdPixelFormat;cdecl;external;
procedure cd_transform_set_abstract_icc(transform:PCdTransform; icc:PCdIcc);cdecl;external;
function cd_transform_get_abstract_icc(transform:PCdTransform):PCdIcc;cdecl;external;
procedure cd_transform_set_rendering_intent(transform:PCdTransform; rendering_intent:TCdRenderingIntent);cdecl;external;
function cd_transform_get_rendering_intent(transform:PCdTransform):TCdRenderingIntent;cdecl;external;
procedure cd_transform_set_bpc(transform:PCdTransform; bpc:Tgboolean);cdecl;external;
function cd_transform_get_bpc(transform:PCdTransform):Tgboolean;cdecl;external;
procedure cd_transform_set_max_threads(transform:PCdTransform; max_threads:Tguint);cdecl;external;
function cd_transform_get_max_threads(transform:PCdTransform):Tguint;cdecl;external;
function cd_transform_process(transform:PCdTransform; data_in:Tgpointer; data_out:Tgpointer; width:Tguint; height:Tguint; 
           rowstride:Tguint; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __CD_TRANSFORM_H  }

implementation

{ was #define dname def_expr }
function CD_TRANSFORM_ERROR : longint; { return type might be wrong }
  begin
    CD_TRANSFORM_ERROR:=cd_transform_error_quark;
  end;

{ was #define dname def_expr }
function CD_TRANSFORM_TYPE_ERROR : longint; { return type might be wrong }
  begin
    CD_TRANSFORM_TYPE_ERROR:=cd_transform_error_get_type;
  end;

{ was #define dname def_expr }
function CD_TYPE_TRANSFORM : longint; { return type might be wrong }
  begin
    CD_TYPE_TRANSFORM:=cd_transform_get_type;
  end;


end.
