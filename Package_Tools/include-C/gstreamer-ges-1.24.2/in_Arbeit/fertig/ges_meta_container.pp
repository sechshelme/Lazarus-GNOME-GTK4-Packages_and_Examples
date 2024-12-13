
unit ges_meta_container;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_meta_container.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_meta_container.h
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
Pgboolean  = ^gboolean;
Pgchar  = ^gchar;
PGDate  = ^GDate;
Pgdouble  = ^gdouble;
PGESMarkerList  = ^GESMarkerList;
PGESMetaContainer  = ^GESMetaContainer;
PGESMetaContainerInterface  = ^GESMetaContainerInterface;
PGESMetaFlag  = ^GESMetaFlag;
Pgfloat  = ^gfloat;
Pgint  = ^gint;
Pgint64  = ^gint64;
PGstDateTime  = ^GstDateTime;
PGType  = ^GType;
Pguint  = ^guint;
Pguint64  = ^guint64;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2012 Paul Lange <palango@gmx.de>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <gst/gst.h>}
{$include <ges/ges-types.h>}
{$include "ges-enums.h"}

{ was #define dname def_expr }
function GES_TYPE_META_CONTAINER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_META_CONTAINER_GET_INTERFACE(inst : longint) : longint;

{extern }
{G_DECLARE_INTERFACE (GESMetaContainer, ges_meta_container, GES, META_CONTAINER, GObject); }
{*
 * GES_META_FORMATTER_NAME:
 *
 * The name of a formatter, used as the #GESAsset:id for #GESFormatter
 * assets (string).
  }
const
  GES_META_FORMATTER_NAME = 'name';  
{*
 * GES_META_DESCRIPTION:
 *
 * The description of the object, to be used in various contexts (string).
  }
  GES_META_DESCRIPTION = 'description';  
{*
 * GES_META_FORMATTER_MIMETYPE:
 *
 * The mimetype used for the file produced by a #GESFormatter (string).
  }
  GES_META_FORMATTER_MIMETYPE = 'mimetype';  
{*
 * GES_META_FORMATTER_EXTENSION:
 *
 * The file extension of files produced by a #GESFormatter (string).
  }
  GES_META_FORMATTER_EXTENSION = 'extension';  
{*
 * GES_META_FORMATTER_VERSION:
 *
 * The version of a #GESFormatter (double).
  }
  GES_META_FORMATTER_VERSION = 'version';  
{*
 * GES_META_FORMATTER_RANK:
 *
 * The rank of a #GESFormatter (a #GstRank).
  }
  GES_META_FORMATTER_RANK = 'rank';  
{*
 * GES_META_VOLUME:
 *
 * The volume for a #GESTrack or a #GESLayer (float).
  }
  GES_META_VOLUME = 'volume';  
{*
 * GES_META_VOLUME_DEFAULT:
 *
 * The default volume for a #GESTrack or a #GESLayer as a float.
  }
  GES_META_VOLUME_DEFAULT = 1.0;  
{*
 * GES_META_FORMAT_VERSION:
 *
 * The version of the format in which a project is serialized (string).
  }
  GES_META_FORMAT_VERSION = 'format-version';  
{*
 * GES_META_MARKER_COLOR:
 *
 * The ARGB color of a #GESMarker (an AARRGGBB hex as a uint).
  }
  GES_META_MARKER_COLOR = 'marker-color';  
type
  PGESMetaContainerInterface = ^TGESMetaContainerInterface;
  TGESMetaContainerInterface = record
      parent_iface : TGTypeInterface;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

(* Const before type ignored *)

function ges_meta_container_set_boolean(container:PGESMetaContainer; meta_item:Pgchar; value:Tgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_set_int(container:PGESMetaContainer; meta_item:Pgchar; value:Tgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_set_uint(container:PGESMetaContainer; meta_item:Pgchar; value:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_set_int64(container:PGESMetaContainer; meta_item:Pgchar; value:Tgint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_set_uint64(container:PGESMetaContainer; meta_item:Pgchar; value:Tguint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_set_float(container:PGESMetaContainer; meta_item:Pgchar; value:Tgfloat):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_set_double(container:PGESMetaContainer; meta_item:Pgchar; value:Tgdouble):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_meta_container_set_date(container:PGESMetaContainer; meta_item:Pgchar; value:PGDate):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_meta_container_set_date_time(container:PGESMetaContainer; meta_item:Pgchar; value:PGstDateTime):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_meta_container_set_string(container:PGESMetaContainer; meta_item:Pgchar; value:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_meta_container_set_meta(container:PGESMetaContainer; meta_item:Pgchar; value:PGValue):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_meta_container_set_marker_list(container:PGESMetaContainer; meta_item:Pgchar; list:PGESMarkerList):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_register_static_meta(container:PGESMetaContainer; flags:TGESMetaFlag; meta_item:Pgchar; _type:TGType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_register_meta_boolean(container:PGESMetaContainer; flags:TGESMetaFlag; meta_item:Pgchar; value:Tgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_register_meta_int(container:PGESMetaContainer; flags:TGESMetaFlag; meta_item:Pgchar; value:Tgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_register_meta_uint(container:PGESMetaContainer; flags:TGESMetaFlag; meta_item:Pgchar; value:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_register_meta_int64(container:PGESMetaContainer; flags:TGESMetaFlag; meta_item:Pgchar; value:Tgint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_register_meta_uint64(container:PGESMetaContainer; flags:TGESMetaFlag; meta_item:Pgchar; value:Tguint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_register_meta_float(container:PGESMetaContainer; flags:TGESMetaFlag; meta_item:Pgchar; value:Tgfloat):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_register_meta_double(container:PGESMetaContainer; flags:TGESMetaFlag; meta_item:Pgchar; value:Tgdouble):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_meta_container_register_meta_date(container:PGESMetaContainer; flags:TGESMetaFlag; meta_item:Pgchar; value:PGDate):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_meta_container_register_meta_date_time(container:PGESMetaContainer; flags:TGESMetaFlag; meta_item:Pgchar; value:PGstDateTime):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_meta_container_register_meta_string(container:PGESMetaContainer; flags:TGESMetaFlag; meta_item:Pgchar; value:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_meta_container_register_meta(container:PGESMetaContainer; flags:TGESMetaFlag; meta_item:Pgchar; value:PGValue):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_check_meta_registered(container:PGESMetaContainer; meta_item:Pgchar; flags:PGESMetaFlag; _type:PGType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_get_boolean(container:PGESMetaContainer; meta_item:Pgchar; dest:Pgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_get_int(container:PGESMetaContainer; meta_item:Pgchar; dest:Pgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_get_uint(container:PGESMetaContainer; meta_item:Pgchar; dest:Pguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_get_int64(container:PGESMetaContainer; meta_item:Pgchar; dest:Pgint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_get_uint64(container:PGESMetaContainer; meta_item:Pgchar; dest:Pguint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_get_float(container:PGESMetaContainer; meta_item:Pgchar; dest:Pgfloat):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_get_double(container:PGESMetaContainer; meta_item:Pgchar; dest:Pgdouble):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_get_date(container:PGESMetaContainer; meta_item:Pgchar; dest:PPGDate):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_get_date_time(container:PGESMetaContainer; meta_item:Pgchar; dest:PPGstDateTime):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_meta_container_get_string(container:PGESMetaContainer; meta_item:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_get_marker_list(container:PGESMetaContainer; key:Pgchar):PGESMarkerList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ges_meta_container_get_meta(container:PGESMetaContainer; key:Pgchar):PGValue;cdecl;external;
{*
 * GESMetaForeachFunc:
 * @container: A #GESMetaContainer
 * @key: The key for one of @container's fields
 * @value: The set value under @key
 * @user_data: User data
 *
 * A method to be called on all of a meta container's fields.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type

  TGESMetaForeachFunc = procedure (container:PGESMetaContainer; key:Pgchar; value:PGValue; user_data:Tgpointer);cdecl;

procedure ges_meta_container_foreach(container:PGESMetaContainer; func:TGESMetaForeachFunc; user_data:Tgpointer);cdecl;external;
function ges_meta_container_metas_to_string(container:PGESMetaContainer):Pgchar;cdecl;external;
(* Const before type ignored *)
function ges_meta_container_add_metas_from_string(container:PGESMetaContainer; str:Pgchar):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_META_CONTAINER : longint; { return type might be wrong }
  begin
    GES_TYPE_META_CONTAINER:=ges_meta_container_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GES_META_CONTAINER_GET_INTERFACE(inst : longint) : longint;
begin
  GES_META_CONTAINER_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,GES_TYPE_META_CONTAINER,GESMetaContainerInterface);
end;


end.
