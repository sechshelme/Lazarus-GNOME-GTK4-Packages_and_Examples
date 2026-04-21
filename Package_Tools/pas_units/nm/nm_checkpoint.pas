unit nm_checkpoint;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 Red Hat, Inc.
  }
{$ifndef __NM_CHECKPOINT_H__}
{$define __NM_CHECKPOINT_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-object.h"}

const
  NM_CHECKPOINT_DEVICES = 'devices';  
  NM_CHECKPOINT_CREATED = 'created';  
  NM_CHECKPOINT_ROLLBACK_TIMEOUT = 'rollback-timeout';  
{*
 * NMCheckpoint:
 *
 * Since: 1.12
  }
type

function nm_checkpoint_get_type:TGType;cdecl;external libnm;
function nm_checkpoint_get_devices(checkpoint:PNMCheckpoint):PGPtrArray;cdecl;external libnm;
function nm_checkpoint_get_created(checkpoint:PNMCheckpoint):Tgint64;cdecl;external libnm;
function nm_checkpoint_get_rollback_timeout(checkpoint:PNMCheckpoint):Tguint32;cdecl;external libnm;
{$endif}
{ __NM_CHECKPOINT_H__  }

// === Konventiert am: 19-4-26 19:34:32 ===

function NM_TYPE_CHECKPOINT : TGType;
function NM_CHECKPOINT(obj : Pointer) : PNMCheckpoint;
function NM_CHECKPOINT_CLASS(klass : Pointer) : PNMCheckpointClass;
function NM_IS_CHECKPOINT(obj : Pointer) : Tgboolean;
function NM_IS_CHECKPOINT_CLASS(klass : Pointer) : Tgboolean;
function NM_CHECKPOINT_GET_CLASS(obj : Pointer) : PNMCheckpointClass;

implementation

function NM_TYPE_CHECKPOINT : TGType;
  begin
    NM_TYPE_CHECKPOINT:=nm_checkpoint_get_type;
  end;

function NM_CHECKPOINT(obj : Pointer) : PNMCheckpoint;
begin
  Result := PNMCheckpoint(g_type_check_instance_cast(obj, NM_TYPE_CHECKPOINT));
end;

function NM_CHECKPOINT_CLASS(klass : Pointer) : PNMCheckpointClass;
begin
  Result := PNMCheckpointClass(g_type_check_class_cast(klass, NM_TYPE_CHECKPOINT));
end;

function NM_IS_CHECKPOINT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_CHECKPOINT);
end;

function NM_IS_CHECKPOINT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_CHECKPOINT);
end;

function NM_CHECKPOINT_GET_CLASS(obj : Pointer) : PNMCheckpointClass;
begin
  Result := PNMCheckpointClass(PGTypeInstance(obj)^.g_class);
end;



end.
