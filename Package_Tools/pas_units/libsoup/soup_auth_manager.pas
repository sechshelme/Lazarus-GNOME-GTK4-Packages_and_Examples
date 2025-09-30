unit soup_auth_manager;

interface

uses
  fp_glib2, fp_soup;

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

{G_DECLARE_FINAL_TYPE (SoupAuthManager, soup_auth_manager, SOUP, AUTH_MANAGER, GObject) }
procedure soup_auth_manager_use_auth(manager:PSoupAuthManager; uri:PGUri; auth:PSoupAuth);cdecl;external libsoup;
procedure soup_auth_manager_clear_cached_credentials(manager:PSoupAuthManager);cdecl;external libsoup;

// === Konventiert am: 29-9-25 19:45:27 ===

function SOUP_TYPE_AUTH_MANAGER: TGType;
function SOUP_AUTH_MANAGER(obj: Pointer): PSoupAuthManager;
function SOUP_IS_AUTH_MANAGER(obj: Pointer): Tgboolean;

implementation

function SOUP_TYPE_AUTH_MANAGER: TGType;
begin
  Result := soup_auth_manager_get_type;
end;

function SOUP_AUTH_MANAGER(obj: Pointer): PSoupAuthManager;
begin
  Result := PSoupAuthManager(g_type_check_instance_cast(obj, SOUP_TYPE_AUTH_MANAGER));
end;

function SOUP_IS_AUTH_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_AUTH_MANAGER);
end;

type 
  TSoupAuthManager = record
  end;
  PSoupAuthManager = ^TSoupAuthManager;

  TSoupAuthManagerClass = record
    parent_class: TGObjectClass;
  end;
  PSoupAuthManagerClass = ^TSoupAuthManagerClass;

function soup_auth_manager_get_type: TGType; cdecl; external libgxxxxxxx;



end.
