
unit xb_builder_source_ctx;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_builder_source_ctx.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_builder_source_ctx.h
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
PGBytes  = ^GBytes;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGInputStream  = ^GInputStream;
PXbBuilderSourceCtx  = ^XbBuilderSourceCtx;
PXbBuilderSourceCtxClass  = ^XbBuilderSourceCtxClass;
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

{ was #define dname def_expr }
function XB_TYPE_BUILDER_SOURCE_CTX : longint; { return type might be wrong }

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


function xb_builder_source_ctx_get_stream(self:PXbBuilderSourceCtx):PGInputStream;cdecl;external;
(* Const before type ignored *)
function xb_builder_source_ctx_get_filename(self:PXbBuilderSourceCtx):Pgchar;cdecl;external;
function xb_builder_source_ctx_get_bytes(self:PXbBuilderSourceCtx; cancellable:PGCancellable; error:PPGError):PGBytes;cdecl;external;

implementation

{ was #define dname def_expr }
function XB_TYPE_BUILDER_SOURCE_CTX : longint; { return type might be wrong }
  begin
    XB_TYPE_BUILDER_SOURCE_CTX:=xb_builder_source_ctx_get_type;
  end;


end.
