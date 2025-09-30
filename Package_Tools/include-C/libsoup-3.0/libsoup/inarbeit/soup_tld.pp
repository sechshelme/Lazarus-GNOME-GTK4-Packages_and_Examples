
unit soup_tld;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_tld.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_tld.h
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
PGError  = ^GError;
PSoupTLDError  = ^SoupTLDError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2012 Igalia S.L.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
(* Const before type ignored *)
(* Const before type ignored *)

function soup_tld_get_base_domain(hostname:Pchar; error:PPGError):Pchar;cdecl;external;
(* Const before type ignored *)
function soup_tld_domain_is_public_suffix(domain:Pchar):Tgboolean;cdecl;external;
{*
 * soup_tld_error_quark:
 * Registers error quark for soup_tld_get_base_domain() if needed.
 *
 * Returns: Error quark for Soup TLD functions.
  }
function soup_tld_error_quark:TGQuark;cdecl;external;
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

implementation

{ was #define dname def_expr }
function SOUP_TLD_ERROR : longint; { return type might be wrong }
  begin
    SOUP_TLD_ERROR:=soup_tld_error_quark;
  end;


end.
