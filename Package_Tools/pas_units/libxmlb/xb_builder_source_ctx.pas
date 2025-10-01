unit xb_builder_source_ctx;

interface

uses
  fp_glib2, fp_xmlb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include "xb-compile.h"}

{G_DECLARE_DERIVABLE_TYPE(XbBuilderSourceCtx, xb_builder_source_ctx, XB, BUILDER_SOURCE_CTX, GObject) }
{< private > }
type
  PXbBuilderSourceCtxClass = ^TXbBuilderSourceCtxClass;
  TXbBuilderSourceCtxClass = record
      parent_class : TGObjectClass;
      _xb_reserved1 : procedure ;cdecl;
      _xb_reserved2 : procedure ;cdecl;
      _xb_reserved3 : procedure ;cdecl;
      _xb_reserved4 : procedure ;cdecl;
      _xb_reserved5 : procedure ;cdecl;
      _xb_reserved6 : procedure ;cdecl;
      _xb_reserved7 : procedure ;cdecl;
    end;


function xb_builder_source_ctx_get_stream(self:PXbBuilderSourceCtx):PGInputStream;cdecl;external libxmlb;
function xb_builder_source_ctx_get_filename(self:PXbBuilderSourceCtx):Pgchar;cdecl;external libxmlb;
function xb_builder_source_ctx_get_bytes(self:PXbBuilderSourceCtx; cancellable:PGCancellable; error:PPGError):PGBytes;cdecl;external libxmlb;

// === Konventiert am: 1-10-25 19:42:18 ===

function XB_TYPE_BUILDER_SOURCE_CTX: TGType;
function XB_BUILDER_SOURCE_CTX(obj: Pointer): PXbBuilderSourceCtx;
function XB_IS_BUILDER_SOURCE_CTX(obj: Pointer): Tgboolean;
function XB_BUILDER_SOURCE_CTX_CLASS(klass: Pointer): PXbBuilderSourceCtxClass;
function XB_IS_BUILDER_SOURCE_CTX_CLASS(klass: Pointer): Tgboolean;
function XB_BUILDER_SOURCE_CTX_GET_CLASS(obj: Pointer): PXbBuilderSourceCtxClass;

implementation

function XB_TYPE_BUILDER_SOURCE_CTX: TGType;
begin
  Result := xb_builder_source_ctx_get_type;
end;

function XB_BUILDER_SOURCE_CTX(obj: Pointer): PXbBuilderSourceCtx;
begin
  Result := PXbBuilderSourceCtx(g_type_check_instance_cast(obj, XB_TYPE_BUILDER_SOURCE_CTX));
end;

function XB_IS_BUILDER_SOURCE_CTX(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, XB_TYPE_BUILDER_SOURCE_CTX);
end;

function XB_BUILDER_SOURCE_CTX_CLASS(klass: Pointer): PXbBuilderSourceCtxClass;
begin
  Result := PXbBuilderSourceCtxClass(g_type_check_class_cast(klass, XB_TYPE_BUILDER_SOURCE_CTX));
end;

function XB_IS_BUILDER_SOURCE_CTX_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, XB_TYPE_BUILDER_SOURCE_CTX);
end;

function XB_BUILDER_SOURCE_CTX_GET_CLASS(obj: Pointer): PXbBuilderSourceCtxClass;
begin
  Result := PXbBuilderSourceCtxClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TXbBuilderSourceCtx = record
    parent_instance: TGObject;
  end;
  PXbBuilderSourceCtx = ^TXbBuilderSourceCtx;

  TXbBuilderSourceCtxClass = record
  end;
  PXbBuilderSourceCtxClass = ^TXbBuilderSourceCtxClass;

function xb_builder_source_ctx_get_type: TGType; cdecl; external libgxxxxxxx;



end.
