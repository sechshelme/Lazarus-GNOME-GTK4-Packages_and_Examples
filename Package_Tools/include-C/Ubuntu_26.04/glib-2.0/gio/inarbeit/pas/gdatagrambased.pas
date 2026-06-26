unit gdatagrambased;

interface

uses
  fp_glib2;

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


function g_datagram_based_get_type:TGType;cdecl;external libgio2;
function g_datagram_based_receive_messages(datagram_based:PGDatagramBased; messages:PGInputMessage; num_messages:Tguint; flags:Tgint; timeout:Tgint64; 
           cancellable:PGCancellable; error:PPGError):Tgint;cdecl;external libgio2;
function g_datagram_based_send_messages(datagram_based:PGDatagramBased; messages:PGOutputMessage; num_messages:Tguint; flags:Tgint; timeout:Tgint64; 
           cancellable:PGCancellable; error:PPGError):Tgint;cdecl;external libgio2;
function g_datagram_based_create_source(datagram_based:PGDatagramBased; condition:TGIOCondition; cancellable:PGCancellable):PGSource;cdecl;external libgio2;
function g_datagram_based_condition_check(datagram_based:PGDatagramBased; condition:TGIOCondition):TGIOCondition;cdecl;external libgio2;
function g_datagram_based_condition_wait(datagram_based:PGDatagramBased; condition:TGIOCondition; timeout:Tgint64; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_DATAGRAM_BASED_H__  }

// === Konventiert am: 26-6-26 16:33:57 ===

function G_TYPE_DATAGRAM_BASED : TGType;
function G_DATAGRAM_BASED(obj : Pointer) : PGDatagramBased;
function G_IS_DATAGRAM_BASED(obj : Pointer) : Tgboolean;
function G_DATAGRAM_BASED_GET_IFACE(obj : Pointer) : ;

implementation

function G_TYPE_DATAGRAM_BASED : TGType;
  begin
    G_TYPE_DATAGRAM_BASED:=g_datagram_based_get_type;
  end;

function G_DATAGRAM_BASED(obj : Pointer) : PGDatagramBased;
begin
  Result := PGDatagramBased(g_type_check_instance_cast(obj, G_TYPE_DATAGRAM_BASED));
end;

function G_IS_DATAGRAM_BASED(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_DATAGRAM_BASED);
end;

function G_DATAGRAM_BASED_GET_IFACE(obj : Pointer) : ;
begin
  Result := (PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_DATAGRAM_BASED(_type : longint) : longint;
begin
  G_TYPE_IS_DATAGRAM_BASED:=g_type_is_a(_type,G_TYPE_DATAGRAM_BASED);
end;


end.
