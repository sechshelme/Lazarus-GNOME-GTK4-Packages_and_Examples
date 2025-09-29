
unit soup_auth_manager;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_auth_manager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_auth_manager.h
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
PGUri  = ^GUri;
PSoupAuth  = ^SoupAuth;
PSoupAuthManager  = ^SoupAuthManager;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2007 Red Hat, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{$include "soup-auth.h"}

{ was #define dname def_expr }
function SOUP_TYPE_AUTH_MANAGER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (SoupAuthManager, soup_auth_manager, SOUP, AUTH_MANAGER, GObject) }
procedure soup_auth_manager_use_auth(manager:PSoupAuthManager; uri:PGUri; auth:PSoupAuth);cdecl;external;
procedure soup_auth_manager_clear_cached_credentials(manager:PSoupAuthManager);cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_AUTH_MANAGER : longint; { return type might be wrong }
  begin
    SOUP_TYPE_AUTH_MANAGER:=soup_auth_manager_get_type;
  end;


end.
