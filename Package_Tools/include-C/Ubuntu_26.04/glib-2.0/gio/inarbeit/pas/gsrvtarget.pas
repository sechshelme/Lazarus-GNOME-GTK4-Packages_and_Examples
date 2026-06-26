unit gsrvtarget;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2008 Red Hat, Inc.
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
  }
{$ifndef __G_SRV_TARGET_H__}
{$define __G_SRV_TARGET_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

function g_srv_target_get_type:TGType;cdecl;external libgio2;
function g_srv_target_new(hostname:Pgchar; port:Tguint16; priority:Tguint16; weight:Tguint16):PGSrvTarget;cdecl;external libgio2;
function g_srv_target_copy(target:PGSrvTarget):PGSrvTarget;cdecl;external libgio2;
procedure g_srv_target_free(target:PGSrvTarget);cdecl;external libgio2;
function g_srv_target_get_hostname(target:PGSrvTarget):Pgchar;cdecl;external libgio2;
function g_srv_target_get_port(target:PGSrvTarget):Tguint16;cdecl;external libgio2;
function g_srv_target_get_priority(target:PGSrvTarget):Tguint16;cdecl;external libgio2;
function g_srv_target_get_weight(target:PGSrvTarget):Tguint16;cdecl;external libgio2;
function g_srv_target_list_sort(targets:PGList):PGList;cdecl;external libgio2;
{$endif}
{ __G_SRV_TARGET_H__  }

// === Konventiert am: 26-6-26 20:00:19 ===

function G_TYPE_SRV_TARGET : TGType;

implementation

function G_TYPE_SRV_TARGET : TGType;
  begin
    G_TYPE_SRV_TARGET:=g_srv_target_get_type;
  end;



end.
