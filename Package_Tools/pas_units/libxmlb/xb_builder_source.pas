unit xb_builder_source;

interface

uses
  fp_glib2, fp_xmlb;

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
{$include "xb-builder-source-ctx.h"}
{$include "xb-compile.h"}

{G_DECLARE_DERIVABLE_TYPE(XbBuilderSource, xb_builder_source, XB, BUILDER_SOURCE, GObject) }
{< private > }
type
  PXbBuilderSourceClass = ^TXbBuilderSourceClass;
  TXbBuilderSourceClass = record
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
 * XbBuilderSourceFlags:
 * @XB_BUILDER_SOURCE_FLAG_NONE:		No extra flags to use
 * @XB_BUILDER_SOURCE_FLAG_LITERAL_TEXT:	Do not attempt to repair XML whitespace
 * @XB_BUILDER_SOURCE_FLAG_WATCH_FILE:		Watch the source file for changes
 * @XB_BUILDER_SOURCE_FLAG_WATCH_DIRECTORY:	Watch the directory containing the source file for
 *changes (for example, if watching all the sources in a directory — this allows the file monitors
 *to be shared)
 *
 * The flags for converting to XML.
 * }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.2.0  }
{< private > }

  PXbBuilderSourceFlags = ^TXbBuilderSourceFlags;
  TXbBuilderSourceFlags =  Longint;
  Const
    XB_BUILDER_SOURCE_FLAG_NONE = 0;
    XB_BUILDER_SOURCE_FLAG_LITERAL_TEXT = 1 shl 0;
    XB_BUILDER_SOURCE_FLAG_WATCH_FILE = 1 shl 1;
    XB_BUILDER_SOURCE_FLAG_WATCH_DIRECTORY = 1 shl 2;
    XB_BUILDER_SOURCE_FLAG_LAST = (1 shl 2)+1;
;
type

  TXbBuilderSourceNodeFunc = function (self:PXbBuilderSource; bn:PXbBuilderNode; user_data:Tgpointer; error:PPGError):Tgboolean;cdecl;

  PXbBuilderSourceAdapterFunc = ^TXbBuilderSourceAdapterFunc;
  TXbBuilderSourceAdapterFunc = function (self:PXbBuilderSource; ctx:PXbBuilderSourceCtx; user_data:Tgpointer; cancellable:PGCancellable; error:PPGError):PGInputStream;cdecl;

function xb_builder_source_new:PXbBuilderSource;cdecl;external libxmlb;
function xb_builder_source_load_file(self:PXbBuilderSource; file:PGFile; flags:TXbBuilderSourceFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libxmlb;
function xb_builder_source_load_xml(self:PXbBuilderSource; xml:Pgchar; flags:TXbBuilderSourceFlags; error:PPGError):Tgboolean;cdecl;external libxmlb;
function xb_builder_source_load_bytes(self:PXbBuilderSource; bytes:PGBytes; flags:TXbBuilderSourceFlags; error:PPGError):Tgboolean;cdecl;external libxmlb;
procedure xb_builder_source_set_info(self:PXbBuilderSource; info:PXbBuilderNode);cdecl;external libxmlb;
procedure xb_builder_source_set_prefix(self:PXbBuilderSource; prefix:Pgchar);cdecl;external libxmlb;
procedure xb_builder_source_add_fixup(self:PXbBuilderSource; fixup:PXbBuilderFixup);cdecl;external libxmlb;
procedure xb_builder_source_add_adapter(self:PXbBuilderSource; content_types:Pgchar; func:TXbBuilderSourceAdapterFunc; user_data:Tgpointer; user_data_free:TGDestroyNotify);cdecl;external libxmlb;
procedure xb_builder_source_add_simple_adapter(self:PXbBuilderSource; content_types:Pgchar; func:TXbBuilderSourceAdapterFunc; user_data:Tgpointer; user_data_free:TGDestroyNotify);cdecl;external libxmlb;

// === Konventiert am: 1-10-25 19:42:15 ===

function XB_TYPE_BUILDER_SOURCE: TGType;
function XB_BUILDER_SOURCE(obj: Pointer): PXbBuilderSource;
function XB_IS_BUILDER_SOURCE(obj: Pointer): Tgboolean;
function XB_BUILDER_SOURCE_CLASS(klass: Pointer): PXbBuilderSourceClass;
function XB_IS_BUILDER_SOURCE_CLASS(klass: Pointer): Tgboolean;
function XB_BUILDER_SOURCE_GET_CLASS(obj: Pointer): PXbBuilderSourceClass;

implementation

function XB_TYPE_BUILDER_SOURCE: TGType;
begin
  Result := xb_builder_source_get_type;
end;

function XB_BUILDER_SOURCE(obj: Pointer): PXbBuilderSource;
begin
  Result := PXbBuilderSource(g_type_check_instance_cast(obj, XB_TYPE_BUILDER_SOURCE));
end;

function XB_IS_BUILDER_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, XB_TYPE_BUILDER_SOURCE);
end;

function XB_BUILDER_SOURCE_CLASS(klass: Pointer): PXbBuilderSourceClass;
begin
  Result := PXbBuilderSourceClass(g_type_check_class_cast(klass, XB_TYPE_BUILDER_SOURCE));
end;

function XB_IS_BUILDER_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, XB_TYPE_BUILDER_SOURCE);
end;

function XB_BUILDER_SOURCE_GET_CLASS(obj: Pointer): PXbBuilderSourceClass;
begin
  Result := PXbBuilderSourceClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TXbBuilderSource = record
    parent_instance: TGObject;
  end;
  PXbBuilderSource = ^TXbBuilderSource;

  TXbBuilderSourceClass = record
  end;
  PXbBuilderSourceClass = ^TXbBuilderSourceClass;

function xb_builder_source_get_type: TGType; cdecl; external libgxxxxxxx;



end.
