
unit nm-checkpoint;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-checkpoint.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-checkpoint.h
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
PGPtrArray  = ^GPtrArray;
PNMCheckpoint  = ^NMCheckpoint;
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

{ was #define dname def_expr }
function NM_TYPE_CHECKPOINT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_CHECKPOINT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_CHECKPOINT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_CHECKPOINT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_CHECKPOINT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_CHECKPOINT_GET_CLASS(obj : longint) : longint;

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

function nm_checkpoint_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function nm_checkpoint_get_devices(checkpoint:PNMCheckpoint):PGPtrArray;cdecl;external;
function nm_checkpoint_get_created(checkpoint:PNMCheckpoint):Tgint64;cdecl;external;
function nm_checkpoint_get_rollback_timeout(checkpoint:PNMCheckpoint):Tguint32;cdecl;external;
{$endif}
{ __NM_CHECKPOINT_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_CHECKPOINT : longint; { return type might be wrong }
  begin
    NM_TYPE_CHECKPOINT:=nm_checkpoint_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_CHECKPOINT(obj : longint) : longint;
begin
  NM_CHECKPOINT:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_CHECKPOINT,NMCheckpoint);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_CHECKPOINT_CLASS(klass : longint) : longint;
begin
  NM_CHECKPOINT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_CHECKPOINT,NMCheckpointClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_CHECKPOINT(obj : longint) : longint;
begin
  NM_IS_CHECKPOINT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_CHECKPOINT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_CHECKPOINT_CLASS(klass : longint) : longint;
begin
  NM_IS_CHECKPOINT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_CHECKPOINT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_CHECKPOINT_GET_CLASS(obj : longint) : longint;
begin
  NM_CHECKPOINT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_CHECKPOINT,NMCheckpointClass);
end;


end.
