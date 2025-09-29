unit soup_tld;

interface

uses
  fp_glib2, fp_soup;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2012 Igalia S.L.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}

function soup_tld_get_base_domain(hostname:Pchar; error:PPGError):Pchar;cdecl;external libsoup;
function soup_tld_domain_is_public_suffix(domain:Pchar):Tgboolean;cdecl;external libsoup;
{*
 * soup_tld_error_quark:
 * Registers error quark for soup_tld_get_base_domain() if needed.
 *
 * Returns: Error quark for Soup TLD functions.
  }
function soup_tld_error_quark:TGQuark;cdecl;external libsoup;
{ was #define dname def_expr }
function SOUP_TLD_ERROR : longint; { return type might be wrong }

type
  PSoupTLDError = ^TSoupTLDError;
  TSoupTLDError =  Longint;
  Const
    SOUP_TLD_ERROR_INVALID_HOSTNAME = 0;
    SOUP_TLD_ERROR_IS_IP_ADDRESS = 1;
    SOUP_TLD_ERROR_NOT_ENOUGH_DOMAINS = 2;
    SOUP_TLD_ERROR_NO_BASE_DOMAIN = 3;
    SOUP_TLD_ERROR_NO_PSL_DATA = 4;
;

// === Konventiert am: 29-9-25 19:43:56 ===


implementation


{ was #define dname def_expr }
function SOUP_TLD_ERROR : longint; { return type might be wrong }
  begin
    SOUP_TLD_ERROR:=soup_tld_error_quark;
  end;


end.
