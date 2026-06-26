
unit gdatagrambased;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdatagrambased.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdatagrambased.h
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
PGDatagramBased  = ^GDatagramBased;
PGDatagramBasedInterface  = ^GDatagramBasedInterface;
PGError  = ^GError;
PGInputMessage  = ^GInputMessage;
PGOutputMessage  = ^GOutputMessage;
PGSource  = ^GSource;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2015 Collabora Ltd.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Philip Withnall <philip.withnall@collabora.co.uk>
  }
{$ifndef __G_DATAGRAM_BASED_H__}
{$define __G_DATAGRAM_BASED_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_DATAGRAM_BASED : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DATAGRAM_BASED(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DATAGRAM_BASED(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DATAGRAM_BASED_GET_IFACE(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_DATAGRAM_BASED(_type : longint) : longint;

type
{*
 * GDatagramBasedInterface:
 * @g_iface: The parent interface.
 * @receive_messages: Virtual method for g_datagram_based_receive_messages().
 * @send_messages: Virtual method for g_datagram_based_send_messages().
 * @create_source: Virtual method for g_datagram_based_create_source().
 * @condition_check: Virtual method for g_datagram_based_condition_check().
 * @condition_wait: Virtual method for
 *   g_datagram_based_condition_wait().
 *
 * Provides an interface for socket-like objects which have datagram semantics,
 * following the Berkeley sockets API. The interface methods are thin wrappers
 * around the corresponding virtual methods, and no pre-processing of inputs is
 * implemented — so implementations of this API must handle all functionality
 * documented in the interface methods.
 *
 * Since: 2.48
  }
{ Virtual table  }
  PGDatagramBasedInterface = ^TGDatagramBasedInterface;
  TGDatagramBasedInterface = record
      g_iface : TGTypeInterface;
      receive_messages : function (datagram_based:PGDatagramBased; messages:PGInputMessage; num_messages:Tguint; flags:Tgint; timeout:Tgint64; 
                   cancellable:PGCancellable; error:PPGError):Tgint;cdecl;
      send_messages : function (datagram_based:PGDatagramBased; messages:PGOutputMessage; num_messages:Tguint; flags:Tgint; timeout:Tgint64; 
                   cancellable:PGCancellable; error:PPGError):Tgint;cdecl;
      create_source : function (datagram_based:PGDatagramBased; condition:TGIOCondition; cancellable:PGCancellable):PGSource;cdecl;
      condition_check : function (datagram_based:PGDatagramBased; condition:TGIOCondition):TGIOCondition;cdecl;
      condition_wait : function (datagram_based:PGDatagramBased; condition:TGIOCondition; timeout:Tgint64; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;
    end;


function g_datagram_based_get_type:TGType;cdecl;external;
function g_datagram_based_receive_messages(datagram_based:PGDatagramBased; messages:PGInputMessage; num_messages:Tguint; flags:Tgint; timeout:Tgint64; 
           cancellable:PGCancellable; error:PPGError):Tgint;cdecl;external;
function g_datagram_based_send_messages(datagram_based:PGDatagramBased; messages:PGOutputMessage; num_messages:Tguint; flags:Tgint; timeout:Tgint64; 
           cancellable:PGCancellable; error:PPGError):Tgint;cdecl;external;
function g_datagram_based_create_source(datagram_based:PGDatagramBased; condition:TGIOCondition; cancellable:PGCancellable):PGSource;cdecl;external;
function g_datagram_based_condition_check(datagram_based:PGDatagramBased; condition:TGIOCondition):TGIOCondition;cdecl;external;
function g_datagram_based_condition_wait(datagram_based:PGDatagramBased; condition:TGIOCondition; timeout:Tgint64; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __G_DATAGRAM_BASED_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DATAGRAM_BASED : longint; { return type might be wrong }
  begin
    G_TYPE_DATAGRAM_BASED:=g_datagram_based_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DATAGRAM_BASED(inst : longint) : longint;
begin
  G_DATAGRAM_BASED:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_DATAGRAM_BASED,GDatagramBased);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DATAGRAM_BASED(inst : longint) : longint;
begin
  G_IS_DATAGRAM_BASED:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_DATAGRAM_BASED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DATAGRAM_BASED_GET_IFACE(inst : longint) : longint;
begin
  G_DATAGRAM_BASED_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,G_TYPE_DATAGRAM_BASED,GDatagramBasedInterface);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_DATAGRAM_BASED(_type : longint) : longint;
begin
  G_TYPE_IS_DATAGRAM_BASED:=g_type_is_a(_type,G_TYPE_DATAGRAM_BASED);
end;


end.
