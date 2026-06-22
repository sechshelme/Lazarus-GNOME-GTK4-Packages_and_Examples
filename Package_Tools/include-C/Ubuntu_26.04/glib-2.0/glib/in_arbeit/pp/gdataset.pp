
unit gdataset;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdataset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdataset.h
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
Pgchar  = ^gchar;
PGData  = ^GData;
PGDestroyNotify  = ^GDestroyNotify;
PGQuark  = ^GQuark;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
  }
{$ifndef __G_DATASET_H__}
{$define __G_DATASET_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gquark.h>}
type

  TGDataForeachFunc = procedure (key_id:TGQuark; data:Tgpointer; user_data:Tgpointer);cdecl;
{ Keyed Data List
  }

procedure g_datalist_init(datalist:PPGData);cdecl;external;
procedure g_datalist_clear(datalist:PPGData);cdecl;external;
function g_datalist_id_get_data(datalist:PPGData; key_id:TGQuark):Tgpointer;cdecl;external;
procedure g_datalist_id_set_data_full(datalist:PPGData; key_id:TGQuark; data:Tgpointer; destroy_func:TGDestroyNotify);cdecl;external;
procedure g_datalist_id_remove_multiple(datalist:PPGData; keys:PGQuark; n_keys:Tgsize);cdecl;external;
type

  TGDuplicateFunc = function (data:Tgpointer; user_data:Tgpointer):Tgpointer;cdecl;

function g_datalist_id_dup_data(datalist:PPGData; key_id:TGQuark; dup_func:TGDuplicateFunc; user_data:Tgpointer):Tgpointer;cdecl;external;
function g_datalist_id_replace_data(datalist:PPGData; key_id:TGQuark; oldval:Tgpointer; newval:Tgpointer; destroy:TGDestroyNotify; 
           old_destroy:PGDestroyNotify):Tgboolean;cdecl;external;
function g_datalist_id_remove_no_notify(datalist:PPGData; key_id:TGQuark):Tgpointer;cdecl;external;
procedure g_datalist_foreach(datalist:PPGData; func:TGDataForeachFunc; user_data:Tgpointer);cdecl;external;
{*
 * G_DATALIST_FLAGS_MASK:
 *
 * A bitmask that restricts the possible flags passed to
 * g_datalist_set_flags(). Passing a flags value where
 * flags & ~G_DATALIST_FLAGS_MASK != 0 is an error.
  }
const
  G_DATALIST_FLAGS_MASK = $3;  

procedure g_datalist_set_flags(datalist:PPGData; flags:Tguint);cdecl;external;
procedure g_datalist_unset_flags(datalist:PPGData; flags:Tguint);cdecl;external;
function g_datalist_get_flags(datalist:PPGData):Tguint;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_datalist_id_set_data(dl,q,d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_datalist_id_remove_data(dl,q : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_datalist_set_data_full(dl,k,d,f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_datalist_remove_no_notify(dl,k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_datalist_set_data(dl,k,d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_datalist_remove_data(dl,k : longint) : longint;

{ Location Associated Keyed Data
  }
procedure g_dataset_destroy(dataset_location:Tgconstpointer);cdecl;external;
function g_dataset_id_get_data(dataset_location:Tgconstpointer; key_id:TGQuark):Tgpointer;cdecl;external;
(* Const before type ignored *)
function g_datalist_get_data(datalist:PPGData; key:Pgchar):Tgpointer;cdecl;external;
procedure g_dataset_id_set_data_full(dataset_location:Tgconstpointer; key_id:TGQuark; data:Tgpointer; destroy_func:TGDestroyNotify);cdecl;external;
function g_dataset_id_remove_no_notify(dataset_location:Tgconstpointer; key_id:TGQuark):Tgpointer;cdecl;external;
procedure g_dataset_foreach(dataset_location:Tgconstpointer; func:TGDataForeachFunc; user_data:Tgpointer);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_dataset_id_set_data(l,k,d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_dataset_id_remove_data(l,k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_dataset_get_data(l,k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_dataset_set_data_full(l,k,d,f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_dataset_remove_no_notify(l,k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_dataset_set_data(l,k,d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_dataset_remove_data(l,k : longint) : longint;

{$endif}
{ __G_DATASET_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_datalist_id_set_data(dl,q,d : longint) : longint;
begin
  g_datalist_id_set_data:=g_datalist_id_set_data_full(dl,q,d,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_datalist_id_remove_data(dl,q : longint) : longint;
begin
  g_datalist_id_remove_data:=g_datalist_id_set_data(dl,q,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_datalist_set_data_full(dl,k,d,f : longint) : longint;
begin
  g_datalist_set_data_full:=g_datalist_id_set_data_full(dl,g_quark_from_string(k),d,f);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_datalist_remove_no_notify(dl,k : longint) : longint;
begin
  g_datalist_remove_no_notify:=g_datalist_id_remove_no_notify(dl,g_quark_try_string(k));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_datalist_set_data(dl,k,d : longint) : longint;
begin
  g_datalist_set_data:=g_datalist_set_data_full(dl,k,d,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_datalist_remove_data(dl,k : longint) : longint;
begin
  g_datalist_remove_data:=g_datalist_id_set_data(dl,g_quark_try_string(k),NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_dataset_id_set_data(l,k,d : longint) : longint;
begin
  g_dataset_id_set_data:=g_dataset_id_set_data_full(l,k,d,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_dataset_id_remove_data(l,k : longint) : longint;
begin
  g_dataset_id_remove_data:=g_dataset_id_set_data(l,k,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_dataset_get_data(l,k : longint) : longint;
begin
  g_dataset_get_data:=g_dataset_id_get_data(l,g_quark_try_string(k));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_dataset_set_data_full(l,k,d,f : longint) : longint;
begin
  g_dataset_set_data_full:=g_dataset_id_set_data_full(l,g_quark_from_string(k),d,f);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_dataset_remove_no_notify(l,k : longint) : longint;
begin
  g_dataset_remove_no_notify:=g_dataset_id_remove_no_notify(l,g_quark_try_string(k));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_dataset_set_data(l,k,d : longint) : longint;
begin
  g_dataset_set_data:=g_dataset_set_data_full(l,k,d,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_dataset_remove_data(l,k : longint) : longint;
begin
  g_dataset_remove_data:=g_dataset_id_set_data(l,g_quark_try_string(k),NULL);
end;


end.
