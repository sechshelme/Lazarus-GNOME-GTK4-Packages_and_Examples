
unit xb_builder;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_builder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_builder.h
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
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGFile  = ^GFile;
PXbBuilder  = ^XbBuilder;
PXbBuilderClass  = ^XbBuilderClass;
PXbBuilderCompileFlags  = ^XbBuilderCompileFlags;
PXbBuilderFixup  = ^XbBuilderFixup;
PXbBuilderNode  = ^XbBuilderNode;
PXbBuilderSource  = ^XbBuilderSource;
PXbSilo  = ^XbSilo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include "xb-builder-fixup.h"}
{$include "xb-builder-node.h"}
{$include "xb-builder-source.h"}
{$include "xb-compile.h"}
{$include "xb-silo.h"}

{ was #define dname def_expr }
function XB_TYPE_BUILDER : longint; { return type might be wrong }

{////G_DECLARE_DERIVABLE_TYPE(XbBuilder, xb_builder, XB, BUILDER, GObject) }
{< private > }
type
  PXbBuilderClass = ^TXbBuilderClass;
  TXbBuilderClass = record
      parent_class : TGObjectClass;
      _xb_reserved1 : procedure ;cdecl;
      _xb_reserved2 : procedure ;cdecl;
      _xb_reserved3 : procedure ;cdecl;
      _xb_reserved4 : procedure ;cdecl;
      _xb_reserved5 : procedure ;cdecl;
      _xb_reserved6 : procedure ;cdecl;
      _xb_reserved7 : procedure ;cdecl;
    end;

{*
 * XbBuilderCompileFlags:
 * @XB_BUILDER_COMPILE_FLAG_NONE:		No extra flags to use
 * @XB_BUILDER_COMPILE_FLAG_NATIVE_LANGS:	Only load native languages
 * @XB_BUILDER_COMPILE_FLAG_IGNORE_INVALID:	Ignore invalid files without an error
 * @XB_BUILDER_COMPILE_FLAG_SINGLE_LANG:	Only store a single language
 * @XB_BUILDER_COMPILE_FLAG_WATCH_BLOB:		Watch the XMLB file for changes
 * @XB_BUILDER_COMPILE_FLAG_IGNORE_GUID:	Ignore the cache GUID value
 * @XB_BUILDER_COMPILE_FLAG_SINGLE_ROOT:	Require at most one root node
 *
 * The flags for converting to XML.
 * }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.7  }
{ Since: 0.3.4  }
{< private > }

  PXbBuilderCompileFlags = ^TXbBuilderCompileFlags;
  TXbBuilderCompileFlags =  Longint;
  Const
    XB_BUILDER_COMPILE_FLAG_NONE = 0;
    XB_BUILDER_COMPILE_FLAG_NATIVE_LANGS = 1 shl 1;
    XB_BUILDER_COMPILE_FLAG_IGNORE_INVALID = 1 shl 2;
    XB_BUILDER_COMPILE_FLAG_SINGLE_LANG = 1 shl 3;
    XB_BUILDER_COMPILE_FLAG_WATCH_BLOB = 1 shl 4;
    XB_BUILDER_COMPILE_FLAG_IGNORE_GUID = 1 shl 5;
    XB_BUILDER_COMPILE_FLAG_SINGLE_ROOT = 1 shl 6;
    XB_BUILDER_COMPILE_FLAG_LAST = (1 shl 6)+1;
;

function xb_builder_new:PXbBuilder;cdecl;external;
(* Const before type ignored *)
procedure xb_builder_append_guid(self:PXbBuilder; guid:Pgchar);cdecl;external;
procedure xb_builder_import_source(self:PXbBuilder; source:PXbBuilderSource);cdecl;external;
procedure xb_builder_import_node(self:PXbBuilder; bn:PXbBuilderNode);cdecl;external;
function xb_builder_compile(self:PXbBuilder; flags:TXbBuilderCompileFlags; cancellable:PGCancellable; error:PPGError):PXbSilo;cdecl;external;
function xb_builder_ensure(self:PXbBuilder; file:PGFile; flags:TXbBuilderCompileFlags; cancellable:PGCancellable; error:PPGError):PXbSilo;cdecl;external;
(* Const before type ignored *)
procedure xb_builder_add_locale(self:PXbBuilder; locale:Pgchar);cdecl;external;
procedure xb_builder_add_fixup(self:PXbBuilder; fixup:PXbBuilderFixup);cdecl;external;
procedure xb_builder_set_profile_flags(self:PXbBuilder; profile_flags:TXbSiloProfileFlags);cdecl;external;

implementation

{ was #define dname def_expr }
function XB_TYPE_BUILDER : longint; { return type might be wrong }
  begin
    XB_TYPE_BUILDER:=xb_builder_get_type;
  end;


end.
