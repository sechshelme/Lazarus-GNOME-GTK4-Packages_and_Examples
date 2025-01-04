
unit WebKitUserContentFilterStore;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitUserContentFilterStore.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitUserContentFilterStore.h
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
PGAsyncResult  = ^GAsyncResult;
PGBytes  = ^GBytes;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGFile  = ^GFile;
PWebKitUserContentFilter  = ^WebKitUserContentFilter;
PWebKitUserContentFilterStore  = ^WebKitUserContentFilterStore;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018 Igalia S.L.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE INC. AND ITS CONTRIBUTORS ``AS IS''
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL APPLE INC. OR ITS CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
  }
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitUserContentFilterStore_h}
{$define WebKitUserContentFilterStore_h}
{$include <gio/gio.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_USER_CONTENT_FILTER_STORE : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitUserContentFilterStore, webkit_user_content_filter_store, WEBKIT, USER_CONTENT_FILTER_STORE, GObject) }
type
(* Const before type ignored *)

function webkit_user_content_filter_store_new(storage_path:Pgchar):PWebKitUserContentFilterStore;cdecl;external;
(* Const before type ignored *)
function webkit_user_content_filter_store_get_path(store:PWebKitUserContentFilterStore):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure webkit_user_content_filter_store_save(store:PWebKitUserContentFilterStore; identifier:Pgchar; source:PGBytes; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function webkit_user_content_filter_store_save_finish(store:PWebKitUserContentFilterStore; result:PGAsyncResult; error:PPGError):PWebKitUserContentFilter;cdecl;external;
(* Const before type ignored *)
procedure webkit_user_content_filter_store_save_from_file(store:PWebKitUserContentFilterStore; identifier:Pgchar; file:PGFile; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function webkit_user_content_filter_store_save_from_file_finish(store:PWebKitUserContentFilterStore; result:PGAsyncResult; error:PPGError):PWebKitUserContentFilter;cdecl;external;
(* Const before type ignored *)
procedure webkit_user_content_filter_store_remove(store:PWebKitUserContentFilterStore; identifier:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_user_content_filter_store_remove_finish(store:PWebKitUserContentFilterStore; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure webkit_user_content_filter_store_load(store:PWebKitUserContentFilterStore; identifier:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_user_content_filter_store_load_finish(store:PWebKitUserContentFilterStore; result:PGAsyncResult; error:PPGError):PWebKitUserContentFilter;cdecl;external;
procedure webkit_user_content_filter_store_fetch_identifiers(store:PWebKitUserContentFilterStore; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_user_content_filter_store_fetch_identifiers_finish(store:PWebKitUserContentFilterStore; result:PGAsyncResult):^Pgchar;cdecl;external;
{$endif}
{ !WebKitUserContentFilterStore_h  }

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_USER_CONTENT_FILTER_STORE : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_USER_CONTENT_FILTER_STORE:=webkit_user_content_filter_store_get_type;
  end;


end.
