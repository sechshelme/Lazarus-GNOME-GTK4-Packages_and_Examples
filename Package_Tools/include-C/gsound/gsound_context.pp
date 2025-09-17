
unit gsound_context;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsound_context.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsound_context.h
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
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
PGSoundContext  = ^GSoundContext;
PGSoundError  = ^GSoundError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gsound-context.h
 *
 * Copyright (C) 2013 Tristan Brindle <t.c.brindle@gmail.com>
 *
 * This file is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of the
 * License, or (at your option) any later version.
 *
 * This file is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef GSOUND_CONTEXT_H}
{$define GSOUND_CONTEXT_H}
{$include <gio/gio.h>}
{$include "gsound-attr.h"}

{ was #define dname def_expr }
function GSOUND_TYPE_CONTEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSOUND_CONTEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSOUND_CONTEXT_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSOUND_IS_CONTEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSOUND_IS_CONTEXT_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSOUND_CONTEXT_GET_CLASS(obj : longint) : longint;

type
{*
 * GSoundContext:
 * ca: the wrapped context
 *
 * Wrapper for ca_context.
  }

{ was #define dname def_expr }
function GSOUND_ERROR : longint; { return type might be wrong }

function gsound_error_quark:TGQuark;cdecl;external;
type
  PGSoundError = ^TGSoundError;
  TGSoundError =  Longint;
  Const
    GSOUND_ERROR_NOTSUPPORTED = -(1);
    GSOUND_ERROR_INVALID = -(2);
    GSOUND_ERROR_STATE = -(3);
    GSOUND_ERROR_OOM = -(4);
    GSOUND_ERROR_NODRIVER = -(5);
    GSOUND_ERROR_SYSTEM = -(6);
    GSOUND_ERROR_CORRUPT = -(7);
    GSOUND_ERROR_TOOBIG = -(8);
    GSOUND_ERROR_NOTFOUND = -(9);
    GSOUND_ERROR_DESTROYED = -(10);
    GSOUND_ERROR_CANCELED = -(11);
    GSOUND_ERROR_NOTAVAILABLE = -(12);
    GSOUND_ERROR_ACCESS = -(13);
    GSOUND_ERROR_IO = -(14);
    GSOUND_ERROR_INTERNAL = -(15);
    GSOUND_ERROR_DISABLED = -(16);
    GSOUND_ERROR_FORKED = -(17);
    GSOUND_ERROR_DISCONNECTED = -(18);
;

function gsound_context_get_type:TGType;cdecl;external;
function gsound_context_new(cancellable:PGCancellable; error:PPGError):PGSoundContext;cdecl;external;
function gsound_context_open(context:PGSoundContext; error:PPGError):Tgboolean;cdecl;external;
function gsound_context_set_attributes(context:PGSoundContext; error:PPGError; args:array of const):Tgboolean;cdecl;external;
function gsound_context_set_attributes(context:PGSoundContext; error:PPGError):Tgboolean;cdecl;external;
function gsound_context_set_attributesv(context:PGSoundContext; attrs:PGHashTable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gsound_context_set_driver(context:PGSoundContext; driver:Pchar; error:PPGError):Tgboolean;cdecl;external;
function gsound_context_play_simple(context:PGSoundContext; cancellable:PGCancellable; error:PPGError; args:array of const):Tgboolean;cdecl;external;
function gsound_context_play_simple(context:PGSoundContext; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function gsound_context_play_simplev(context:PGSoundContext; attrs:PGHashTable; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure gsound_context_play_full(context:PGSoundContext; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer; args:array of const);cdecl;external;
procedure gsound_context_play_full(context:PGSoundContext; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure gsound_context_play_fullv(context:PGSoundContext; attrs:PGHashTable; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gsound_context_play_full_finish(context:PGSoundContext; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
function gsound_context_cache(context:PGSoundContext; error:PPGError; args:array of const):Tgboolean;cdecl;external;
function gsound_context_cache(context:PGSoundContext; error:PPGError):Tgboolean;cdecl;external;
function gsound_context_cachev(context:PGSoundContext; attrs:PGHashTable; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ GSOUND_CONTEXT_H  }

implementation

{ was #define dname def_expr }
function GSOUND_TYPE_CONTEXT : longint; { return type might be wrong }
  begin
    GSOUND_TYPE_CONTEXT:=gsound_context_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSOUND_CONTEXT(obj : longint) : longint;
begin
  GSOUND_CONTEXT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GSOUND_TYPE_CONTEXT,GSoundContext);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSOUND_CONTEXT_CLASS(obj : longint) : longint;
begin
  GSOUND_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_CAST(obj,GSOUND_TYPE_CONTEXT,GSoundContextClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSOUND_IS_CONTEXT(obj : longint) : longint;
begin
  GSOUND_IS_CONTEXT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GSOUND_TYPE_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSOUND_IS_CONTEXT_CLASS(obj : longint) : longint;
begin
  GSOUND_IS_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(obj,GSOUND_TYPE_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSOUND_CONTEXT_GET_CLASS(obj : longint) : longint;
begin
  GSOUND_CONTEXT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GSOUND_TYPE_CONTEXT,GSoundContextClass);
end;

{ was #define dname def_expr }
function GSOUND_ERROR : longint; { return type might be wrong }
  begin
    GSOUND_ERROR:=gsound_error_quark;
  end;


end.
